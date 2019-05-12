/// @description  Returns an array of valid arcade machine locations in the overworld
// This script uses obj_arcade_area objects placed in the the room to define the valid
// locatinos of arcade machines. The script will iterate over the areas, and generate
// an array of valid locations to spawn arcade machines

// catalog arcade areas
var _area_list = [];
	
// dimensions of the sprite we use to define areas
var _area_sprite_width = sprite_get_width(object_get_sprite(obj_arcade_area));
var _area_sprite_height = sprite_get_height(object_get_sprite(obj_arcade_area));
	
// some spacing values for arcade machines
var _spacing_width = 64;
var _spacing_height = 96;
	
// generate a priority queue of obj_arcade_area, ordered top-down, left-to-right
var _area_order = ds_priority_create();
with (obj_arcade_area) {
	var _index = y * room_width + x;
	ds_priority_add(_area_order, id, _index);
}
	
// generate the area list for each area
while (not ds_priority_empty(_area_order)) {
	with (ds_priority_delete_min(_area_order)) {
		for (var _yy = 0; _yy < _area_sprite_height*image_yscale; _yy += _spacing_height) {
			for (var _xx = 0; _xx < _area_sprite_width*image_xscale; _xx += _spacing_width) {
				var _xloc = x + _xx + sprite_get_xoffset(spr_arcade_machine);
				var _yloc = y + _yy + sprite_get_yoffset(spr_arcade_machine);
				_area_list[array_length_1d(_area_list)] = [_xloc, _yloc]; 
			}	
		}
			
		// we don't need this no more
		instance_destroy();
	}
}
	
// cleanup
ds_priority_destroy(_area_order);

return _area_list;