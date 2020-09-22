/// @description Init Variables

grav = .2;
vsp = 0;
hsp = 0;
grabbed = false;
slipChance = 0;
dir = choose(-4,4);
isGrounded = true;
image_speed = 0;
image_index = irandom(sprite_get_number(spr_CM_Price)-1);