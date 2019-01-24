Dntg_FrameDefine = {
	Frame = {
		Chain = {
			Animation1 = "RedLine",
			Animation3 = "LightChain",
			Animation2 = "BlueLine"
		},
		UI = {
			MinButton = {
				PosY = 1,
				PosX = 1277,
				Animation = "MinButton"
			},
			CloseButton = {
				PosY = 1,
				PosX = 1380,
				Animation = "CloseButton"
			},
			SetButton = {
				PosY = 1,
				PosX = 1328,
				Animation = "SetButton"
			},
			DownButton = {
				PosY = 868,
				PosX = 600,
				Animation = "DownScore"
			},
			PingPos = {
				X = 20,
				Y = 1000
			},
			UpButton = {
				PosY = 868,
				PosX = 653,
				Animation = "UpScore"
			},
			ScorePos = {
				X = 518,
				Y = 880
			},
			Frame = {
				Left = "Left",
				Right = "Right",
				ScorNum = "userscore_num",
				title = "Title",
				bottom = "SelfInfo",
				CurSor = "Cursor"
			},
			AutoButton = {
				PosY = 868,
				PosX = 720,
				Animation = "CheckBt"
			},
			NamePos = {
				X = 80,
				Y = 865
			}
		},
		Bingo = {
			NumAin = "bingo_num",
			Rotation = 0,
			Animation = "bingo"
		},
		FileList = {
			Bullet = "Fishing/Script/BulletSet.xml",
			Scene = "Fishing/Script/Scene.xml",
			Troop = "Fishing/Script/TroopSet.xml",
			System = "Fishing/Script/System.xml",
			BoundingBox = "Fishing/Script/BoundingBox.xml",
			Fish = "Fishing/Script/Fish.xml",
			Sound = "Fishing/Script/FishSound.xml",
			CannonSet = "Fishing/Script/CannonSet.xml",
			Special = "Fishing/Script/Special.xml",
			Visual = "Fishing/Script/Visual.xml",
			Path = "Fishing/Script/Path.xml"
		},
		Effect = {
			{
				File = "Resource/particle/Particles.pyro"
			}
		},
		LockFish = {
			Flag = "lock_flag",
			TagFlag = "lock_flag_%d",
			Line = "lock_line"
		},
		Loading = {
			ProgressBar = {
				PosY = 788,
				PosX = 559,
				Bar = {
					PosY = 0,
					PosX = 0,
					Img = "Fishing/images/UI/progress_bar.png"
				},
				Bg = {
					PosY = 0,
					PosX = 0,
					Img = "Fishing/images/UI/progress_bar_bg.png"
				}
			},
			BackGround = {
				PosY = 0,
				PosX = 0,
				Img = "Fishing/images/UI/background.png"
			}
		},
		Treasure = {
			AwardTips = "awardTips",
			RotaryTable = "rotaryTable",
			Unknow = "fish23",
			Points = "points"
		},
		Jetton = {
			SpriteBG2 = "jetton_bgc2",
			GoldAni = "gold",
			NumAin = "jetton_num",
			SpriteBG1 = "jetton_bgc1",
			Sprite = "jetton"
		},
		Special = {
			BlackWater = {
				Sprite = "BlackWater"
			}
		}
	}
}

return
