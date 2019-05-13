/// @desc (TBD) This function will start fading back to the overworld room

audio_stop_all();
room_goto_transition(rm_Overworld,TransType.screenFade);