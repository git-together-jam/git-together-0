/// @func arcade_game_add(type, name, sprite, room)
/// @param type		- Entry from Game enum
/// @param name		- String
/// @param sprite	- Sprite
/// @param room		- Room of the game
/// @param [bool]		- Use Save System


// Setup temporary variables
var _entry, _name, _sprite, _room, _useSaveSystem;

_entry = argument[0];
_name = argument[1];
_sprite = argument[2];
_room = argument[3];
_useSaveSystem = false;

// Get optional arguments

if argument_count > 4 {
	_useSaveSystem = argument[4];	
}

global.GameName[_entry] = _name;
global.GameSpr[_entry]  = _sprite;
global.GameRoom[_entry] = _room;

// Adds to save system
if (_useSaveSystem) _sys_save_arcade_add(_name);