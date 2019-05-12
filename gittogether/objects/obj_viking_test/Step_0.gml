/// @description
switch(state) {
	case WkStates.Idle:
		//Walk
		if (global.iMoveX != 0) {
			state = WkStates.Walk;
		}
		//Jump
		if (global.iMoveY < 0) {
			state = WkStates.Jump;
		}
		break;
	case WkStates.Walk:
		break;
}