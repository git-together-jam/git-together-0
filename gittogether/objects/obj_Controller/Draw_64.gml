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
//draw_text(8, 8, "TICKETS : " + string(global.Tickets));
//draw_text(8, 8, "COINS : " + string(global.Coins));

if (miniTitleAlpha > 0) {
	draw_set_font(fntBig);

	var str = "Minigame\n\n" + miniName;
	draw_text_center(RES_W/2, RES_H/2, str, 1, 1, 0, c_dkgray, miniTitleAlpha);

	// Reduce alpha
	miniTitleAlpha -= 0.02;
}

//Draw exit bar in the center of the screen

var _x = display_get_gui_width()  div 2,
	_y = display_get_gui_height() div 2;

draw_round_bar(
	_x,
	_y,
	45,
	7,
	((exitTime - exitTimerMaxTime) / exitTime),
	c_white,
	exitTimerDisplayAlpha,
	4,
);

var _font = draw_get_font();
draw_set_font(fntNormal);

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