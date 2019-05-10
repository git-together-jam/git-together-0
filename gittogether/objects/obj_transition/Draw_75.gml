/// @desc 

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		draw_sprite_ext(spr_pixel, 0, -buff, -buff, xscale, yscale, 0, color, alpha);
	break;
	#endregion
	
	#region Checkboard
	case TransType.checkboard:
	
	break;
	#endregion
	
	default:
	break;
}