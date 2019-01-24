slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("EffectPresentor", ClassLoader:aquireClass("Entity"))

function slot2(slot0)
	slot3 = nil

	return (100000000 < slot0 and tostring(math.floor(slot0 / slot1)) .. "#") or (10000 < slot0 and tostring(math.floor(slot0 / 10000)) .. "@") or tostring(math.floor(slot0))
end

slot1.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:setValue("category", "presentor")
	slot0:startListen("FISH3D_CMD_S_KILL_FISH")
	slot0:startListen("FISH3D_CMD_S_KILL_BULLET")
	slot0:startListen("FISH3D_CMD_S_KILL_SPECIAL_FISH")
	slot0:startListen("FISH3D_CMD_S_EFFECT_KILL")
	slot0:startListen("FISH3D_CMD_S_SEND_DES")
	slot0:startListen("FISH3D_CMD_S_EFFECT_WHEELSURF")
	slot0:startListen("FISH3D_CMD_S_ADD_BUFFER_DECREASE")
	slot0:startListen("FISH_CREATED")
	slot0:startListen("USER_ENTER")
	slot0:startListen("FROZEN_KILLED")
	slot0:startListen("LOCKING_TARGET_CHANGED")
	slot0:startListen("UPDATE_COIN_POSITION")
	slot0:startListen("CREATE_PACKET_UI")
	slot0:startListen("UPDATE_PACKET_NUMBER")
	slot0:startListen("PACKET_RECEIVED")
	slot0:startListen(EventFish3D.EventFish3D_Dispatch_Lighting_Chain)
	slot0:startListen(EventFish3D.EventFish3D_Dispatch_Shake_Screen)
	slot0:startListen(EventFish3D.EventFish3D_Dispatch_Show_Bingo)
	slot0:startListen(EventFish3D.EventFish3D_Dispatch_Show_Seat)

	slot0._lockFishChain = {}
	slot0._shakeScreen = nil
	slot0.SpeedScale = {
		[0] = 0.35,
		0.65,
		0.75,
		0.9,
		1.1,
		1.2,
		1.4
	}

	if device.platform ~= "android" then
		slot0.CoinNumber = {
			[0] = 4,
			6,
			12,
			25,
			45,
			85,
			100
		}
	else
		slot0.CoinNumber = {
			[0] = 3,
			3,
			6,
			12,
			24,
			32,
			50
		}
	end

	slot0.bossGoldScale = {
		[1.0] = 1.4,
		[2.0] = 2
	}
	slot0.freeBossGold = {
		{
			number = 0
		},
		{
			number = 0
		}
	}
	slot0.usedBossGold = {}
	slot0.positionZero = {
		x = 0,
		y = 0
	}
	slot0.freeAnimationNodes = {
		[0] = {
			maxNumber = 50,
			number = 0
		},
		{
			maxNumber = 5,
			number = 0
		},
		{
			maxNumber = 5,
			number = 0
		},
		{
			maxNumber = 5,
			number = 0
		},
		{
			maxNumber = 3,
			number = 0
		},
		{
			maxNumber = 1,
			number = 0
		},
		{
			maxNumber = 1,
			number = 0
		}
	}
	slot0.usedAnimationNodes = {}
	slot0.ObjectManager = ClassLoader:aquireSingleton("ObjectManager")
	slot0.PathMath = PathMath
	slot0.GameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.cocosLayerManager = ClassLoader:aquireSingleton("CocosLayerManager")
	slot0.effectLayer = slot0.cocosLayerManager:getLayer("EffectLayer")
	slot0.bulletLayer = slot0.cocosLayerManager:getLayer("BulletLayer")
	slot0.uiLayer = slot0.cocosLayerManager:getLayer("UILayer")
	slot0.tools = ClassLoader:aquireSingleton("Tools")
	slot0.Hero = Hero
	slot0._specialAnimationQueue = {
		[0] = ClassLoader:aquireInstance("SimpleQueue"),
		ClassLoader:aquireInstance("SimpleQueue"),
		ClassLoader:aquireInstance("SimpleQueue"),
		ClassLoader:aquireInstance("SimpleQueue")
	}
	slot0.effectLayerOffsetY = slot0.effectLayer:getParent():convertToWorldSpace(cc.fixp(0, 0)).y
	slot0._mirrorPosition = {}
end

slot1.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	slot0:startCoinPreload()
end

slot1.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0:startCoinRecycle()
end

slot1.startCoinPreload = function (slot0)
	slot1 = nil

	slot0.effectLayer:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.066), cc.CallFunc:create(function ()
		if slot0.freeBossGold[1].number < 4 then
			slot0.freeBossGold[1].number = slot0.freeBossGold[1].number + 1
			slot0.freeBossGold[1][slot0.freeBossGold[1].number] = slot0:createBossGoldAnimation(1)

			return
		end

		if slot0.freeBossGold[2].number == 0 then
			slot0.freeBossGold[2].number = slot0.freeBossGold[2].number + 1
			slot0.freeBossGold[2][slot0.freeBossGold[2].number] = slot0:createBossGoldAnimation(2)

			return
		end

		slot0 = {
			[0] = 50,
			5,
			5,
			5,
			3,
			1,
			1
		}

		for slot4 = 0, 6, 1 do
			if slot0.freeAnimationNodes[slot4].number < slot0[slot4] then
				slot0.freeAnimationNodes[slot4].number = slot0.freeAnimationNodes[slot4].number + 1
				slot0.freeAnimationNodes[slot4][slot0.freeAnimationNodes[slot4].number] = slot0:createFishGoldAnimation(slot4)

				return
			end
		end

		slot0.effectLayer:stopAction(slot0.effectLayer.stopAction)
	end))))
end

slot1.startCoinRecycle = function (slot0)
	slot1 = nil

	TimerBase.new(slot2, 16, -1, "EffectPresentor:recycleCall").setAutoDispose(slot1, false)
	TimerBase.new(slot2, 16, -1, "EffectPresentor:recycleCall"):start()
end

slot1.recycleFishCoinNode = function (slot0, slot1)
	if slot1.labelAction then
		slot1.labelAction:release()
	end

	if slot1.coinNumberAction then
		slot1.startAction:release()
	end

	if slot1.coinNumberAction then
		slot1.coinNumberAction:release()
	end

	for slot5 = 1, slot1.goldNumber, 1 do
		slot1.coins[slot5].collectAction:release()
		slot1.coins[slot5].spreadAction:release()
		slot0.ObjectManager:recycleObject(slot1.coins[slot5].animateGold)
		slot0.ObjectManager:recycleObject(slot1.coins[slot5].animateSilver)
		slot1.coins[slot5]:removeFromParent()
	end

	slot0.ObjectManager:recycleObject(slot1.spine)
	slot0.ObjectManager:recycleObject(slot1.coinNumber.coinSprite)
	slot0.ObjectManager:recycleObject(slot1.coinNumber.plusSprite)
	slot1:release()
end

slot1.recycleBossCoinNode = function (slot0, slot1)
	slot1.startAction:release()

	for slot5 = 1, slot1.coin_count, 1 do
		slot1.coins[slot5].spreadAction:release()
		slot0.ObjectManager:recycleObject(slot1.coins[slot5].animate:getInnerAction())
		slot1.coins[slot5].animate:release()

		slot1.coins[slot5].spreadAction = nil
		slot1.coins[slot5].animate = nil
	end

	slot1:release()
end

slot1.handle_UPDATE_COIN_POSITION = function (slot0)
	slot0.coinPos = {
		[0] = slot0._world:retrieveEntity("cannon", 0):getValue("coinPosition"),
		slot0._world:retrieveEntity("cannon", 1):getValue("coinPosition"),
		slot0._world:retrieveEntity("cannon", 2):getValue("coinPosition"),
		slot0._world:retrieveEntity("cannon", 3):getValue("coinPosition")
	}

	if not slot0.coinEffect then
		slot0.coinEffect = {}

		for slot4 = 0, 3, 1 do
			slot5 = slot0.ObjectManager:getObject("jinbishounaeffect")

			slot5:setPosition(slot0.coinPos[slot4])
			slot5:setAnimation(0, "animation", false)
			slot5:setVisible(false)
			slot5:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
				slot0:setVisible(true)
			end)))
			slot0.effectLayer:addChild(slot5, 3)

			slot0.coinEffect[slot4] = slot5
		end
	end

	if not slot0.coinParticle then
		slot0.coinParticle = {}

		for slot4 = 0, 3, 1 do
			slot5 = slot0.ObjectManager:getObject("paotaijinbilizi")

			slot5:setPosition(slot0.coinPos[slot4])
			slot5:resetSystem()
			slot5:setScale(0.1)
			slot5:setVisible(false)
			slot5:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
				slot0:setVisible(true)
			end)))
			slot0.effectLayer:addChild(slot5, 4)

			slot0.coinParticle[slot4] = slot5
		end
	end

	if slot0.willCreatePacket then
		slot0.packetCreated = true
		slot0.packets = {}

		for slot4 = 0, 3, 1 do
			slot6 = nil
			slot7 = false

			if slot0._world:retrieveEntity("cannon", slot4):getValue("controlledByPlayer") then
				slot6 = cc.p(slot5:getValue("coinPosition").x, slot5.getValue("coinPosition").y + 100)
				slot7 = true
			else
				slot6 = slot5:getValue("position")
				slot7 = false
			end

			slot8 = ResConfig.loadCsLayout("csb/common/RedPacket.csb", {
				controller = slot0._world._framework
			})

			slot8:setPosition(slot6)
			slot8:showStorage(slot7)
			slot8:setAnchorPoint(cc.p(0.5, 0.5))
			slot8:setStorage(slot0.packetNumber or 0)
			slot0.effectLayer:addChild(slot8)

			slot0.packets[slot4] = slot8
		end
	end
end

slot1.preloadGoldAnimatiom = function (slot0)
	slot1 = slot0.ObjectManager
	slot2 = {}

	function slot3()
		slot0 = slot0:getObject("yuboomceffect")

		table.insert(table.insert, slot0)

		slot1 = slot0:getObject("fishScoreNumber")

		table.insert(slot1, slot1)
		table.insert(slot1, slot2)
		table.insert(slot1, slot3)
		table.insert(slot1, slot4)
		table.insert(slot1, slot0:getObject("jinbishounaeffect"))
	end

	slot4 = {}

	for slot8 = 1, 20, 1 do
		table.insert(slot4, slot9)
		table.insert(slot4, cc.CallFunc:create(slot3))
	end

	table.insert(slot4, cc.CallFunc:create(slot5))
	cc.Director:getInstance():getRunningScene():runAction(cc.Sequence:create(unpack(slot4)))
end

slot1.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("id", "EffectPresentor")
	slot0:setValue("category", "presentor")
end

slot1.handle_USER_ENTER = function (slot0, slot1)
	return
end

slot1.handle_FISH_CREATED = function (slot0, slot1)
	if slot0.GameConfig.FishMap[slot1.nTypeID] then
		slot4 = slot2.FishVisuals[slot3.nVisualID]

		if not slot1.bTroop and slot4 and slot4.isBoss then
			slot6 = cc.LayerColor:create(Fish3D_Constant.Color_Black4b)

			slot6:setTouchEnabled(false)
			slot6:runAction(cc.Sequence:create(cc.FadeTo:create(0.1, 70), cc.DelayTime:create(1.1), cc.FadeTo:create(0.1, 0), cc.RemoveSelf:create()))
			slot6:setPosition(cc.p(-(cc.Director:getInstance():getVisibleSize().width - 1334) / 2, 0))
			slot0.effectLayer:addChild(slot6, 1)

			slot7 = slot0.ObjectManager:getObjectWithDuration("boss_tips", 1.5)

			slot7:setPosition(667, 375)
			slot7:setAnimation(0, "animation", false)
			slot7:setSkin(slot4.bossName)
			slot0.effectLayer:addChild(slot7, 1)
			fishtdSound:playEffectOnBossCome(slot4.bossName)
		end
	end
end

slot1.handle_LOCKING_TARGET_CHANGED = function (slot0, slot1)
	slot0:loadLockedFish(slot1)
end

slot1.handle_EventFish3D_Dispatch_Shake_Screen = function (slot0, slot1)
	slot0._shakeScreen = {
		time = math.max(0.5, math.min(slot1.mulFactor / 60, 1.5)),
		range = math.min(slot1.mulFactor / 50, 2)
	}
end

slot1.handle_EventFish3D_Dispatch_Show_Seat = function (slot0, slot1)
	slot4 = slot0.GameConfig
	slot5 = slot0._world:retrieveEntity("cannon")[slot1.chairId].getValue(slot3, "position")
	slot6 = slot0.effectLayer
	slot7 = -100

	if slot1.chairId % 2 == 1 then
		slot7 = 100
	end

	ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(GET_PATH(FilePath.ANIMATION, "zsjian/zsjian.ExportJson"))

	slot8 = ccs.Armature:create("zsjian")

	slot8:getAnimation():play("zsdonghua")
	slot8:setAnchorPoint(0.5, 0)
	slot8:setPosition(slot5.x + slot7, -10)
	slot8:runAction(transition.sequence({
		cc.DelayTime:create(3),
		cc.FadeOut:create(0.5),
		cc.RemoveSelf:create()
	}))
	slot6:addChild(slot8)
end

function slot3(slot0)
	slot1 = slot0
	slot2 = {}

	while slot0 > 0 do
		table.insert(slot2, slot0 % 10)

		slot0 = math.floor(slot0 / 10)
	end

	slot4 = #slot2

	for slot8 = 1, math.floor(#slot2 / 2), 1 do
		slot2[slot8] = slot2[slot4 - slot8 + 1]
		slot2[slot4 - slot8 + 1] = slot2[slot8]
	end

	return slot2
end

function slot4(slot0, slot1)
	slot2 = ""
	slot3 = ""

	if slot0 >= 100000000 then
		slot3 = "亿"
		slot0 = math.floor(slot0 / 100000000)
	end

	if slot0 >= 10000 then
		slot2 = "万"
		slot0 = math.floor(slot0 / 10000)
	end

	result = tostring(slot0) .. slot2 .. slot3

	if slot1 == Hero:getWChairID() then
		return cc.Label:createWithBMFont("res/gameres/module/fishtd/ui/txt/gaofenText.fnt", result)
	else
		return cc.Label:createWithBMFont("res/gameres/module/fishtd/ui/txt/gaofenText2.fnt", result)
	end
end

slot1.getPacketByUserId = function (slot0, slot1)
	for slot5 = 0, 3, 1 do
		if slot0._world:retrieveEntity("cannon", slot5):getValue("controllerId") == slot1 then
			return slot0.packets[slot5]
		end
	end
end

slot1.handle_CREATE_PACKET_UI = function (slot0)
	slot0.willCreatePacket = true
end

slot1.handle_UPDATE_PACKET_NUMBER = function (slot0, slot1)
	slot0.packetNumber = slot1.lCount

	if slot0.packetCreated and slot0:getPacketByUserId(slot1.dwUserID) then
		slot2:setStorage(slot1.lCount)
	end
end

slot1.handle_PACKET_RECEIVED = function (slot0, slot1)
	slot0.packetNumber = slot1.lCount

	if slot0.packetCreated then
		slot3 = slot0:getPacketByUserId(slot1.dwUserID)

		if slot0._world:retrieveEntity("fish", slot1.dwParam) and slot3 then
			slot3:playReceiveAnimation(slot0.effectLayer:convertToWorldSpace(slot2:getValue("bonePosition")), slot1.lCount)
		end

		if not slot2 and slot3 then
			slot3:setStorage(slot1.lCount)
		end
	end
end

slot1.showBingoAnimation = function (slot0, slot1, slot2)
	slot3 = cc.Node:create()
	slot4 = sp.SkeletonAnimation:create("gameres/module/fishtd/animation/score/gaofenzhuanpan.json", "gameres/module/fishtd/animation/score/gaofenzhuanpan.atlas")

	slot4:setAnimation(0, "animation", true)
	slot4:setOpacity(0)
	slot3:addChild(slot4)

	slot5 = slot4:getContentSize()
	slot6 = slot0(slot1, slot2)

	slot6:setAnchorPoint(0.5, 0.5)
	slot3:setScale(1.1)
	slot3:addChild(slot6, 2)
	slot6:setPosition(-5, 15)
	slot6:setSkewY(10)
	slot6:setRotation(3)
	slot4:runAction(cc.RepeatForever:create(slot7))

	slot11 = slot0._world:retrieveEntity("cannon")[slot2].getValue(slot9, "position")
	slot12 = 200

	if slot0.GameConfig.MirrorFlag then
		if slot2 == 0 or slot2 == 1 then
			slot12 = -200
		end
	elseif slot2 == 2 or slot2 == 3 then
		slot12 = -200
	end

	slot3:setPosition(slot13, slot14)
	slot0.effectLayer.addChild(slot15, slot3, 101)
	slot3:setScale(0.3)
	slot3:setOpacity(0)
	slot3:runAction(cc.Sequence:create(cc.Spawn:create(cc.Sequence:create(cc.EaseExponentialOut:create(cc.ScaleTo:create(0.2, 1.2)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.25, 0.98)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.15, 1.05)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.15, 1)))), cc.DelayTime:create(1.6), cc.Spawn:create(cc.ScaleTo:create(0.3, 1.15), cc.Sequence:create(cc.DelayTime:create(1.6))), cc.RemoveSelf:create()))
	slot6:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(cc.Sequence:create(cc.EaseExponentialOut:create(cc.ScaleTo:create(0.2, 1.2)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.25, 0.98)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.15, 1.05)), cc.EaseSineInOut:create(cc.ScaleTo:create(0.15, 1)))), cc.DelayTime:create(1.4), cc.ScaleTo:create(0.1, 0.95), cc.Spawn:create(cc.ScaleTo:create(0.3, 1.15), cc.Sequence:create(cc.DelayTime:create(0.1)))))
	slot6:runAction(cc.Sequence:create(cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 12)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -12))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 9)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -9))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 13)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -13))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 12)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -12))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 12)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -12))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 9)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -9))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 13)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -13))), cc.Sequence:create(cc.EaseSineInOut:create(cc.RotateBy:create(0.2, 12)), cc.EaseSineInOut:create(cc.RotateBy:create(0.2, -12)))))
	slot6:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.FadeTo:create(0.3, 255), cc.DelayTime:create(2.05), cc.FadeTo:create(0.1, 0)))
	slot4:runAction(cc.Sequence:create(cc.FadeTo:create(0.1, 255), cc.DelayTime:create(2.35), cc.FadeTo:create(0.15, 0), cc.CallFunc:create(function ()
		slot0._specialAnimationQueue[slot1].playing = false
	end)))
end

slot1.handle_EventFish3D_Dispatch_Show_Bingo = function (slot0, slot1)
	slot0._specialAnimationQueue[slot1.chairId]:pushBack({
		type = "bingo",
		playerId = slot1.chairId,
		score = slot1.score
	})
end

slot1.handle_FISH3D_CMD_S_KILL_FISH = function (slot0, slot1)
	if slot0._world:retrieveEntity("fish", slot1.dwFishID) then
		slot3 = slot1.wChairID == Hero:getWChairID()
		slot5 = slot1.lScore / slot1.nBScoe

		if slot0.GameConfig.FishVisuals[slot2:getValue("visualId")].shakeScreen and slot3 then
			slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Shake_Screen, {
				mulFactor = slot5
			})
		end

		if slot4.showBingo then
			slot0._world:triggerEvent(EventFish3D.EventFish3D_Dispatch_Show_Bingo, {
				chairId = slot1.wChairID,
				score = slot1.lScore
			})

			if slot3 then
				fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BINGO)
			end
		end

		slot0:performCashIn(slot2:getValue("bonePosition"), slot1, slot4)

		if slot3 then
			fishtdSound:playRandomFishEffect(slot4.id)
		end
	end
end

slot1.performCashIn = function (slot0, slot1, slot2, slot3)
	if slot3.castRefs[0] then
		slot6 = slot4.delay

		if slot0[(slot4.performer or "") .. "_cashin"] then
			slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(slot6), cc.CallFunc:create(function ()
				slot0(slot1, slot2, slot3.effectLevel, slot4.wChairID, slot4.lScore, slot4.nBScoe, slot3.bossName, slot5.txtOffset)
			end)))
		end
	end

	fishtdSound:playEffectOnBossKill(slot3.bossName)
end

slot1.handle_FISH3D_CMD_S_KILL_BULLET = function (slot0, slot1)
	slot2 = slot1.bullet
	slot3 = cc.Director:getInstance():getVisibleSize()

	if slot0.GameConfig.MirrorFlag then
		slot0._mirrorPosition.x = slot0.GameConfig.Width - slot2.position._value.x
		slot0._mirrorPosition.y = slot0.GameConfig.Height - slot2.position._value.y
	else
		slot0._mirrorPosition.x = slot2.position._value.x
		slot0._mirrorPosition.y = slot2.position._value.y
	end

	slot4 = slot0.ObjectManager:getObjectWithDuration("yuwangeffect", 0.15)

	slot4:setPosition(slot0._mirrorPosition)
	slot4:setSkin(slot2.netResName)
	slot4:setAnimation(0, "animation", false)
	slot4:setTimeScale(2)
	slot0.effectLayer:addChild(slot4, 0)
end

slot1.handle_FISH3D_CMD_S_SEND_DES = function (slot0, slot1)
	if not slot1.isBoss then
		slot3 = cc.LayerColor:create(cc.c4b(0, 0, 0, 0))

		slot3:setPosition(cc.p(-(cc.Director:getInstance():getVisibleSize().width - 1334) / 2, 0))
		slot3:setTouchEnabled(false)
		slot3:runAction(cc.Sequence:create(cc.FadeTo:create(0.1, 70), cc.DelayTime:create(1.1), cc.FadeTo:create(0.1, 0), cc.RemoveSelf:create()))
		slot0.effectLayer:addChild(slot3, 1)

		slot4 = slot0.ObjectManager:getObjectWithDuration("troop_tips", 1.5)

		slot4:setPosition(667, 375)
		slot4:setAnimation(0, "animation", false)
		slot0.effectLayer:addChild(slot4, 1)
	end
end

slot1.handle_FISH3D_CMD_S_EFFECT_WHEELSURF = function (slot0, slot1)
	slot2 = slot0.tools
	slot3 = slot0.GameConfig
	slot4 = slot0.effectLayer
	slot5 = slot0._world:retrieveEntity("fish", slot1.dwFishID)
	slot6 = slot0._world:retrieveEntity("cannon", slot1.wChairID)
	slot7 = slot6:getValue("position")
	slot8 = slot0.coinEffect[slot1.wChairID]
	slot9 = slot0.coinParticle[slot1.wChairID]
	slot10 = 0
	slot11 = 0

	if slot6:getValue("id") < 2 then
		slot7.y = slot7.y - 20
		slot11 = -100
	else
		slot7.y = slot7.y + 20
		slot10 = 180
		slot11 = 850
	end

	slot12 = slot6:getValue("coinPosition")

	if slot5 then
		slot13 = slot1.lScore
		slot15 = cc.Node:create()

		slot15:setPosition(slot5:getValue("bonePosition").x, slot5.getValue("bonePosition").y)
		slot15:setScale(0.85)
		slot15:setCascadeOpacityEnabled(true)
		slot15:setRotation(slot10)
		slot4:addChild(slot15)

		slot16 = cc.Sprite:create("res/gameres/module/fishtd/ui/ingame/3dby_xybxzpdb.png")

		slot16:setScale(4)
		slot15:addChild(slot16, 0)

		slot17 = slot0.ObjectManager:getObject("Roulette_Effect")

		slot17:setAnimation(0, "start", false)
		slot15:addChild(slot17, 2)

		slot18 = cc.ParticleSystemQuad:create("res/gameres/module/fishtd/particle/3dby_xybxzpguangci.plist")

		slot18:setPosition(cc.p(-5, -5))
		slot18:resetSystem()
		slot18:setScale(1.5)
		slot15:addChild(slot18, 102)

		slot19 = cc.ParticleSystemQuad:create("res/gameres/module/fishtd/particle/3dby_xybxzpstarboom.plist")

		slot19:setPosition(cc.p(-5, -5))
		slot19:resetSystem()
		slot19:setScale(1.5)
		slot15:addChild(slot19, 103)
		slot15:addChild(slot20, 3)
		slot15:addChild(slot21, 3)

		slot26, slot23 = slot0:generateCircleNodeOutside(slot1.nBaseScore / slot1.nBaseMultiple, slot1.nBScoe * slot1.nBMultiple)

		slot15:addChild(slot22, 1)

		slot28, slot25 = slot0:generateCircleNodeInside(slot1.nBaseMultiple)

		slot15:addChild(slot24, 1)
		slot15:addChild(slot26, 4)
		slot15:addChild(slot27, 4)
		slot15:runAction(cc.Sequence:create(cc.DelayTime:create(0.099), cc.CallFunc:create(function ()
			slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0), cc.EaseBackIn:create(cc.MoveTo:create(0.55, slot0)), cc.CallFunc:create(function ()
				slot0:setAnimation(0, "p2", false)
				slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
					slot0:setAnimation(1, "idle", false)
					slot0:runAction(cc.EaseSineInOut:create(cc.RotateBy:create(2.244, 720 + slot2)))
					slot3:runAction(cc.EaseSineInOut:create(cc.RotateBy:create(2.244, -1080 + slot4)))
					slot5:runAction(cc.Sequence:create(cc.DelayTime:create(4.5), cc.CallFunc:create(function ()
						slot0:setAnimation(0, "end", false)
						slot1.stop()
						slot2.stop()
						slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.396), cc.CallFunc:create(function ()
							slot0:showSpecialCashInAnimation("Roulette_Gold_Cashin", slot0, slot2.wChairID, Fish3DSound.GameEffect.BOSS_ACCOUNT, -15)
						end)))
						slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.396), cc.FadeTo:create(0.15, 0)))
						slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.198), cc.EaseSineIn:create(cc.MoveTo:create(0.29700000000000004, cc.p(slot7.x, cc.MoveTo))), cc.CallFunc:create(function ()
							slot0:setAnimation(0, "animation", false)
							slot0:resetSystem()
						end), cc.RemoveSelf:create()))
					end)))
					slot5:runAction(cc.Sequence:create(cc.DelayTime:create(2.277), cc.CallFunc:create(function ()
						slot0:resetSystem()
						slot0:resetSystem()
					end)))
				end)))
			end)))
		end)))
		slot15:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
			slot0 = slot0:getBoneData("3dby_xybxzptop")

			slot0:setScale(slot0.scaleX * 4)
			slot0:setScale(slot0.scaleX)
			slot3:setScale(slot0.scaleX)
			slot4:setScale(slot0.scaleX)
			slot5:setScale(slot0.scaleX)

			slot1 = slot0:getBoneData("changgui_jinbi")

			slot6:setPosition(cc.p(slot1.x, slot1.y))
			slot6:setScaleX(slot1.scaleX)
			slot6:setScaleY(slot1.scaleY)
			slot6:setRotation(0)

			slot2 = slot0:getBoneData("3dby_xybxzp10")

			slot7:setPosition(cc.p(slot2.x, slot2.y))
			slot7:setScaleX(slot2.scaleX)
			slot7:setScaleY(slot2.scaleY)
			slot7:setRotation(0)
		end))))
	end
end

slot1.generateOutsideItem = function (slot0, slot1, slot2, slot3)
	slot4 = cc.Node:create()

	slot4:setPosition(cc.p(slot1 * math.cos(slot2), slot1 * math.sin(slot2)))
	slot4:setRotation(90 - (slot2 * 180) / math.pi)
	slot4:setCascadeOpacityEnabled(true)
	slot4:addChild(slot5, 1)

	slot6 = TextField.new(CCSKitchen.defaultFontFamily, 31, nil, 300, nil, TextField.H_CENTER)

	slot6:setHtmlText(slot7)
	slot6:setPosition(cc.p(-150, -20))
	slot4:addChild(slot6, 2)

	return slot4
end

slot1.generateInsideItem = function (slot0, slot1, slot2, slot3)
	slot4 = cc.Node:create()

	slot4:setPosition(cc.p(slot1 * math.cos(slot2), slot1 * math.sin(slot2)))
	slot4:setRotation(90 - (slot2 * 180) / math.pi)
	slot4:setCascadeOpacityEnabled(true)

	slot5 = TextField.new(CCSKitchen.defaultFontFamily, 31, nil, 300, nil, TextField.H_CENTER)

	slot5:setHtmlText(slot6 .. slot7)
	slot5:setPosition(cc.p(-150, 0))
	slot4:addChild(slot5)

	return slot4
end

slot1.generateCircleNodeOutside = function (slot0, slot1, slot2)
	slot3 = 159
	slot4 = (36 * math.pi) / 180
	slot6 = math.random(0, 9)
	slot7 = 0

	cc.Node:create().setCascadeOpacityEnabled(slot5, true)

	for slot11 = 0, 9, 1 do
		slot12 = slot4 * slot11 + math.pi / 2
		slot13 = slot2

		if slot11 == slot6 then
			slot13 = slot13 * slot1
			slot7 = (slot12 * 180) / math.pi - 90
		else
			slot13 = slot13 * math.floor(math.random(80, 150) / math.random(1, 10))
		end

		slot5:addChild(slot0:generateOutsideItem(slot3, slot12, slot13), 2)
	end

	return slot5, slot7
end

slot1.generateCircleNodeInside = function (slot0, slot1)
	slot2 = 85
	slot3 = (36 * math.pi) / 180
	slot5 = 0

	cc.Node:create().setCascadeOpacityEnabled(slot4, true)

	for slot9 = 0, 9, 1 do
		slot4:addChild(slot0:generateInsideItem(slot2, slot10, slot9 + 1), 2)

		if slot1 == slot9 + 1 then
			slot5 = (slot10 * 180) / math.pi - 90
		end
	end

	return slot4, slot5
end

slot1.generateParticleNode = function (slot0, slot1, slot2)
	cc.Node:create().particles = {}

	cc.Node:create().addChild(slot3, slot4)

	for slot8 = 0, 3, 1 do
		slot9 = cc.Node:create()
		slot10 = cc.ParticleSystemQuad:create("res/gameres/module/fishtd/particle/particle_fire.plist")

		slot10:setTotalParticles(350)
		slot10:setEmissionRate(20)
		slot10:setPosition(cc.p(slot2, 0))
		slot10:setPositionType(0)
		slot9:addChild(slot10)
		slot9:setRotation(90 * slot8)

		slot4.particles[slot8] = slot10

		slot4:setScale(slot1)
		slot4:addChild(slot9)
		slot4:runAction(cc.RepeatForever:create(cc.RotateBy:create(1, -360)))
	end

	slot3.stop = function ()
		for slot3 = 0, 3, 1 do
			slot0.particles[slot3]:stopSystem()
		end
	end

	return slot3
end

slot1.displayFrozenEffect = function (slot0, slot1, slot2, slot3, slot4)
	slot11 = 1.518 + 2.3760000000000003 * ((slot3 - 1.518 - 2.4090000000000003) / 2.3760000000000003 + 1) + 2.4090000000000003
	slot12 = slot0.ObjectManager.getObject(slot6, "Spine_Effect_Frozen_FullScreen")

	slot12:setAnimation(0, "start", false)
	slot12:setScale(cc.Director:getInstance():getVisibleSize().width / 1336)

	for slot16 = 1, (slot3 - 1.518 - 2.4090000000000003) / 2.3760000000000003 + 1, 1 do
		slot12:addAnimation(0, "idle", false)
	end

	slot12:addAnimation(0, "end", false)
	slot12:setMix("idle", "end", 0.8)
	slot12:setPosition(667, 375)
	slot12:runAction(cc.Sequence:create(cc.DelayTime:create(slot11), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	slot1:addChild(slot12, 101)
	slot6:getObject("Spine_Effect_Frozen_Particle").setAnimation(slot14, 0, "start", false)

	for slot18 = 1, slot10, 1 do
		slot14:addAnimation(0, "idle", false)
	end

	slot14:addAnimation(0, "end", false)
	slot14:setMix("idle", "end", 0.8)
	slot14:setPosition(667, 375)
	slot14:runAction(cc.Sequence:create(cc.DelayTime:create(slot11), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))

	if slot2 then
		slot1:addChild(slot14, 101)
		slot14:setPosition(slot2)
	end

	slot16 = slot6:getObject("Spine_Effect_Frozen_Timer")

	slot16:setPosition(667, 120)
	slot16:setVisible(false)
	slot16:setScale(0.9)
	slot16:setOpacity(255)
	slot16:runAction(slot22)
	slot1:addChild(slot16, 102)

	slot24 = slot0.ObjectManager:getObject("specialEffectNumberLight")

	slot24:setAnchorPoint(0.5, 0.5)
	slot24:disableSeperator()
	slot24:enableUnit()
	slot24:setNumber(slot3)
	slot24:setPosition(5, -27)
	slot24:setScale(0.325)
	slot24:setOpacity(0)
	slot24:runAction(slot29)
	slot16:addChild(slot24, 104)
	slot16:runAction(cc.Sequence:create(cc.DelayTime:create(0.398), cc.Repeat:create(cc.Sequence:create(cc.CallFunc:create(slot31), cc.DelayTime:create(1)), math.floor(slot3 - 1))))
end

slot1.ShowFishGoldEx = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = nil

	if slot0.freeAnimationNodes[slot5].number > 0 then
		slot9 = slot10[slot11]
		slot10.number = slot11 - 1
	else
		slot9 = slot0:createFishGoldAnimation(slot5)
	end

	slot9:setPosition(cc.p(0, 0))
	slot0.effectLayer:addChild(slot9)

	if slot2 == Hero:getWChairID() then
		slot9.gold = true
	else
		slot9.gold = false
	end

	dump(slot0.coinPos)
	slot9:setPosition(slot1)

	slot9.endPos = slot9:convertToNodeSpace(slot0.effectLayer:convertToWorldSpace(slot0.coinPos[slot2]))
	slot9.effect = slot0.coinEffect[slot2]
	slot9.particle = slot0.coinParticle[slot2]

	slot9.label:setPosition(slot0.positionZero)
	DebugUtil.beginMark("atlas setString")

	if slot2 == Hero:getWChairID() then
		slot9.label:setBMFontFilePath("res/gameres/module/fishtd/ui/txt/gaofenText.fnt")
	else
		slot9.label:setBMFontFilePath("res/gameres/module/fishtd/ui/txt/gaofenText2.fnt")
	end

	slot9.label:setString(tostring(slot3))
	slot9.coinNumber.label:setString(tostring(slot3))
	DebugUtil.endMark("atlas setString")
	slot9.coinNumber:setPosition(slot9.endPos)

	slot9.speedScale = 600 / math.sqrt(slot9.endPos.x * slot9.endPos.x + slot9.endPos.y * slot9.endPos.y)

	slot9:runAction(slot9.startAction)

	slot0.usedAnimationNodes[slot9] = true

	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.GOLD_POPUP)
end

slot1.getkillSpine = function (slot0, slot1)
	if slot1 > 4 then
		slot1 = 4
	end

	if slot1 == ENUM.EffectLevel.EffectLevel_Primary then
		slot2 = slot0.ObjectManager:getObject("yuboomdeffect")

		slot2:setTimeScale(1)
		slot2:setScale(1.1)

		return slot2
	elseif slot1 == ENUM.EffectLevel.EffectLevel_Middle then
		slot2 = slot0.ObjectManager:getObject("yuboomceffect")

		slot2:setScale(1)

		return slot2
	elseif slot1 == ENUM.EffectLevel.EffectLevel_Senior then
		slot2 = slot0.ObjectManager:getObject("yuboombeffect")

		slot2:setScale(1.2)

		return slot2
	elseif slot1 == ENUM.EffectLevel.EffectLevel_Explode then
		slot2 = slot0.ObjectManager:getObject("yuboomeffect")

		slot2:setScale(1.5)

		return slot2
	else
		slot2 = slot0.ObjectManager:getObject("yuboomceffect")

		slot2:setScale(1)

		return slot2
	end
end

slot1.createFishGoldAnimation = function (slot0, slot1)
	slot3 = cc.Node:create()

	slot3:retain()

	slot3.goldNumber = slot0.CoinNumber[slot1]
	slot3.coins = {}
	slot3.counter = 0
	slot3.gold = true
	slot4 = 0

	for slot8 = 1, slot0.CoinNumber[slot1], 1 do
		slot9 = 550
		slot10 = 0
		slot11 = 0

		if slot1 == 0 then
			slot10 = 30 + 350 * math.random() * 0.22
			slot11 = 0.8 - 0.4 * math.random()
		elseif slot1 > 0 then
			slot10 = 150 + 350 * math.random() * slot0.SpeedScale[slot1]
			slot11 = 1 - 0.5 * math.random()
		end

		slot17 = cc.Sprite:createWithSpriteFrameName("fish_jinbi4_1.png")

		slot17:setScale(0.2)
		slot17:setOpacity(0)

		slot17.animateGold = slot0.ObjectManager:getObject("fish_jinbi_gold")
		slot17.animateSilver = slot0.ObjectManager:getObject("fish_jinbi_silver")

		slot3:addChild(slot17, 2)

		slot17.collectMove = cc.MoveTo:create(0.3, slot0.positionZero)
		slot17.collectAction = cc.Speed:create(cc.Sequence:create(cc.EaseSineIn:create(cc.Spawn:create(slot17.collectMove, cc.Sequence:create(cc.DelayTime:create(0.15), cc.ScaleTo:create(0.15, 0.4)))), cc.CallFunc:create(function ()
			slot0:setVisible(false)
			slot1.effect:setAnimation(0, "animation", false)
			slot1.particle:resetSystem()

			slot1.particle.counter = slot1.particle.counter + 1

			if slot1.counter == slot1.particle.counter + 1.goldNumber then
				slot1.coinNumber:setVisible(true)
				slot1.coinNumber:runAction(slot1.coinNumberAction)
			end
		end)), 1)

		slot17.collectAction:retain()

		slot17.spreadAction = cc.Sequence:create(cc.Spawn:create(cc.FadeTo:create(slot10 / slot9 / 9, 255), cc.ScaleTo:create(slot10 / slot9 / 4, 0.75), cc.EaseExponentialOut:create(cc.MoveBy:create(slot12, cc.fixp((slot10 * slot10 / slot9 - 0.5 * slot9 * slot10 / slot9 * slot10 / slot9) * math.cos(slot14), (slot10 * slot10 / slot9 - 0.5 * slot9 * slot10 / slot9 * slot10 / slot9) * math.sin(slot14)))), cc.Sequence:create(cc.EaseSineOut:create(cc.MoveBy:create(0.2 * slot11, cc.fixp(0, 180 * slot11))), cc.EaseSineIn:create(cc.MoveBy:create(0.2 * slot11, cc.fixp(0, -180 * slot11))), cc.EaseSineOut:create(cc.MoveBy:create(0.15 * slot11, cc.fixp(0, 60 * slot11))), cc.EaseSineIn:create(cc.MoveBy:create(0.15 * slot11, cc.fixp(0, -60 * slot11))), cc.EaseSineOut:create(cc.MoveBy:create(0.1 * slot11, cc.fixp(0, 10 * slot11))), cc.EaseSineIn:create(cc.MoveBy:create(0.1 * slot11, cc.fixp(0, -10 * slot11))), cc.EaseSineOut:create(cc.MoveBy:create(0.066 * slot11, cc.fixp(0, 5 * slot11))), cc.EaseSineIn:create(cc.MoveBy:create(0.066 * slot11, cc.fixp(0, -5 * slot11))), cc.EaseSineOut:create(cc.MoveBy:create(0.066 * slot11, cc.fixp(0, 5 * slot11))), cc.EaseSineIn:create(cc.MoveBy:create(0.066 * slot11, cc.fixp(0, -5 * slot11))), cc.CallFunc:create(function ()
			slot0:runAction(slot0.collectAction)
		end))))

		slot17.spreadAction:retain()

		slot3.coins[slot8] = slot17

		if slot4 < slot10 / slot9 then
			slot4 = slot12
		end
	end

	slot3:addChild(slot5, 1)

	slot3.spine = slot0:getkillSpine(slot1)
	slot6 = cc.Label:createWithBMFont("res/gameres/module/fishtd/ui/txt/gaofenText.fnt", "")

	slot6:setScale(0.7)
	slot6:setAnchorPoint(0.5, 0.5)
	slot6:setString(tonumber(999999))
	slot6:setOpacity(0)
	slot3:addChild(slot6, 2)

	slot3.label = slot6
	slot3.coinNumber = slot0:createCoinNumber()

	slot3:addChild(slot3.coinNumber)

	slot3.labelAction = cc.Sequence:create(cc.Spawn:create(cc.EaseSineOut:create(cc.MoveBy:create(0.25, cc.fixp(0, 35))), cc.FadeTo:create(0.1, 255)), cc.DelayTime:create(0.6), cc.Spawn:create(cc.FadeTo:create(0.3, 0), cc.EaseSineIn:create(cc.MoveBy:create(0.3, cc.fixp(0, 15)))), cc.MoveBy:create(0.016, cc.fixp(0, -30)), cc.CallFunc:create(function ()
		slot0.label:setVisible(false)
	end))

	slot3.labelAction:retain()

	slot3.coinNumberAction = cc.Sequence:create(cc.Spawn:create(cc.EaseSineOut:create(cc.MoveBy:create(0.25, cc.fixp(0, 30))), cc.FadeTo:create(0.1, 255)), cc.DelayTime:create(0.3), cc.Spawn:create(cc.FadeTo:create(0.3, 0), cc.EaseSineIn:create(cc.MoveBy:create(0.3, cc.fixp(0, 15)))), cc.CallFunc:create(function ()
		slot0.coinNumber:setVisible(false)
	end))

	slot3.coinNumberAction:retain()

	slot3.startAction = cc.Sequence:create(cc.CallFunc:create(function ()
		for slot3 = 1, , 1 do
			slot1.coins[slot3].setPosition(slot4, slot2.positionZero)
			slot1.coins[slot3].setScale(slot4, 0.2)
			slot1.coins[slot3].setOpacity(slot4, 0)
			slot1.coins[slot3].setVisible(slot4, true)
			slot1.coins[slot3].collectMove:initWithDuration(0.3, slot1.endPos)
			slot1.coins[slot3].collectAction:setSpeed(slot1.speedScale)
			slot1.coins[slot3]:runAction(slot1.coins[slot3].spreadAction)

			if slot1.gold then
				slot4:runAction(slot4.animateGold)
			else
				slot4:runAction(slot4.animateSilver)
			end
		end

		slot1.spine:setVisible(true)
		slot1.spine:setAnimation(0, "animation", false)
		slot1.label:setVisible(true)
		slot1.label:setOpacity(255)
		slot1.label:runAction(slot1.labelAction)
		slot1.coinNumber:setVisible(true)
		slot1.coinNumber:setOpacity(0)

		slot1.coinNumber.counter = 0
	end), cc.DelayTime:create(0.4), cc.CallFunc:create(function ()
		slot0.spine:setVisible(false)
	end), cc.DelayTime:create((slot4 + 1.5) - 0.4 + 0.5), cc.CallFunc:create(function ()
		slot0:removeFromParent()

		if slot1.freeAnimationNodes[slot2].maxNumber <= slot1.freeAnimationNodes[slot2].number then
			slot1:recycleFishCoinNode(slot0)
		else
			slot0[slot1 + 1] = slot0
			slot0.number = slot1 + 1
		end

		slot1.usedAnimationNodes[slot0] = nil
	end))

	slot3.startAction:retain()

	return slot3
end

slot1.createCoinNumber = function (slot0)
	slot1 = cc.Node:create()

	slot1:setOpacity(255)
	slot1:setCascadeOpacityEnabled(true)

	slot2 = slot0.ObjectManager:getObject("coinImage")

	slot2:setPosition(0, 0)
	slot2:setScale(0.9)
	slot2:setCascadeOpacityEnabled(true)
	slot2:setOpacity(255)
	slot1:addChild(slot2, 2)

	slot1.coinSprite = slot2
	slot3 = slot0.ObjectManager:getObject("plusImage")

	slot3:setPosition(28, 0)
	slot3:setScale(1)
	slot3:setScale(0.6)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setOpacity(255)
	slot1:addChild(slot3, 2)

	slot1.plusSprite = slot3
	slot4 = cc.LabelAtlas:create("100000", GET_PATH(FilePath.INGAME_UI, "scoreNumber/collect.png"), 33, 49, 48)

	slot4:setScale(0.55)
	slot4:setAnchorPoint(0, 0.5)
	slot4:setPosition(38, 0)
	slot4:setOpacity(255)

	slot1.labelScore = slot4

	slot1:addChild(slot4, 2)

	slot1.label = slot4

	slot1:setVisible(false)

	return slot1
end

slot1.onUpdate = function (slot0, slot1)
	slot0:updateLockChain(slot1)
	slot0:updateSpecialAnimationQueue()

	if slot0._shakeScreen then
		slot0:updateShakeScreen(slot1)
	end
end

slot1.updateShakeScreen = function (slot0, slot1)
	slot3 = math.max(1, 12 * slot0._shakeScreen.range * slot0._shakeScreen.time) / 2
	slot4 = cc.Director:getInstance():getRunningScene()
	slot0._shakeScreen.time = slot0._shakeScreen.time - slot1

	if slot0._shakeScreen.time <= 0 then
		slot4:setPosition(0, 0)

		slot0._shakeScreen = nil
	else
		slot4:setPosition(math.random() * slot2 - slot3, math.random() * slot2 - slot3)
	end
end

slot1.updateSpecialAnimationQueue = function (slot0)
	for slot4 = 0, 3, 1 do
		if not slot0._specialAnimationQueue[slot4]:isEmpty() and not slot5.playing then
			if slot5:popFront().type == "bingo" then
				slot0:showBingoAnimation(slot6.score, slot6.playerId)
			elseif slot6.type == "specialCashIn" then
				slot0:showSpecialCashInAnimation(slot6.name, slot6.score, slot6.playerId, slot6.soundEffectType, slot6.txtOffset)
			end

			slot5.playing = true
		end
	end
end

slot1.handle_FISH3D_CMD_S_ADD_BUFFER_DECREASE = function (slot0, slot1)
	if slot1.nBufferType == ENUM.BufferType.BufferType_ChangeSpeed then
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			slot8:setOriginSpeed(slot8:getValue("speed"))
			slot8:setValue("speed", slot1.fBufferParam)
			table.insert(slot3, slot7)
		end

		slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(slot1.fBufferTime), cc.CallFunc:create(function (slot0)
			for slot4, slot5 in ipairs(slot0) do
				if slot1._world:retrieveEntity("fish", slot5) then
					slot6:setValue("speed", slot6:getOriginSpeed())
				end
			end

			slot0 = nil
		end)))

		if slot0._world:retrieveEntity("fish", slot1.caster) then
			slot5:setValue("deadCause", "CAST_EFFECT")
			slot5:trigger("isDead", true)
			slot0:displayFrozenEffect(slot0.effectLayer, slot5:getValue("bonePosition"), slot1.fBufferTime, slot5)
			fishtdSound:playFishTdFishEffect(Fish3DSound.GameEffect.FROZEN_EFFECT)
		end
	end
end

slot1.handle_FISH3D_CMD_S_EFFECT_KILL = function (slot0, slot1)
	if slot0._world:retrieveEntity("fish", slot1.dwFishID) and slot0[slot0.GameConfig.FishVisuals[slot2:getValue("visualId")].castRefs[1].performer .. "_kill_performer"] ~= nil then
		slot6(slot0, slot1)
	end
end

slot1.blackhole_kill_performer = function (slot0, slot1)
	slot2 = slot0.tools
	slot4 = slot0.effectLayer
	slot5 = slot0._world:retrieveEntity("fish", slot1.dwFishID)
	slot7 = PathMath.projectSameNDC(slot6, -2000)
	slot8 = slot5:getValue("bonePosition")
	slot9 = 1
	slot10 = slot1.nBScoe * 10
	slot11 = -9999999
	slot12 = 1

	while slot12 <= 100 and slot1.fishes[slot12] > 0 do
		if slot0._world:retrieveEntity("fish", slot1.fishes[slot12]) then
			slot13.distanceToGravityCenter = (slot2:distance3D(slot3:mirrorPosition(slot13:getValue("position"), slot13._mirrorPosition), slot7) > 200 and slot15) or 200
			slot13.startPosition = slot14

			if slot11 < slot15 then
				slot11 = slot15
			end
		end

		slot10 = slot10 + slot1.scores[slot12]
		slot12 = slot12 + 1
	end

	for slot16 = 1, 100, 1 do
		if slot1.fishes[slot16] > 0 then
			if slot0._world:retrieveEntity("fish", slot1.fishes[slot16]) then
				slot21 = (math.pi - math.random() * 2.5) * 0.7

				slot17:getComponentByName("visual")._visualNode:runAction(cc.Sequence:create(cc.DelayTime:create(slot22), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0:setValue("deadCause", "EFFECT_HOLD")
					slot0.setValue:trigger("isDead", true)
					slot5:runAction(cc.EaseSineIn:create(custom.ActionVortex:create(custom.ActionVortex, , -1, slot0, , 200 * math.random())))
				end), cc.Sequence:create(cc.DelayTime:create(((3.5 - math.random() * 1) * slot17.distanceToGravityCenter) / slot11 * 0.2), cc.EaseExponentialIn:create(cc.FadeTo:create(((3.5 - math.random() * 1) * slot17.distanceToGravityCenter) / slot11 * 0.8, 10))), cc.CallFunc:create(function (slot0)
					slot0:setValue("deadCause", "EFFECT_KILL_FINISH")
					slot0:trigger("isDead", true)
				end)))
			end
		else
			break
		end
	end

	slot5:setValue("deadCause", "EFFECT_KILL_FINISH")
	slot5:trigger("isDead", true)

	slot14 = slot0.ObjectManager.getObject(slot13, "Blackhole_Cast")

	slot14:setPosition(slot8.x, slot8.y)
	slot14:setAnimation(0, "start", false)
	slot14:addAnimation(0, "idle2", false)
	slot14:addAnimation(0, "idle2", false)
	slot14:addAnimation(0, "end", false)
	slot14:setScale(1.15)
	slot14:setGlobalZOrder(-50)
	slot4:addChild(slot14, 101)
	slot4:runAction(cc.Sequence:create(cc.DelayTime:create(4), cc.CallFunc:create(function ()
		fishtdSound:playFishTdFishEffect(Fish3DSound.GameEffect.EFFECT_PARTICAL_BIG_FIREWORKS)
	end)))
	slot14:runAction(cc.Sequence:create(cc.DelayTime:create(8), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	slot4:runAction(cc.Sequence:create(cc.DelayTime:create(5), cc.CallFunc:create(slot15)))
	cc.Director:getInstance():getRunningScene():runAction(cc.Sequence:create(cc.Sequence:create(slot16), cc.Repeat:create(cc.Sequence:create({
		cc.MoveBy:create(0.066, cc.fixp(-2, 2)),
		cc.MoveBy:create(0.066, cc.fixp(0, -4)),
		cc.MoveBy:create(0.066, cc.fixp(4, 2)),
		cc.MoveBy:create(0.066, cc.fixp(-2, -2)),
		cc.MoveBy:create(0.066, cc.fixp(0, 2))
	}), 13), cc.Sequence:create({
		cc.MoveBy:create(0.066, cc.fixp(-2, 2)),
		cc.MoveBy:create(0.066, cc.fixp(0, -4)),
		cc.MoveBy:create(0.066, cc.fixp(5, 5)),
		cc.MoveBy:create(0.066, cc.fixp(-8, -6)),
		cc.MoveBy:create(0.066, cc.fixp(10, 5)),
		cc.MoveBy:create(0.066, cc.fixp(-9, -7)),
		cc.MoveBy:create(0.066, cc.fixp(10, 11)),
		cc.MoveBy:create(0.066, cc.fixp(-16, 5)),
		cc.MoveBy:create(0.066, cc.fixp(2, -11)),
		cc.MoveBy:create(0.066, cc.fixp(8, 0))
	})))
	fishtdSound:playFishTdFishEffect(Fish3DSound.GameEffect.BLACK_VORTEX)
end

slot1.dynamite_kill_performer = function (slot0, slot1)
	slot2 = cc.Director:getInstance():getWinSize()
	slot3 = slot0.tools
	slot4 = slot0.GameConfig
	slot5 = slot0.effectLayer
	slot7 = slot0._world:retrieveEntity("fish", slot1.dwFishID).getValue(slot6, "bonePosition")
	slot8 = 1
	slot9 = 1.1880000000000002

	while slot8 <= 100 and slot1.fishes[slot8] > 0 do
		slot11 = slot8

		if slot0._world:retrieveEntity("fish", slot1.fishes[slot8]) then
			slot5:runAction(cc.Sequence:create(cc.DelayTime:create(slot9 + 0.5 * math.random()), cc.CallFunc:create(function ()
				if not slot0.alive then
					return
				end

				if slot1.FishVisuals[slot0:getValue("visualId")].effectLevel < 3 then
					slot0 = 0
				end

				slot0:ShowFishGoldEx(slot1, slot3.wChairID, slot3.scores[slot4], slot3.nBScoe, slot0)
				slot0:setValue("deadCause", "EFFECT_KILL_FINISH")
				slot0:trigger("isDead", true)

				slot0 = nil
			end)))
		end

		slot8 = slot8 + 1
	end

	slot6:getComponentByName("visual")._visualNode.runAction(slot10, cc.Sequence:create(cc.Sequence:create(slot11), cc.Repeat:create(cc.Sequence:create(slot12), 6), cc.Sequence:create(slot13)))
	cc.Director:getInstance():getRunningScene():runAction(cc.Sequence:create(cc.Sequence:create(slot14), cc.Repeat:create(cc.Sequence:create(slot15), 6)))

	slot18 = slot0.ObjectManager.getObject(slot17, "Dynamite_Cast")

	slot18:setPosition3D(slot16)
	slot18:setAnimation(0, "end", false)
	slot18:setScale(1.2)
	slot5:addChild(slot18, 1000)
	slot18:runAction(cc.Sequence:create(cc.DelayTime:create(1.98), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))

	slot20 = slot0.ObjectManager.getObject(slot17, "Dynamite_FullScreen")

	slot20:setPosition(667, 375)
	slot20:setAnimation(0, "animation", false)
	slot20:setScale(cc.Director:getInstance():getVisibleSize().width / 1336)
	slot5:addChild(slot20, 10001)
	slot20:runAction(cc.Sequence:create(cc.DelayTime:create(1.98), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	slot5:runAction(cc.Sequence:create(cc.DelayTime:create(1.1880000000000002), slot21))
	cc.Director:getInstance():getRunningScene():runAction(cc.Sequence:create(cc.DelayTime:create(1.1880000000000002), cc.Sequence:create(slot22), cc.Repeat:create(cc.Sequence:create({
		cc.MoveBy:create(0.033, cc.p(10, 9)),
		cc.MoveBy:create(0.033, cc.p(-9, 0)),
		cc.MoveBy:create(0.033, cc.p(9, -10)),
		cc.MoveBy:create(0.033, cc.p(0, 9)),
		cc.MoveBy:create(0.033, cc.p(-10, -8))
	}), 2), cc.Sequence:create({
		cc.MoveBy:create(0.033, cc.p(-9, 10)),
		cc.MoveBy:create(0.033, cc.p(8, -8)),
		cc.MoveBy:create(0.033, cc.p(5, -5)),
		cc.MoveBy:create(0.033, cc.p(-3, 2)),
		cc.MoveBy:create(0.033, cc.p(-1, 1))
	})))
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EFFECT_PARTICAL_BIG_FIREWORKS)
end

slot1.lightning_blue_kill_performer = function (slot0, slot1)
	slot2 = cc.Director:getInstance():getWinSize()
	slot3 = slot0.tools
	slot4 = slot0.GameConfig
	slot5 = slot0.effectLayer
	slot6 = slot0.ObjectManager
	slot7 = slot0._world:retrieveEntity("fish", slot1.dwFishID)
	slot8 = slot7:getValue("bonePosition")
	slot9 = 1
	slot10 = 0

	if slot7 then
		slot11 = 0

		for slot15 = 1, 100, 1 do
			if slot1.fishes[slot15] > 0 then
				slot11 = slot15
			else
				break
			end
		end

		if slot7.maxKill._value < slot11 then
			slot7.maxKill:set(slot11)

			if slot7.killAction then
				slot0.effectLayer:stopAction(slot7.killAction)
			end

			slot7.killAction = cc.Sequence:create(cc.DelayTime:create((40 + slot11) * 0.033), cc.CallFunc:create(function ()
				slot0.killAction = nil

				slot0.deadCause:set("EFFECT_KILL_FINISH")
				slot0.deadCause.set:trigger("isDead", true)
			end))

			slot0.effectLayer:runAction(slot7.killAction)
			fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EXPLODE)
		end
	end

	slot0.effectLayer:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(function ()
		if slot1.fishes[slot0] > 0 then
			if slot2._world:retrieveEntity("fish", slot1.fishes[slot0]) then
				slot1:setValue("deadCause", "EFFECT_HOLD")
				slot1:trigger("isDead", true)

				slot2 = slot1:mirrorPosition(slot1:getValue("position"), slot1._mirrorPosition)
				fishPosition = slot1:getValue("bonePosition")
				slot5 = fishPosition.y - slot5.y:getObject("Lightning_Blue_Line")

				slot5:setPosition((fishPosition.x + slot5.x) / 2, (fishPosition.y + slot5.y) / 2)
				slot5:setAnimation(0, "start", false)
				slot5:addAnimation(0, "idle", false)
				slot5:addAnimation(0, "end", false)
				slot5:setScaleX((slot1:distance(fishPosition, ) + 30) / 720)
				slot5:setRotation((math.atan2(fishPosition.x - slot5.x, fishPosition.y - slot5.y) * 180) / math.pi - 90)
				slot5:addChild(slot5, 103)
				slot5:runAction(cc.Sequence:create(cc.DelayTime:create(1.485), cc.CallFunc:create(function ()
					slot0:recycleObject(slot0)
				end)))

				slot6 = slot5.runAction:getObject("Lightning_Blue_Hit")

				slot6:setPosition(fishPosition)
				slot6:setAnimation(0, "start", false)
				slot6:addAnimation(0, "idle", false)
				slot6:addAnimation(0, "end", false)
				slot6:setAnchorPoint(0, 0)
				slot6:setScale(0.5)
				slot6.setScale:addChild(slot6, 104)
				slot6:runAction(cc.Sequence:create(cc.DelayTime:create(1.485), cc.CallFunc:create(function ()
					slot0:recycleObject(slot0)
				end)))
				slot7:runAction(cc.Sequence:create(cc.DelayTime:create(1.32), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0:ShowFishGoldEx(slot1, slot3.wChairID, slot3.scores[slot4], slot3.nBScoe, 0)
					slot0:setValue("deadCause", "EFFECT_KILL_FINISH")
					slot0:trigger("isDead", true)
				end)))
				fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BOMB_ELECTRIC)
			end

			slot0 = slot0 + 1

			return
		end

		slot2.effectLayer:stopAction(slot8)
	end), cc.DelayTime:create(0.033))))
end

slot1.lightning_gold_kill_performer = function (slot0, slot1)
	slot2 = slot0.tools
	slot6 = slot0._world:retrieveEntity("fish", slot1.dwFishID)
	slot7 = slot0.GameConfig.mirrorPosition(slot3, slot6:getValue("position"), slot6._mirrorPosition)
	slot9 = 1
	slot10 = 1
	slot11 = 0

	slot0.effectLayer:runAction(slot11)

	slot12 = slot0.ObjectManager.getObject(slot5, "Lightning_Gold_Explode")

	slot12:setPosition(slot8)
	slot12:setAnimation(0, "end", false)
	slot12:setScale(0.4)
	slot0.effectLayer.addChild(slot4, slot12, 105)
	slot12:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EXPLODE)
end

slot1.lightning_aqua_kill_performer = function (slot0, slot1)
	slot2 = slot0.tools
	slot3 = slot0.GameConfig
	slot4 = slot0.effectLayer
	slot5 = slot0.ObjectManager
	slot7 = slot0._world:retrieveEntity("fish", slot1.dwFishID).getValue(slot6, "bonePosition")
	slot8 = 1

	for slot12 = 1, 100, 1 do
		if slot1.fishes[slot12] > 0 then
			if slot0._world:retrieveEntity("fish", slot1.fishes[slot12]) then
				slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0 = slot0:getValue("bonePosition")
					slot2 = math.atan2(slot0.x - slot2.x, slot0.y - slot2.y)
					slot3 = slot0.x - slot2.x:getObject("Lightning_Aqua_Line")

					slot3:setPosition((slot0.x + slot2.x) / 2, (slot0.y + slot2.y) / 2)
					slot3:setAnimation(0, "animation", false)
					slot3:setScaleX(slot0:distance(slot0, slot0) / 520)
					slot3:setRotation((slot2 * 180) / math.pi - 90)
					slot3.setRotation:addChild(slot3, 103)
					slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
						slot0:recycleObject(slot0)
					end)))
					slot0:setValue("deadCause", "EFFECT_HOLD")
					slot0:trigger("isDead", true)
				end), cc.DelayTime:create(0.13), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot1 = slot0:getObject("Lightning_Aqua_Hit")

					slot1:setPosition(slot0)
					slot1:setAnimation(0, "animation", false)
					slot1:setAnchorPoint(0, 0)
					slot1:setScale(0.6)
					slot1.setScale:addChild(slot1, 104)
					slot1:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
						slot0:recycleObject(slot0)
					end)))
				end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0:ShowFishGoldEx(slot1, slot3.wChairID, slot3.scores[slot4], slot3.nBScoe, slot1.FishVisuals[slot0:getValue("visualId")].effectLevel)
					slot0:setValue("deadCause", "EFFECT_KILL_FINISH")
					slot0:trigger("isDead", true)
				end)))
			end
		else
			break
		end
	end

	slot6:setValue("deadCause", "EFFECT_KILL_FINISH")
	slot6:trigger("isDead", true)

	slot9 = slot5:getObject("Lightning_Aqua_Explode")

	slot9:setPosition(slot7)
	slot9:setAnimation(0, "end", false)
	slot9:setScale(0.6)
	slot4:addChild(slot9, 105)
	slot9:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EXPLODE)
end

slot1.lightning_purple_kill_performer = function (slot0, slot1)
	slot2 = slot0.tools
	slot3 = slot0.GameConfig
	slot4 = slot0.effectLayer
	slot5 = slot0.ObjectManager
	slot7 = slot0._world:retrieveEntity("fish", slot1.dwFishID).getValue(slot6, "bonePosition")
	slot8 = 1

	for slot12 = 1, 100, 1 do
		if slot1.fishes[slot12] > 0 then
			if slot0._world:retrieveEntity("fish", slot1.fishes[slot12]) then
				slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0 = slot0:getValue("bonePosition")
					slot2 = math.atan2(slot0.x - slot2.x, slot0.y - slot2.y)
					slot3 = slot0.x - slot2.x:getObject("Lightning_Purple_Line")

					slot3:setPosition((slot0.x + slot2.x) / 2, (slot0.y + slot2.y) / 2)
					slot3:setAnimation(0, "animation", false)
					slot3:setScaleX(slot0:distance(slot0, slot0) / 500)
					slot3:setRotation((slot2 * 180) / math.pi + 90)
					slot3.setRotation:addChild(slot3, 103)
					slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
						slot0:recycleObject(slot0)
					end)))
					slot0:setValue("deadCause", "EFFECT_HOLD")
					slot0:trigger("isDead", true)
				end), cc.DelayTime:create(0.16), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot1 = slot0:getObject("Lightning_Purple_Hit")

					slot1:setPosition(slot0)
					slot1:setAnimation(0, "animation", false)
					slot1:setAnchorPoint(0, 0)
					slot1:setScale(0.8)
					slot1.setScale:addChild(slot1, 104)
					slot1:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
						slot0:recycleObject(slot0)
					end)))
				end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
					if not slot0.alive then
						return
					end

					slot0:ShowFishGoldEx(slot1, slot3.wChairID, slot3.scores[slot4], slot3.nBScoe, slot1.FishVisuals[slot0:getValue("visualId")].effectLevel)
					slot0:setValue("deadCause", "EFFECT_KILL_FINISH")
					slot0:trigger("isDead", true)
				end)))
			end
		else
			break
		end
	end

	slot6:setValue("deadCause", "EFFECT_KILL_FINISH")
	slot6:trigger("isDead", true)

	slot9 = slot5:getObject("Lightning_Purple_Explode")

	slot9:setPosition(slot7)
	slot9:setAnimation(0, "end", false)
	slot9:setScale(0.45)
	slot4:addChild(slot9, 105)
	slot9:runAction(cc.Sequence:create(cc.DelayTime:create(0.99), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EXPLODE)
end

slot1.queueSpecialCashInAnimation = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._specialAnimationQueue[slot3]:pushBack({
		type = "specialCashIn",
		name = slot1,
		score = slot2,
		playerId = slot3,
		soundEffectType = slot4,
		txtOffset = slot5
	})
end

slot1.showSpecialCashInAnimation = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0._world:retrieveEntity("cannon", slot3)
	slot7 = slot0.GameConfig
	slot8 = slot6:getValue("position")
	slot9 = slot6:getValue("coinPosition")
	slot10 = slot5 or 0
	slot11 = 150

	if slot7.MirrorFlag then
		if slot3 == 0 or slot3 == 1 then
			slot11 = -150
		end
	elseif slot3 == 2 or slot3 == 3 then
		slot11 = -150
	end

	slot12 = slot0.ObjectManager:getObject(slot1)

	slot12:setOpacity(255)
	slot12:setScale(0.9)
	slot12:setAnimation(0, "start", false)
	slot12:addAnimation(0, "idle", true)
	slot12:setCascadeOpacityEnabled(true)
	slot12:setPosition(slot8.x, slot8.y + slot11)
	slot0.effectLayer.addChild(slot13, slot12, 101)

	slot15 = slot0.ObjectManager:getObject("specialEffectNumberLight")

	slot15:setAnchorPoint(0.5, 0.5)
	slot15:setLimitTrigger(0)
	slot15:disableSeperator()
	slot15:enableUnit()
	slot15:setNumber(slot2)
	slot15:setPosition(5, -27 + slot10)
	slot15:setScale(0.325)
	slot15:setOpacity(0)
	slot15:runAction(slot17)
	slot12:addChild(slot15, 104)

	slot21 = slot0.ObjectManager:getObject("specialEffectNumberEffect")

	slot21:setAnchorPoint(0.5, 0.5)
	slot21:setLimitTrigger(0)
	slot21:disableSeperator()
	slot21:enableUnit()
	slot21:setNumber(slot2)
	slot21:setPosition(5, -27 + slot10)
	slot21:setScale(0.45499999999999996)
	slot21:setOpacity(0)
	slot21:runAction(slot23)
	slot12:addChild(slot21, 105)
	slot12:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.Sequence:create(cc.EaseSineOut:create(cc.ScaleTo:create(0.165, 0.85)), cc.EaseSineOut:create(cc.ScaleTo:create(0.165, 1.08)), cc.EaseSineOut:create(cc.ScaleTo:create(0.165, 1.01)), cc.EaseSineOut:create(cc.ScaleTo:create(0.165, 1.07)), cc.EaseSineInOut:create(cc.Spawn:create(cc.MoveTo:create(0.495, slot9), cc.ScaleTo:create(0.495, 0.3), cc.FadeTo:create(0.495, 0))), cc.CallFunc:create(function ()
		slot0._specialAnimationQueue[slot1].playing = false
	end)), cc.CallFunc:create(function ()
		slot0.ObjectManager:recycleObject(slot0.ObjectManager)
		slot0.ObjectManager.recycleObject.ObjectManager:recycleObject(slot0.ObjectManager)
		slot0.ObjectManager.recycleObject.ObjectManager.recycleObject.ObjectManager:recycleObject(slot3)
	end)))

	if slot4 >= 0 then
		fishtdSound:playFishTdGameEffect(slot4)
	end
end

slot1.normal_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:ShowFishGoldEx(slot1, slot3, slot4, slot5, slot2)
end

slot1.double_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Lightning_Aqua_Cashin", slot0, , Fish3DSound.GameEffect.BOSS_ACCOUNT)
	end)))
end

slot1.tripple_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Lightning_Purple_Cashin", slot0, , Fish3DSound.GameEffect.BOSS_ACCOUNT)
	end)))
end

slot1.lightning_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Lightning_Blue_Cashin", slot0, , Fish3DSound.GameEffect.BOSS_ACCOUNT)
	end)))
end

slot1.blackhole_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(6.5), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Blackhole_Cashin", slot0, , Fish3DSound.GameEffect.BOSS_ACCOUNT)
	end)))
end

slot1.dynamite_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2.5), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Dynamite_Cashin", slot0, , Fish3DSound.GameEffect.BOSS_ACCOUNT)
	end)))
end

slot1.yuwang_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Lightning_Gold_Cashin", slot0, , -1)
	end)))
end

slot1.yuhuang_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Lightning_Gold_Cashin_2", slot0, , -1)
	end)))
end

slot1.roulette_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(2), cc.CallFunc:create(function ()
		slot0:queueSpecialCashInAnimation("Roulette_Gold_Cashin", slot0, , -1, )
	end)))
end

slot1.boss_cashin = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot9 = slot0._world:retrieveEntity("cannon", slot3).getValue(slot8, "coinPosition")

	slot0:ShowFishGoldEx(slot1, slot3, slot4, slot5, 5)
	slot0.effectLayer.runAction(slot7, cc.Sequence:create(cc.DelayTime:create(0.165), slot10))
	slot0.effectLayer.runAction(slot7, cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function ()
		slot0:bossCashInAnimation(slot0, , , )
	end)))
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BIGAWARD)
end

slot1.bossCashInAnimation = function (slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	slot7 = cc.Director:getInstance():getWinSize()
	slot9 = slot4 / 25
	slot11 = slot0.ObjectManager.getObject(slot5, "mask_boss_cashin")

	slot11:setPosition(667, 375)
	slot11:setOpacity(0)
	slot11:setScaleX(cc.Director:getInstance():getVisibleSize().width / 1334)
	slot11:runAction(cc.Sequence:create(cc.DelayTime:create(0.33), cc.FadeTo:create(0.165, 255)))
	slot0.effectLayer.addChild(slot6, slot11, 998)

	slot12 = cc.Node:create()

	slot12:setPosition(667, 375)
	slot12:setCascadeOpacityEnabled(true)
	slot0.effectLayer.addChild(slot6, slot12, 999)

	slot13 = slot0.ObjectManager.getObject(slot5, "Boss_Cashin_Top")

	slot13:setAnimation(0, "start", false)
	slot13:addAnimation(0, "idle", true)
	slot12:addChild(slot13, 105)

	slot14 = slot0.ObjectManager.getObject(slot5, "Boss_Cashin_Bottom")

	slot14:setAnimation(0, "start", false)
	slot14:addAnimation(0, "idle", true)
	slot12:addChild(slot14, 103)

	slot15 = slot0.ObjectManager.getObject(slot5, "Boss_Cashin_" .. slot1)

	slot15:setAnimation(0, "start", false)
	slot15:addAnimation(0, "idle", true)
	slot12:addChild(slot15, 104)

	slot16 = slot0.ObjectManager.getObject(slot5, "specialEffectNumberLight")

	slot16:setAnchorPoint(0.5, 0.5)
	slot16:disableSeperator()
	slot16:enableUnit()
	slot16:setNumber(slot8)
	slot16:setPosition(0, -137)
	slot16:setScale(2.2)
	slot16:setOpacity(0)
	slot16:setLimitTrigger(1000000)
	slot16:runAction(slot24)
	slot12:addChild(slot16, 106)

	slot25 = slot0.ObjectManager.getObject(slot5, "specialEffectNumberEffect")

	slot25:setAnchorPoint(0.5, 0.5)
	slot25:disableSeperator()
	slot25:enableUnit()
	slot25:setNumber(slot8)
	slot25:setPosition(0, -137)
	slot25:setScale(0.85)
	slot25:setOpacity(0)
	slot25:setLimitTrigger(1000000)
	slot25:runAction(slot34)
	slot12:addChild(slot25, 107)
	slot12:runAction(cc.Sequence:create(cc.DelayTime:create(3.6300000000000003), slot43, slot44, cc.RemoveSelf:create()))
	slot11:runAction(cc.Sequence:create(cc.DelayTime:create(3.4650000000000003), cc.FadeTo:create(0.165, 0), cc.CallFunc:create(function ()
		slot0:recycleObject(slot0)
	end)))
	slot0.effectLayer.runAction(slot6, slot50)
	slot0.effectLayer:runAction(cc.Sequence:create(cc.DelayTime:create(0.924), cc.Repeat:create(cc.Sequence:create(slot51, cc.DelayTime:create(0.04)), 25)))
end

slot1.ShowBossGoldEx = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot0.freeBossGold[slot2].number > 0 then
		slot4 = slot5[slot5.number]
		slot5.number = slot5.number - 1
	else
		slot4 = slot0:createBossGoldAnimation(slot2)
	end

	slot0.usedBossGold[slot4] = true

	slot4:setPosition(slot1)
	slot4:setLocalZOrder(slot3)
	slot4:runAction(slot4.startAction)
	slot0.effectLayer:addChild(slot4)
end

slot1.createBossGoldAnimation = function (slot0, slot1)
	slot4 = cc.Node:create()

	slot4:retain()

	slot4.coin_count = 30 * slot0.bossGoldScale[slot1] * 1.4
	slot4.coins = {}
	slot5 = 0

	for slot9 = 1, 30 * slot0.bossGoldScale[slot1] * 1.4, 1 do
		slot18 = cc.Sprite:createWithSpriteFrameName("fish_jinbi4_1.png")
		slot19 = cc.Speed:create(slot17, (1.6 + math.random() * 0.5) * slot2)

		slot19:retain()

		slot18.animate = slot19

		slot18:setPosition(slot16)
		slot18:setScale(slot15)
		slot18:setRotation(360 * math.random())
		slot18:setOpacity(35)
		slot4:addChild(slot18)

		slot18.spreadAction = cc.Sequence:create(cc.Spawn:create(cc.FadeTo:create(0.3, 255), cc.ScaleTo:create((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * 0.3, 0.55 + 0.2 * math.random() * slot2), cc.Sequence:create(cc.MoveBy:create((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * 0.2, cc.fixp(((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 - 0.5 * 850 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4) * 0.7 * math.cos(slot14), ((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 - 0.5 * 850 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4) * 0.7 * math.sin(slot14))), cc.EaseSineOut:create(cc.MoveBy:create((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * 0.8, cc.fixp(((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 - 0.5 * 850 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4) * 0.3 * math.cos(slot14), ((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 - 0.5 * 850 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4) * 0.3 * math.sin(math.pi * 2 * math.random()))))), cc.Sequence:create(cc.DelayTime:create((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * 0.7), cc.FadeTo:create((550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 * 0.3, 0))), cc.CallFunc:create(function ()
			slot0:setVisible(false)
		end))

		slot18.spreadAction:retain()

		slot18.startScale = 0.4 * slot2
		slot18.startOffset = cc.p(50 * slot2 * math.cos(slot14), 50 * slot2 * math.sin(slot14))
		slot4.coins[slot9] = slot18

		if slot5 < (550 + 250 * (math.random() * 2 - 1) * slot2 * 1.2) / 850 * 1.4 then
			slot5 = slot12
		end
	end

	slot4.startAction = cc.Sequence:create(cc.CallFunc:create(function ()
		for slot3 = 1, slot0.coin_count, 1 do
			slot0.coins[slot3].setVisible(slot4, true)
			slot0.coins[slot3].setOpacity(slot4, 35)
			slot0.coins[slot3].setScale(slot4, slot0.coins[slot3].startScale)
			slot0.coins[slot3].setPosition(slot4, slot0.coins[slot3].startOffset)
			slot0.coins[slot3].runAction(slot4, slot0.coins[slot3].spreadAction)
			slot0.coins[slot3]:runAction(slot0.coins[slot3].animate)
		end
	end), cc.DelayTime:create(slot5 + 0.1), cc.CallFunc:create(function ()
		slot0:removeFromParent()

		slot1.freeBossGold[slot2].number = slot2.freeBossGold[slot2].number + 1
		slot1.freeBossGold[slot2][slot2.freeBossGold[slot2].number] = slot1.freeBossGold[slot2]
		slot1.usedBossGold[] = nil
	end))

	slot4.startAction:retain()

	return slot4
end

slot1.loadLockedFish = function (slot0, slot1)
	slot3 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if not slot0._lockUIContainer then
		slot4 = 0

		if slot2.width - 1334 >= 10 then
			slot4 = 80
		end

		slot0._lockUIContainer = display.newNode()

		slot0._lockUIContainer:setPosition(slot2.width - 73 - slot4 - slot3, 200)
		slot0.uiLayer:addChild(slot0._lockUIContainer, 1)

		slot5 = sp.SkeletonAnimation:create(FilePath.ANIMATION .. "lock/3dby_game_lock.json", FilePath.ANIMATION .. "lock/3dby_game_lock.atlas", 1)

		slot5:setAnimation(0, "start", false)
		slot5:addAnimation(0, "idle", true)
		slot0._lockUIContainer:addChild(slot5)

		slot6 = ccui.Button:create(FilePath.UI .. "btn/3dby_game_lockmenu.png", FilePath.UI .. "btn/3dby_game_lockmenu.png")

		slot6:setContentSize(cc.size(500, 500))
		slot6:setPosition(0, -50 - slot6:getContentSize().height / 2 + 100)
		slot6:addTouchEventListener(c_func(slot0.onBtnTouched_SwitchLockTarget, slot0))
		slot0._lockUIContainer:addChild(slot6)

		slot0._lockUIContainer.spine = slot5
		slot0._lockUIContainer.modelContainer = display.newNode()

		slot0._lockUIContainer:addChild(slot0._lockUIContainer.modelContainer)
	end

	if slot0._world:retrieveEntity("fish", slot1) then
		if slot0._lockUIContainer._visual then
			slot0._lockUIContainer._visual:onDestroy()

			slot0._lockUIContainer._visual = nil
		end

		if slot0.GameConfig.FishVisuals[slot4:getValue("visualId")] then
			slot0._lockUIContainer:setVisible(true)
			slot0._lockUIContainer.spine:setAnimation(0, "start", false)
			slot0._lockUIContainer.spine:addAnimation(0, "idle", true)
			slot0._lockUIContainer.modelContainer:removeAllChildren()

			slot0._lockUIContainer._visual = slot0.tools:loadVisualWithConfig(slot5, slot0._lockUIContainer.modelContainer, slot5.presentationScale)

			if slot0.GameConfig.MirrorFlag then
				slot6.position._value = {
					z = 0,
					x = 1334 - (slot3 * 1336) / slot2.width,
					y = 750 - slot5.presentationOffsetY
				}
			else
				slot6.position._value = {
					z = 0,
					x = (slot3 * 1336) / slot2.width,
					y = 0 + slot5.presentationOffsetY
				}
			end

			slot0._lockUIContainer.modelContainer:stopAllActions()
			slot0._lockUIContainer.modelContainer:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.016), cc.CallFunc:create(function ()
				slot0:onUpdate(0.016)
			end))))
		end
	else
		slot0._lockUIContainer:setVisible(false)
	end
end

slot1.onBtnTouched_SwitchLockTarget = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)
		slot0._world:triggerEvent("CHANGE_LOCKING_TARGET")
	end
end

slot1.updateLockChain = function (slot0)
	slot1 = slot0.GameConfig

	for slot5 = 0, 3, 1 do
		slot6 = slot0._world:retrieveEntity("cannon", slot5)

		if not slot0._lockFishChain[slot5] then
			slot0._lockFishChain[slot5] = slot0:createLockChain(slot6:getValue("position"))
		end

		slot7 = slot0._lockFishChain[slot5]

		if slot0._world:retrieveEntity("fish", slot6:getValue("lockingTarget")) and not slot8:getValue("isDead") then
			slot9 = slot8:getValue("bonePosition")
			slot10 = cc.fixp(slot9.x - slot7.posX, slot9.y - slot7.posY)

			slot7:setVisible(true)
			slot7:setRotation(slot12)
			slot7.mask:setScaleY((1221 - (math.sqrt(slot10.x * slot10.x + slot10.y * slot10.y) - 60)) / 10)
			slot7.target:setVisible(true)
			slot7.target:setPosition(slot9)
		else
			slot7:setVisible(false)
			slot7.target:setVisible(false)
		end
	end
end

slot1.createLockChain = function (slot0, slot1)
	slot0.bulletLayer:addChild(slot2, 1)

	slot3 = cc.Sprite:create("gameres/module/fishtd/ui/ingame/mask.png")

	slot3:setAnchorPoint(0.5, 1)
	slot3:setScaleX(5)
	slot3:setPosition(0, 1221)

	slot4 = cc.ClippingNode:create()

	slot4:setStencil(slot3)
	slot4:setAlphaThreshold(0.8)
	slot4:setPosition(slot1.x, slot1.y)
	slot4:setInverted(true)

	slot4.mask = slot3
	slot4.posX = slot1.x
	slot4.posY = slot1.y
	slot4.target = cc.Sprite:create("gameres/module/fishtd/animation/lock/suoding_quan.png")

	slot0.bulletLayer:addChild(slot4)

	slot5 = {}

	for slot9 = 1, 5, 1 do
		slot10 = sp.SkeletonAnimation:create("gameres/module/fishtd/fishEffect/3dby_lockjiantou.json", "gameres/module/fishtd/fishEffect/3dby_lockjiantou.atlas")

		slot10:setTimeScale(2)
		slot10:setOpacity(255)
		slot10:runAction(cc.Sequence:create(cc.DelayTime:create(0.9570000000000001 * slot9), cc.CallFunc:create(function ()
			slot0:setAnimation(0, "animation", true)
		end)))

		slot5[slot9 + 1] = slot10

		slot4:addChild(slot5[slot9 + 1], slot9)
	end

	return slot4
end

return slot1
