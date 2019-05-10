/// @description 
// Random pos
var _x = irandom_range(0, room_width);
var _y = irandom_range(0, room_height);

// Select edge
if (irandom(1) == 0) _x = choose(-64, room_width+64);
else _y = choose(-64, room_height+64);

// Create arcade
instance_create_layer(_x, _y, "Instances", oB1_EnemySpawns);

alarm[0] = 60;