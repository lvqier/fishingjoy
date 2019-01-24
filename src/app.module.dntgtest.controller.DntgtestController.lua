slot2 = "DntgtestController"
DntgtestController = class(slot1)
slot2 = "dntgtest.fishConfig.Dntgtest_path"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_TroopSet"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_Fish"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_Duration"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_TroopDuration"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_BoundingBox"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_System"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_Special"

requireLuaFromModule(slot1)

slot2 = "dntgtest.fishConfig.Dntgtest_RenderOrder"

requireLuaFromModule(slot1)

slot0, slot1 = nil

if DNTGTEST_IS_ANDROID_PLATFORM then
	slot4 = "dntgtest.model.DntgtestModel+Fish+Android"
	slot0 = requireLuaFromModule(slot3)
	slot4 = "dntgtest.model.DntgtestModel+Bullet+Android"
	slot1 = requireLuaFromModule(slot3)
else
	slot4 = "dntgtest.model.DntgtestModel+Fish"
	slot0 = requireLuaFromModule(slot3)
	slot4 = "dntgtest.model.DntgtestModel+Bullet"
	slot1 = requireLuaFromModule(slot3)
end

slot2 = requireLuaFromModule(slot3)
slot3 = requireLuaFromModule("dntgtest.model.DntgtestModel+Player")
slot4 = requireLuaFromModule("dntgtest.Effect.EffectFatory")
slot5 = requireLuaFromModule("dntgtest.Effect.EffectAddMoney")
slot6 = requireLuaFromModule("dntgtest.Effect.EffectKill")
slot7 = requireLuaFromModule("dntgtest.Effect.EffectAddBuffer")
slot8 = requireLuaFromModule("dntgtest.Effect.EffectProduce")
slot11 = "dntgtest.Effect.EffectAward"
slot9 = requireLuaFromModule("dntgtest.Effect.EffectBlackWater")
slot10, slot11 = nil

if DNTGTEST_IS_ANDROID_PLATFORM then
else
	slot14 = "dntgtest.dntgLogic.MoveByPath"
	slot10 = requireLuaFromModule(slot13)
	slot14 = "dntgtest.dntgLogic.MoveByDirection"
	slot11 = requireLuaFromModule(slot13)
end

DntgtestController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = {
		onX = 155.4,
		offX = 86.4
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot4 = mainMgr

	mainMgr.onStopTick2Gc(slot3)

	slot0.tBulletID = {}
	slot0.nBulletID = 0
	slot4 = slot0.model

	slot0.model.resetLocalData(slot3)

	slot4 = slot0

	slot0.resetTimeService(slot3)

	slot4 = slot0

	slot0.adjustIX(slot3)

	slot4 = slot0

	slot0.loadSystemConfig(slot3)

	slot4 = slot0

	slot0.resetDntgSoundManager(slot3)

	slot5 = false

	slot0.setSyncSelfScore(slot3, slot0)

	slot0.effectFatory = slot0.new()
	slot6 = slot1

	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.ADDMONEY)

	slot6 = slot0.effectFatory.Register

	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.KILL)

	slot6 = slot3

	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.ADDBUFFER)

	slot6 = slot0.effectFatory

	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.PRODUCE)
	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.BLACKWATER)

	slot6 = DNTGTEST_EFFECT_TYPE.BLACKWATER

	slot0.effectFatory.Register(slot3, slot0.effectFatory, DNTGTEST_EFFECT_TYPE.AWARD)

	slot0._resProcessConfigs = {
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/dntgtest_num_plist"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/dntgtest_battle_ui"
		},
		{
			type = "jpg",
			url = "battleViewBg/Map_0"
		},
		{
			type = "jpg",
			url = "battleViewBg/Map_1"
		},
		{
			type = "jpg",
			url = "battleViewBg/Map_2"
		},
		{
			type = "jpg",
			url = "battleViewBg/Map_3"
		},
		{
			type = "plist",
			url = "fishAnimations/bulletAni/dntgtest_bullet"
		},
		{
			type = "plist",
			url = "spritesheet/cannon/dntgtest_cannon_ui"
		},
		{
			type = "png",
			url = "fishAnimations/longwang/longwang"
		},
		{
			type = "png",
			url = "fishAnimations/dingping/dingping"
		},
		{
			type = "png",
			url = "fishAnimations/danaotiangong/danaotiangong"
		},
		{
			type = "png",
			url = "fishAnimations/jingubang/jingubang"
		},
		{
			type = "png",
			url = "fishAnimations/wudifenghuolun/wudifenghuolun"
		},
		{
			type = "png",
			url = "fishAnimations/foshou/foshou"
		},
		{
			type = "png",
			url = "fishAnimations/haiyao/haiyao"
		},
		{
			type = "png",
			url = "fishAnimations/sunwukong/sunwukong"
		},
		{
			type = "png",
			url = "fishAnimations/shenxianchuan/shenxianchuan"
		},
		{
			type = "png",
			url = "fishAnimations/yishisanyu/yishisanyu"
		},
		{
			type = "png",
			url = "fishAnimations/shandianliansuo/shandianliansuo"
		},
		{
			type = "png",
			url = "fishAnimations/longxia/longxia"
		},
		{
			type = "png",
			url = "fishAnimations/yuboomeffect/yuboomeffect"
		},
		{
			type = "png",
			url = "fishAnimations/shuimuhuangjinban/shuimuhuangjinban"
		},
		{
			type = "png",
			url = "fishAnimations/zhangyuguai/zhangyuguai"
		},
		{
			type = "png",
			url = "fishAnimations/bianfuyu/bianfuyu"
		},
		{
			type = "png",
			url = "fishAnimations/shajing/shajing"
		},
		{
			type = "png",
			url = "fishAnimations/shayuhuangjinban/shayuhuangjinban"
		},
		{
			type = "png",
			url = "fishAnimations/jinlong/jinlong"
		},
		{
			type = "png",
			url = "fishAnimations/yinlong/yinlong"
		},
		{
			type = "png",
			url = "fishAnimations/shajinghuangjinban/shajinghuangjinban"
		},
		{
			type = "png",
			url = "fishAnimations/shandianxianjie/shandianxianjie"
		},
		{
			type = "png",
			url = "fishAnimations/jianyu/jianyu"
		},
		{
			type = "png",
			url = "fishAnimations/yuboombeffect/yuboombeffect"
		},
		{
			type = "png",
			url = "fishAnimations/shandian/shandian"
		},
		{
			type = "png",
			url = "fishAnimations/yijianshuangdiao/yijianshuangdiao"
		},
		{
			type = "png",
			url = "fishAnimations/yuboomceffect/yuboomceffect"
		},
		{
			type = "png",
			url = "fishAnimations/jinyumantang/jinyumantang"
		},
		{
			type = "plist",
			url = "fishAnimations/jinbishounaeffect/jinbishounaeffect"
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
			url = "fishAnimations/xiaohaigui/xiaohaigui0"
		},
		{
			type = "plist",
			url = "fishAnimations/buyu13/buyu130"
		},
		{
			type = "plist",
			url = "fishAnimations/denglongyu/denglongyu0"
		},
		{
			type = "plist",
			url = "fishAnimations/xiaochouyu/xiaochouyu0"
		},
		{
			type = "plist",
			url = "fishAnimations/hetun/hetun0"
		},
		{
			type = "plist",
			url = "fishAnimations/effect_bg_water/effect_bg_water2"
		},
		{
			type = "plist",
			url = "fishAnimations/buyu10/buyu100"
		},
		{
			type = "plist",
			url = "fishAnimations/buyu8/buyu80"
		},
		{
			type = "plist",
			url = "fishAnimations/xiaolanyu/xiaolanyu0"
		},
		{
			type = "plist",
			url = "fishAnimations/xiaolvyu2/xiaolvyu20"
		},
		{
			type = "plist",
			url = "fishAnimations/xiaolvyu/xiaolvyu0"
		},
		{
			type = "plist",
			url = "fishAnimations/jinbiAni/jinbiAni0"
		}
	}

	if DNTGTEST_IS_ANDROID_PLATFORM == false then
		slot0._resIOSyyConfig = {
			{
				type = "png",
				url = "fishAnimations/foshouyy/foshouyy"
			},
			{
				type = "png",
				url = "fishAnimations/danaotiangongyy/danaotiangongyy"
			},
			{
				type = "png",
				url = "fishAnimations/yishisanyuyy/yishisanyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/dingpingyy/dingpingyy"
			},
			{
				type = "png",
				url = "fishAnimations/longwangyy/longwangyy"
			},
			{
				type = "png",
				url = "fishAnimations/haiyaoyy/haiyaoyy"
			},
			{
				type = "png",
				url = "fishAnimations/jingubangyy/jingubangyy"
			},
			{
				type = "png",
				url = "fishAnimations/sunwukongyy/sunwukongyy"
			},
			{
				type = "png",
				url = "fishAnimations/yinlongyy/yinlongyy"
			},
			{
				type = "png",
				url = "fishAnimations/jinlongyy/jinlongyy"
			},
			{
				type = "png",
				url = "fishAnimations/longxiayy/longxiayy"
			},
			{
				type = "png",
				url = "fishAnimations/shenxianchuanyy/shenxianchuanyy"
			},
			{
				type = "png",
				url = "fishAnimations/shuimuhuangjinbanyy/shuimuhuangjinbanyy"
			},
			{
				type = "png",
				url = "fishAnimations/yijianshuangdiaoyy/yijianshuangdiaoyy"
			},
			{
				type = "png",
				url = "fishAnimations/zhangyuguaiyy/zhangyuguaiyy"
			},
			{
				type = "png",
				url = "fishAnimations/shajinghuangjinbanyy/shajinghuangjinbanyy"
			},
			{
				type = "png",
				url = "fishAnimations/shajingyy/shajingyy"
			},
			{
				type = "png",
				url = "fishAnimations/jianyuyy/jianyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/jinyumantangyy/jinyumantangyy"
			},
			{
				type = "png",
				url = "fishAnimations/bianfuyuyy/bianfuyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/shayuhuangjinbanyy/shayuhuangjinbanyy"
			},
			{
				type = "png",
				url = "fishAnimations/buyu12yy/buyu12yy"
			},
			{
				type = "png",
				url = "fishAnimations/xiaohaiguiyy/xiaohaiguiyy"
			},
			{
				type = "png",
				url = "fishAnimations/buyu13yy/buyu13yy"
			},
			{
				type = "png",
				url = "fishAnimations/shandianmenuyy/shandianmenuyy"
			},
			{
				type = "png",
				url = "fishAnimations/buyu7yy/buyu7yy"
			},
			{
				type = "png",
				url = "fishAnimations/hetunyy/hetunyy"
			},
			{
				type = "png",
				url = "fishAnimations/houtouyuyy/houtouyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/buyu10yy/buyu10yy"
			},
			{
				type = "png",
				url = "fishAnimations/denglongyuyy/denglongyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/xiaochouyuyy/xiaochouyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/buyu8yy/buyu8yy"
			},
			{
				type = "png",
				url = "fishAnimations/xiaolanyuyy/xiaolanyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/xiaolvyu2yy/xiaolvyu2yy"
			},
			{
				type = "png",
				url = "fishAnimations/xiaolvyuyy/xiaolvyuyy"
			},
			{
				type = "png",
				url = "fishAnimations/wudifenghuolunyy/wudifenghuolunyy"
			}
		}
		slot4 = slot0._resIOSyyConfig

		for slot5, slot6 in ipairs() do
			slot0._resProcessConfigs[#slot0._resProcessConfigs + 1] = slot6
		end
	end

	slot5 = {
		{
			type = "mp3",
			url = "effect/award.mp3"
		},
		{
			type = "mp3",
			url = "effect/bigAward.mp3"
		},
		{
			type = "mp3",
			url = "effect/BigBang.mp3"
		},
		{
			type = "mp3",
			url = "effect/ChangeScore.mp3"
		},
		{
			type = "mp3",
			url = "effect/Bigfireworks.mp3"
		},
		{
			type = "mp3",
			url = "effect/ChangeType.mp3"
		},
		{
			type = "mp3",
			url = "effect/CJ.mp3"
		},
		{
			type = "mp3",
			url = "effect/click.mp3"
		},
		{
			type = "mp3",
			url = "effect/electric.mp3"
		},
		{
			type = "mp3",
			url = "effect/Fire.mp3"
		},
		{
			type = "mp3",
			url = "effect/fireworks.mp3"
		},
		{
			type = "mp3",
			url = "effect/GunFire0.mp3"
		},
		{
			type = "mp3",
			url = "effect/GunFire1.mp3"
		},
		{
			type = "mp3",
			url = "effect/HaiLang.mp3"
		},
		{
			type = "mp3",
			url = "effect/Hit0.mp3"
		},
		{
			type = "mp3",
			url = "effect/Hit1.mp3"
		},
		{
			type = "mp3",
			url = "effect/Hit2.mp3"
		},
		{
			type = "mp3",
			url = "effect/laser.mp3"
		},
		{
			type = "mp3",
			url = "effect/MakeUP.mp3"
		},
		{
			type = "mp3",
			url = "effect/Net0.mp3"
		},
		{
			type = "mp3",
			url = "effect/Net1.mp3"
		},
		{
			type = "mp3",
			url = "effect/rotaryturn.mp3"
		},
		{
			type = "mp3",
			url = "effect/surf.mp3"
		},
		{
			type = "mp3",
			url = "effect/TNNFDCLNV.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha1.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha2.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha3.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha4.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha5.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha6.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha7.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha8.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha9.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha10.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha11.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha12.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha13.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha14.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha15.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha16.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha17.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha18.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha19.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha20.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha21.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha22.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha23.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha24.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha25.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha26.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha27.mp3"
		},
		{
			type = "mp3",
			url = "effect/fisha28.mp3"
		}
	}

	for slot6, slot7 in pairs(slot4) do
		slot0._resProcessConfigs[#slot0._resProcessConfigs + 1] = slot7
	end

	slot0.tBossId = {
		[27.0] = 2,
		[30.0] = 1
	}

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot3 = {
			["effect/CJ.mp3"] = 4,
			["effect/BigBang.mp3"] = 2,
			["effect/Bigfireworks.mp3"] = 1
		}

		for slot7 = 0, 17, 1 do
			slot3["effect/Fisha" .. slot7 .. ".mp3"] = 3
		end

		slot7 = slot3

		slot0.setEffectPriorityConfig(slot5, slot0)

		slot7 = 3

		slot0.setSingleFrameMaxEffect(slot5, slot0)
	end

	slot0.createFishMsgBufList = {}
	slot0.keyList = {}
	slot0.createFishMsgBufListIsDirty = false
	slot0.createFishMsgCount = 0
	fishcc = nil
	slot0._cannonTick = {}
end

DntgtestController.adjustIX = function (slot0)
	slot0._needAdjustIx = false
	slot0._ixOffsetx = 0
	slot0._realScreenW = CONFIG_DESIGN_WIDTH
	slot0._realScreenH = CONFIG_DESIGN_HEIGHT

	if CONFIG_DESIGN_WIDTH < display.width then
		slot0._needAdjustIx = true
		slot0._ixOffsetx = -(display.width - CONFIG_DESIGN_WIDTH) * 0.5
		slot0._realScreenW = display.width
	end
end

DntgtestController.onGameLuckMoneyMessage = function (slot0, slot1)
	slot5 = slot1

	BaseGameController.onGameLuckMoneyMessage(slot3, slot0)

	slot1.playAni = true
	slot2 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot5 = fishgame.FishObjectManager
		slot6 = slot1.dwParam
		slot2 = fishgame.FishObjectManager.GetInstance(slot4).FindFish(slot4, fishgame.FishObjectManager.GetInstance(slot4))
	else
		slot6 = slot1.dwParam
		slot2 = slot0.fishObjMgr.FindFish(slot4, slot0.fishObjMgr)
	end

	if slot2 ~= nil then
		slot5 = slot2
		slot1.fishPosition = slot2.GetPosition(slot4)
		slot7 = true

		slot0.model.setLuckPacketEvt(slot4, slot0.model, slot1)
	end
end

DntgtestController.onGameLuckMoneyEnterMessage = function (slot0, slot1)
	slot5 = slot1

	BaseGameController.onGameLuckMoneyEnterMessage(slot3, slot0)

	slot1.playAni = false
	slot6 = true

	slot0.model.setLuckPacketEvt(slot3, slot0.model, slot1)
end

DntgtestController.isNeedAdjustIx = function (slot0)
	return slot0._needAdjustIx
end

DntgtestController.getIXOffsetX = function (slot0)
	return slot0._ixOffsetx
end

DntgtestController.getIxScreenPixel = function (slot0)
	return slot0._realScreenW, slot0._realScreenH
end

DntgtestController.adjustNode = function (slot0, slot1)
	if slot0._needAdjustIx then
		slot6 = slot1.getPositionX(slot3) + slot0._ixOffsetx

		slot1:setPositionX(slot1)
	end
end

DntgtestController.restoreNode = function (slot0, slot1)
	if slot0._needAdjustIx then
		slot6 = slot1.getPositionX(slot3) - slot0._ixOffsetx

		slot1:setPositionX(slot1)
	end
end

DntgtestController.registerListeners = function (slot0)
	slot3 = slot0

	BaseGameController.registerListeners(slot2)

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot3 = fishgame.FishObjectManager
		slot3 = fishgame.FishObjectManager.GetInstance(slot2)
		slot7 = slot0.onActionBulletHitFish

		fishgame.FishObjectManager.GetInstance(slot2).RegisterBulletHitFishHandler(slot2, handler(slot5, slot0))
	end
end

DntgtestController.canceledListeners = function (slot0)
	slot3 = slot0

	BaseGameController.canceledListeners(slot2)

	slot3 = slot0

	slot0.resetBattle(slot2)
end

DntgtestController.initFishccEngine = function (slot0)
	if not DNTGTEST_IS_ANDROID_PLATFORM or not fishcc then
		return
	end

	slot3 = "dntgtest.fishConfig.Dntgtest_Visual_0130"

	requireLuaFromModule(slot2)

	slot3 = "dntgtest.fishConfig.Dntgtest_FishLimit"

	requireLuaFromModule(slot2)

	slot1 = {}
	slot2 = 0
	slot5 = Dntgtest_Visual_0130

	for slot6, slot7 in pairs(slot4) do
		slot1[slot6] = {}
		slot10 = slot7

		for slot11, slot12 in ipairs(slot9) do
			if not slot12.Shadow then
				slot16 = slot12

				table.insert(slot14, slot1[slot6])
			end
		end

		slot2 = slot2 + 1
	end

	slot6 = slot2

	print(slot4, "FishVisual + Count:")

	slot5 = Dntgtest_Visual_Limit

	fishcc.registerFishCreateMax(slot4)

	slot5 = slot1

	fishcc.registerFishCreateTemplate(slot4)

	slot3 = {}
	slot4 = {}
	slot8 = Dntgtest_CannonSet.CannonSet[1].CannonType

	for slot9, slot10 in pairs(slot7) do
		slot4[slot9] = slot10.BulletNew[1]
		slot3[slot9] = 40
	end

	slot8 = slot3

	fishcc.registerBulletCreateMax(slot7)

	slot8 = slot4

	fishcc.registerBulletCreateTemplate(slot7)

	slot7 = {}
	slot10 = Dntgtest_Fish.FishSet.Fish

	for slot11, slot12 in pairs(slot9) do
		slot7[slot12.VisualID] = Dntgtest_BoundingBox.BoundingBox[slot12.BoundingBox]
	end

	slot10 = slot7

	fishcc.registerFishBoundBoxes(slot9)

	slot10 = slot0

	slot0.registerFishBulletDeathCallback(slot9)
end

DntgtestController.registerFishBulletDeathCallback = function (slot0)
	return
end

DntgtestController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == DNTGTEST_SUB_S_TIME_SYNC then
		slot6 = slot1

		slot0.onMsgTimeSync(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SEND_FISH then
		slot6 = slot1

		slot0.onMsgCreateFish(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_USER_INFO then
		slot6 = slot1

		slot0.onMsgPlayerInfo(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_CHANGE_SCORE then
		slot6 = slot1

		slot0.onMsgChangeScore(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_CANNON_SET then
		slot6 = slot1

		slot0.onMsgCannonSet(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SEND_BULLET then
		slot6 = slot1

		slot0.onMsgCreateBullet(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_KILL_FISH then
		slot6 = slot1

		slot0.onMsgKillFish(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_KILL_BULLET then
		slot6 = slot1

		slot0.onMsgKillBullet(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SWITCH_SCENE then
		slot6 = slot1

		slot0.onMsgSwitchScene(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_ALLOW_FIRE then
		slot6 = slot1

		slot0.onMsgAllowFire(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_GAME_CONFIG then
		slot6 = slot1

		slot0.onMsgGameConfig(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_LOCK_FISH then
		slot6 = slot1

		slot0.onMsgLockFish(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SEND_DES then
		slot6 = slot1

		slot0.onMsgSendDes(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_FORCE_TIME_SYNC then
		slot6 = slot1

		slot0.onMsgForceTimeSync(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_BULLET_SET then
		slot6 = slot1

		slot0.onMsgBulletSet(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_ADD_BUFFER then
		slot6 = slot1

		slot0.onMsgAddBuffer(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_FIRE_FAILE then
		slot6 = slot1

		slot0.onMsgFireFailed(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_ACTIVITY_NOTIFY then
		slot6 = slot1

		slot0.onMsgActivityNotice(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_FISH_MUL then
		slot6 = slot1

		slot0.onMsgFishMul(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SCORE_SYNC then
		slot6 = slot1

		slot0.onMsgScoreSync(slot4, slot0)
	elseif slot2 == DNTGTEST_SUB_S_SPEEDUP then
		slot6 = slot1

		slot0.onMsgChangeSpeedUp(slot4, slot0)
	end
end

DntgtestController.onViewTypeChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_BATTLE then
		slot4 = true

		slot0.model.setIsShowingBattleLoading(slot2, slot0.model)

		slot4 = true

		slot0.model.setBBattle(slot2, slot0.model)

		slot4 = true

		slot0.model.setUpdateTickStatus(slot2, slot0.model)
	else
		slot4 = false

		slot0.model.setUpdateTickStatus(slot2, slot0.model)

		slot4 = false

		slot0.model.setBBattle(slot2, slot0.model)
	end

	slot3 = slot0

	BaseGameController.onViewTypeChanged(slot2)
end

DntgtestController.onMsgChangeSpeedUp = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SPEEDUP"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SPEEDUP"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID

		if slot0.model.getPlayerByChairID(ffiMgr, slot0.model) ~= nil then
			slot8 = slot2.dwStartTick

			slot3.SetBulletSpeedRate(slot5, slot3, slot2.cbSpeedMul)

			slot8 = slot3

			slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)
		end
	end
end

DntgtestController.onMsgTimeSync = function (slot0, slot1)
	slot6 = "FISH_CMD_S_TIME_SYNC"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_TIME_SYNC"
		slot5 = Hero

		if not Hero.getWChairID(ffiMgr) == ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChiarID then
			return
		end

		slot5 = slot0

		if slot0.BeReady(slot4) == false then
			reqDNTGTESTBReady()
		end

		slot7 = slot2.dwServerTick

		slot0.TimerSync(slot4, slot0, slot2.dwClientTick)

		slot5 = slot0

		slot0.SetSyncTime(slot4, socket.gettime())
	end
end

DntgtestController.onMsgGameConfig = function (slot0, slot1)
	slot6 = "FISH_CMD_S_GameConfig"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_GameConfig"

		if ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).nMaxInterval < 1000 then
			slot2.nMaxInterval = 90000
		end

		slot2.nFireInterval = slot2.nFireInterval / 1000
		slot2.nMaxInterval = slot2.nMaxInterval / 1000

		if slot2.nMaxBulletCount == nil then
			slot2.nMaxBulletCount = 80
		end

		slot6 = slot2

		slot0.model.setGameconfig(slot4, slot0.model)

		slot5 = {
			bAdd = true,
			bAddAll = true,
			wChairID = Hero.getWChairID(slot7) or 0
		}
		slot8 = Hero

		reqDNTGTESTChangeScore(slot4)
	end
end

DntgtestController.onMsgCreateFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SendFish"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SendFish"
		slot5 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).fDelay * 1000

		if slot0.createFishMsgBufList[math.floor(ffiMgr) + ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).dwCreateTick] == nil then
			slot0.createFishMsgBufList[slot3] = {}
			slot0.createFishMsgBufListIsDirty = true
		end

		slot8 = slot2

		table.insert(slot6, slot4)

		slot0.createFishMsgCount = slot0.createFishMsgCount + 1
		slot0.dwServerTick = slot2.dwServerTick
	end
end

DntgtestController.createFishByMsg = function (slot0, slot1)
	if slot0.tBossId[slot1.nTypeID] then
		slot6 = slot2

		slot0.model.setIBossComing(slot4, slot0.model)
	end

	slot3 = Dntgtest_Fish.FishSet.Fish[slot1.nTypeID]

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot6 = fishgame.FishObjectManager
		slot7 = slot1.dwFishID

		if fishgame.FishObjectManager.GetInstance(slot5).FindFish(slot5, fishgame.FishObjectManager.GetInstance(slot5)) then
			slot6 = "Same fish---"

			print(slot5)

			return
		end
	else
		slot7 = slot1.dwFishID

		if slot0.fishObjMgr.FindFish(slot5, slot0.fishObjMgr) then
			return
		end
	end

	if Dntgtest_Fish.FishSet.Fish[slot1.nTypeID] ~= nil then
		slot16 = slot1.FisType

		if slot0.CreateFish(slot6, slot0, slot4, slot1.fOffestX, slot1.fOffestY, slot1.fDir, slot1.fDelay, slot1.FishSpeed, slot1.nPathID, slot1.bTroop) then
			slot9 = slot4

			slot5.SetFishCofigData(slot7, slot5)

			slot9 = slot1.dwFishID

			slot5.SetId(slot7, slot5)

			slot9 = slot1.nRefershID

			slot5.SetRefershID(slot7, slot5)

			if DNTGTEST_IS_ANDROID_PLATFORM then
				slot8 = fishgame.FishObjectManager
				slot9 = slot5

				fishgame.FishObjectManager.GetInstance(slot7).AddFish(slot7, fishgame.FishObjectManager.GetInstance(slot7))

				if fishcc then
					slot12 = slot1.dwCreateTick
					slot9 = slot0.GetDelayTick(slot10, slot0) / 1000

					slot5.onUpdateNew(slot7, slot5)
				else
					slot12 = slot1.dwCreateTick
					slot9 = slot0.GetDelayTick(slot10, slot0) / 1000

					slot5.OnUpdate(slot7, slot5)
				end
			else
				slot8 = slot0
				slot9 = slot5

				if slot0.GetFishObjMgr(slot7).AddFish(slot7, slot0.GetFishObjMgr(slot7)) == true then
					slot13 = slot1.dwCreateTick
					slot10 = slot0.GetDelayTick(slot11, slot0) / 1000

					slot5.OnUpdate(slot8, slot5)
				end
			end
		end
	else
		slot10 = slot1.nTypeID
		slot7 = "没有找到nTypeID为 " .. tostring(slot9) .. " 的鱼。"

		print(slot6)
	end
end

DntgtestController.update4CreateFish = function (slot0)
	if slot0.createFishMsgBufListIsDirty then
		slot3 = slot0.createFishMsgBufList
		slot0.keyList = TableUtil.getKeys(slot2)

		if #slot0.keyList > 1 then
			slot3 = slot0.keyList

			table.sort(slot2)
		end

		slot0.createFishMsgBufListIsDirty = false
	end

	while #slot0.keyList > 0 do
		slot2 = slot0.createFishMsgBufList[slot0.keyList[1]]
		slot6 = slot0.keyList[1]

		if -slot0.GetDelayTick(slot4, slot0) > 20 then
			slot8 = table.remove(slot5)

			slot0.createFishByMsg(slot2, slot0)

			if #slot2 == 0 then
				slot0.createFishMsgBufList[slot1] = nil
				slot8 = 1

				table.remove(nil, slot0.keyList)
			end

			slot0.createFishMsgCount = slot0.createFishMsgCount - 1

			break
		else
			slot6 = slot2

			for slot7, slot8 in ipairs(slot5) do
				slot12 = slot8

				slot0.createFishByMsg(slot10, slot0)
			end
		end

		slot0.createFishMsgBufList[slot1] = nil
		slot7 = 1

		table.remove(nil, slot0.keyList)

		slot0.createFishMsgCount = slot0.createFishMsgCount - #slot2
	end

	if slot0.dwServerTick then
		slot4 = slot0.dwServerTick
		slot4 = slot0

		if slot0:getMaxDiffrence() < slot0.GetDelayTick(slot2, slot0) then
			slot3 = {
				wChairID = Hero.getWChairID(slot5),
				dwClientTick = slot0.GetClientTick(slot5)
			}
			slot6 = Hero
			slot6 = slot0

			reqDNTGTESTMsgSyncTime(slot2)
		end

		slot0.dwServerTick = nil
	end
end

DntgtestController.onMsgBulletSet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_BULLET_SET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_BULLET_SET"

		if ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).bFirst then
			Dntgtest_BulletSet.BulletSet = {}
		end

		slot7 = {
			BulletSize = slot2.nBulletSize,
			CannonType = slot2.nCannonType,
			Speed = slot2.nSpeed,
			Mulriple = slot2.nMulriple,
			MaxCatch = slot2.nMaxCatch,
			CatchRadio = slot2.nCatchRadio
		}

		table.insert(slot5, Dntgtest_BulletSet.BulletSet)
	end
end

DntgtestController.onMsgPlayerInfo = function (slot0, slot1)
	slot6 = "FISH_CMD_S_USER_INFO"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_USER_INFO"
		slot5 = Hero

		if Hero.getWChairID(ffiMgr) == ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID then
			slot5 = {
				wChairID = Hero.getWChairID(slot7),
				dwClientTick = slot0.GetClientTick(slot7)
			}
			slot8 = Hero
			slot8 = slot0

			reqDNTGTESTMsgSyncTime(slot4)

			if slot2.wChairID == 0 or slot2.wChairID == 1 then
				if DNTGTEST_IS_ANDROID_PLATFORM then
					slot5 = fishgame.FishObjectManager
					slot6 = true

					fishgame.FishObjectManager.GetInstance(slot4).SetMirrowShow(slot4, fishgame.FishObjectManager.GetInstance(slot4))
				end

				slot6 = true

				slot0.SetMirrowShow(slot4, slot0)
			else
				if DNTGTEST_IS_ANDROID_PLATFORM then
					slot5 = fishgame.FishObjectManager
					slot6 = false

					fishgame.FishObjectManager.GetInstance(slot4).SetMirrowShow(slot4, fishgame.FishObjectManager.GetInstance(slot4))
				end

				slot6 = false

				slot0.SetMirrowShow(slot4, slot0)
			end
		end

		slot6 = slot2.wChairID

		if slot0.model.getPlayerByChairID(slot4, slot0.model) == nil then
			slot6 = slot2.wChairID
			slot6 = slot0.new(slot5)
			slot9 = slot0.model

			slot0.new(slot5).SetRoomKind(slot5, slot0.model.getRoomKind(slot8))

			slot0.new(slot5).hasPlayerInfo = false
		end

		if slot3.hasPlayerInfo then
			return
		end

		slot3.hasPlayerInfo = true
		slot7 = slot2.nCannonMul

		slot3.SetCannonMultiply(slot5, slot3)

		slot7 = slot2.nCannonType

		slot3.SetCannonType(slot5, slot3)

		slot7 = slot2.lScore

		slot3.SetScore(slot5, slot3)

		if slot2.lScore > 0 then
			slot7 = Hero

			if slot2.wChairID == Hero.getWChairID(slot6) then
				slot7 = slot2.lScore

				Hero.setUserScore(slot5, Hero)
			end
		end

		slot7 = slot2.wChairID

		if gameMgr.getUserDataByChairId(slot5, gameMgr) then
			slot8 = slot4.szNickName

			slot3.SetNickName(slot6, slot3)

			slot8 = slot4.dwUserID

			slot3.SetUserId(slot6, slot3)
		end

		slot9 = slot3

		slot0.model.setPlayerByChairID(slot6, slot0.model, slot2.wChairID)
	end
end

DntgtestController.onMsgChangeScore = function (slot0, slot1)
	slot6 = "FISH_CMD_S_CHANGE_SCORE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_CHANGE_SCORE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID

		if slot0.model.getPlayerByChairID(ffiMgr, slot0.model) == nil then
			return
		end

		slot7 = slot2.lFishScore

		slot3.SetScore(slot5, slot3)

		if slot2.lFishScore > 0 then
			slot7 = Hero

			if slot2.wChairID == Hero.getWChairID(slot6) then
				slot7 = slot2.lFishScore

				Hero.setUserScore(slot5, Hero)
			end
		end

		slot8 = slot3

		slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)
	end
end

DntgtestController.onMsgCannonSet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_CANNON_SET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_CANNON_SET"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID

		if slot0.model.getPlayerByChairID(ffiMgr, slot0.model) == nil then
			return
		end

		slot7 = Hero

		if slot2.wChairID == Hero.getWChairID(slot6) then
			if slot2.cannonSet == 0 then
				slot7 = "no"

				slot0.model.setIsEnergyCannon(slot5, slot0.model)
			else
				slot7 = "yes"

				slot0.model.setIsEnergyCannon(slot5, slot0.model)
			end
		end

		if not slot0._cannonTick[slot2.wChairID] then
			function cannonTickCallBack()
				if not slot0._isEnterBack and slot0._cannonTick[slot1.wChairID] then
					count = slot0._cannonTick[slot1.wChairID].count
					count = count + 1
					count + 1._cannonTick[slot1.wChairID.wChairID].count = count

					if count > 7 then
						slot3 = slot1.wChairID

						if slot0.model.getPlayerByChairID(slot1, slot0.model) then
							slot3 = slot0

							if slot0.GetCannonSetType(slot2) ~= 0 then
								slot5 = Hero

								if slot1.wChairID == Hero.getWChairID(slot4) then
									slot5 = "no"

									slot0.model.setIsEnergyCannon(slot3, slot0.model)
								end

								slot5 = 0

								slot0.SetCannonSetType(slot3, slot0)

								slot4 = slot0

								slot0.SetUpdateCannon(slot3)

								slot6 = slot0

								slot0.model.setPlayerByChairID(slot3, slot0.model, slot1.wChairID)
							end
						end

						if slot0._cannonTick[slot1.wChairID].timer then
							slot3 = slot0._cannonTick[slot1.wChairID].timer

							slot0._cannonTick[slot1.wChairID].timer.stop(slot1.wChairID)
						end

						slot0._cannonTick[slot1.wChairID] = nil
					end
				end
			end

			slot9 = -1
			_tick = tickMgr.delayedCall(slot5, tickMgr, cannonTickCallBack, 1000)
			slot6 = _tick

			_tick.start(slot5)

			slot0._cannonTick[slot2.wChairID] = {
				count = 0,
				timer = _tick
			}
		end

		slot7 = slot2.cannonSet

		slot3.SetCannonSetType(slot5, slot3)

		slot7 = slot2.cannonType

		slot3.SetCannonType(slot5, slot3)

		slot7 = slot2.cannonMul

		slot3.SetCannonMultiply(slot5, slot3)

		slot8 = slot3

		slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)
	end
end

DntgtestController.onMsgCreateBullet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SEND_BULLET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot2 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot7 = "FISH_CMD_S_SEND_BULLET"
			slot2 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)
		else
			DebugUtil.beginMark(slot4)

			slot2 = {
				dwID = slot4.readUInt(slot1, slot4),
				wChairID = slot4.readUShort(slot1, slot4),
				dwCreateTick = slot4.readUInt(slot1, slot4),
				fXpos = slot4.readFloat(slot1, slot4),
				fYPos = slot4.readFloat(slot1, slot4),
				nCannonType = slot4.readInt(slot1, slot4),
				nMultiply = slot4.readInt(slot1, slot4),
				lScore = slot4.readByte2Integer(slot1, slot4, 8, true),
				fDirection = slot4.readFloat(slot1, slot4),
				bNew = slot4.readBool(slot1, slot4),
				dwServerTick = slot4.readUInt(slot1, slot4),
				IsDouble = slot4.readBool(slot1, slot4)
			}
			slot4 = ByteArray.new("协议解析：DNTGTEST_FISH_CMD_S_SEND_BULLET")
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot10 = false
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot7 = "协议解析：DNTGTEST_FISH_CMD_S_SEND_BULLET"

			DebugUtil.endMark(slot1)
		end

		slot6 = slot2.wChairID

		if slot0.model.getPlayerByChairID(slot4, slot0.model) == nil then
			return
		end

		if slot2.lScore > 0 then
			slot7 = Hero

			if slot2.wChairID == Hero.getWChairID(slot6) then
				slot9 = slot3
				slot7 = slot3.GetScore(slot8) - slot2.lScore

				slot0.model.updateCostBulletCount(slot5, slot0.model)
			end
		end

		slot7 = slot2.lScore

		slot3.SetScore(slot5, slot3)

		if slot2.lScore > 0 then
			slot7 = Hero

			if slot2.wChairID == Hero.getWChairID(slot6) then
				slot7 = slot2.lScore

				Hero.setUserScore(slot5, Hero)
			end
		end

		slot6 = Hero

		if Hero.getWChairID(slot5) == slot2.wChairID then
			if slot0.nBulletID == nil or slot0.nBulletID == 0 then
				slot0.nBulletID = slot2.dwID - slot2.wChairID * 20000
			end

			slot7 = slot2.dwServerTick
			slot7 = slot0

			if slot0:getMaxDiffrence() < slot0.GetDelayTick(slot5, slot0) then
				slot6 = {
					wChairID = Hero.getWChairID(slot8),
					dwClientTick = slot0.GetClientTick(slot8)
				}
				slot9 = Hero
				slot9 = slot0

				reqDNTGTESTMsgSyncTime(slot5)
			end
		else
			if slot2.bNew then
				slot6 = slot3

				if slot3.GetLockFishID(slot5) == 0 then
					if slot2.wChairID == 2 or slot2.wChairID == 3 then
						slot6 = slot3
						slot7 = M_PI - slot2.fDirection

						slot3.GetCannon(slot5).SetCannonAngle(slot5, slot3.GetCannon(slot5))
					else
						slot6 = slot3
						slot7 = slot2.fDirection

						slot3.GetCannon(slot5).SetCannonAngle(slot5, slot3.GetCannon(slot5))
					end
				end

				slot7 = slot2.wChairID

				slot0.model.setPlayerCannonAnimation(slot5, slot0.model)
			end

			slot9 = slot2.fDirection

			slot0.createBullet(slot5, slot0, slot2.wChairID, slot2.dwID)
		end

		slot8 = slot3

		slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)
	end
end

DntgtestController.onMsgKillFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_KILL_FISH"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_KILL_FISH"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot3 = slot2.wChairID
		slot6 = slot2.lScore / slot2.nBScoe
		slot7 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot10 = fishgame.FishObjectManager
			slot11 = slot2.dwFishID
			slot7 = fishgame.FishObjectManager.GetInstance(slot9).FindFish(slot9, fishgame.FishObjectManager.GetInstance(slot9))
		else
			slot10 = slot0
			slot11 = slot2.dwFishID
			slot7 = slot0.GetFishObjMgr(slot9).FindFish(slot9, slot0.GetFishObjMgr(slot9))
		end

		slot15 = DNTGTEST_OVER_BY_BULLET

		slot0.KillFish(slot9, slot0, slot2.wChairID, slot7, slot2.nBScoe, slot2.lScore)

		slot11 = slot2.wChairID

		if slot0.model.getPlayerByChairID(slot9, slot0.model) ~= nil then
			slot14 = slot8
			slot12 = slot8.GetScore(slot13) + slot2.lScore

			slot8.SetScore(slot10, slot8)

			slot13 = slot8

			slot0.model.setPlayerByChairID(slot10, slot0.model, slot2.wChairID)

			slot12 = Hero

			if slot2.wChairID == Hero.getWChairID(slot0.model) then
				slot11 = Hero
				slot14 = slot8

				Hero.setUserScore(slot10, slot8.GetScore(slot13))

				slot12 = slot2.lScore

				slot0.model.updateGetGoldCount(slot10, slot0.model)
			end
		end
	end
end

DntgtestController.onMsgKillBullet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_KILL_BULLET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_KILL_BULLET"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot3 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot6 = fishgame.FishObjectManager
			slot7 = slot2.dwBulletID
			slot3 = fishgame.FishObjectManager.GetInstance(slot5).FindBullet(slot5, fishgame.FishObjectManager.GetInstance(slot5))
		else
			slot6 = slot0
			slot7 = slot2.dwBulletID
			slot3 = slot0.GetFishObjMgr(slot5).FindBullet(slot5, slot0.GetFishObjMgr(slot5))
		end

		slot7 = slot2.dwBulletID

		slot0.removeSelfBullets(slot5, slot0)

		if slot3 ~= nil then
			slot7 = DNTGTEST_OBJ_STATE.EOS_DEAD

			slot3.SetState(slot5, slot3)
		end
	end
end

DntgtestController.onMsgSwitchScene = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SWITCH_SCENE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SWITCH_SCENE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0.model.setSwitchingScene(ffiMgr, slot0.model)

		slot5 = slot0.model

		if slot0.model.getBBattle(ffiMgr) == true then
			slot6 = false

			slot0.model.setBBattle(slot4, slot0.model)
		end
	end
end

DntgtestController.onMsgAllowFire = function (slot0, slot1)
	slot6 = "FISH_CMD_S_ALLOW_FIRE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_ALLOW_FIRE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).m_bAllowFire

		slot0.model.setAllowFire(ffiMgr, slot0.model)
	end
end

DntgtestController.onMsgLockFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_LOCK_FISH"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_LOCK_FISH"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID

		if slot0.model.getPlayerByChairID(ffiMgr, slot0.model) ~= nil then
			slot7 = slot2.dwLockID

			slot3.SetLockFishID(slot5, slot3)

			slot8 = slot3

			slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)

			slot7 = Hero

			if slot2.wChairID == Hero.getWChairID(slot0.model) and slot2.dwLockID ~= 0 then
				slot6 = slot0.model

				if slot0.model.getBLockFish(slot5) == false then
					slot6 = {
						bLock = false,
						wChairID = slot2.wChairID
					}

					reqDNTGTESTMsgLockFish(slot5)
				end
			end
		end
	end
end

DntgtestController.onMsgSendDes = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SEND_DES"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SEND_DES"
		slot6 = "onMsgSendDes:"

		dump(ffiMgr, slot2)

		slot6 = true

		slot0.model.setFishGroupComing(ffiMgr, slot0.model)
	end
end

DntgtestController.onMsgForceTimeSync = function (slot0, slot1)
	slot4 = {
		wChairID = Hero.getWChairID(slot6),
		dwClientTick = slot0.GetClientTick(slot6)
	}
	slot7 = Hero
	slot7 = slot0

	reqDNTGTESTMsgSyncTime(slot3)
end

DntgtestController.onMsgAddBuffer = function (slot0, slot1)
	slot6 = "FISH_CMD_S_ADD_BUFFER"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_ADD_BUFFER"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot5 = fishgame.FishObjectManager
			slot8 = slot2.fBufferTime

			fishgame.FishObjectManager.GetInstance(slot4).AddFishBuff(slot4, fishgame.FishObjectManager.GetInstance(slot4), slot2.nBufferType, slot2.fBufferParam)
		else
			slot5 = slot0
			slot8 = slot2.fBufferTime

			slot0.GetFishObjMgr(slot4).AddFishBuff(slot4, slot0.GetFishObjMgr(slot4), slot2.nBufferType, slot2.fBufferParam)
		end
	end
end

DntgtestController.onMsgFireFailed = function (slot0, slot1)
	return
end

DntgtestController.onMsgActivityNotice = function (slot0, slot1)
	slot6 = "FISH_CMD_S_ACTIVITY_NOTIFY"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_ACTIVITY_NOTIFY"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
	end
end

DntgtestController.onMsgFishMul = function (slot0, slot1)
	slot6 = "FISH_CMD_S_FISH_MUL"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_FISH_MUL"
		slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
		slot3 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot6 = fishgame.FishObjectManager
			slot7 = slot2.nFishID
			slot3 = fishgame.FishObjectManager.GetInstance(slot5).FindFish(slot5, fishgame.FishObjectManager.GetInstance(slot5))
		else
			slot6 = slot0
			slot7 = slot2.nFishID
			slot3 = slot0.GetFishObjMgr(slot5).FindFish(slot5, slot0.GetFishObjMgr(slot5))
		end

		if slot3 == nil then
			return
		end

		slot7 = slot2.nMul

		slot3.SetScore(slot5, slot3)
	end
end

DntgtestController.onMsgScoreSync = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SCORE_SYNC"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SCORE_SYNC"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1).wChairID

		if slot0.model.getPlayerByChairID(ffiMgr, slot0.model) == nil then
			return
		end

		slot7 = Hero

		if slot2.wChairID == Hero.getWChairID(slot6) then
			slot7 = -1 * slot2.lScore

			slot0.model.updateCostBulletCount(slot5, slot0.model)

			slot9 = slot3
			slot7 = slot3.GetScore(slot8) + slot2.lScore

			Hero.setUserScore(slot5, Hero)
		end

		slot9 = slot3
		slot7 = slot3.GetScore(slot8) + slot2.lScore

		slot3.SetScore(slot5, slot3)

		slot8 = slot3

		slot0.model.setPlayerByChairID(slot5, slot0.model, slot2.wChairID)
	end
end

DntgtestController.onUserScore = function (slot0, slot1)
	if slot1 then
		slot5 = Hero

		if slot1.dwUserID == Hero.getDwUserID(slot4) then
			slot5 = slot1.lScore

			Hero.setUserScore(slot3, Hero)
		end
	end

	slot5 = Hero

	if slot1.wTableID == Hero.getWTableID(slot4) and US_FREE < slot1.cbUserStatus and slot1.cbUserStatus ~= US_LOOKON and slot1.wChairID ~= INVALID_WORD then
		slot5 = slot1.wChairID

		if slot0.model.getPlayerByChairID(slot3, slot0.model) ~= nil then
			slot6 = slot1.lScore

			slot2.SetScore(slot4, slot2)

			slot7 = slot2

			slot0.model.setPlayerByChairID(slot4, slot0.model, slot1.wChairID)

			slot6 = Hero

			if slot1.wChairID == Hero.getWChairID(slot0.model) then
				slot6 = slot1.lScore

				Hero.setUserScore(slot4, Hero)
			end
		end
	end
end

DntgtestController.onUserEnter = function (slot0, slot1)
	return
end

DntgtestController.onUserStatus = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if US_FREE < slot1.cbUserStatus and slot1.cbUserStatus ~= US_LOOKON then
		slot5 = Hero

		if slot1.wTableID ~= Hero.getWTableID(slot4) then
			return
		end

		slot5 = slot1.wChairID

		if slot0.model.getPlayerByChairID(slot3, slot0.model) == nil then
			slot5 = slot1.wChairID
			slot5 = slot0.new(slot4)
			slot8 = slot0.model

			slot0.new(slot4).SetRoomKind(slot4, slot0.model.getRoomKind(slot7))
		end

		slot6 = slot1.dwUserID

		slot2.SetUserId(slot4, slot2)

		slot6 = slot1.szNickName

		slot2.SetNickName(slot4, slot2)

		slot6 = slot1.lScore

		slot2.SetScore(slot4, slot2)

		slot2.hasPlayerInfo = false

		if slot1.lScore > 0 then
			slot6 = Hero

			if slot1.wChairID == Hero.getWChairID(slot5) then
				slot6 = slot1.lScore

				Hero.setUserScore(slot4, Hero)
			end
		end

		slot7 = slot2

		slot0.model.setPlayerByChairID(slot4, slot0.model, slot1.wChairID)
	else
		slot5 = slot0.model.getFishPlayer(slot3)

		for slot6, slot7 in pairs(slot0.model) do
			slot11 = slot7

			if slot1.dwUserID == slot7.GetUserId(slot10) then
				slot2[slot6] = nil
				slot12 = true

				slot0.model.setFishPlayer(slot9, slot0.model, slot2)

				slot11 = Hero

				if slot1.dwUserID == Hero.getDwUserID(slot0.model) then
					slot10 = slot0

					slot0.exitBattle(slot9)
				end

				break
			end
		end
	end
end

DntgtestController.SetFishObjMgr = function (slot0, slot1)
	slot0.fishObjMgr = slot1
end

DntgtestController.GetFishObjMgr = function (slot0)
	return slot0.fishObjMgr
end

DntgtestController.loadSystemConfig = function (slot0)
	slot1 = Dntgtest_System.SystemSet.DefaultScreenSet
	slot2 = CONFIG_DESIGN_WIDTH
	slot3 = CONFIG_DESIGN_HEIGHT
	slot6 = slot0

	if slot0.isNeedAdjustIx(slot5) then
		slot6 = slot0
		slot2, slot3 = slot0.getIxScreenPixel(slot5)
	end

	slot10 = slot3

	slot0.setBattleLayerSize(slot5, slot0, slot1.width, slot1.height, slot2)
end

DntgtestController.onRoomLoginFinish = function (slot0)
	slot3 = slot0

	slot0.reConnetServer(slot2)

	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

DntgtestController.reConnetServer = function (slot0)
	slot5 = true

	slot0.model.setBulletCount(slot2, slot0.model, 0)

	slot4 = false

	slot0.setAutoAttack(slot2, slot0)

	slot4 = false

	slot0.model.setBLockFish(slot2, slot0.model)

	slot4 = 1

	slot0.model.setMCurSpeedRate(slot2, slot0.model)

	for slot4 = 0, 3, 1 do
		slot8 = slot4

		if slot0.model.getPlayerByChairID(slot6, slot0.model) ~= nil then
			slot9 = 0

			slot5.SetCannonSetType(slot7, slot5)

			slot10 = slot5

			slot0.model.setPlayerByChairID(slot7, slot0.model, slot4)
		end
	end

	slot0.nBulletID = 0
	slot0.tBulletID = {}
	slot3 = slot0

	slot0.resetTimeService(slot2)

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot3 = fishgame.FishObjectManager
		slot3 = fishgame.FishObjectManager.GetInstance(slot2)
		slot7 = slot0.onActionBulletHitFish

		fishgame.FishObjectManager.GetInstance(slot2).RegisterBulletHitFishHandler(slot2, handler(slot5, slot0))

		slot3 = fishgame.FishObjectManager
		slot4 = true

		fishgame.FishObjectManager.GetInstance(slot2).RemoveAllBullets(slot2, fishgame.FishObjectManager.GetInstance(slot2))

		slot3 = fishgame.FishObjectManager
		slot4 = true

		fishgame.FishObjectManager.GetInstance(slot2).RemoveAllFishes(slot2, fishgame.FishObjectManager.GetInstance(slot2))
	else
		slot3 = slot0

		if slot0.GetFishObjMgr(slot2) ~= nil then
			slot3 = slot0
			slot4 = true

			slot0.GetFishObjMgr(slot2).RemoveAllBullets(slot2, slot0.GetFishObjMgr(slot2))

			slot3 = slot0
			slot4 = true

			slot0.GetFishObjMgr(slot2).RemoveAllFishes(slot2, slot0.GetFishObjMgr(slot2))
		end
	end

	slot0.createFishMsgBufList = {}
	slot0.keyList = {}
	slot0.createFishMsgBufListIsDirty = false
	slot0.createFishMsgCount = 0
	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

DntgtestController.resetBattle = function (slot0)
	slot3 = slot0._cannonTick

	for slot4, slot5 in pairs(slot2) do
		if slot5.timer then
			slot8 = slot5.timer

			slot5.timer.stop(slot7)
		end
	end

	slot0._cannonTick = {}
	slot0.tBulletID = {}
	slot3 = slot0.model

	slot0.model.resetLocalData(slot2)

	slot3 = slot0

	slot0.resetTimeService(slot2)

	slot3 = slot0

	slot0.resetDntgSoundManager(slot2)

	slot4 = false

	slot0.model.setIsShowingExit(slot2, slot0.model)

	slot4 = false

	slot0.setSyncSelfScore(slot2, slot0)

	slot0.nBulletID = 0
	slot4 = 1

	slot0.model.setMCurSpeedRate(slot2, slot0.model)

	slot4 = -1

	slot0.model.setCurrSceneId(slot2, slot0.model)

	slot4 = false

	slot0.setAutoAttack(slot2, slot0)

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot1 = fishgame.FishObjectManager.GetInstance(slot2)
		slot5 = true

		slot1.RemoveAllBullets(fishgame.FishObjectManager, slot1)

		slot5 = true

		slot1.RemoveAllFishes(fishgame.FishObjectManager, slot1)

		slot5 = false

		slot1.SetGameLoaded(fishgame.FishObjectManager, slot1)

		if fishcc then
			slot4 = slot1

			slot1.removeAllFishesNew(slot3)

			slot4 = slot1

			slot1.removeAllBulletsNew(slot3)
		end

		slot4 = fishgame.FishObjectManager

		fishgame.FishObjectManager.DestoryInstace(slot3)

		if fishcc then
			fishcc.removeAllFishes()
			fishcc.removeAllBullets()
		end
	else
		slot3 = slot0

		if slot0.GetFishObjMgr(slot2) ~= nil then
			slot3 = slot0
			slot4 = true

			slot0.GetFishObjMgr(slot2).RemoveAllBullets(slot2, slot0.GetFishObjMgr(slot2))

			slot3 = slot0
			slot4 = true

			slot0.GetFishObjMgr(slot2).RemoveAllFishes(slot2, slot0.GetFishObjMgr(slot2))

			slot3 = slot0
			slot4 = false

			slot0.GetFishObjMgr(slot2).SetGameLoaded(slot2, slot0.GetFishObjMgr(slot2))

			slot4 = nil

			slot0.SetFishObjMgr(slot2, slot0)
		end
	end

	slot0.createFishMsgBufList = {}
	slot0.keyList = {}
	slot0.createFishMsgBufListIsDirty = false
	slot0.createFishMsgCount = 0
end

DntgtestController.exitGame = function (slot0, slot1)
	slot5 = slot1

	BaseGameController.exitGame(slot3, slot0)

	slot4 = mainMgr

	mainMgr.onRestartTick2Gc(slot3)
end

DntgtestController.praticeTipsTickCall = function (slot0)
	slot3 = slot0

	BaseGameController.praticeTipsTickCall(slot2)

	slot3 = slot0

	slot0.showPraticeTips(slot2)
end

DntgtestController.CreateChairBullet = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot11 = slot3

	if Dntgtest_BulletSet.BulletSet[slot3.GetCannonMultiply(slot10) + 1] == nil then
		return
	end

	if slot3 == nil then
		return
	end

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot11 = fishgame.FishObjectManager
		slot12 = slot2

		if fishgame.FishObjectManager.GetInstance(slot10).FindBullet(slot10, fishgame.FishObjectManager.GetInstance(slot10)) then
			return
		end
	else
		slot11 = slot0
		slot12 = slot2

		if slot0.GetFishObjMgr(slot10).FindBullet(slot10, slot0.GetFishObjMgr(slot10)) then
			return
		end
	end

	slot11 = slot3

	if slot3.GetCannonConfig(slot10) == nil then
		return
	end

	slot10 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM and fishcc then
		slot13 = slot9.Id
		slot10 = slot0.new(slot12)
	else
		slot10 = slot0.new()
	end

	slot10.SetVisualData(slot12, slot10, slot2)

	slot14 = slot8.CatchRadio

	slot10.SetCatchRadio(slot12, slot10)

	slot14 = slot1

	slot10.SetChairID(slot12, slot10)

	slot13 = slot10
	slot16 = slot3

	slot10.SetCannonSetType(slot12, slot3.GetCannonSetType(slot2))

	slot13 = slot10
	slot16 = slot3

	slot10.SetCannonType(slot12, slot3.GetCannonType(slot2))

	if not DNTGTEST_IS_ANDROID_PLATFORM or not fishcc then
		slot11 = "res/gameres/module/dntgtest/fishAnimations/bulletAni/%s"

		for slot15 = 1, #slot9.Bullet, 1 do
			slot20 = slot9.Bullet[slot15].ResName
			slot17 = string.format(slot18, slot11)
			slot18 = slot9.Bullet[slot15].PosX or 0
			slot19 = slot16.PosY or 0

			if slot10.AddVisualLiveDataWithZOrder ~= nil then
				slot31 = Dntgtest_RenderOrder[slot16.ResName]

				slot10.AddVisualLiveDataWithZOrder(slot21, slot10, slot16.ResName, slot17, slot16.Name, slot16.Scale, slot18, slot19, 0, slot16.ResType)
			else
				slot30 = slot16.ResType

				slot10.AddVisualLiveData(slot21, slot10, slot16.ResName, slot17, slot16.Name, slot16.Scale, slot18, slot19, 0)
			end
		end

		for slot15 = 1, #slot9.Net, 1 do
			slot20 = slot9.Net[slot15].ResName
			slot17 = string.format(slot18, slot11)
			slot18 = slot9.Net[slot15].PosX or 0
			slot19 = slot16.PosY or 0

			if slot10.AddVisualDieDataWithZOrder ~= nil then
				slot31 = Dntgtest_RenderOrder[slot16.ResName]

				slot10.AddVisualDieDataWithZOrder(slot21, slot10, slot16.ResName, slot17, slot16.Name, slot16.Scale, slot18, slot19, 0, slot16.ResType)
			else
				slot30 = slot16.ResType

				slot10.AddVisualDieData(slot21, slot10, slot16.ResName, slot17, slot16.Name, slot16.Scale, slot18, slot19, 0)
			end
		end
	end

	slot11 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot14 = fishgame.MoveByDirection
		slot11 = fishgame.MoveByDirection.create(slot13)
	else
		slot11 = slot1.new()
	end

	slot15 = slot6

	slot11.SetDirection(slot13, slot11)

	if not DNTGTEST_IS_ANDROID_PLATFORM then
		slot15 = slot7

		slot11.SetFixDirection(slot13, slot11)
	end

	slot15 = slot8.Speed

	slot11.SetSpeed(slot13, slot11)

	slot16 = slot5

	slot11.SetPosition(slot13, slot11, slot4)

	slot15 = true

	slot11.SetRebound(slot13, slot11)

	slot15 = slot11

	slot10.SetMoveCompent(slot13, slot10)

	slot15 = DNTGTEST_OBJ_STATE.EOS_LIVE

	slot10.SetState(slot13, slot10)

	slot15 = slot2

	slot10.SetId(slot13, slot10)

	slot16 = slot3.GetLockFishID(slot13)

	slot10.SetTarget(slot3, slot10)

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot15 = fishgame.FishObjectManager
		slot16 = slot10

		fishgame.FishObjectManager.GetInstance(slot14).AddBullet(slot14, fishgame.FishObjectManager.GetInstance(slot14))
	else
		slot15 = slot0
		slot16 = slot10

		slot0.GetFishObjMgr(slot14).AddBullet(slot14, slot0.GetFishObjMgr(slot14))
	end

	slot15 = Hero

	if slot1 == Hero.getWChairID(slot14) then
		slot16 = DNTGTEST_GAME_EFFECT.FIRE

		slot0.playDntgtestGameEffect(slot14, slot0)
	end

	return slot10
end

DntgtestController.createBullet = function (slot0, slot1, slot2, slot3)
	slot7 = slot1
	slot4 = slot0.GetCannonPosition(slot5, slot0)
	slot8 = slot1

	if slot0.model.getPlayerByChairID(slot0, slot0.model) == nil then
		slot11 = slot1
		slot8 = "没有找到玩家椅子号是 " .. tostring(slot10) .. " 的玩家。"

		print(slot7)

		return
	end

	slot10 = true

	slot0.model.setPlayerCannonAnimation(slot7, slot0.model, slot1)

	slot6 = slot3

	if slot0._needAdjustIx then
		slot12 = math.cos(slot8) * slot0.widthRatioSC
		slot6 = math.atan2(slot6, math.sin(slot6) * slot0.heightRatioSC) + M_PI_2
	end

	slot16 = slot3

	slot0.CreateChairBullet(slot8, slot0, slot1, slot2, slot5, slot4.x, slot4.y, slot6)
end

DntgtestController.KillFish = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot2 then
		return
	end

	slot6 = slot2.GetTypeID(slot7)
	slot9 = slot2
	slot7 = slot2:GetPosition()
	slot8 = slot0.new()
	slot12 = slot3

	slot8.SetScore(slot10, slot8)

	slot12 = slot1

	slot8.SetChairID(slot10, slot8)

	slot16 = slot5
	slot10, slot11 = slot2.ExecuteEffects(slot8, slot2, slot8, slot9, false)
	slot15 = DNTGTEST_OBJ_STATE.EOS_DEAD

	slot2.SetState(slot8, slot2)

	slot14 = Hero

	if slot1 == Hero.getWChairID(slot8) then
		slot15 = slot6

		slot0.model.updateKillFish(slot13, slot0.model)
	end

	slot12 = slot2.GetFishCofigData(slot13)
	slot15 = slot2

	if slot2:GetParticle() == "" then
		slot15 = slot2

		if slot2.GetFishType(slot14) ~= DNTGTEST_SPECIAL_FISH_TYPE.NORMAL then
			slot15 = slot2

			if slot2.GetParticle(slot14) ~= "" then
				slot16 = {
					xPos = slot7.x,
					yPos = slot7.y,
					name = slot2.GetParticle(slot18)
				}
				slot19 = slot2

				slot0.model.setAddEffectPartical(slot14, slot0.model)
			else
				slot16 = {
					name = "bomb",
					xPos = slot7.x,
					yPos = slot7.y
				}

				slot0.model.setAddEffectPartical(slot14, slot0.model)
			end
		end
	end

	slot13 = slot4 / slot3

	if slot12.ShowBingo and slot13 >= 80 then
		slot17 = {
			chair_id = slot1,
			score = slot4
		}

		slot0.model.setAddBingo(slot15, slot0.model)
	end

	if slot13 >= 50 then
		slot17 = {
			name = "salute1",
			xPos = slot7.x,
			yPos = slot7.y
		}

		slot0.model.setAddEffectPartical(slot15, slot0.model)
	end

	slot14 = false

	if slot6 == 27 then
		slot14 = true
	elseif slot6 == 30 then
		slot14 = true
	end

	slot17 = Hero

	if slot1 == Hero.getWChairID(slot16) then
		if slot4 > 0 then
			slot14 = true
		end

		if slot13 < 30 then
			slot18 = DNTGTEST_GAME_EFFECT.CATCH

			slot0.playDntgtestGameEffect(slot16, slot0)
		else
			slot18 = (slot13 < 80 and DNTGTEST_GAME_EFFECT.CATCH1) or DNTGTEST_GAME_EFFECT.CATCH2

			slot0.playDntgtestGameEffect(slot16, slot0)
		end
	end

	if slot14 then
		slot18 = slot6

		slot0.PlayDntgtestFishEffect(slot16, slot0)
	end

	if slot4 > 0 then
		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot19 = true

			slot0.model.setAddFishGold(slot16, slot0.model, {
				wChairID = slot1,
				fishX = slot7.x,
				fishY = slot7.y,
				score = slot4,
				baseScore = slot3
			})
		else
			slot17 = slot2
			slot20.fishX, slot20.fishY = slot2.GetRenderPosition(slot16)
			slot21 = true

			slot0.model.setAddFishGold(slot18, slot0.model, {
				wChairID = slot1,
				fishX = slot15,
				fishY = slot16,
				score = slot4,
				baseScore = slot3
			})
		end
	end

	slot15 = slot2.GetId(slot16)
	slot18 = slot11

	for slot19, slot20 in pairs(slot2) do
		slot23 = slot20

		if slot20.GetId(slot22) ~= slot15 then
			slot28 = DNTGTEST_OVER_BY_EFFECT

			slot0.KillFish(slot22, slot0, slot1, slot20, slot3, 0)
		end
	end
end

DntgtestController.CreateFish = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if Dntgtest_Visual[slot1.VisualID] == nil then
		return nil
	end

	if DNTGTEST_IS_ANDROID_PLATFORM and not fishcc then
		slot13 = slot10
		slot10 = TableUtil.copyDataDep(slot12)

		if slot1.VisualID >= 200 and slot1.VisualID <= 219 then
			slot13 = slot10.Live

			for slot14, slot15 in ipairs(slot12) do
				if slot15.Image == "shandian" then
					slot10.Live[slot14] = nil
				end
			end

			slot13 = slot10.Die

			for slot14, slot15 in ipairs(slot12) do
				if slot15.Image == "shandianxianjie" then
					slot10.Die[slot14] = nil
				end
			end
		end
	end

	if Dntgtest_BoundingBox.BoundingBox[slot1.BoundingBox].BB == nil then
		return nil
	end

	slot13 = nil

	if DNTGTEST_IS_ANDROID_PLATFORM and fishcc then
		slot16 = slot1.VisualID
		slot13 = slot0.new(slot15)
	else
		slot13 = slot0.new()
	end

	slot17 = slot1.TypeID

	slot13.SetTypeID(slot15, slot13)

	slot17 = slot9

	slot13.SetFishType(slot15, slot13)

	slot17 = slot1.VisualID

	slot13.SetVisualID(slot15, slot13)

	if DNTGTEST_IS_ANDROID_PLATFORM and fishcc then
		slot17 = slot1.VisualID

		slot13.setZOrder(slot15, slot13)
	end

	if DNTGTEST_IS_ANDROID_PLATFORM then
		if not fishcc then
			slot18 = slot10.TypeID

			slot13.SetVisualData(slot15, slot13, slot10.Id)

			slot16 = slot10.Live

			for slot17, slot18 in ipairs(slot15) do
				slot30 = slot18.AniType

				slot13.AddVisualLiveData("/", slot13, slot18.Image, "res/gameres/module/dntgtest/fishAnimations/" .. slot18.Image .. "/" .. slot18.Image, slot18.Name, slot18.Scale, slot18.OffestX, slot18.OffestY, slot18.Direction)
			end

			slot16 = slot10.Die

			for slot17, slot18 in ipairs(slot15) do
				slot30 = slot18.AniType

				slot13.AddVisualDieData("/", slot13, slot18.Image, "res/gameres/module/dntgtest/fishAnimations/" .. slot18.Image .. "/" .. slot18.Image, slot18.Name, slot18.Scale, slot18.OffestX, slot18.OffestY, slot18.Direction)
			end
		end
	else
		slot17 = slot10

		slot13.SetVisualData(slot15, slot13)

		slot17 = slot1.BoundingBox

		slot13.SetBoundingBoxID(slot15, slot13)
	end

	if not DNTGTEST_IS_ANDROID_PLATFORM or not fishcc then
		slot16 = slot11

		for slot17, slot18 in pairs(slot15) do
			slot24 = slot18.Radio

			slot13.AddBoundingBox(slot20, slot13, slot18.OffestX, slot18.OffestY)
		end
	end

	if slot7 >= 0 then
		slot14, slot15 = nil

		if slot8 == false then
			slot14 = Dntgtest_path.FishPath.Path[slot7 + 1]
			slot15 = Dntgtest_Duration.FishPath.Path[slot7 + 1].Duration
		else
			slot14 = Dntgtest_TroopSet.Path[slot7]
			slot15 = Dntgtest_TroopDuration.FishPath.Path[slot7].Duration
		end

		if slot14 == nil or slot15 == nil then
			return nil
		end

		slot14.nDuration = slot15
		slot16 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot19 = fishgame.MoveByPath
			slot31 = slot15

			fishgame.MoveByPath.create(slot18).SetPathMoveData(slot18, fishgame.MoveByPath.create(slot18), slot14.Type, slot14.Position[1].x, slot14.Position[2].x, slot14.Position[3].x, slot14.Position[4].x, slot14.Position[1].y, slot14.Position[2].y, slot14.Position[3].y, slot14.Position[4].y, slot14.nPointCount, 0)
		else
			slot20 = slot14

			slot1.new().SetPathMoveData(slot18, slot1.new())
		end

		slot19 = slot16
		slot23 = slot3

		slot16.SetOffest(slot18, cc.p(slot21, slot2))

		slot20 = slot5

		slot16.SetDelay(slot18, slot16)

		slot20 = slot6

		slot16.SetSpeed(slot18, slot16)

		slot20 = slot16

		slot13.SetMoveCompent(slot18, slot13)
	else
		slot14 = nil

		if DNTGTEST_IS_ANDROID_PLATFORM then
			slot17 = fishgame.MoveByDirection
			slot14 = fishgame.MoveByDirection.create(slot16)
		else
			slot14 = slot2.new()
		end

		slot18 = slot6

		slot14.SetSpeed(slot16, slot14)

		slot18 = slot5

		slot14.SetDelay(slot16, slot14)

		slot18 = slot4

		slot14.SetDirection(slot16, slot14)

		slot19 = slot3

		slot14.SetPosition(slot16, slot14, slot2)

		slot18 = slot7 == -1

		slot14.SetRebound(slot16, slot14)

		slot18 = slot14

		slot13.SetMoveCompent(slot16, slot13)
	end

	if slot1.Buffer ~= nil then
		slot16 = slot1.Buffer

		for slot17, slot18 in pairs(slot15) do
			slot24 = slot18.Life

			slot13.AddBuff(slot20, slot13, slot18.TypeID, slot18.Param)
		end
	end

	if #slot1.Effect > 0 then
		if slot9 == DNTGTEST_SPECIAL_FISH_TYPE.KINGANDQUAN or slot9 == DNTGTEST_SPECIAL_FISH_TYPE.KING then
			if slot13.SetSpecialShow ~= nil then
				slot17 = true

				slot13.SetSpecialShow(slot15, slot13)
			end

			slot17 = DNTGTEST_EFFECT_TYPE.KILL

			if slot0.effectFatory.CreateEffect(slot15, slot0.effectFatory) and Dntgtest_Special.FishKing[slot1.TypeID] then
				slot20 = 2

				slot14.SetParam(slot17, slot14, 0)

				slot20 = slot1.TypeID

				slot14.SetParam(slot17, slot14, 1)

				slot20 = slot15.MaxScore

				slot14.SetParam(slot17, slot14, 2)

				slot19 = slot14

				slot13.AddEffect(slot17, slot13)
			end

			slot18 = DNTGTEST_EFFECT_TYPE.ADDMONEY

			if slot0.effectFatory.CreateEffect(slot16, slot0.effectFatory) then
				slot20 = 1

				slot15.SetParam(slot17, slot15, 0)

				slot20 = 10

				slot15.SetParam(slot17, slot15, 1)

				slot19 = slot15

				slot13.AddEffect(slot17, slot13)
			end
		end

		slot16 = slot1.Effect

		for slot17, slot18 in pairs(slot15) do
			slot22 = slot18.TypeID

			if slot0.effectFatory.CreateEffect(slot20, slot0.effectFatory) then
				slot22 = slot19

				for slot24 = 0, slot19.GetParamSize(slot21), 1 do
					slot25 = 0

					if slot24 == 0 then
						slot25 = slot18.Param1
					elseif slot24 == 1 then
						slot25 = slot18.Param2
					elseif slot24 == 2 then
						slot25 = slot18.Param3
					elseif slot24 == 3 then
						slot25 = slot18.Param4
					elseif slot24 == 4 then
						slot25 = slot18.Param5
					elseif slot24 == 5 then
						slot25 = slot18.Param6
					elseif slot24 == 6 then
						slot25 = slot18.Param7
					elseif slot24 == 7 then
						slot25 = slot18.Param8
					end

					if slot25 == nil then
						slot25 = 0
					end

					if slot9 == DNTGTEST_SPECIAL_FISH_TYPE.SANYUAN and slot24 == 1 then
						slot30 = slot25 * 3

						slot19.SetParam(slot27, slot19, slot24)
					elseif slot9 == DNTGTEST_SPECIAL_FISH_TYPE.SIXI and slot24 == 1 then
						slot30 = slot25 * 4

						slot19.SetParam(slot27, slot19, slot24)
					else
						slot30 = slot25

						slot19.SetParam(slot27, slot19, slot24)
					end
				end

				slot24 = slot19

				slot13.AddEffect(slot22, slot13)
			end
		end

		if slot9 == DNTGTEST_SPECIAL_FISH_TYPE.KINGANDQUAN then
			slot17 = DNTGTEST_EFFECT_TYPE.PRODUCE

			if slot0.effectFatory.CreateEffect(slot15, slot0.effectFatory) then
				slot19 = slot1.TypeID

				slot14.SetParam(slot16, slot14, 0)

				slot19 = 3

				slot14.SetParam(slot16, slot14, 1)

				slot19 = 30

				slot14.SetParam(slot16, slot14, 2)

				slot19 = 1

				slot14.SetParam(slot16, slot14, 3)

				slot18 = slot14

				slot13.AddEffect(slot16, slot13)
			end
		end
	end

	return slot13
end

DntgtestController.getMyBulletId = function (slot0)
	slot3 = Hero
	slot1 = Hero.getWChairID(slot2)

	if slot0.nBulletID == nil or slot0.nBulletID >= 20000 then
		slot0.nBulletID = 0
	end

	slot0.nBulletID = slot0.nBulletID + 1

	return slot1 * 20000 + slot0.nBulletID
end

DntgtestController.playerFireTo = function (slot0, slot1)
	slot2 = slot0.getMyBulletId(slot3)
	slot5 = Hero
	slot3 = Hero.getWChairID(slot0)

	if DNTGTEST_IS_ANDROID_PLATFORM then
		slot7 = slot0
		slot7 = {
			wChairID = slot3,
			fDirection = slot1,
			dwFireTime = slot0.GetServerTick(slot6),
			dwClientID = slot2
		}

		reqDNTGTESTMsgFire(slot6)
	else
		slot6 = "协议解析：DNTGTEST_FISH_CMD_C_FIRE"

		DebugUtil.beginMark(slot5)

		slot4 = ""
		slot5 = ByteArray.new()
		slot11 = true

		slot5.writeUShort(slot8, slot5, slot3)
		slot5.writeFloat(slot8, slot5, slot1)

		slot12 = slot0
		slot11 = true

		slot5.writeUInt(slot8, slot5, slot0.GetServerTick(slot6))

		slot11 = true

		slot5.writeUInt(slot8, slot5, slot2)

		slot10 = 1

		slot5.setPosition(slot8, slot5)

		slot9 = slot5
		slot9 = "协议解析：DNTGTEST_FISH_CMD_C_FIRE"

		DebugUtil.endMark(slot8)

		slot10 = true

		reqDNTGTESTMsgFire(slot8, slot5.toString(slot8))
	end

	slot0.tBulletID[slot2] = 1
	slot9 = slot0.model
	slot7 = slot0.model.getBulletCount(slot8) + 1

	slot0.model.setBulletCount(1, slot0.model)

	slot9 = slot1

	slot0.createBullet(1, slot0, slot3, slot2)
end

DntgtestController.onActionBulletHitFish = function (slot0, slot1, slot2)
	slot4 = slot2.GetId(slot1)
	slot5 = Hero.getWChairID(slot2)
	slot8 = slot1
	slot6 = slot1.GetChairID(Hero)

	if slot1.GetId(slot4) == 190000 then
		slot10 = DNTGTEST_OBJ_STATE.EOS_DESTORY

		slot1.SetState(slot8, slot1)

		slot10 = slot5

		if slot0.model.getPlayerByChairID(slot8, slot0.model) ~= nil then
			slot11 = slot4

			slot7.SetLockFishID(slot9, slot7)

			slot12 = slot7

			slot0.model.setPlayerByChairID(slot9, slot0.model, slot5)
		end

		slot10 = {
			dwFishID = slot4
		}

		reqDNTGTESTMsgLockSomeFish(slot9)
	else
		slot10 = slot3

		slot0.removeSelfBullets(slot8, slot0)

		slot10 = {
			dwData = 0,
			dwBulletID = slot3,
			dwFishID = slot4
		}

		reqDNTGTESTMsgNetCast(slot0)
	end
end

DntgtestController.removeSelfBullets = function (slot0, slot1)
	if slot0.tBulletID[slot1] ~= nil then
		slot7 = slot0.model
		slot5 = slot0.model.getBulletCount(slot6) - 1

		slot0.model.setBulletCount(slot3, slot0.model)

		slot0.tBulletID[slot1] = nil
	end
end

DntgtestController.sendMsgChangeCannon = function (slot0, slot1)
	slot4 = slot1

	reqDNTGTESTMsgChangeCannon(slot3)
end

DntgtestController.setAutoAttack = function (slot0, slot1)
	slot5 = slot1

	slot0.model.setBAutoAttack(slot3, slot0.model)
end

DntgtestController.setLockFish = function (slot0, slot1)
	slot4 = slot0.model
	slot7 = Hero

	if slot0.model.getPlayerByChairID(slot3, Hero.getWChairID(slot6)) == nil then
		return
	end

	slot6 = slot1

	slot0.model.setBLockFish(slot4, slot0.model)

	slot6 = slot1

	slot2.SetLocking(slot4, slot2)

	slot5 = {
		wChairID = Hero.getWChairID(slot7),
		bLock = slot1
	}
	slot8 = Hero

	reqDNTGTESTMsgLockFish(slot4)
end

DntgtestController.setChangeSpeed = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMCurSpeedRate(slot2) == 1 then
		slot1 = 2
	elseif slot1 == 2 then
		slot1 = 4
	elseif slot1 == 4 then
		slot1 = 1
	end

	slot5 = slot1

	slot0.model.setMCurSpeedRate(slot3, slot0.model)
end

DntgtestController.hasSyncSelfScore = function (slot0)
	return slot0.bSyncScore
end

DntgtestController.setSyncSelfScore = function (slot0, slot1)
	slot0.bSyncScore = slot1
end

DntgtestController.destroy = function (slot0)
	slot0.model = nil
end

return
