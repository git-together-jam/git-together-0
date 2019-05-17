/// @description Insert description here
// You can write your code in this editor

if (gameState == ELDGameState.Menu)
{
//	var _isPlay = buttonState == ELDMenuButtons.Play;
//	var _isLead = buttonState == ELDMenuButtons.Leaderboards;

	draw_rect(0, 0, room_width, room_height - 0, c_black, 0.5);
	var _playText = "  Play";
	var _leadText = "  Leaderboards";
	var _playCol = c_gray;
	var _leadCol = c_gray;
	var _playSX = 1;
	var _playSY = 1;
	var _leadSX = 1;
	var _leadSY = 1;
	var _playOX = 0;
	var _leadOX = 0;
	if (buttonState == ELDMenuButtons.Play)
	{
		_playText = "> Play";
		_playCol  = c_red;
		//_playSX = 1.5 + 0.05 * sin( current_time * 0.001 );
		//_playSY = 1.5 + 0.05 * cos( current_time * 0.001 );
		_playOX = sin( current_time * 0.005 ) * 3 - 3;
	}
	else if (buttonState == ELDMenuButtons.Leaderboards)
	{
		_leadText = "> Leaderboards";
		_leadCol  = c_red;
		//_leadSX = 1.0 + 0.05 * sin( current_time * 0.001 );
		//_leadSY = 1.0 + 0.05 * cos( current_time * 0.001 );
		_leadOX = sin( current_time * 0.005 ) * 3 - 3;
	}
	
	var _rw2 = room_width div 4;
	var _rh2 = room_height div 2;
	
	var f = draw_get_font();
	draw_set_font(fnt_big);
	draw_set_valign(fa_middle);
		draw_text_transformed_color(_rw2 + _playOX, _rh2-10, _playText, _playSX, _playSY, 0, _playCol, _playCol, _playCol, _playCol, 1.0);
		draw_text_transformed_color(_rw2 + _leadOX, _rh2+25, _leadText, _leadSX, _leadSY, 0, _leadCol, _leadCol, _leadCol, _leadCol, 1.0);
	draw_set_valign(fa_top);
	draw_set_font(f);
}