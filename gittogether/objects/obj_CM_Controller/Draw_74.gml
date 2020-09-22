/// @description Draw foreground
draw_sprite(spr_CM_CabinetUI,1,0,0);
draw_sprite(spr_CM_CabinetUI,2,0,0);

var _xMove;

switch(global.iMoveX) {
	case 0:	_xMove = 0; break;
	case -1: _xMove = 2; break;
	case 1: _xMove = 1; break;
}

var _yMove = max(global.iMoveY,0);

draw_sprite(spr_CM_Joystick,_xMove,136,168);
draw_sprite(spr_CM_Button,_yMove,184,162);
//draw_sprite(spr_CM_Button,0,184,162);