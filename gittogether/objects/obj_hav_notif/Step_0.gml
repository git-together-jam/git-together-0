/// @description Insert description here
// You can write your code in this editor



xo = dsin( timer) * 2;
yo = dsin( timer) * 2;
timer += 2;


scale -= 0.001;
alpha -= 0.005;

if alpha <= 0.0 {
	instance_destroy();	
}