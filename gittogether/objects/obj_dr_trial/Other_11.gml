/// @desc Set characters

characters = json_decode(string_concat(@'{ 
	"tony": {
		"full_name": "TonyStr",
		"sprite": ', spr_dr_tonystr, @',
		"seat": 0,
		"ultimate": "Skin Creator"
	},
	"math": {
		"full_name": "Matharoo",
		"sprite": ', spr_dr_matharoo, @',
		"seat": 1,
		"ultimate": "Community Leader"
	},
	"jxm": {
		"full_name": "Juju",
		"sprite": ', spr_dr_juju, @',
		"seat": 2,
		"ultimate": "???"
	},
	"pope": {
		"full_name": "Jon Pope",
		"sprite": ', spr_dr_pope, @',
		"seat": 3,
		"ultimate": "Pope"
	},
	"sahaun": {
		"full_name": "Sahaun",
		"sprite": ', spr_dr_sahaun, @',
		"seat": 4,
		"ultimate": "Snowman"
	},
	"yellowaf": {
		"full_name": "YellowAfterlife",
		"sprite": ', spr_dr_yellowaf, @',
		"seat": 5,
		"ultimate": "Programming Wizard"
	},
	"yosi": {
		"full_name": "Yosi",
		"sprite": ', spr_dr_yosi, @',
		"seat": 6,
		"ultimate": "Code Obfuscator"
	},
	"minty": {
		"full_name": "Minty Python",
		"sprite": ', spr_dr_minty, @',
		"seat": 7,
		"ultimate": "Penguin"
	}
}'));

seat = ["tony", "math", "jxm", "pope", "sahaun", "yellowaf", "yosi", "minty"];