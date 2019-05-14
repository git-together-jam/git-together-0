//randomize type
sprite_index = choose(spr_frog_log,spr_frog_turtle2,spr_frog_turtle3);
image_index = irandom_range(0,image_number-1);
vx = 1;

if (instance_place(x,y,obj_frog_turtle)) instance_destroy(id);