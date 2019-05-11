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
	game_state = YosiGameState.start;
	player_staet = YosiPlayerState.cutscene;
	}
//Main Loop
else if (argument[0] == YosiFunction.main)
	{
	//Game State
	
	//Rendering
	if (!surface_exists(surf))
		{
		surf = surface_create(room_width,room_height);
		}
	if (surface_exists(surf))
		{
		surface_set_target(surf);
		draw_clear(c_dkgray);
		//Object rendering to surface
		
		surface_reset_target();
		
		//Draw the surface
		draw_surface(surf,0,0);
		}
	}
else
	{
	//Functions
	switch(argument[0])
		{
		case YosiFunction.new_player:
			//var _new = array_create(YosiPlayer.length);
			
			break;
		}
	}