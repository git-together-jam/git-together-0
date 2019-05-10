/// @desc 

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		alpha = approach(alpha, !changeRoom, .05);
		if (!changeRoom) {
			if (alpha >= 1) {
				changeRoom = true;
				room_goto(targetRoom);
			}
		} else {
			if (alpha <= 0) instance_destroy();
		}
	break;
	#endregion
	
	#region Checkboard
	case TransType.checkboard:
	
	break;
	#endregion
	
	default:
	break;
}