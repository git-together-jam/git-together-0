/// @description Create Prizes

prizeNum = 24;

spawnMinX = 128;
spawnMaxX = 232;

repeat(prizeNum) {
	instance_create_layer(irandom_range(spawnMinX,spawnMaxX),room_height-48,"Instances",obj_CM_Prize);
}