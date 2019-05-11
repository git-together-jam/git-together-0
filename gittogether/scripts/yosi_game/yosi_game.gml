/// @func yosi_game(parameters...)
/// @arg parameters...
/// @desc LOL
#macro YosiBasics hsp,vsp,X,Y,length
enum YosiFunction
	{
	init,
	main,
	new_player,
	new_obstacle,
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
enum YosiObstacle
	{
	zapper,
	laser,
	spinning_zapper,
	missiles,
	flood,
	spikes,
	}
enum YosiZapper
	{
	scale,angle,YosiBasics
	}
enum YosiLaser
	{
	timer,state,YosiBasics
	}
//Init
if (argument[0] == YosiFunction.init)
	{
	surf = surface_create(room_width,room_height);
	game_state = YosiGameState.title;
	player_staet = YosiPlayerState.cutscene;
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
			break;
		}
	//Rendering
	if (!surface_exists(surf))
		{
		surf = surface_create(room_width,room_height);
		}
	if (surface_exists(surf))
		{
		surface_set_target(surf);
		draw_clear_alpha(c_dkgray,0);
		//Floor & ceiling
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(ceiling_list);i++)
			{
			draw_vertex_color(i*2,ceiling_list[|i],c_black,1);
			draw_vertex_color(i*2,0,c_white,1);
			}
		draw_primitive_end();
		draw_primitive_begin(pr_trianglestrip);
		for(var i=0;i<ds_list_size(floor_list);i++)
			{
			draw_vertex_color(i*2,floor_list[|i],c_black,1);
			draw_vertex_color(i*2,room_height,c_white,1);
			}
		draw_primitive_end();
		//Object rendering to surface
		
		surface_reset_target();
		
		//Draw the surface
		draw_surface(surf,0,0);
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