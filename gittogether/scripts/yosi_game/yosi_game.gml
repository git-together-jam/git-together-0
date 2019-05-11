/// @func yosi_game(parameters...)
/// @arg parameters...
/// @desc LOL
#macro YosiBasics hsp,vsp,X,Y,length
#macro YosiBlocksize 16
enum YosiFunction
	{
	init,
	main,
	new_player,
	new_zapper,
	move_ground,
	}
enum YosiGameState
	{
	title,
	start,
	playing,
	lose
	}
enum YosiPlayer
	{
	state,YosiBasics
	}
enum YosiPlayerState
	{
	cutscene,
	playing,
	dead,
	}
enum YosiObType
	{
	zapper,
	laser,
	missiles,
	spikes,
	flood,
	}
enum YosiZapper
	{
	type,scale,angle,YosiBasics
	}
enum YosiLaser
	{
	type,timer,state,YosiBasics
	}
//Init
if (argument[0] == YosiFunction.init)
	{
	surf = surface_create(room_width,room_height);
	game_state = YosiGameState.title;
	screen_flash = 0;
	player = yosi_game(YosiFunction.new_player,40,room_height div 2);
	obstacle_list = ds_list_create();
	ceiling_y = 20;
	ceiling_list = ds_list_create();
	floor_y = room_height-20;
	floor_list = ds_list_create();
	repeat(ceil(room_width/2)+1)
		{
		ds_list_add(ceiling_list,ceiling_y);
		ds_list_add(floor_list,floor_y);
		}
	draw_set_font(fnt_pixel);
	draw_set_color(c_white);
	}
//Main Loop
else if (argument[0] == YosiFunction.main)
	{
	//Render setup
	if (!surface_exists(surf))
		{
		surf = surface_create(room_width,room_height);
		}
	if (surface_exists(surf))
		{
		surface_set_target(surf);
		draw_clear_alpha(c_black,1);
		//Screen flash
		screen_flash = lerp(screen_flash,0,0.1);
		if (screen_flash > 0.1) draw_clear(merge_color(c_black,c_white,min(screen_flash,1)));
		//Floor & ceiling
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(ceiling_list);i++)
			{
			draw_vertex_color(i*2,ceiling_list[|i],c_white,1);
			draw_vertex_color(i*2,0,c_white,1);
			}
		draw_primitive_end();
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(floor_list);i++)
			{
			draw_vertex_color(i*2,floor_list[|i],c_white,1);
			draw_vertex_color(i*2,room_height,c_white,1);
			}
		draw_primitive_end();
		//Game State
		switch(game_state)
			{
			case YosiGameState.title:
				draw_text_center(room_width/2,room_height/2,"PRESS SPACE",1,1,0,c_white,abs(round(sin(current_time/300))));
				if (global.iSelect) 
					{
					game_state = YosiGameState.playing;
					player[@YosiPlayer.state] = YosiPlayerState.playing;
					}
				break;
			case YosiGameState.playing:
				//Move the ground every frame
				ceiling_y = 20 + sin(current_time / 1000)*10;
				floor_y = room_height - 20 + cos(current_time / 1000)*10;
				yosi_game(YosiFunction.move_ground);
				//debug
				if (mouse_check_button_pressed(mb_left)) {ds_list_add(obstacle_list,yosi_game(YosiFunction.new_zapper,mouse_x,mouse_y));}
				//Move
				for(var i=0;i<ds_list_size(obstacle_list);i++)
					{
					var _ob = obstacle_list[|i];
					switch(_ob[0])
						{
						case YosiObType.zapper:
							_ob[@YosiZapper.X] += _ob[YosiZapper.hsp];
							_ob[@YosiZapper.Y] += _ob[YosiZapper.vsp];
							//Render
							draw_rectangle
								(
								_ob[@YosiZapper.X],
								_ob[@YosiZapper.Y],
								_ob[@YosiZapper.X] + YosiBlocksize,
								_ob[@YosiZapper.Y] + YosiBlocksize,
								true
								);
							//Out of room
							if (_ob[@YosiZapper.X] < -YosiBlocksize) obstacle_list[|i] = noone;
							//Collision with player
							if (player[YosiPlayer.state] == YosiPlayerState.playing && 
								rectangle_in_rectangle
								(
								player[@YosiPlayer.X],
								player[@YosiPlayer.Y],
								player[@YosiPlayer.X] + YosiBlocksize,
								player[@YosiPlayer.Y] + YosiBlocksize,
								_ob[@YosiZapper.X],
								_ob[@YosiZapper.Y],
								_ob[@YosiZapper.X] + YosiBlocksize,
								_ob[@YosiZapper.Y] + YosiBlocksize
								))
								{
								//Player dies
								player[@YosiPlayer.state] = YosiPlayerState.dead;
								player[@YosiPlayer.vsp] = -15;
								screen_flash = 2;
								}
							break;
						}
					}
				//Player Control
				switch(player[@YosiPlayer.state])
					{
					case YosiPlayerState.cutscene:
						break;
					case YosiPlayerState.dead:
						//Movement
						player[@YosiPlayer.vsp] += 0.15;
						player[@YosiPlayer.Y] += round(player[YosiPlayer.vsp]);
						var _x_ref = (player[YosiPlayer.X] + YosiBlocksize) div 2;
						if (player[YosiPlayer.Y] < ceiling_list[|_x_ref])
							{
							player[@YosiPlayer.Y] = ceiling_list[|_x_ref];
							if (player[YosiPlayer.vsp] < 0) player[@YosiPlayer.vsp] *= -1;
							}
						if (player[YosiPlayer.Y] > floor_list[|_x_ref] - YosiBlocksize)
							{
							player[@YosiPlayer.Y] = floor_list[|_x_ref] - YosiBlocksize;
							if (player[YosiPlayer.vsp] > 0) player[@YosiPlayer.vsp] *= -0.6;
							if (abs(player[YosiPlayer.vsp]) < 1)
								{
								game_state = YosiGameState.lose;
								}
							}
						break;
					case YosiPlayerState.playing:
						//Jetpack
						if (global.iMoveY < 0)
							{
							player[@YosiPlayer.vsp] -= 0.25;
							}
						else
							{
							player[@YosiPlayer.vsp] += 0.15;
							}
						//Movement
						player[@YosiPlayer.Y] += round(player[YosiPlayer.vsp]);
						//Move away from floor & ceiling
						var _x_ref = (player[YosiPlayer.X] + YosiBlocksize) div 2;
						if (player[YosiPlayer.Y] < ceiling_list[|_x_ref])
							{
							player[@YosiPlayer.Y] = ceiling_list[|_x_ref];
							player[@YosiPlayer.vsp] = max(player[YosiPlayer.vsp],0);
							}
						if (player[YosiPlayer.Y] > floor_list[|_x_ref] - YosiBlocksize)
							{
							player[@YosiPlayer.Y] = floor_list[|_x_ref] - YosiBlocksize;
							player[@YosiPlayer.vsp] = min(player[YosiPlayer.vsp],0);
							}
						break;
					}
				//Draw player
				draw_rectangle
					(
					player[@YosiPlayer.X],
					player[@YosiPlayer.Y],
					player[@YosiPlayer.X] + YosiBlocksize,
					player[@YosiPlayer.Y] + YosiBlocksize,
					false
					);
				break;
			}
		surface_reset_target();
		//Draw the surface
		draw_surface(surf,0,0);
		}
	//Garbage Collector
	var i=0;
	repeat(ds_list_size(obstacle_list))
		{
		if (!is_array(obstacle_list[|i])) 
			{
			ds_list_delete(obstacle_list,i);
			continue;
			} 
		i++
		}
	}
else
	{
	//Functions / Constructors
	switch(argument[0])
		{
		case YosiFunction.new_player:
			var _new = array_create(YosiPlayer.length);
			_new[YosiPlayer.state] = YosiPlayerState.cutscene;
			_new[YosiPlayer.X] = argument[1];
			_new[YosiPlayer.Y] = argument[2];
			_new[YosiPlayer.hsp] = 0;
			_new[YosiPlayer.vsp] = 0;
			return _new;
			break;
		case YosiFunction.new_zapper:
			var _new = array_create(YosiZapper.length);
			_new[YosiZapper.type] = YosiObType.zapper;
			_new[YosiZapper.X] = argument[1];
			_new[YosiZapper.Y] = argument[2];
			_new[YosiZapper.hsp] = -2;
			_new[YosiZapper.vsp] = 0;
			_new[YosiZapper.angle] = irandom(360);
			return _new;
			break;
		case YosiFunction.move_ground:
			//Move along the floor & ceiling
			ds_list_delete(ceiling_list,0);
			ds_list_delete(floor_list,0);
			ds_list_add(ceiling_list,ceiling_y);
			ds_list_add(floor_list,floor_y);
			return;
			break;
		}
	}