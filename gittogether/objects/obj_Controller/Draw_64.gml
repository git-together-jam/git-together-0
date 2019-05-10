/// @description
// Minigame title

#region Draw Tickets & Coins UI

// Setup temporary variables
var _ticketSprXOffset = sprite_get_width(spr_GUITicket);
var _ticketString = " X " + string(global.Tickets);
var _ticketStringXOffset = string_width(_ticketString);
var _coinSprXOffset = sprite_get_width(spr_GUICoin);
var _coinString = " X " + string(global.Coins);
var _coinAdjXOffset = 4; // Needed to space things appropriately

// Putting this here to neaten up the offets a bit
var _coinXOffset = guiXOffset + _ticketSprXOffset + _ticketStringXOffset;

// Tickets
draw_sprite(spr_GUITicket, 0, guiXOffset, guiYOffset);
draw_text(_ticketSprXOffset + guiXOffset, guiYOffset, _ticketString);

// Coins
draw_sprite(spr_GUICoin,0, _coinXOffset + guiXOffset, guiYOffset+1);
draw_text(_coinXOffset + _coinSprXOffset + _coinAdjXOffset, guiYOffset, _coinString);

#endregion
//draw_text(8, 8, "TICKETS : " + string(global.Tickets));
//draw_text(8, 8, "COINS : " + string(global.Coins));

if (miniTitleAlpha > 0) {
	draw_set_font(fntBig);

	var str = "Minigame\n\n" + global.GameName[miniType];
	draw_text_center(RES_W/2, RES_H/2, str, 1, 1, 0, c_dkgray, miniTitleAlpha);

	// Reduce alpha
	miniTitleAlpha -= 0.02;
}
