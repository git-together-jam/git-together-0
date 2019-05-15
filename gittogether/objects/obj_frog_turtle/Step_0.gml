//movement
x += vx;
y += vy;
if (sprite_index == spr_frog_turtle2 or sprite_index == spr_frog_turtle3)image_xscale = sign(vx) + sign(vy);