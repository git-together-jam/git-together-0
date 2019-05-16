/// @func end_minigame(won?)
/// @param won?

var _won = (argument_count > 0) ? argument[0] : false;
if (_won) global.Coins += DEF_COIN_REWARD;

audio_stop_all();
room_goto_transition(rm_Overworld,TransType.screenFade);