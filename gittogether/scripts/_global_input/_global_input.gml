// Movement axis
global.iMoveX = (keyboard_check(ord("D")) || keyboard_check(vk_right))
              - (keyboard_check(ord("A")) || keyboard_check(vk_left));
			  
global.iMoveY = (keyboard_check(ord("S")) || keyboard_check(vk_down))
              - (keyboard_check(ord("W")) || keyboard_check(vk_up));

// Input
global.iSelect =	(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space));
global.iExit =		keyboard_check(vk_escape);

// Mouse input
global.iMouseL_P = mouse_check_button_pressed(mb_left);