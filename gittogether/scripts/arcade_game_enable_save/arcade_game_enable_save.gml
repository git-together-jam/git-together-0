/// @func arcade_game_enable_save(game_id, bool)
/// @param game_id
/// @param bool

var _map = global.ArcadeMachineList[| argument[0]];

if (argument[1]) _sys_save_arcade_add(_map[? "name"]);