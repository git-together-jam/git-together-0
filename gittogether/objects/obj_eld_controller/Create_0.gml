/// @description Insert description here
// You can write your code in this editor

#macro ELD_ENEMY_SPACING 17

enum ELDGameState {
	Standby,
	Menu,
	Galaga,
	MissileCommand
};

enum ELDWaveState {
	Spawning,
	Waiting
};

enum ELDMenuButtons {
	Play,
	Leaderboards
};

buttonState = ELDMenuButtons.Play;
buttonSwapCooldown = -1;
gameState = ELDGameState.Menu;
waveState = ELDWaveState.Spawning;

eld_init_tracks();

// 0  1  2  3  4  5  6  7  8  9
//10 11 12 13 14 15 16 17 18 19
//20 21 22 23 24 25 26 27 28 29
//30 31 32 33 34 35 36 37 38 39
//40 41 42 43 44 45 46 47 48 49
waves = [];
#region wave 0
waves[0] =
	[
		[  0, "T00", 11, 12, 21, 22, 31, 32, 41, 42 ],
		[  5, "T01", 13, 14, 23, 24, 33, 34, 43, 44 ],
		[ 10, "T02", 15, 16, 25, 26, 35, 36, 45, 46 ],
		[ 15, "T03", 17, 18, 27, 28, 37, 38, 47, 48 ],
		[ 23, "T01",  0,  1,  2,  3,  4 ],
		[ 23, "T00",  9,  8,  7,  6,  5 ]
	];
#endregion
#region wave 1
waves[1] =
	[
		[  0, "T04", 10, 11, 12, 13, 14, 20, 21, 22, 23, 24 ],
		[  5, "T05", 19, 18, 17, 16, 15, 29, 28, 27, 26, 25 ],
		[ 10, "T06", 30, 32, 40, 42, 34, 36, 44, 46, 38, 48 ],
		[ 15, "T07", 31, 33, 41, 43, 35, 37, 45, 47, 39, 49 ],
		[ 23, "T01",  0,  2,  4,  6,  8 ],
		[ 23, "T00",  9,  7,  5,  3,  1 ]
	];
#endregion
#region wave 2
waves[2] =
	[
		[  0, "T00",  0,  8, 11, 17, 22, 26, 33, 35, 44 ],
		[  5, "T05",  1,  9, 12, 18, 23, 27, 34, 36, 45 ],
		[ 10, "T01",  2,  7,  3,  6,  4,  5, 13, 16, 14, 15],
		[ 15, "T07", 40, 41, 42, 43, 49, 48, 47, 46],
		[ 23, "T04", 10, 20, 30, 21, 31, 32],
		[ 23, "T03", 19, 29, 39, 28, 38, 37 ]
	];
#endregion
#region wave 3
waves[3] =
	[
		[  0, "T04",  0,  1,  2, 12, 22, 32, 42],
		[  0, "T05", 49, 39, 29, 19,  9,  8,  7],
		[  8, "T01", 10, 20, 30, 40, 41],
		[  8, "T02", 17, 27, 37, 47, 48],
		[ 16, "T06", 11, 21, 31,  3, 43, 13, 33, 23],
		[ 16, "T03", 18, 28, 38, 46,  6, 36, 16, 26],
		[ 22, "T00",  4, 15, 24, 35, 44],
		[ 22, "T07",  5, 14, 25, 34, 45],
	];
#endregion

waves_in_progress = ds_list_create();

start_time = current_time * 0.001;
curr_wave = 0;
curr_subwave = 0;

x = room_width div 2 - 5 * ELD_ENEMY_SPACING;
initial_x = x;
origin_x = round(x);

y = ELD_ENEMY_SPACING;

fuelpads_in_wave = 1;

if (!audio_is_playing(snd_eld_music))
	audio_play_sound(snd_eld_music,0,true);
	
enemySprites = [
	spr_eld_enemy_butter,
	spr_eld_enemy_long,
	spr_eld_enemy_sting
];

departTracks = [
	"D00",
	"D01",
	"D02",
	"D03"
];

next_departure = current_time * 0.001 + 2.0;

game_over = false;
game_won = false;
game_lost = false;
eld_score = 0;
bugs_zapped = 0;

global.elduser = "";
global.eldscore = 0;