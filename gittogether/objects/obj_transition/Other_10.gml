/// @desc Update Type

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		xscale = display_get_gui_width() + buff*2;
		yscale = display_get_gui_height() + buff*2;
		hNum = 1;
		vNum = 1;
		alpha = 0;
	break;
	#endregion
	
	#region Checkboard
	case TransType.checkboard:
	
	break;
	#endregion
	
	default:
	break;
}