/// @func argame_game_set_title(game_id, font, color)
/// @param game_id
/// @param font
/// @param color

var _map = global.ArcadeMachineList[| argument[0]];

_map[? "titleFont"]	= argument[1];
_map[? "titleCol"]  = argument[2];
