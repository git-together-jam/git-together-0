///@arg x
///@arg y
///@arg particles

var _x = argument0;
var _y = argument1;
var _n = argument2;

var _layer = layer_get_id("Instances");
for (var i = 0; i < _n; ++i)
{
	instance_create_layer(_x, _y, _layer, obj_eld_debris);
}