/// @description
// Minigame title

#region Draw Tickets & Coins UI

// Draw only if we are in the Overworld

if room = rm_Overworld {

	draw_set_font(fnt_pixel)

	// Setup temporary variables
	var _ticketSprXOffset = sprite_get_width(spr_GUITicket);
	var _ticketString = " X " + string(global.Tickets);
	var _ticketStringXOffset = string_width(_ticketString);
	var _coinSprXOffset = sprite_get_width(spr_GUICoin);
	var _coinString = " X " + string(global.Coins);
	var _coinAdjXOffset = 4; // Needed to space things appropriately

	// Putting this here to neaten up the offets a bit
	var _coinXOffset = guiXOffset + _ticketSprXOffset + _ticketStringXOffset;

	draw_set_valign(fa_middle);
	// Tickets
	draw_sprite(spr_GUITicket, 0, guiXOffset, guiYOffset);
	draw_text(_ticketSprXOffset + guiXOffset, guiYOffset, _ticketString);

	// Coins
	draw_sprite(spr_GUICoin,0, _coinXOffset + guiXOffset, guiYOffset+1);
	draw_text(_coinXOffset + _coinSprXOffset + _coinAdjXOffset, guiYOffset, _coinString);
}

#endregion

#region Game shader effect

// Drawing the app surface
application_surface_draw_enable(!shaderEnabled);
gpu_set_tex_filter(shaderEnabled);

if (shaderEnabled) {
	if (shaderSet != -1) {
		shader_set(shaderSet);
		draw_surface_ext(application_surface,0,0,1/RES_S,1/RES_S,0,-1,1);
		shader_reset();
	
	}
}

gpu_set_tex_filter(false);

#endregion

#region Draw exit bar

var _x = display_get_gui_width()  div 2,
	_y = display_get_gui_height() div 2;
draw_rect(
	0,
	0,
	display_get_gui_width(),
	display_get_gui_height(),
	c_black,
	exitTimerDisplayAlpha * 0.5,
);
draw_round_bar(
	_x,
	_y,
	45,
	7,
	((exitTime - (exitTimerMaxTime-2)) / exitTime),
	c_white,
	exitTimerDisplayAlpha,
	4,
);
var _font = draw_get_font();
draw_set_font(fnt_normal);
draw_text_center(
	_x,
	_y,
	"HOLD TO EXIT",
	1,
	1,
	0,
	c_white,
	exitTimerDisplayAlpha,
);
draw_set_font(_font);

#endregion