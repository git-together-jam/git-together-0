/// @func arcade_game_enable_shader(game_id, bool, [shader])
/// @param game_id
/// @param bool
/// @param [shader]

var _map = global.ArcadeMachineList[| argument[0]];

_map[? "shaderEnabled"] = argument[1];

_map[? "shaderSet"] = (argument[1] && (argument_count > 2)) ? argument[2] : -1;