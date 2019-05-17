/// @desc Set characters

characters = json_decode(string_concat(@'{ 
	"tony": {
		"full_name": "TonyStr",
		"sprite": ', spr_dr_tonystr, @',
		"social": "https://tonystr.net",
		"seat": 0,
	},
	"math": {
		"full_name": "Matharoo",
		"sprite": ', spr_dr_matharoo, @',
		"social": "https://twitter.com/itsmatharoot",
		"seat": 1,
	},
	"jxm": {
		"full_name": "Juju",
		"sprite": ', spr_dr_juju, @',
		"social": "https://jujuadams.com/",
		"seat": 2,
	},
	"sahaun": {
		"full_name": "Sahaun",
		"sprite": ', spr_dr_sahaun, @',
		"social": "https://twitter.com/sohomsahaun",
		"seat": 3,
	},
	"yosi": {
		"full_name": "Yosi",
		"sprite": ', spr_dr_yosi, @',
		"social": "https://pureemaison.com/en/404",
		"seat": 4,
	},
	"abae": {
		"full_name": "Andy Bae",
		"sprite": ', spr_credits_andyb, @',
		"social": "https://pureemaison.com/en/404",
		"seat": 5,
	},
	"dtir": {
		"full_name": "David Tirado",
		"sprite": ', spr_credits_dtir, @',
		"social": "https://twitter.com/WaxDevs",
		"seat": 6,
	},
	"qweleo": {
		"full_name": "Qweleo",
		"sprite": ', spr_credits_qweleo, @',
		"social": "https://pureemaison.com/en/404",
		"seat": 7,
	},
	"levg": {
		"full_name": "Levgon",
		"sprite": ', spr_credits_levg, @',
		"social": "https://pureemaison.com/en/404",
		"seat": 8,
	},
	"xor": {
		"full_name": "Xor",
		"sprite": ', spr_credits_xor, @',
		"social": "https://twitter.com/XorDev",
		"seat": 9,
	},
	"naxos": {
		"full_name": "Naxos",
		"sprite": ', spr_credits_naxos, @',
		"social": "https://twitter.com/naxospade",
		"seat": 10,
	},
	"qst": {
		"full_name": "Qst0",
		"sprite": ', spr_credits_qst, @',
		"social": "https://qst0.com",
		"seat": 11,
	},
	"havik": {
		"full_name": "havik",
		"sprite": ', spr_credits_havik, @',
		"social": "https://twitter.com/matthavik",
		"seat": 12,
	},
	"surg": {
		"full_name": "!Surg",
		"sprite": ', spr_credits_surg, @',
		"social": "https://www.twitch.tv/surgdev",
		"seat": 13,
	},
	"tabe": {
		"full_name": "TabularElf",
		"sprite": ', spr_credits_maki, @',
		"social": "https://twitter.com/RealTabularElf",
		"seat": 14,
	},
	"see": {
		"full_name": "SeeBeyond",
		"sprite": ', spr_credits_see, @',
		"social": "https://twitter.com/BirbCafe",
		"seat": 15,
	},
	"meseta": {
		"full_name": "Meseta",
		"sprite": ', spr_credits_meseta, @',
		"social": "https://twitter.com/mesetatron",
		"seat": 16,
	}
}'));

seat = [
	"tony", "math", "jxm", "sahaun", "yosi", 
	"abae", "dtir", "qweleo", "levg", "xor", 
	"naxos", "qst", "havik", "surg", "tabe",
	"see", "meseta"
];