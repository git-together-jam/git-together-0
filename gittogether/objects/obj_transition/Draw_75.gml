/// @desc 

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		draw_sprite_ext(spr_pixel, 0, -buff, -buff, xscale, yscale, 0, color, alpha);
	break;
	#endregion
	
	#region Checkerboard
	case TransType.checkerboard:
		for (var xx = 0; xx < hnum; ++xx) {
			for (var yy = 0; yy < vnum; ++yy) {
				draw_sprite_ext(spr_pixel, 0,
				-buff+checkerboardSize*xx, -buff+checkerboardSize*yy,
				xscale*checkerboardSize, yscale*checkerboardSize, 0, color, alpha);
			}
		}
	break;
	#endregion
	
	default:
	break;
}