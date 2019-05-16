/// @desc 

switch (type) {
	
	#region Screen Fade
	case TransType.screenFade:
		if (!changeRoom) {
			if (alpha >= 1) {
				changeRoom = true;
				room_goto(targetRoom);
			}
		} else {
			if (alpha <= 0) instance_destroy();
		}
		alpha = approach(alpha, !changeRoom, .05);
	break;
	#endregion
	
	#region Checkerboard
	case TransType.checkerboard:
		var _targScale = 1.2;
		if (!changeRoom) {
			if (xscale >= _targScale-.1) {
				changeRoom = true;
				room_goto(targetRoom);
			}
		} else {
			if (xscale <= .1) instance_destroy();
		}
		xscale = lerp(xscale, !changeRoom*_targScale, .1);
		yscale = xscale;
	break;
	#endregion
	
	#region Circle
	case TransType.circle:
		if (!changeRoom) {
			if (rad >= radTarg - .1) event_user(15);
		} else {
			if (rad <= .1) instance_destroy();
		}
		rad = lerp(rad, !changeRoom * radTarg, .15);
	break;
	#endregion
	
	#region None
	case TransType.none:
		
	break;
	#endregion
	
	default:
	break;
}