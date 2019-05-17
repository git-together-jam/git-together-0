/// @desc 

image_alpha -= .01;

if (image_alpha <= 0) {
	instance_destroy();
}