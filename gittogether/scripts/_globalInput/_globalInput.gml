// Movement axis
global.iMoveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
global.iMoveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Mouse input
global.iMouseL_P = mouse_check_button_pressed(mb_left);