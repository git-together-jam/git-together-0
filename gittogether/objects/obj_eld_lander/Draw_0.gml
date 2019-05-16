var _ct = current_time * 0.001;

var _rw2 = room_width div 2;
var _rh2 = room_height div 2;

// if we are waiting to respawn or invincible, blink alpha
if (invincible_until > _ct or !am_alive)
	image_alpha = 0.5 + round(sin(_ct*15.0)) * 0.5;
else
	image_alpha = 1.0;

if (!am_alive)
	image_blend = c_aqua;
else
	image_blend = c_white;
	
// if GAME OVER
//if (am_alive == false and extra_lives <= 0)
if (obj_eld_controller.game_over)
{
	var _sc = obj_eld_controller.eld_score;
	if (obj_eld_controller.game_won)
		draw_text_center(_rw2, _rh2-20, "YOU WON", 2, 2, 0, lerp(c_yellow, c_white, sin(_ct)*0.5 + 0.5), 1.0);
	else
		draw_text_center(_rw2, _rh2-20, "YOU DIED", 2, 2, 0, c_red, 1.0);
	
	draw_text_center(_rw2, _rh2, "Final Score", 1, 1, 0, c_white, 1.0);
	draw_set_halign(fa_right);
	draw_text(_rw2+42, _rh2+15, string(_sc));
	draw_text(_rw2+42, _rh2+30, "+ "+string(extra_lives) + " x " + string(_sc));
	draw_set_color(c_yellow);
	draw_text(_rw2+42, _rh2+45, "= "+string(_sc * (extra_lives + 1)));
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	//draw_text_center(_rw2, _rh2+15, string(_sc), 1, 1, 0, c_white, 1.0);
	//draw_text_center(_rw2, _rh2+30, "+ "+string(_sc) + " x " + string(extra_lives), 1, 1, 0, c_white, 1.0);
	//draw_text_center(_rw2, _rh2+45, "= "+string(_sc * (extra_lives + 1)), 1, 1, 0, c_yellow, 1.0);
}
else if (obj_eld_controller.game_over)
	draw_text_center(_rw2, _rh2, "GAME OVER", 2, 2, 0, c_red, 1.0);
else
	draw_self();


//////////////////
// FUEL RESERVES
//////////////////
draw_text_transformed(0,0, "Fuel ", 0.5, 0.5, 0);
draw_set_color(c_aqua);
draw_rectangle(text_width_fuel, 3, text_width_fuel + 50 * fuel_level * 0.01, 7, false);
draw_set_color(c_white);
//draw_rectangle(text_width_fuel, 3, text_width_fuel + 50 * fuel_level * 0.01, 7, true);

//////////////////////
// Lives
//////////////////////

var _lives = (am_alive == false and extra_lives > 0) ? extra_lives - 1 : extra_lives;
draw_text_transformed(room_width - 30, 0, string(_lives) + "x", 0.5, 0.5, 0);
draw_sprite_ext(spr_eld_lander, 0, room_width - 12, 6, 0.5, 0.5, 0, c_white, 1.0);

///////////////////
// SCORE 
//////////////////
draw_text_center(_rw2-25, 5, "Score", 0.5, 0.5, 0, c_yellow, 1.0);
draw_text_center(_rw2-25,15, string(obj_eld_controller.eld_score), 0.5, 0.5, 0, c_white, 1.0);
draw_text_center(_rw2+25, 5, "High Score", 0.5, 0.5, 0, c_red, 1.0);
draw_text_center(_rw2+25,15, string(high_score), 0.5, 0.5, 0, c_white, 1.0);




//draw_text(0,30, "num enemies: " + string(instance_number(obj_eld_enemy1)));