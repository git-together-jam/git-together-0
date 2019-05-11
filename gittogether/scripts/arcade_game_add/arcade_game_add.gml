/// @func arcade_game_add(name, sprite, room)
/// @param name		- String
/// @param sprite	- Sprite
/// @param room		- Room of the game


// Setup temporary variables
var _name, _sprite, _room;

_name   = argument[0];
_sprite = argument[1];
_room   = argument[2];

// Create unique map
var _map = ds_map_create();
_map[? "name"]		= _name;
_map[? "sprite"]	= _sprite;
_map[? "room"]		= _room;
_map[? "trans"]		= TransType.none;
_map[? "transCol"]  = c_black;

// Add to global list
ds_list_add_map(global.ArcadeMachineList, _map);

// Returns the pos of the entry in the list
return (ds_list_size(global.ArcadeMachineList)-1);