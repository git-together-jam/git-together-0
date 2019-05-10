/// @desc Update Type

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		xscale = display_get_gui_width() + buff*2;
		yscale = display_get_gui_height() + buff*2;
		alpha = 0;
	break;
	#endregion
	
	#region Checkerboard
	case TransType.checkerboard:
		hnum = ceil((display_get_gui_width()+buff*2)/checkerboardSize);
		vnum = ceil((display_get_gui_height()+buff*2)/checkerboardSize);
		alpha = 1;
	break;
	#endregion

	#region Circle
	case TransType.circle:
		xx = display_get_gui_width()/2;
		yy = display_get_gui_height()/2;
		radTarg = point_distance(xx, yy, -buff, -buff);
	break;
	#endregion
	
	default:
	break;
}