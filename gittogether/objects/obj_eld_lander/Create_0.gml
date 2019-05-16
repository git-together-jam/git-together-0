/// @description Insert description here
// You can write your code in this editor
#macro ELD_LANDER_IMPULSE 0.01
#macro ELD_ROTATE_SPEED 3.0
#macro ELD_GRAVITY 0.005
#macro ELD_THRUST_COST 0.05
#macro ELD_LASER_COST 1

am_alive = true;
extra_lives = 3;

invincible_until = current_time * 0.001 + 2.0; // 2 seconds from now

xvel = 0;
yvel = 0;

image_xscale = 0.5;
image_yscale = 0.5;

fuel_level = 100;
laser_length = 0.0;

text_width_fuel = string_width("Fuel") * 0.5 + 2;

high_score = sys_save_arcade_read(global.ELDTitle, "HighScore", 0);