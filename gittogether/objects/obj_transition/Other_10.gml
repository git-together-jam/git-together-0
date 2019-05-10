/// @desc Update Type

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		xscale = display_get_gui_width() + buff*2;
		yscale = display_get_gui_height() + buff*2;
		hnum = 1;
		vnum = 1;
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
	
	default:
	break;
}