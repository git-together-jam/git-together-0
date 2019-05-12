// Movement axis
global.iMoveX = (keyboard_check(ord("D")) || keyboard_check(vk_right) ||
				gamepad_axis_value(global.Controller,gp_axislh) > CONTROLLER_DEADZONE)
              - (keyboard_check(ord("A")) || keyboard_check(vk_left) ||
				gamepad_axis_value(global.Controller,gp_axislh) < -CONTROLLER_DEADZONE);
			  
global.iMoveY = (keyboard_check(ord("S")) || keyboard_check(vk_down) ||
				gamepad_axis_value(global.Controller,gp_axislv) > CONTROLLER_DEADZONE)
              - (keyboard_check(ord("W")) || keyboard_check(vk_up) ||
				gamepad_axis_value(global.Controller,gp_axislv) < -CONTROLLER_DEADZONE);

// Input
global.iSelect =	(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) ||
					gamepad_button_check_pressed(global.Controller,gp_face1));
global.iExit =		(keyboard_check(vk_escape) ||
					gamepad_button_check(global.Controller,gp_start));

// Mouse input
global.iMouseL_P =	(mouse_check_button_pressed(mb_left) ||
					gamepad_button_check_pressed(global.Controller,gp_face2));