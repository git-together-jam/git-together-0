/// @desc 

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		draw_sprite_ext(spr_pixel, 0, xx-buff, yy-buff, xscale, yscale, 0, color, alpha);
	break;
	#endregion
	
	#region Checkerboard
	case TransType.checkerboard:
		for (var _i = 0; _i < hnum; ++_i) {
			for (var _j = 0; _j < vnum; ++_j) {
				draw_sprite_ext(spr_pixel, 0,
				xx-buff+checkerboardSize*_i, yy-buff+checkerboardSize*_j,
				xscale*checkerboardSize, yscale*checkerboardSize, 0, color, alpha);
			}
		}
	break;
	#endregion
	
	#region
	case TransType.circle:
		draw_circle_color(xx, yy, rad, color, color, false);
	break;
	#endregion
	
	default:
	break;
}