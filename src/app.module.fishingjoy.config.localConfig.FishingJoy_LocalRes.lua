FishingJoy_LocalRes = {
	processConfig = {
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/fishingJoy_battle_ui"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/fishingJoy_room_font"
		},
		{
			type = "jpg",
			url = "ui/background/fishingJoy_battle_1"
		},
		{
			type = "jpg",
			url = "ui/background/fishingJoy_battle_2"
		},
		{
			type = "jpg",
			url = "ui/background/fishingJoy_battle_3"
		},
		{
			type = "jpg",
			url = "ui/background/fishingJoy_battle_4"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net1_10"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net1_20"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai1_1d0"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai1_2d0"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net2_10"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net2_20"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai2_1d0"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai2_2d0"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net3_10"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_Net3_20"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai3_1d0"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/bkby_paotai3_2d0"
		},
		{
			type = "png",
			url = "fishAnimations/shandianliansuo/shandianliansuo"
		},
		{
			type = "png",
			url = "fishAnimations/yuboomeffect/yuboomeffect"
		},
		{
			type = "png",
			url = "fishAnimations/shandianxianjie/shandianxianjie"
		},
		{
			type = "png",
			url = "fishAnimations/yuboombeffect/yuboombeffect"
		},
		{
			type = "png",
			url = "fishAnimations/yuboomceffect/yuboomceffect"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_transition_water/effect_transition_water0"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_transition_water/effect_transition_water1"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_bg_water/effect_bg_water1"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_bg_water/effect_bg_water0"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_bg_water/effect_bg_water2"
		}
	},
	shadowConfig = {},
	roomSpine = {
		{
			hero = "res/gameres/module/fishingjoy/roomSpine/dly/hero/dntg_dly_b1",
			backBg = "res/gameres/module/fishingjoy/roomSpine/dly/bg/denglongyu2DUI_a2",
			frontBg = "res/gameres/module/fishingjoy/roomSpine/dly/bg/denglongyu2DUI_a1"
		},
		{},
		{
			hero = "res/gameres/module/fishingjoy/roomSpine/wugui/hero/dntg_wugui",
			backBg = "res/gameres/module/fishingjoy/roomSpine/wugui/bg/wugui_Back_background",
			frontBg = "res/gameres/module/fishingjoy/roomSpine/wugui/bg/wugui_Fore_background"
		},
		{
			hero = "res/gameres/module/fishingjoy/roomSpine/sy/hero/dntg_sy_b",
			backBg = "res/gameres/module/fishingjoy/roomSpine/sy/bg/shayu2DUI_a2",
			frontBg = "res/gameres/module/fishingjoy/roomSpine/sy/bg/shayu2DUI_a1"
		},
		{
			hero = "res/gameres/module/fishingjoy/roomSpine/yudi/hero/dntg_yd",
			backBg = "res/gameres/module/fishingjoy/roomSpine/yudi/bg/yd_Back_background",
			frontBg = "res/gameres/module/fishingjoy/roomSpine/yudi/bg/yd_Fore_background"
		},
		{
			hero = "res/gameres/module/fishingjoy/roomSpine/sunwukong/hero/dntg_wk",
			backBg = "res/gameres/module/fishingjoy/roomSpine/sunwukong/bg/wukong_Back_background",
			frontBg = "res/gameres/module/fishingjoy/roomSpine/sunwukong/bg/wukong_Fore_background"
		}
	},
	resourcePath = {
		bossComingTips = {
			getFileName = function ()
				return "gameres/module/fishingjoy/fishAnimations/bosstips/2dboostips.json", "gameres/module/fishingjoy/fishAnimations/bosstips/2dboostips.atlas"
			end
		},
		fishGroupComingTips = {
			getFileName = function ()
				return "gameres/module/fishingjoy/fishAnimations/flshboomtips/flshboomtips.json", "gameres/module/fishingjoy/fishAnimations/flshboomtips/flshboomtips.atlas"
			end
		},
		bingo = {
			bgPng = "res/gameres/module/fishingjoy/ui/background/fishingJoy_gaofen_bg.png",
			fntSelf = "res/gameres/module/fishingjoy/ui/fnt/scoreText/gaofenText1.fnt",
			fntOther = "res/gameres/module/fishingjoy/ui/fnt/scoreText/gaofenText2.fnt"
		},
		hitFish = {
			fntSelf = "res/gameres/module/fishingjoy/ui/fnt/scoreText/hitFishText1.fnt",
			fntOther = "res/gameres/module/fishingjoy/ui/fnt/scoreText/hitFishText2.fnt"
		},
		gold = {
			plistSelf = {
				saveKey = "fish_jinbi_10",
				frameCount = 6,
				fileName = "res/gameres/module/fishingjoy/fishAnimations/fish_jinbi_1/fish_jinbi_10.plist",
				frameName = "fish_jinbi4"
			},
			plistOther = {
				saveKey = "fish_jinbi_yinse0",
				frameCount = 6,
				fileName = "res/gameres/module/fishingjoy/fishAnimations/fish_jinbi_1/fish_jinbi_yinse0.plist",
				frameName = "fish_yinse_jinbi4"
			}
		},
		killFishScoreFtn = {
			fileName = "res/gameres/module/fishingjoy/ui/fnt/buyuNumPlus/buyuNumPlus.fnt"
		},
		cannon = {
			animationParticle2 = "res/gameres/module/fishingjoy/fishAnimations/effect_weapons_replace/paotaigxboomlizi.plist",
			animationParticle1 = "res/gameres/module/fishingjoy/fishAnimations/effect_weapons_replace/paotaiboomlizi.plist",
			fileName = "res/gameres/module/fishingjoy/spritesheet/cannon/%s",
			animationFileName = function ()
				return "res/gameres/module/fishingjoy/fishAnimations/effect_weapons_replace/paotaieffect.skel", "res/gameres/module/fishingjoy/fishAnimations/effect_weapons_replace/paotaieffect.atlas"
			end
		},
		effect = {
			shandianliansuo = "res/gameres/module/fishingjoy/fishAnimations/shandianliansuo/shandianliansuo",
			shandianxianjie = "res/gameres/module/fishingjoy/fishAnimations/shandianxianjie/shandianxianjie",
			foshou = "res/gameres/module/fishingjoy/fishAnimations/foshou/foshouzidan.png",
			frezonPng = "res/gameres/module/fishingjoy/fishAnimations/dingping/bing.png",
			frezonPlist = function ()
				return {
					"res/gameres/module/fishingjoy/fishAnimations/dingping/xuehua.plist",
					"res/gameres/module/fishingjoy/fishAnimations/dingping/xuehua2.plist",
					"res/gameres/module/fishingjoy/fishAnimations/dingping/xuehua3.plist",
					"res/gameres/module/fishingjoy/fishAnimations/dingping/xuehua4.plist"
				}
			end
		},
		particle = {
			getyuboombeffect = function ()
				return "res/gameres/module/fishingjoy/fishAnimations/yuboombeffect/yuboombeffect.json", "res/gameres/module/fishingjoy/fishAnimations/yuboombeffect/yuboombeffect.atlas"
			end,
			getyuboomceffect = function ()
				return "res/gameres/module/fishingjoy/fishAnimations/yuboomceffect/yuboomceffect.json", "res/gameres/module/fishingjoy/fishAnimations/yuboomceffect/yuboomceffect.atlas"
			end,
			getyuboomdeffect = function ()
				return {
					{
						plistScale = 3,
						plistPath = "res/gameres/module/fishingjoy/fishAnimations/yuboomdeffect/yuboomgqks.plist"
					},
					{
						plistScale = 0.4,
						plistPath = "res/gameres/module/fishingjoy/fishAnimations/yuboomdeffect/yuboomliziks.plist"
					},
					{
						plistScale = 0.6,
						plistPath = "res/gameres/module/fishingjoy/fishAnimations/yuboomdeffect/yuboomliziks.plist"
					}
				}
			end
		}
	},
	txtEnum = {
		moneyNotEnough2 = "你身上的欢乐豆不足，无法发炮了.",
		exitBattleNoFire = "您长时间没有发炮，您将在 %s 秒后离开游戏!",
		bulletTooMuch = "炮管散热中，请等待炮管冷却后再发炮!",
		moneyNotEnough = "您的欢乐豆不足，不能开炮."
	}
}

return FishingJoy_LocalRes
