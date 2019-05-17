/// @func arcade_game_add(type, name, sprite, room)
/// @param type		- Enum entry
/// @param name		- String
/// @param sprite	- Sprite
/// @param room		- Room of the game


// Setup temporary variables
var _type, _name, _sprite, _room;

_type   = argument[0];
_name   = argument[1];
_sprite = argument[2];
_room   = argument[3];

// Create unique map
var _map = ds_map_create();

_map[? "type"]		 = _type;
_map[? "name"]		 = _name;
_map[? "sprite"]	 = _sprite;
_map[? "room"]		 = _room;
_map[? "trans"]		 = TransType.none;
_map[? "transCol"]   = c_black;
_map[? "titleFont"]  = fnt_big;
_map[? "titleCol"]   = c_black;

_map[? "shaderEnabled"] = false;
_map[? "shaderSet"]     = -1;

// Add to global list
global.ArcadeMachineList[| _type] = _map;
ds_list_mark_as_map(global.ArcadeMachineList, _type);