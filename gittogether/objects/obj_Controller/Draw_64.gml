/// @description
// Minigame title

#region Draw Tickets & Coins UI

// Setup temporary variables
var _ticketSprXOffset = sprite_get_width(spr_GUITicket);
var _ticketString = " X " + string(global.Tickets);
var _ticketStringXOffset = string_width(_ticketString);
var _coinSprXOffset = sprite_get_width(spr_GUICoin);
var _coinString = " X " + string(global.Coins);

// Tickets
draw_sprite(spr_GUITicket,0,guiXOffset,guiYOffset);
draw_text(_ticketSprXOffset+guiXOffset,guiYOffset,_ticketString);

// Coins

draw_sprite(spr_GUICoin,0,_ticketSprXOffset+_ticketStringXOffset+4+guiXOffset,guiYOffset);
draw_text(_ticketSprXOffset+_ticketStringXOffset+_coinSprXOffset+4+guiXOffset,guiYOffset,_coinString);

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
