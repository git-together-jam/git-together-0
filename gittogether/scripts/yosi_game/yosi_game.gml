/// @func yosi_game(parameters...)
/// @arg parameters...
/// @desc LOL
gml_pragma("forceinline");
enum YosiFunction
	{
	main,
	init,
	new_obstacle,
	}
enum YosiGameState
	{
	title,
	start,
	playing,
	lose,
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
#macro YosiBasics hsp,vsp,X,Y,length
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
	}
//Main Loop
else if (argument[0] == YosiFunction.main)
	{
	//Rendering
	if (!surface_exists(surf))
		{
		surf = surface_create(room_width,room_height);
		}
	if (surface_exists(surf))
		{
		surface_set_target(surf);
		draw_clear(c_dkgray);
		surface_reset_target();
		
		draw_surface(surf,0,0);
		}
	}
else
	{
	//Functions
	switch(argument[0])
		{
		case YosiFunction.new_obstacle:
			
			break;
		}
	}