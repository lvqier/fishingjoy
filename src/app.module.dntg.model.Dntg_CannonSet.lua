Dntg_CannonSet = {
	CannonPos = {
		LOCK = {
			PosX = 160,
			name = "lock_flag",
			PosY = -120,
			flag = "lock_flag_%d",
			line = "lock_line"
		},
		CannonEffect = {
			PosX = -115,
			name = "PaoTaiEffect",
			PosY = 0
		},
		Jetton = {
			PosX = -60,
			PosY = 0,
			Max = 4
		},
		Cannon = {
			{
				id = 0,
				PosX = 0.3,
				Direction = 3.14,
				PosY = 0.085
			},
			{
				id = 1,
				PosX = 0.7,
				Direction = 3.14,
				PosY = 0.085
			},
			{
				id = 2,
				PosX = 0.7,
				Direction = 0,
				PosY = 0.915
			},
			{
				id = 3,
				PosX = 0.3,
				Direction = 0,
				PosY = 0.915
			}
		}
	},
	CannonSet = {
		{
			id = 0,
			double = 1,
			ion = 1,
			normal = 0,
			CannonType = {
				{
					type = 0,
					Net = {
						{
							PosX = 0,
							Name = "effect_fish_bomb_02_ani",
							Scale = 1,
							ResType = 0,
							PosY = 0,
							ResName = "effect_fish_bomb"
						}
					},
					Cannon = {
						PosX = 0,
						Name = "move",
						FireOffest = 0,
						type = 0,
						PosY = 0,
						ResType = 0,
						ResName = "dntg_pao1_buyu"
					},
					Bullet = {
						{
							ResType = 0,
							Name = "move",
							Scale = 1,
							ResName = "dntg_bullet0"
						}
					}
				},
				{
					type = 1,
					Net = {
						{
							PosX = 0,
							Name = "effect_fish_bomb_02_ani",
							Scale = 1,
							ResType = 0,
							PosY = 0,
							ResName = "effect_fish_bomb"
						}
					},
					Cannon = {
						PosX = 0,
						Name = "move",
						FireOffest = 0,
						type = 0,
						PosY = 0,
						ResType = 0,
						ResName = "dntg_pao2_buyu"
					},
					Bullet = {
						{
							ResType = 0,
							Name = "move",
							Scale = 1,
							ResName = "dntg_bullet3"
						}
					}
				},
				{
					type = 2,
					Net = {
						{
							PosX = 0,
							Name = "effect_fish_bomb_03_ani",
							Scale = 1,
							ResType = 0,
							PosY = 0,
							ResName = "effect_fish_bomb"
						}
					},
					Cannon = {
						PosX = 0,
						Name = "move",
						FireOffest = 0,
						type = 0,
						PosY = 0,
						ResType = 0,
						ResName = "dntg_pao3_buyu"
					},
					Bullet = {
						{
							ResType = 0,
							Name = "move",
							Scale = 1,
							ResName = "dntg_bullet1"
						}
					}
				},
				{
					type = 2,
					Net = {
						{
							PosX = 0,
							Name = "effect_fish_bomb_04_ani",
							Scale = 1,
							ResType = 0,
							PosY = 0,
							ResName = "effect_fish_bomb"
						}
					},
					Cannon = {
						PosX = 0,
						Name = "move",
						FireOffest = 0,
						type = 0,
						PosY = 0,
						ResType = 0,
						ResName = "dntg_pao3_buyu"
					},
					Bullet = {
						{
							ResType = 0,
							Name = "move",
							Scale = 1,
							ResName = "dntg_bullet2"
						}
					}
				}
			}
		}
	}
}

return
