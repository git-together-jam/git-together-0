/// @func arcade_game_add(type, name, sprite, room)
/// @param type		- Entry from Game enum
/// @param name		- String
/// @param sprite	- Sprite
/// @param room		- Room of the game
/// @param [bool]	- Use Save System


// Setup temporary variables
var _type, _name, _sprite, _room, _useSaveSystem;

_type   = argument[0];
_name   = argument[1];
_sprite = argument[2];
_room   = argument[3];
_useSaveSystem = (argument_count > 4) ? argument[4] : false;

// Create unique map
var _map = ds_map_create();
_map[? "type"]   = _type;
_map[? "name"]   = _name;
_map[? "sprite"] = _sprite;
_map[? "room"]   = _room;

// Add to global list
ds_list_add_map(global.ArcadeMachineList, _map);

// Add to save system - Optional
if (_useSaveSystem) _sys_save_arcade_add(_name);