slot0 = ClassLoader:aquireSingleton("ObjectManager")

slot0:registerObject({
	yuwangeffect = {
		CullFace = true,
		maxCacheNumber = 40,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		JSON_PATH = string.format("%s%s/%s.json", FilePath.ANIMATION, "yuwangeffect", "yuwangeffect"),
		ATLAS_PATH = string.format("%s%s/%s.atlas", FilePath.ANIMATION, "yuwangeffect", "yuwangeffect"),
		CullFaceMode = gl.FRONT
	},
	huangsewang = {
		CullFace = true,
		maxCacheNumber = 40,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		JSON_PATH = string.format("%s%s/%s.json", FilePath.ANIMATION, "huangsewang", "huangsewang"),
		ATLAS_PATH = string.format("%s%s/%s.atlas", FilePath.ANIMATION, "huangsewang", "huangsewang"),
		CullFaceMode = gl.FRONT
	},
	hongsewang = {
		CullFace = true,
		maxCacheNumber = 40,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		JSON_PATH = string.format("%s%s/%s.json", FilePath.ANIMATION, "hongsewang", "hongsewang"),
		ATLAS_PATH = string.format("%s%s/%s.atlas", FilePath.ANIMATION, "hongsewang", "hongsewang"),
		CullFaceMode = gl.FRONT
	},
	yuwangeffect2 = {
		CullFace = true,
		maxCacheNumber = 40,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		JSON_PATH = string.format("%s%s/%s.json", FilePath.ANIMATION, "yuwangeffect2", "yuwangeffect2"),
		ATLAS_PATH = string.format("%s%s/%s.atlas", FilePath.ANIMATION, "yuwangeffect2", "yuwangeffect2"),
		CullFaceMode = gl.FRONT
	},
	jinbishounaeffect = {
		JSON_PATH = "gameres/module/fishtd/animation/armature/jinbishounaeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/animation/armature/jinbishounaeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	yuboomceffect = {
		JSON_PATH = "gameres/module/fishtd/animation/armature/yuboomceffect/yuboomceffect.json",
		maxCacheNumber = 0,
		ATLAS_PATH = "gameres/module/fishtd/animation/armature/yuboomceffect/yuboomceffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	yuboombeffect = {
		JSON_PATH = "gameres/module/fishtd/animation/armature/yuboombeffect/yuboombeffect.json",
		maxCacheNumber = 0,
		ATLAS_PATH = "gameres/module/fishtd/animation/armature/yuboombeffect/yuboombeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	yuboomdeffect = {
		JSON_PATH = "gameres/module/fishtd/animation/armature/yuboomdeffect/yuboomdeffect.json",
		maxCacheNumber = 0,
		ATLAS_PATH = "gameres/module/fishtd/animation/armature/yuboomdeffect/yuboomdeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	troop_tips = {
		JSON_PATH = "gameres/module/fishtd/animation/troop_tips/flshboomtips.json",
		maxCacheNumber = 0,
		ATLAS_PATH = "gameres/module/fishtd/animation/troop_tips/flshboomtips.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	boss_tips = {
		JSON_PATH = "gameres/module/fishtd/fishEffect/2dboostips.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/2dboostips.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	yuboomeffect = {
		JSON_PATH = "gameres/module/fishtd/animation/armature/yuboomeffect/yuboomeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/animation/armature/yuboomeffect/yuboomeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Spine_Effect_Frozen_FullScreen = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/bingdongyupmeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/bingdongyupmeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Spine_Effect_Frozen_Particle = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/bingdongyueffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/bingdongyueffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Spine_Effect_Frozen_Timer = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/bingdongyujiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/bingdongyujiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Blue_Line = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/shandianyushandian.json",
		maxCacheNumber = 10,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/shandianyushandian.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Blue_Hit = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/shandianyudianqiu.json",
		maxCacheNumber = 10,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/shandianyudianqiu.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Blue_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/shandianyujiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/shandianyujiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Gold_Explode = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yuwangtyeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yuwangtyeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Gold_Line = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yuwangshandian.json",
		maxCacheNumber = 50,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yuwangshandian.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Gold_Hit = {
		Scale = 1,
		maxCacheNumber = 50,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yuwangtyeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yuwangtyeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Gold_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yuwangjiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yuwangjiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Gold_Cashin_2 = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yuhuangjiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yuhuangjiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Roulette_Gold_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_xybxjs.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_xybxjs.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Roulette_Effect = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_xybxzp.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_xybxzp.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Aqua_Explode = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaoa.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaoa.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Aqua_Line = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaoshandian.json",
		maxCacheNumber = 10,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaoshandian.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Aqua_Hit = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaob.json",
		maxCacheNumber = 10,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaob.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Aqua_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaojs.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yijianshuangdiaojs.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Purple_Explode = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yishisanniaoa.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yishisanniaoa.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Purple_Line = {
		Scale = 1,
		maxCacheNumber = 10,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yishisanniaoshandian.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yishisanniaoshandian.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Lightning_Purple_Hit = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yishisanniaob.json",
		maxCacheNumber = 10,
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yishisanniaob.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Lightning_Purple_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/yishisanniaojs.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/yishisanniaojs.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Dynamite_FullScreen = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/zhadanyupmeffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/zhadanyupmeffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Dynamite_Cast = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/zhadanyueffect.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/zhadanyueffect.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Dynamite_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/zhadanyujiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/zhadanyujiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Dynamite_Particle = {
		PLIST_PATH = "gameres/module/fishtd/fishEffect/zhadanyulizinew.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	Blackhole_Cast = {
		Scale = 0.7,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/heidongyu.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/heidongyu.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Boss_Cashin_Top = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_bossqian.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_bossqian.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Boss_Cashin_Bottom = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_bossbei.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_bossbei.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Boss_Cashin_zhangyu = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_bazhuayu.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_bazhuayu.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Boss_Cashin_haiyao = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_haiyao.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_haiyao.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Boss_Cashin_chuitousha = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_chuitousha.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_chuitousha.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Boss_Cashin_haidaochuan = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_haidaochuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_haidaochuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	Boss_Kill_Effect = {
		Scale = 1,
		CullFace = true,
		JSON_PATH = "gameres/module/fishtd/fishEffect/3dby_bossbao.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/3dby_bossbao.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		CullFaceMode = gl.FRONT
	},
	Blackhole_Cashin = {
		Scale = 1,
		JSON_PATH = "gameres/module/fishtd/fishEffect/heidongyujiesuan.json",
		ATLAS_PATH = "gameres/module/fishtd/fishEffect/heidongyujiesuan.atlas",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE
	},
	3dby_game_lock = {
		Scale = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPINE,
		JSON_PATH = FilePath.ANIMATION .. "lock/3dby_game_lock.json",
		ATLAS_PATH = FilePath.ANIMATION .. "lock/3dby_game_lock.atlas"
	},
	fish_jinbi_1 = {
		maxCacheNumber = 0,
		ARMATURE_NAME = "fish_jinbi_1",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.ARMATURE,
		JSON_PATH = string.format("%s%s/%s.ExportJson", FilePath.ANIMATION, "fish_jinbi_1", "fish_jinbi_1")
	},
	fish_jinbi_gold = {
		maxCacheNumber = 0,
		FRAME_NUMBER = 6,
		FRAME_NAME = "fish_jinbi4",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.FRAME_ANIMATION,
		PLIST_PATH = string.format("%sfish_jinbi_1/fish_jinbi_10.plist", FilePath.ANIMATION)
	},
	fish_jinbi_silver = {
		maxCacheNumber = 0,
		FRAME_NUMBER = 6,
		FRAME_NAME = "fish_yinse_jinbi4",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.FRAME_ANIMATION,
		PLIST_PATH = string.format("%sfish_jinbi_1/fish_jinbi_yinse0.plist", FilePath.ANIMATION)
	},
	paotaijinbilizi = {
		PLIST_PATH = "gameres/module/fishtd/particle/paotaijinbilizi.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	paotaijinbilizi = {
		PLIST_PATH = "gameres/module/fishtd/particle/paotaijinbilizi.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	yuboomgqks = {
		PLIST_PATH = "gameres/module/fishtd/animation/armature/yuboomdeffect/yuboomgqks.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	yuboomliziks = {
		PLIST_PATH = "gameres/module/fishtd/animation/armature/yuboomdeffect/yuboomliziks.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	yuboomliziks = {
		PLIST_PATH = "gameres/module/fishtd/animation/armature/yuboomdeffect/yuboomliziks.plist",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.PARTICLE
	},
	muzzle_flash = {
		TEXTURE_PATH = "gameres/module/fishtd/animation/sprite/muzzle_flash.png",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPRITE
	},
	mask_boss_cashin = {
		TEXTURE_PATH = "gameres/module/fishtd/ui/bg/mask_boss_cashin.png",
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPRITE
	},
	coinImage = {
		TEXTURE_PATH = "gameres/module/fishtd/ui/common/ico_Gold.png",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPRITE
	},
	plusImage = {
		TEXTURE_PATH = "gameres/module/fishtd/ui/common/jiafen.png",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.SPRITE
	},
	fishScoreNumber = {
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.TEXTURED_NUMBER,
		NUMBER_RESOURCE = {
			[0] = {
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/0.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/1.png"),
				sizeFix = {
					-24,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/2.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/3.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/4.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/5.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					-1
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/6.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					1
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/7.png"),
				sizeFix = {
					-18,
					0
				},
				positionFix = {
					0,
					-1
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/8.png"),
				sizeFix = {
					-16,
					0
				},
				positionFix = {
					1,
					0
				}
			},
			{
				texture = GET_PATH(FilePath.INGAME_UI, "scoreNumber/9.png"),
				sizeFix = {
					-12,
					0
				},
				positionFix = {
					0,
					0
				}
			},
			textureType = ENUM.NUMBER_TEXTURE_TYPE.SPRITE
		}
	},
	specialEffectNumberLight = {
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.TEXTURED_NUMBER,
		NUMBER_RESOURCE = {
			[0] = {
				texture = "0",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "1",
				sizeFix = {
					-20,
					0
				}
			},
			{
				texture = "2",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "3",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "4",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "5",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "6",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "7",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "8",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "9",
				sizeFix = {
					-15,
					0
				}
			},
			textureHeight = "84",
			atlasFileName = "gameres/module/fishtd/fishEffect/3dby_baofen.atlas",
			textureWidth = "66",
			jsonFileName = "gameres/module/fishtd/fishEffect/3dby_baofen.json",
			textureType = ENUM.NUMBER_TEXTURE_TYPE.SPINE,
			[","] = {
				texture = "10",
				sizeFix = {
					-50,
					0
				},
				positionFix = {
					-3,
					-10
				}
			},
			w = {
				texture = "11",
				sizeFix = {
					-10,
					0
				},
				positionFix = {
					0,
					-5
				}
			},
			y = {
				texture = "12",
				sizeFix = {
					-10,
					0
				},
				positionFix = {
					0,
					-5
				}
			}
		}
	},
	specialEffectNumberEffect = {
		CATEGORY = slot0.OBJECT_CATEGORY.COCOS,
		TYPE = slot0.OBJECT_TYPE.TEXTURED_NUMBER,
		NUMBER_RESOURCE = {
			[0] = {
				texture = "0_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "1_s",
				sizeFix = {
					-20,
					0
				}
			},
			{
				texture = "2_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "3_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "4_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "5_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "6_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "7_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "8_s",
				sizeFix = {
					-15,
					0
				}
			},
			{
				texture = "9_s",
				sizeFix = {
					-15,
					0
				}
			},
			textureHeight = "84",
			atlasFileName = "gameres/module/fishtd/fishEffect/3dby_baofen.atlas",
			textureWidth = "66",
			jsonFileName = "gameres/module/fishtd/fishEffect/3dby_baofen.json",
			textureType = ENUM.NUMBER_TEXTURE_TYPE.SPINE,
			[","] = {
				texture = "10_s",
				sizeFix = {
					-15,
					0
				}
			},
			w = {
				texture = "11_s",
				sizeFix = {
					-10,
					0
				},
				positionFix = {
					0,
					-5
				}
			},
			y = {
				texture = "12_s",
				sizeFix = {
					-10,
					0
				},
				positionFix = {
					0,
					-5
				}
			}
		}
	},
	FISH_1_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 8,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_2_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 8,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_3_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_4_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_5_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_6_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_7_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_8_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_9_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_10_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_11_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_12_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 12,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_13_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_15_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 16,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_16_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_17_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 3,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_18_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_19_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_20_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_21_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_22_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_23_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_24_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_25_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_26_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_27_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_601_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_602_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_603_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_604_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_605_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_606_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_607_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_608_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_609_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_610_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_611_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_612_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_613_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_614_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_615_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_616_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_617_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_618_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_619_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_620_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_621_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_622_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_701_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_702_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_703_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_704_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_705_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_706_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_707_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_708_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_709_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_710_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_801_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_802_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_803_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_804_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_805_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_806_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_807_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_808_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_809_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_910_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 2,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_920_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_930_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_940_NORMAL = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 1,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_10_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_621_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_12_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_616_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_8_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_620_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_19_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_920_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_9_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_15_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_20_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_619_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	FISH_622_GROUP = {
		FACTORY_CLASS = "FishFactory",
		maxCacheNumber = 0,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	},
	BULLET = {
		FACTORY_CLASS = "BulletFactory",
		maxCacheNumber = 40,
		CATEGORY = slot0.OBJECT_CATEGORY.LOGIC,
		TYPE = slot0.OBJECT_TYPE.GAME_OBJECT
	}
})

return
