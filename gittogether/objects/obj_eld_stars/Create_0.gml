/// @description Insert description here
// You can write your code in this editor
#macro ELD_STAR_BEGIN_HEIGHT -200
var _rh = room_height;
var _rw = room_width;

stars = array_create(_rw);
nonces = array_create(_rw);

for (var i = 0; i < _rw; ++i){
	stars[i] = irandom_range(ELD_STAR_BEGIN_HEIGHT, _rh);
	nonces[i] = random(5);
}
	

