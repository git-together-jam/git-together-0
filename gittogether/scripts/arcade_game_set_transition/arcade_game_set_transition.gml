/// @func arcade_game_set_transition(game_id,transition_type,color)
/// @param game_id
/// @param transition_type
/// @param color

var _map = global.ArcadeMachineList[| argument[0]];

_map[? "trans"]	   = argument[1];
_map[? "transCol"] = (argument_count > 2) ? argument[2] : c_black;
