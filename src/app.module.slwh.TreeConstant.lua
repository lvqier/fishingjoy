Tree = Tree or {}
Tree.root = "res/gameres/module/slwh/"
Tree.CameraFlag = 4
Tree.ModelNumber = 24
Tree.ZeroPosition = {
	z = 0,
	x = 0,
	y = 0
}
Tree.TagNodeBrick = 113
Tree.TagStagePointer = 114
Tree.TagActNode = 115
Tree.TagActNodeSound = 116
Tree.TagAnimalModel = 117
Tree.TagNodeSceneReward = 119
Tree.TagCamera = 120
Tree.TagTV = 128
Tree.TagOther = 131
Tree.TagSongDengTV = 134
SLWH_AFTER_WITHDRAWAL_CAN_BET = false
SLWH_BET_SPRITE_CACHE_MAX = 500
SLWH_BET_SCORE_RATE_DATA = 1
SLWH_BET_SCORE_RATE_VIEW = 1
SLWH_MULTI_FONT = {
	"#slwh_jetton_red_multi_%s.png",
	"#slwh_jetton_red_multi_%s.png",
	"#slwh_jetton_red_multi_%s.png",
	"#slwh_jetton_red_multi_%s.png",
	"#slwh_jetton_yellow_multi_%s.png",
	"#slwh_jetton_yellow_multi_%s.png",
	"#slwh_jetton_yellow_multi_%s.png",
	"#slwh_jetton_yellow_multi_%s.png",
	"#slwh_jetton_green_multi_%s.png",
	"#slwh_jetton_green_multi_%s.png",
	"#slwh_jetton_green_multi_%s.png",
	"#slwh_jetton_green_multi_%s.png",
	"#slwh_jetton_blue_multi_%s.png",
	"#slwh_jetton_blue_multi_%s.png",
	"#slwh_jetton_blue_multi_%s.png"
}
SLWH_SELF_BET_FONT = {
	"#slwh_jetton_red_bet_%s.png",
	"#slwh_jetton_red_bet_%s.png",
	"#slwh_jetton_red_bet_%s.png",
	"#slwh_jetton_red_bet_%s.png",
	"#slwh_jetton_yellow_bet_%s.png",
	"#slwh_jetton_yellow_bet_%s.png",
	"#slwh_jetton_yellow_bet_%s.png",
	"#slwh_jetton_yellow_bet_%s.png",
	"#slwh_jetton_green_bet_%s.png",
	"#slwh_jetton_green_bet_%s.png",
	"#slwh_jetton_green_bet_%s.png",
	"#slwh_jetton_green_bet_%s.png",
	"#slwh_jetton_blue_bet_%s.png",
	"#slwh_jetton_blue_bet_%s.png",
	"#slwh_jetton_blue_bet_%s.png"
}
SLWH_OTHER_BET_FONT = {
	"#slwh_jetton_red_bet_other_%s.png",
	"#slwh_jetton_red_bet_other_%s.png",
	"#slwh_jetton_red_bet_other_%s.png",
	"#slwh_jetton_red_bet_other_%s.png",
	"#slwh_jetton_yellow_bet_other_%s.png",
	"#slwh_jetton_yellow_bet_other_%s.png",
	"#slwh_jetton_yellow_bet_other_%s.png",
	"#slwh_jetton_yellow_bet_other_%s.png",
	"#slwh_jetton_green_bet_other_%s.png",
	"#slwh_jetton_green_bet_other_%s.png",
	"#slwh_jetton_green_bet_other_%s.png",
	"#slwh_jetton_green_bet_other_%s.png",
	"#slwh_jetton_blue_bet_other_%s.png",
	"#slwh_jetton_blue_bet_other_%s.png",
	"#slwh_jetton_blue_bet_other_%s.png"
}
Tree.ActionType = {
	ActionType_MoveBy = 4,
	ActionType_Jump = 1,
	ActionType_Speed = 6,
	ActionType_Base = 0,
	ActionType_DelayTime = 3,
	ActionType_Callback = 2,
	ActionType_Sequence = 5,
	ActionType_SineOut = 7
}
Tree.LoadingType = {
	LoadingType_Sprite = 3,
	LoadingType_Spine = 2,
	LoadingType_Animation3D = 1
}
Tree.Status = {
	Over = 101,
	Play = 100,
	Wait = 0
}
Tree.JettonRetType = {
	RetType_ReachPersonalLimit = 2,
	RetType_ReachAreaLimit = 1,
	RetType_ZhuangXianOnlyOne = 3,
	RetType_Success = 0
}
Tree.RewardType = {
	RewardType_None = 0,
	RewardType_SongDeng = 4,
	RewardType_ShanDian = 5,
	RewardType_DaSiXi = 3,
	RewardType_DaSanYuan = 2,
	RewardType_CaiJin = 6,
	RewardType_Normal = 1,
	RewardType_Max = 7
}
Tree.CardType = {
	CardType_LionYellow = 4,
	CardType_RabbitYellow = 7,
	CardType_PandaYellow = 5,
	CardType_LionRed = 0,
	CardType_LionGreen = 8,
	CardType_MonkeyGreen = 10,
	CardType_Zhuang = 12,
	CardType_He = 13,
	CardType_Xian = 14,
	CardType_MonkeyYellow = 6,
	CardType_PandaRed = 1,
	CardType_PandaGreen = 9,
	CardType_Max = 15,
	CardType_Rabbit = 11,
	CardType_Monkey = 2
}
Tree.ModelType = {
	ModelType_Rabbit = 4,
	ModelType_Monkey = 3,
	ModelType_Caijin = 7,
	ModelType_DaSiXi = 10,
	ModelType_Lion = 1,
	ModelType_Multi3 = 6,
	ModelType_SongDeng = 8,
	ModelType_Multi2 = 5,
	ModelType_Panda = 2,
	ModelType_DaSanYuan = 9
}
Tree.ModelPath = {
	[Tree.ModelType.ModelType_Lion] = Tree.root .. "model/shizi.c3b",
	[Tree.ModelType.ModelType_Panda] = Tree.root .. "model/xiongmao.c3b",
	[Tree.ModelType.ModelType_Monkey] = Tree.root .. "model/houzi.c3b",
	[Tree.ModelType.ModelType_Rabbit] = Tree.root .. "model/tuzi.c3b",
	[Tree.ModelType.ModelType_Multi2] = Tree.root .. "model/slwh_beishu2.c3b",
	[Tree.ModelType.ModelType_Multi3] = Tree.root .. "model/slwh_beishu3.c3b",
	[Tree.ModelType.ModelType_Caijin] = Tree.root .. "model/slwh_caijin.c3b",
	[Tree.ModelType.ModelType_SongDeng] = Tree.root .. "model/slwh_songdeng.c3b"
}
Tree.PartyModelPath = {
	[Tree.RewardType.RewardType_Normal] = {
		pointerModel = Tree.root .. "model/slwh_yuanshipoint.c3b",
		partyModel = Tree.root .. "model/slwh_yuanshistage.c3b"
	},
	[Tree.RewardType.RewardType_DaSanYuan] = {
		pointerModel = Tree.root .. "model/dasanyuan/slwh_dsystagepoint.c3b",
		partyModel = Tree.root .. "model/dasanyuan/slwh_dsystage.c3b"
	},
	[Tree.RewardType.RewardType_DaSiXi] = {
		pointerModel = Tree.root .. "model/dasixi/slwh_dsxstagepoint.c3b",
		partyModel = Tree.root .. "model/dasixi/slwh_dsxstage.c3b"
	},
	[Tree.RewardType.RewardType_CaiJin] = {
		pointerModel = Tree.root .. "model/caijin/slwh_cjstagepoint.c3b",
		partyModel = Tree.root .. "model/caijin/slwh_cjstage.c3b"
	}
}
Tree.PartyAnimationType = {
	AnimationType_Normal = 2,
	AnimationType_Down = 3,
	AnimationType_Up = 1
}
Tree.PartyModelAnimation = {
	[Tree.RewardType.RewardType_Normal] = {
		[Tree.PartyAnimationType.AnimationType_Up] = {
			from = 0,
			to = 30
		},
		[Tree.PartyAnimationType.AnimationType_Normal] = {
			from = 30,
			to = 60
		},
		[Tree.PartyAnimationType.AnimationType_Down] = {
			from = 60,
			to = 90
		}
	},
	[Tree.RewardType.RewardType_DaSanYuan] = {
		[Tree.PartyAnimationType.AnimationType_Up] = {
			from = 0,
			to = 16
		},
		[Tree.PartyAnimationType.AnimationType_Normal] = {
			from = 16,
			to = 32
		},
		[Tree.PartyAnimationType.AnimationType_Down] = {
			from = 32,
			to = 48
		}
	},
	[Tree.RewardType.RewardType_DaSiXi] = {
		[Tree.PartyAnimationType.AnimationType_Up] = {
			from = 0,
			to = 36
		},
		[Tree.PartyAnimationType.AnimationType_Normal] = {
			from = 36,
			to = 52
		},
		[Tree.PartyAnimationType.AnimationType_Down] = {
			from = 52,
			to = 64
		}
	},
	[Tree.RewardType.RewardType_CaiJin] = {
		[Tree.PartyAnimationType.AnimationType_Up] = {
			from = 0,
			to = 20
		},
		[Tree.PartyAnimationType.AnimationType_Normal] = {
			from = 120,
			to = 240
		},
		[Tree.PartyAnimationType.AnimationType_Down] = {
			from = 20,
			to = 35
		}
	}
}
Tree.AnimationType = {
	AnimationType_Reward = 3,
	AnimationType_Activity = 1,
	AnimationType_Jump = 2
}
Tree.AlignType = {
	AlignType_Left = 1,
	AlignType_Right = 2,
	AlignType_Center = 3,
	AlignType_None = 0
}
Tree.Sound = {
	ShanDianEffect = "shandian_pixia_effect.mp3",
	BetScoreEffect2 = "betScoreEffect2.mp3",
	RotateSceneEffect = "rotate_scene_effect.mp3",
	RewardBreakOutEffect = "reward_breakout_effect.mp3",
	XiaZhuMianBanEffect = "xiazhu_auto.mp3",
	BetScoreEffect1 = "betScoreEffect1.mp3",
	roomBgSound = "roomBg.mp3",
	battleWaitBg = "battle_wait.mp3",
	RotateSceneOverEffect = "rotate_scene_over_effect.mp3",
	battleZhuanpan = "battle_zhuanpan.mp3",
	AwardSound = {
		[Tree.RewardType.RewardType_Normal] = {
			[Tree.ModelType.ModelType_Lion] = "zj_shizi_sound.mp3",
			[Tree.ModelType.ModelType_Panda] = "zj_xiongmao_sound.mp3",
			[Tree.ModelType.ModelType_Monkey] = "zj_houzi_sound.mp3",
			[Tree.ModelType.ModelType_Rabbit] = "zj_tuzi_sound.mp3"
		},
		[Tree.RewardType.RewardType_DaSanYuan] = "zj_teshu_sound.mp3",
		[Tree.RewardType.RewardType_DaSiXi] = "zj_teshu_sound.mp3",
		[Tree.RewardType.RewardType_SongDeng] = "zj_teshu_sound.mp3",
		[Tree.RewardType.RewardType_ShanDian] = "zj_teshu_sound.mp3",
		[Tree.RewardType.RewardType_CaiJin] = "zj_teshu_sound.mp3"
	},
	AnimalPlayRewardEffect = {
		[Tree.ModelType.ModelType_Lion] = "hh_shizi_effect.mp3",
		[Tree.ModelType.ModelType_Panda] = "hh_xiongmao_effect.mp3",
		[Tree.ModelType.ModelType_Monkey] = "hh_houzi_effect.mp3",
		[Tree.ModelType.ModelType_Rabbit] = "hh_tuzi_effect.mp3"
	},
	AnimalSelectEffect = {
		[Tree.ModelType.ModelType_Lion] = "xz_shizi_effect.mp3",
		[Tree.ModelType.ModelType_Panda] = "xz_xiongmao_effect.mp3",
		[Tree.ModelType.ModelType_Monkey] = "xz_houzi_effect.mp3",
		[Tree.ModelType.ModelType_Rabbit] = "xz_tuzi_effect.mp3"
	},
	ZXHEffect = {
		[Tree.CardType.CardType_Zhuang] = "r3_zhuang_effect.mp3",
		[Tree.CardType.CardType_He] = "r3_he_effect.mp3",
		[Tree.CardType.CardType_Xian] = "r3_xian_effect.mp3"
	},
	ColorSelectEffect = {
		"color_hong_effect.mp3",
		"color_huang_effect.mp3",
		"color_lv_effect.mp3"
	},
	SpecialRewardEffect = {
		[Tree.RewardType.RewardType_DaSanYuan] = "r_dasanyuan_effect.mp3",
		[Tree.RewardType.RewardType_DaSiXi] = "r_dasixi_effect.mp3",
		[Tree.RewardType.RewardType_SongDeng] = "r_songdeng_effect.mp3",
		[Tree.RewardType.RewardType_ShanDian] = "r_shandian_effect.mp3",
		[Tree.RewardType.RewardType_CaiJin] = "r_caijin_effect.mp3"
	}
}
Tree.ModelAnimation = {
	[Tree.ModelType.ModelType_Lion] = {
		[Tree.AnimationType.AnimationType_Activity] = {
			from = 200,
			to = 290
		},
		[Tree.AnimationType.AnimationType_Jump] = {
			from = 300,
			to = 360
		},
		[Tree.AnimationType.AnimationType_Reward] = {
			from = 0,
			to = 120
		}
	},
	[Tree.ModelType.ModelType_Panda] = {
		[Tree.AnimationType.AnimationType_Activity] = {
			from = 11,
			to = 111
		},
		[Tree.AnimationType.AnimationType_Jump] = {
			from = 300,
			to = 360
		},
		[Tree.AnimationType.AnimationType_Reward] = {
			from = 150,
			to = 270
		}
	},
	[Tree.ModelType.ModelType_Monkey] = {
		[Tree.AnimationType.AnimationType_Activity] = {
			from = 200,
			to = 290
		},
		[Tree.AnimationType.AnimationType_Jump] = {
			from = 300,
			to = 360
		},
		[Tree.AnimationType.AnimationType_Reward] = {
			from = 0,
			to = 120
		}
	},
	[Tree.ModelType.ModelType_Rabbit] = {
		[Tree.AnimationType.AnimationType_Activity] = {
			from = 2,
			to = 116
		},
		[Tree.AnimationType.AnimationType_Jump] = {
			from = 120,
			to = 180
		},
		[Tree.AnimationType.AnimationType_Reward] = {
			from = 190,
			to = 330
		}
	}
}
Tree.Room = {
	{
		{
			json = Tree.root .. "animation/slwh_tyc/slwh_tyxcbg.json",
			atlas = Tree.root .. "animation/slwh_tyc/slwh_tyxcbg.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_tyc/slwh_tyxc.json",
			atlas = Tree.root .. "animation/slwh_tyc/slwh_tyxc.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_tyc/slwh_tycgx.json",
			atlas = Tree.root .. "animation/slwh_tyc/slwh_tycgx.atlas"
		}
	},
	{
		{
			json = Tree.root .. "animation/slwh_cjc/slwh_cjxcbg.json",
			atlas = Tree.root .. "animation/slwh_cjc/slwh_cjxcbg.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_cjc/slwh_cjxc.json",
			atlas = Tree.root .. "animation/slwh_cjc/slwh_cjxc.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_cjc/slwh_cjxcgx.json",
			atlas = Tree.root .. "animation/slwh_cjc/slwh_cjxcgx.atlas"
		}
	},
	{
		{
			json = Tree.root .. "animation/slwh_ptc/slwh_ptxcbg.json",
			atlas = Tree.root .. "animation/slwh_ptc/slwh_ptxcbg.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_ptc/slwh_ptxc.json",
			atlas = Tree.root .. "animation/slwh_ptc/slwh_ptxc.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_ptc/slwh_ptxcgx.json",
			atlas = Tree.root .. "animation/slwh_ptc/slwh_ptxcgx.atlas"
		}
	},
	{
		{
			json = Tree.root .. "animation/slwh_zjc/slwh_zjxcbg.json",
			atlas = Tree.root .. "animation/slwh_zjc/slwh_zjxcbg.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_zjc/slwh_zjxc.json",
			atlas = Tree.root .. "animation/slwh_zjc/slwh_zjxc.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_zjc/slwh_zjxcgx.json",
			atlas = Tree.root .. "animation/slwh_zjc/slwh_zjxcgx.atlas"
		}
	},
	{
		{
			json = Tree.root .. "animation/slwh_gjc/slwh_gjxcbg.json",
			atlas = Tree.root .. "animation/slwh_gjc/slwh_gjxcbg.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_gjc/slwh_gjxc.json",
			atlas = Tree.root .. "animation/slwh_gjc/slwh_gjxc.atlas"
		},
		{
			json = Tree.root .. "animation/slwh_gjc/slwh_gjxcgx.json",
			atlas = Tree.root .. "animation/slwh_gjc/slwh_gjxcgx.atlas"
		}
	}
}
Tree.BrickTexture = {
	{
		Tree.root .. "model/light/02_basecolor_01.png",
		Tree.root .. "model/light/02_basecolor_0_09.png"
	},
	{
		Tree.root .. "model/light/02_basecolor_03.png",
		Tree.root .. "model/light/02_basecolor_0_03.png"
	},
	{
		Tree.root .. "model/light/02_basecolor_02.png",
		Tree.root .. "model/light/02_basecolor_0_06.png"
	}
}
Tree.BrickBlackTexture = Tree.root .. "model/light/02_basecolor_04.png"
Tree.Event = {
	enterForeground = "tree_event_enter_foreground",
	startJetton = "tree_event_start_jetton",
	gameBetContinue = "tree_event_game_bet_continue",
	closeJettonView = "tree_event_close_jetton_view",
	gameOver = "tree_event_game_over",
	queryGameStatus = "tree_event_query_game_status",
	enterBackghround = "tree_event_enter_background",
	gameStart = "tree_event_game_start",
	gameBet = "tree_event_game_bet",
	closeGame = "tree_event_close_game",
	loadScene = "tree_event_load_scene",
	jettonCancel = "tree_event_jetton_cancel",
	cancelAllBets = "tree_event_cancel_all_bets",
	gameStatusRefresh = "tree_event_game_status_refresh",
	jettonFailed = "tree_event_jetton_failed",
	gameWait = "tree_event_game_wait"
}
Tree.JettonFrames = {
	{
		"red_1_number_%s",
		"red_2_number_%s",
		"red_3_number_%s"
	},
	{
		"yellow_1_number_%s",
		"yellow_2_number_%s",
		"yellow_3_number_%s"
	},
	{
		"green_1_number_%s",
		"green_2_number_%s",
		"green_3_number_%s"
	}
}
Tree.JettonNumbers = {
	Tree.JettonFrames[1],
	Tree.JettonFrames[1],
	Tree.JettonFrames[1],
	Tree.JettonFrames[1],
	Tree.JettonFrames[2],
	Tree.JettonFrames[2],
	Tree.JettonFrames[2],
	Tree.JettonFrames[2],
	Tree.JettonFrames[3],
	Tree.JettonFrames[3],
	Tree.JettonFrames[3],
	Tree.JettonFrames[3],
	Tree.JettonFrames[1],
	Tree.JettonFrames[2],
	Tree.JettonFrames[3]
}
Tree.CameraScale = display.height / CONFIG_DESIGN_HEIGHT
Tree.SceneLocation = {
	Camera = {
		startAngle = -39.2,
		finalAngle = -28.7,
		eyePosition = {
			x = 0,
			y = 226.2 * Tree.CameraScale,
			z = 314.2 * Tree.CameraScale
		},
		finalPosition = {
			x = 0,
			y = 101.7 * Tree.CameraScale,
			z = 180.2 * Tree.CameraScale
		}
	},
	Camera2 = {
		startAngle = -39.2,
		finalAngle = -33,
		eyePosition = {
			x = 0,
			y = 226.2 * Tree.CameraScale,
			z = 314.2 * Tree.CameraScale
		},
		finalPosition = {
			x = 0,
			y = 138 * Tree.CameraScale,
			z = 206 * Tree.CameraScale
		}
	},
	CameraBetween = {
		middlePosition = {
			x = 0,
			y = 299.2 * Tree.CameraScale,
			z = 255.7 * Tree.CameraScale
		},
		middleAngle = {
			z = 0,
			x = -54.6,
			y = 0
		}
	},
	ParticleLocation = {
		[Tree.RewardType.RewardType_DaSanYuan] = {
			z = 0,
			x = 0,
			y = 1
		},
		[Tree.RewardType.RewardType_DaSiXi] = {
			z = 0,
			x = 0,
			y = 0
		},
		[Tree.RewardType.RewardType_SongDeng] = {
			z = 0,
			x = 0,
			y = -18
		}
	},
	TVModel = {
		z = -184,
		x = 0,
		y = 108
	},
	Location = {
		[Tree.RewardType.RewardType_Normal] = {
			{
				z = 0,
				x = 0,
				y = -18
			}
		},
		[Tree.RewardType.RewardType_DaSanYuan] = {
			{
				z = 18.7,
				x = 22.8,
				y = 1
			},
			{
				z = 18.1,
				x = -24.3,
				y = 1
			},
			{
				z = -26.4,
				x = 0.2,
				y = 1
			}
		},
		[Tree.RewardType.RewardType_DaSiXi] = {
			{
				z = 48,
				x = 0,
				y = 0
			},
			{
				z = 0,
				x = -53,
				y = 0
			},
			{
				z = -48,
				x = 0,
				y = 0
			},
			{
				z = 0,
				x = 53,
				y = 0
			}
		},
		[Tree.RewardType.RewardType_ShanDian] = {
			{
				z = 0,
				x = 0,
				y = -18
			}
		},
		[Tree.RewardType.RewardType_CaiJin] = {
			{
				z = 0,
				x = 0,
				y = 1
			}
		},
		[Tree.RewardType.RewardType_SongDeng] = {
			{
				{
					z = 0,
					x = 0,
					y = -18
				}
			},
			{
				{
					z = -3.3,
					x = -30,
					y = -18
				},
				{
					z = -3.3,
					x = 30,
					y = -18
				}
			},
			{
				{
					z = 0,
					x = 0,
					y = -18
				},
				{
					z = 0,
					x = 60,
					y = -18
				},
				{
					z = 0,
					x = -60,
					y = -18
				}
			},
			{
				{
					z = 0,
					x = -32,
					y = -18
				},
				{
					z = 0,
					x = -84,
					y = -18
				},
				{
					z = 0,
					x = 32,
					y = -18
				},
				{
					z = 0,
					x = 84,
					y = -18
				}
			},
			{
				{
					z = 66,
					x = -33,
					y = -18
				},
				{
					z = -40,
					x = 0,
					y = -18
				},
				{
					z = 0,
					x = -70,
					y = -18
				},
				{
					z = 0,
					x = 70,
					y = -18
				},
				{
					z = 66,
					x = 33,
					y = -18
				}
			},
			{
				{
					z = 57.8,
					x = -25.6,
					y = -18
				},
				{
					z = -41.4,
					x = -28.2,
					y = -18
				},
				{
					z = -43.4,
					x = 27.9,
					y = -18
				},
				{
					z = 4,
					x = -58.6,
					y = -18
				},
				{
					z = 7.5,
					x = 57.7,
					y = -18
				},
				{
					z = 56.8,
					x = 25.4,
					y = -18
				}
			},
			{
				{
					z = 57,
					x = -41.7,
					y = -18
				},
				{
					z = -29.3,
					x = 25.1,
					y = -18
				},
				{
					z = -31.4,
					x = -25.2,
					y = -18
				},
				{
					z = 12.4,
					x = -58.3,
					y = -18
				},
				{
					z = 12.6,
					x = 58.5,
					y = -18
				},
				{
					z = 57.4,
					x = 40.9,
					y = -18
				},
				{
					z = 68,
					x = -1.3,
					y = -18
				}
			},
			{
				{
					z = 30.3,
					x = -32.9,
					y = -18
				},
				{
					z = -33.7,
					x = 0,
					y = -18
				},
				{
					z = -15.9,
					x = 33.5,
					y = -18
				},
				{
					z = -16.4,
					x = -33.3,
					y = -18
				},
				{
					z = -1.5,
					x = -67.4,
					y = -18
				},
				{
					z = 32.3,
					x = 33,
					y = -18
				},
				{
					z = -0.4,
					x = 66.5,
					y = -18
				},
				{
					z = 9,
					x = 0.1,
					y = -18
				}
			},
			{
				{
					z = 65.2,
					x = -54.4,
					y = -18
				},
				{
					z = 65.2,
					x = 54.4,
					y = -18
				},
				{
					z = -60.5,
					x = 44.9,
					y = -18
				},
				{
					z = -60.8,
					x = -44.9,
					y = -18
				},
				{
					z = 0,
					x = -80.7,
					y = -18
				},
				{
					z = 0,
					x = 80.6,
					y = -18
				},
				{
					z = 0,
					x = 31.3,
					y = -18
				},
				{
					z = 60.9,
					x = 0,
					y = -18
				},
				{
					z = 0,
					x = -31.3,
					y = -18
				}
			},
			{
				{
					z = 57.8,
					x = -46.9,
					y = -18
				},
				{
					z = -51.8,
					x = 52.1,
					y = -19
				},
				{
					z = -52.2,
					x = -52.3,
					y = -18
				},
				{
					z = 0.4,
					x = -82.9,
					y = -18
				},
				{
					z = 0.2,
					x = 80.1,
					y = -18
				},
				{
					z = 57.9,
					x = 48.5,
					y = -18
				},
				{
					z = 0.9,
					x = -39.6,
					y = -18
				},
				{
					z = 0.2,
					x = 37,
					y = -18
				},
				{
					z = -19.8,
					x = 0.6,
					y = -18
				},
				{
					z = 31.1,
					x = 0.3,
					y = -18
				}
			},
			{
				{
					z = 48.5,
					x = -48.6,
					y = -18
				},
				{
					z = -51.8,
					x = 52.1,
					y = -19
				},
				{
					z = -52.2,
					x = -52.3,
					y = -18
				},
				{
					z = 0.4,
					x = -82.9,
					y = -18
				},
				{
					z = 0.2,
					x = 80.1,
					y = -18
				},
				{
					z = 81.7,
					x = -0.7,
					y = -18
				},
				{
					z = 48.1,
					x = 48.9,
					y = -18
				},
				{
					z = 0.9,
					x = -39.6,
					y = -18
				},
				{
					z = 0.2,
					x = 37,
					y = -18
				},
				{
					z = -13.4,
					x = 0.2,
					y = -18
				},
				{
					z = 35.6,
					x = -0.1,
					y = -18
				}
			},
			{
				{
					z = 48.9,
					x = -55.8,
					y = -18
				},
				{
					z = -48.4,
					x = 55.6,
					y = -19
				},
				{
					z = -83.2,
					x = 0.3,
					y = -18
				},
				{
					z = -48.5,
					x = -55.5,
					y = -18
				},
				{
					z = 0.4,
					x = -82.9,
					y = -18
				},
				{
					z = 0.2,
					x = 80.1,
					y = -18
				},
				{
					z = 81.7,
					x = -0.7,
					y = -18
				},
				{
					z = 49.8,
					x = 54.7,
					y = -18
				},
				{
					z = 0.9,
					x = -39.6,
					y = -18
				},
				{
					z = 0.2,
					x = 37,
					y = -18
				},
				{
					z = -37.4,
					x = 0.1,
					y = -18
				},
				{
					z = 35.6,
					x = -0.1,
					y = -18
				}
			}
		}
	}
}
Tree.ObjectType = {
	ObjectType_Cocos2dx = 1,
	ObjectType_Lua = 2
}
Tree.CacheType = {
	CacheType_SpriteFrame = 4,
	CacheType_RollingText = 4,
	CacheType_Particle = 2,
	CacheType_Sprite = 3,
	CacheType_Spine = 1
}
Tree.CacheTemplate = {
	spine_award_result = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_kjjg.json",
		atlas = Tree.root .. "effect/slwh_kjjg.atlas",
		cache = Tree.root .. "effect/slwh_kjjg"
	},
	spine_award_dasanyuan = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_dsy.json",
		atlas = Tree.root .. "effect/slwh_dsy.atlas",
		cache = Tree.root .. "effect/slwh_dsy"
	},
	spine_award_dasixi = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_dsx.json",
		atlas = Tree.root .. "effect/slwh_dsx.atlas",
		cache = Tree.root .. "effect/slwh_dsx"
	},
	spine_fire = {
		max_count = 6,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_yanhuaeffect.json",
		atlas = Tree.root .. "effect/slwh_yanhuaeffect.atlas",
		cache = Tree.root .. "effect/slwh_yanhuaeffect"
	},
	spine_bet_btn = {
		max_count = 5,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_xzgd.json",
		atlas = Tree.root .. "effect/slwh_xzgd.atlas",
		cache = Tree.root .. "effect/slwh_xzgd"
	},
	spine_menuitem_show = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_xztxlg.json",
		atlas = Tree.root .. "effect/slwh_xztxlg.atlas",
		cache = Tree.root .. "effect/slwh_xztxlg"
	},
	beishu_effect = {
		max_count = 1,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_beishueffect.json",
		atlas = Tree.root .. "effect/slwh_beishueffect.atlas",
		cache = Tree.root .. "effect/slwh_beishueffect"
	},
	caijin_effect = {
		max_count = 1,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_caijineffect.json",
		atlas = Tree.root .. "effect/slwh_caijineffect.atlas",
		cache = Tree.root .. "effect/slwh_caijineffect"
	},
	slwh_dancing = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_dancinggs.json",
		atlas = Tree.root .. "effect/slwh_dancinggs.atlas",
		cache = Tree.root .. "effect/slwh_dancinggs"
	},
	slwh_stagegs = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_stagegs.json",
		atlas = Tree.root .. "effect/slwh_stagegs.atlas",
		cache = Tree.root .. "effect/slwh_stagegs"
	},
	slwh_jumpsmoke = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_jumpsmoke.json",
		atlas = Tree.root .. "effect/slwh_jumpsmoke.atlas",
		cache = Tree.root .. "effect/slwh_jumpsmoke"
	},
	slwh_animal_1 = {
		max_count = 4,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_shizigx.json",
		atlas = Tree.root .. "effect/slwh_shizigx.atlas",
		cache = Tree.root .. "effect/slwh_shizigx"
	},
	slwh_animal_2 = {
		max_count = 4,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_xiongmaogx.json",
		atlas = Tree.root .. "effect/slwh_xiongmaogx.atlas",
		cache = Tree.root .. "effect/slwh_xiongmaogx"
	},
	slwh_animal_3 = {
		max_count = 4,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_houzigx.json",
		atlas = Tree.root .. "effect/slwh_houzigx.atlas",
		cache = Tree.root .. "effect/slwh_houzigx"
	},
	slwh_animal_4 = {
		max_count = 4,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_tuzigx.json",
		atlas = Tree.root .. "effect/slwh_tuzigx.atlas",
		cache = Tree.root .. "effect/slwh_tuzigx"
	},
	slwh_daojishi = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_daojishi.json",
		atlas = Tree.root .. "effect/slwh_daojishi.atlas",
		cache = Tree.root .. "effect/slwh_daojishi"
	},
	slwh_xiazhutips = {
		max_count = 2,
		type = Tree.CacheType.CacheType_Spine,
		type = Tree.CacheType.CacheType_Spine,
		json = Tree.root .. "effect/slwh_xiazhutips.json",
		atlas = Tree.root .. "effect/slwh_xiazhutips.atlas",
		cache = Tree.root .. "effect/slwh_xiazhutips"
	},
	particle_reward_l = {
		max_count = 2,
		scale = 1,
		type = Tree.CacheType.CacheType_Particle,
		particle = Tree.root .. "particle/slwh_wincaidai1.plist"
	},
	particle_reward_r = {
		max_count = 2,
		scale = 1,
		type = Tree.CacheType.CacheType_Particle,
		particle = Tree.root .. "particle/slwh_wincaidai1f.plist"
	},
	particle_bet_btn = {
		max_count = 5,
		scale = 1,
		type = Tree.CacheType.CacheType_Particle,
		particle = Tree.root .. "particle/slwh_cmlightlizi.plist"
	},
	slwh_stagedclizi = {
		max_count = 4,
		scale = 1,
		type = Tree.CacheType.CacheType_Particle,
		particle = Tree.root .. "particle/slwh_stagedclizi.plist"
	},
	red_1_number_0 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_1 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_2 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_3 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_4 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_5 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_6 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_7 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_8 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_9 = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_d = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_f = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_1_number_w = {
		max_count = 64,
		frame_name = "number_1/slwh_bnr1_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_0 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_1 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_2 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_3 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_4 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_5 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_6 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_7 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_8 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_9 = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_d = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_2_number_f = {
		max_count = 64,
		frame_name = "number_2/slwh_bnr2_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_0 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_1 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_2 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_3 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_4 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_5 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_6 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_7 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_8 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_9 = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_d = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_f = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	red_3_number_w = {
		max_count = 64,
		frame_name = "number_3/slwh_bnr3_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_0 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_1 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_2 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_3 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_4 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_5 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_6 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_7 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_8 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_9 = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_d = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_f = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_1_number_w = {
		max_count = 64,
		frame_name = "number_1/slwh_bny1_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_0 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_1 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_2 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_3 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_4 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_5 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_6 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_7 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_8 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_9 = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_d = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_2_number_f = {
		max_count = 64,
		frame_name = "number_2/slwh_bny2_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_0 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_1 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_2 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_3 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_4 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_5 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_6 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_7 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_8 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_9 = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_d = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_f = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	yellow_3_number_w = {
		max_count = 64,
		frame_name = "number_3/slwh_bny3_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_0 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_1 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_2 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_3 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_4 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_5 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_6 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_7 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_8 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_9 = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_d = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_f = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_1_number_w = {
		max_count = 64,
		frame_name = "number_1/slwh_bng1_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_0 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_1 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_2 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_3 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_4 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_5 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_6 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_7 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_8 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_9 = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_d = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_2_number_f = {
		max_count = 64,
		frame_name = "number_2/slwh_bng2_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_0 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_1 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_2 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_3 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_4 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_5 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_6 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_7 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_8 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_9 = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_d = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_f = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	green_3_number_w = {
		max_count = 64,
		frame_name = "number_3/slwh_bng3_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_0 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_1 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_2 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_3 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_4 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_5 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_6 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_7 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_8 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_9 = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_d = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_f = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_1_money_w = {
		max_count = 64,
		frame_name = "jetton1/slwh_j1_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_0 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_1 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_2 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_3 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_4 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_5 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_6 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_7 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_8 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_9 = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_d = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_f = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_2_money_w = {
		max_count = 64,
		frame_name = "jetton2/slwh_j2_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_0 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_1 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_2 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_3 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_4 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_5 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_6 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_7 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_8 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_9 = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_d = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_f = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_3_money_w = {
		max_count = 64,
		frame_name = "jetton3/slwh_j3_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_0 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_1 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_2 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_3 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_4 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_5 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_6 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_7 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_8 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_9 = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_d = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_f = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_4_money_w = {
		max_count = 64,
		frame_name = "jetton4/slwh_j4_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_0 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_1 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_2 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_3 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_4 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_5 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_6 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_7 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_8 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_9 = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_d = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_f = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_5_money_w = {
		max_count = 64,
		frame_name = "jetton5/slwh_j5_w.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_0 = {
		max_count = 4,
		frame_name = "slwh_time_n_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_1 = {
		max_count = 4,
		frame_name = "slwh_time_n_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_2 = {
		max_count = 4,
		frame_name = "slwh_time_n_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_3 = {
		max_count = 4,
		frame_name = "slwh_time_n_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_4 = {
		max_count = 4,
		frame_name = "slwh_time_n_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_5 = {
		max_count = 4,
		frame_name = "slwh_time_n_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_6 = {
		max_count = 4,
		frame_name = "slwh_time_n_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_7 = {
		max_count = 4,
		frame_name = "slwh_time_n_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_8 = {
		max_count = 4,
		frame_name = "slwh_time_n_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	time_number_9 = {
		max_count = 4,
		frame_name = "slwh_time_n_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_0 = {
		max_count = 14,
		frame_name = "slwh_battle_money0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_1 = {
		max_count = 14,
		frame_name = "slwh_battle_money1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_2 = {
		max_count = 14,
		frame_name = "slwh_battle_money2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_3 = {
		max_count = 14,
		frame_name = "slwh_battle_money3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_4 = {
		max_count = 14,
		frame_name = "slwh_battle_money4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_5 = {
		max_count = 14,
		frame_name = "slwh_battle_money5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_6 = {
		max_count = 14,
		frame_name = "slwh_battle_money6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_7 = {
		max_count = 14,
		frame_name = "slwh_battle_money7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_8 = {
		max_count = 14,
		frame_name = "slwh_battle_money8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_9 = {
		max_count = 14,
		frame_name = "slwh_battle_money9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_w = {
		max_count = 14,
		frame_name = "slwh_battle_moneyw.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_d = {
		max_count = 14,
		frame_name = "slwh_battle_moneyd.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_f = {
		max_count = 14,
		frame_name = "slwh_battle_moneyf.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	battle_money_n_y = {
		max_count = 14,
		frame_name = "slwh_battle_moneyy.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_0 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_0.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_1 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_1.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_2 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_2.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_3 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_3.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_4 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_4.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_5 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_5.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_6 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_6.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_7 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_7.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_8 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_8.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_9 = {
		max_count = 14,
		frame_name = "slwh_battle_jack_9.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_d = {
		max_count = 14,
		frame_name = "slwh_battle_jack_d.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	},
	jetton_money_n_f = {
		max_count = 14,
		frame_name = "slwh_battle_jack_f.png",
		type = Tree.CacheType.CacheType_SpriteFrame
	}
}

return
