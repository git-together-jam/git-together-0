/// @func yosi_game(parameters...)
/// @arg parameters...
/// @desc LOL
#macro YosiBasics hsp,vsp,X,Y,length
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
	player_staet = YosiPlayerState.cutscene;
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
		//Floor & ceiling
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(ceiling_list);i++)
			{
			draw_vertex_color(i*2,ceiling_list[|i],c_dkgray,1);
			draw_vertex_color(i*2,0,c_black,1);
			}
		draw_primitive_end();
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(floor_list);i++)
			{
			draw_vertex_color(i*2,floor_list[|i],c_dkgray,1);
			draw_vertex_color(i*2,room_height,c_black,1);
			}
		draw_primitive_end();
		//Game State
		switch(game_state)
			{
			case YosiGameState.title:
				draw_text_center(room_width/2,room_height/2,"PRESS SPACE",1,1,0,c_white,abs(round(sin(current_time/300))));
				if (keyboard_check_pressed(vk_space)) game_state = YosiGameState.playing;
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
							draw_rectangle(_ob[@YosiZapper.X],_ob[@YosiZapper.Y],_ob[@YosiZapper.X] + 32,_ob[@YosiZapper.Y] + 32,true);
							//Out of room
							if (_ob[@YosiZapper.X] < 0) obstacle_list[|i] = noone;
							break;
						}
					}
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
	//*/
	}
else
	{
	//Functions
	switch(argument[0])
		{
		case YosiFunction.new_player:
			//var _new = array_create(YosiPlayer.length);
			return;
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