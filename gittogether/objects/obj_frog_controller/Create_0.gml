depth = -1000;
global.froggerTime = 0;
global.froggerUser = ""

secret = sys_save_global_read("frogger secret", false);

if secret then instance_create_layer(288,32,"Truck_kun",obj_frog_secret);