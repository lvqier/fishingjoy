slot0 = class_C("GameSupervisor", ClassLoader:aquireClass("Entity"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:startListen("INIT")
	slot0:startListen("FISH3D_CMD_S_SEND_FISH")
	slot0:startListen("FISH3D_CMD_S_SEND_BULLET")
	slot0:startListen("FISH3D_CMD_S_CANNON_SET")
	slot0:startListen("FISH3D_CMD_S_CHANGE_SCORE")
	slot0:startListen("FISH3D_CMD_S_KILL_FISH")
	slot0:startListen("FISH3D_CMD_S_KILL_BULLET")
	slot0:startListen("FISH3D_CMD_S_ADD_BUFFER")
	slot0:startListen("FISH3D_CMD_S_SWITCH_SCENE")
	slot0:startListen("REFRESH_CANNON")
	slot0:startListen("USER_ENTER")
	slot0:startListen("USER_LEFT")
	slot0:startListen("USER_ONLINE")
	slot0:startListen("USER_OFFLINE")
	slot0:startListen("ENTER_FOREGROUND")
	slot0:startListen("ENTER_BACKGROUND")
	slot0:startListen("CHANGE_FIRE_POSITION")
	slot0:startListen("INCREASE_CANNON_BASE")
	slot0:startListen("DECREASE_CANNON_BASE")
	slot0:startListen("SCENE_SWITCH_FINISH")
	slot0:startListen("FIRE_SPEED_CHANGE")
	slot0:startListen("FISH3D_CMD_S_SCORE_SYNC")
	slot0:startListen("FISH3D_CMD_S_SEND_GROUP")
	slot0:startListen("FISH3D_CMD_S_KILL_SPECIAL_FISH")
	slot0:startListen("FISH3D_CMD_S_EFFECT_KILL")
	slot0:startListen("FISH_CMD_S_SCORE_SYNC")
	slot0:startListen("CHANGE_LOCKING_TARGET")
	slot0:startListen("TOUCH_ENDED")

	slot0._delayedMessages = {}
	slot0._playerBulletNumberMap = {}
	slot0._bulletCostAccumulator = 0
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.objectManager = ClassLoader:aquireSingleton("ObjectManager")
	slot0._currentFiringInterval = 0.3
	slot0._mirrorPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0.fishtdSound = fishtdSound
	slot0.Fish3DSound = Fish3DSound
	slot0._tempMsgKillBullet = {}
	slot0._tempMsgNetCast = {}
	slot0.initiated = false
end

slot0.handle_TOUCH_ENDED = function (slot0)
	slot0.touched = true
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("id", "GameSupervisor")
	slot0:setValue("category", "supervisor")
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
end

slot0.addCannons = function (slot0)
	for slot4 = 0, 3, 1 do
		slot0._world:addEntity(ClassLoader:aquireSingleton("CannonFactory").createCannonByChairId(slot5, slot4))
	end
end

slot0.handle_INIT = function (slot0, slot1)
	if not slot0.initiated then
		slot0.initiated = true

		slot0:addCannons()
	end

	cc.Director:getInstance():getRunningScene():runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(10), cc.CallFunc:create(function ()
		return
	end))))
	cc.Director:getInstance():getRunningScene():runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(10), cc.CallFunc:create(function ()
		return
	end))))
end

slot0.handle_REFRESH_CANNON = function (slot0, slot1)
	for slot5 = 0, 3, 1 do
		slot7 = slot0._world:retrieveEntity("cannon", slot5).getComponentByName(slot6, "visual")

		function slot8(slot0)
			return slot0 - 180
		end

		function slot9(slot0)
			return (slot0 + 2) % 4
		end

		if slot0.gameConfig.MirrorFlag then
			slot7:assignGetterSetter("position", slot10, nil)
			slot7:assignGetterSetter("fireAngle", slot8, nil)
			slot7:assignGetterSetter("id", slot9, nil)
		else
			slot7:assignGetterSetter("position", slot10, nil)
			slot7:assignGetterSetter("fireAngle", nil, nil)
			slot7:assignGetterSetter("id", nil, nil)
		end

		slot6:trigger("id", slot5)
	end

	slot0._world:triggerEvent("UPDATE_COIN_POSITION")
end

slot0.handle_FISH3D_CMD_S_SEND_FISH = function (slot0, slot1)
	slot0._delayedMessages[slot1] = slot1
end

slot0.handle_FISH3D_CMD_S_SCORE_SYNC = function (slot0, slot1)
	slot2 = Hero:getWChairID()
	slot3 = slot0._world:retrieveEntity("cannon", slot1.wChairID)

	if slot1.wChairID then
		slot0._world:retrieveEntity("cannon", slot1.wChairID):setValue("controllerScore", slot1.lTotalScore)
	end
end

slot0.handle_FISH3D_CMD_S_KILL_FISH = function (slot0, slot1)
	slot0._world:triggerFrameworkEvent("SHOW_BONUS")

	if slot0._world:retrieveEntity("fish", slot1.dwFishID) then
		slot3 = Hero:getWChairID()
		slot4 = slot0._world:retrieveEntity("cannon", slot1.wChairID)

		if slot1.wChairID then
			slot0._world:retrieveEntity("cannon", slot1.wChairID):setValue("controllerScore", slot1.totalScore)
		end

		if not slot2:getValue("isDead") then
			slot2:setValue("deadCause", "NORMAL_KILL")
			slot2:trigger("isDead", true)
		end
	else
		for slot6, slot7 in pairs(slot0._delayedMessages) do
			if slot6.dwFishID == slot1.dwFishID then
				slot0._delayedMessages[slot6] = nil
			end
		end
	end
end

slot0.parseMul = function (slot0, slot1)
	if slot1 < 4 then
		return 1
	elseif slot1 < 7 then
		return 2
	else
		return 3
	end
end

slot0.handle_FISH3D_CMD_S_SEND_BULLET = function (slot0, slot1)
	if slot1.bClientSide then
		if slot0._world._playerBulletNumberMap[slot1.playerId] == slot0.gameConfig.nMaxBullet then
			return
		elseif slot0._world:retrieveEntity("bullet", slot1.dwID) then
			trace("duplicate id")

			return
		else
			slot0._world._playerBulletNumberMap[slot2] = slot3 + 1

			reqFishGamePlayerFire(slot1)

			slot4 = slot0._world:retrieveEntity("cannon", slot1.wChairID)
			slot1.cannonConfig = slot0.gameConfig.CannonSetArray[0].Sets[slot1.nCannonSet]
			slot1.nMultiply = slot4:getValue("cannonMul")
			slot6 = slot0.objectManager:getObject("BULLET", slot1)

			slot6.ownerUserId:set(slot1.playerId)

			slot6.netResName = slot0.gameConfig.CannonSetArray[0].Sets[slot1.nCannonSet].NetSet[slot0:parseMul(slot1.nMultiply)].szResourceName

			slot0._world:addEntity(slot6)
			slot6.lockingTarget:set(slot4.lockingTarget._value)
			slot6:onUpdate(0)
			slot4.controllerScore:set(slot1.playerScore - slot1.cost)
			slot4.openFire:trigger(true)

			if slot1.nCannonType == 0 then
				if slot1.nMultiply < 5 then
					slot0.fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.FIRE)
				else
					slot0.fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.IONFIRE)
				end
			elseif slot1.nCannonType == 1 then
				slot0.fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.EFFECT_BULLET_BOMB)
			end
		end
	elseif slot1.bNew then
		if slot0._world:retrieveEntity("bullet", slot1.dwID) then
			print("duplicate id")

			return
		end

		if not slot0._world:retrieveEntity("cannon", slot1.wChairID) then
			trackToServer(10009528, "charID:  " .. slot1.wChairID)

			return
		end

		slot1.nMultiply = slot2:getValue("cannonMul")
		slot1.cannonConfig = slot0.gameConfig.CannonSetArray[0].Sets[slot2.cannonSet._value]
		slot1.nCannonSet = slot2.cannonSet._value
		slot1.nCannonType = slot2.cannonSet._value
		slot1.fXpos = (slot2.position._value.x * cc.Director:getInstance():getVisibleSize().width) / 1336 - (cc.Director.getInstance().getVisibleSize().width - 1336) / 2
		slot1.fYPos = slot2.position._value.y
		slot8 = slot0.objectManager:getObject("BULLET", slot1)

		slot8.ownerUserId:set(slot4)

		slot8.lScore = slot1.lScore
		slot8.fAngle = slot1.fDirection * 57.29578
		slot8.netResName = slot0.gameConfig.CannonSetArray[0].Sets[slot2.cannonSet._value].NetSet[slot0:parseMul(slot1.nMultiply)].szResourceName

		if slot2.controllerId._value > 0 then
			slot2._queueSize = slot2._queueSize + 1
			slot2._bulletQueue[slot2._queueSize] = slot8
		else
			slot0.objectManager:recycleObject(slot8)
		end
	end
end

slot0.handle_USER_ENTER = function (slot0, slot1)
	trace(slot5)

	slot6 = slot0._world:retrieveEntity("cannon", slot5)

	slot6:setValue("controlledByPlayer", slot1.wChairID == Hero:getWChairID())
	slot6:setValue("controllerScore", slot1.lScore)
	slot6:setValue("controllerName", slot1.szUserName)
	slot6:setValue("controllerId", slot1.dwUserID)
	slot6:setValue("controllerState", ENUM.CONTROLLER_STATE.ONLINE)
	slot6:setValue("cannonSet", slot1.nCannonSet)
	slot6:setValue("cannonType", slot1.nCannonType)
	slot6:setValue("cannonBase", slot0.gameConfig.BulletVector[slot1.nCannonMul + 1].nMulriple or 10)
	slot6:setValue("cannonMul", slot1.nCannonMul + 1)
	slot6:setValue("lockingTarget", slot1.lockFish)
	slot6:setValue("bulletIDKey", (slot5 + 1) * 20000)
	slot6:setValue("bulletIDCounter", slot1.nBulletID - (slot5 + 1) * 20000)

	if slot4 then
		slot6:setValue("fireInterval", slot0._currentFiringInterval)
	else
		slot6:setValue("fireInterval", 0.1)
	end

	slot0._world._playerBulletNumberMap[slot1.dwUserID] = slot0._world._playerBulletNumberMap[slot1.dwUserID] or 0
end

slot0.handle_USER_ONLINE = function (slot0, slot1)
	slot2 = slot0._world:retrieveEntity("cannon", slot1.wChairID)

	slot2:setValue("controllerState", ENUM.CONTROLLER_STATE.ONLINE)
	slot2:setValue("controllerId", slot1.dwUserID)
end

slot0.handle_USER_OFFLINE = function (slot0, slot1)
	slot0._world:retrieveEntity("cannon", slot1.wChairID):setValue("controllerState", ENUM.CONTROLLER_STATE.OFFLINE)
end

slot0.handle_USER_LEFT = function (slot0, slot1)
	slot2 = slot0._world:retrieveEntity("cannon", slot1.wChairID)

	slot2:setValue("controlledByPlayer", false)
	slot2:setValue("controllerState", ENUM.CONTROLLER_STATE.LEFT)
	slot2:setValue("locking", false)
	slot2:setValue("lockingTarget", 4294967295.0)
	slot2:setValue("controllerId", 0)
	slot2:setValue("fireInterval", 0.1)

	slot2._queueSize = 0

	if slot1.wChairID == Hero:getWChairID() then
		slot2:setValue("forceAutoFire", false)
		slot0._world:triggerEvent("STOP_AUTO_FIRE")
	end
end

slot0.handle_FISH3D_CMD_S_CANNON_SET = function (slot0, slot1)
	slot3 = slot0._world:retrieveEntity("cannon", slot1.wChairID)

	slot3:setValue("cannonSet", slot1.cannonSet)
	slot3:setValue("cannonType", slot1.cannonType)
	slot3:setValue("cannonMul", slot1.cannonMul + 1)
	slot3:setValue("cannonBase", slot0.gameConfig.BulletVector[slot1.cannonMul + 1].nMulriple or 10)

	if slot1.wChairID == Hero:getWChairID() and slot1.cannonSet == 1 then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.ION_CANNON_ACTIVE)
	end
end

slot0.handle_FISH3D_CMD_S_CHANGE_SCORE = function (slot0, slot1)
	slot0._world:retrieveEntity("cannon", slot1.wChairID).setValue(slot2, "controllerScore", slot1.lFishScore)

	if Hero:getWChairID() == slot1.wChairID and slot1.lFishScore > 0 then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.INSERT)
	end
end

slot0.handle_CHANGE_FIRE_POSITION = function (slot0, slot1)
	if slot0._world:retrieveEntity("cannon", Hero:getWChairID()) and not slot3:getValue("locking") then
		slot3:setValue("fireAngle", (slot0:clampAngle(math.atan2(slot1.targetPosition.y - ({
			x = (slot3.position._value.x * cc.Director:getInstance():getVisibleSize().width) / 1336 - (cc.Director.getInstance().getVisibleSize().width - 1336) / 2,
			y = slot3.position._value.y
		})["y"], slot1.targetPosition.x - ()["x"]), slot2) * 180) / math.pi)
	end
end

slot0.handle_FISH3D_CMD_S_ADD_BUFFER = function (slot0, slot1)
	print("-------GameSupervisor:handle_FISH3D_CMD_S_ADD_BUFFER-------", slot1.nBufferTypemmsg, fBufferParam)

	if slot1.nBufferType == ENUM.BufferType.BufferType_ChangeSpeed then
		if slot1.fBufferParam <= 0 then
			for slot5, slot6 in pairs(slot0._delayedMessages) do
				slot6.fDelay = slot6.fDelay + slot1.fBufferTime
			end

			slot0._world:triggerEvent("FISH3D_CMD_S_ADD_BUFFER_DECREASE", slot1)
		else
			for slot6, slot7 in pairs(slot2) do
				slot7:setValue("speed", slot7:getValue("speed") * slot1.fBufferParam)
			end

			slot0._delayedMessages = {}
		end
	end
end

slot0.handle_FISH3D_CMD_S_SWITCH_SCENE = function (slot0, slot1)
	if not slot1.bSwitching then
		return
	end

	for slot6, slot7 in pairs(slot2) do
		slot7:setValue("speed", slot7:getValue("speed") * 6)
		slot7:setValue("collisionEnabled", false)
	end

	for slot7, slot8 in pairs(slot3) do
		slot8:setValue("lockingTarget", 4294967295.0)
	end

	for slot8, slot9 in pairs(slot4) do
		slot9:setValue("lockingTarget", 4294967295.0)
	end

	slot0._delayedMessages = {}
end

slot0.handle_SCENE_SWITCH_FINISH = function (slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		slot0._world:removeEntity(slot7)
	end
end

slot0.handle_INCREASE_CANNON_BASE = function (slot0)
	reqFishGameChangeCannon(slot1)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.CANNON_SWITCH)
end

slot0.handle_DECREASE_CANNON_BASE = function (slot0)
	reqFishGameChangeCannon(slot1)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.CANNON_SWITCH)
end

slot0.handle_FISH3D_CMD_S_UPDATE_POSITION = function (slot0, slot1)
	if slot0._world:retrieveEntity("fish", slot1.dwID) then
		slot2:setValue("position", {
			x = slot1.x,
			y = slot1.y,
			z = slot1.z
		})
		slot2:setValue("direction", {
			x = slot1.dirX,
			y = slot1.dirY,
			z = slot1.dirZ
		})
	else
		dump("Error: fish not found")
	end
end

slot0.handleFishMessageWithDelay = function (slot0, slot1)
	if slot0._world:retrieveEntity("fish", slot1.dwFishID) then
		slot0._delayedMessages[slot1] = nil

		return false
	end

	if slot1.fDelay - (slot0._world:getCurrentTime() - slot1.dwCreateTick) / 1000 <= 0 then
		slot0._delayedMessages[slot1] = nil
		slot7 = -slot6
		slot8 = (slot1.bTroop and "GROUP") or "NORMAL"

		if not slot0.objectManager:getObject(string.format("FISH_%d_%s", slot1.nTypeID, slot8), slot1) then
			return false
		end

		slot0._world:addEntity(slot10)
		slot10:onUpdate(slot7)
		slot0._world:triggerEvent("FISH_CREATED", slot1)

		return true
	end

	return false
end

slot0.handle_FISH3D_CMD_S_SEND_GROUP = function (slot0, slot1)
	if slot0._world:retrieveEntity("group", slot1.dwGroupID) then
		return
	end

	slot6 = ClassLoader:aquireSingleton("GroupFactory").createGroup(slot5, slot1, slot0._world)

	slot6:setValue("timeOverflow", (slot0._world:getCurrentTime() - slot1.dwCreateTick) / 1000)
	slot0._world:addEntity(slot6)
	slot6:onUpdate(0)
end

slot0.onUpdate = function (slot0, slot1)
	slot2 = Hero:getWChairID()
	slot4 = slot0.gameConfig.VisualMap

	for slot8, slot9 in pairs(slot0._delayedMessages) do
		if slot0:handleFishMessageWithDelay(slot9) then
			break
		end
	end

	for slot9, slot10 in pairs(slot5) do
		if slot10:getValue("isRemoved") then
			slot0._world:removeEntity(slot10)
		end
	end

	for slot10, slot11 in pairs(slot6) do
		if slot11.isRemoved._value then
			slot0._world:removeEntity(slot11)
		else
			slot13 = false

			for slot17, slot18 in ipairs(slot12) do
				if slot18.category._value == "bullet" and not slot18.isRemoved._value then
					slot18.isRemoved:set(true)

					slot0._tempMsgKillBullet.wChairID = slot18.ownerChairId._value
					slot0._tempMsgKillBullet.bullet = slot18

					slot0._world:triggerEvent("FISH3D_CMD_S_KILL_BULLET", slot0._tempMsgKillBullet)

					slot0._tempMsgNetCast.dwBulletID = slot18.id._value
					slot0._tempMsgNetCast.dwFishID = slot11.id._value
					slot0._tempMsgNetCast.dwData = 0

					reqFishGameNetCast(slot0._tempMsgNetCast)

					slot13 = true
				end

				slot12[slot17] = nil
			end

			if slot13 then
				slot11.hit:trigger(true)
			end
		end
	end

	for slot11, slot12 in pairs(slot7) do
		if slot12.isRemoved._value then
			slot0._world:removeEntity(slot12)
		end
	end

	for slot12, slot13 in pairs(slot8) do
		slot15 = -9999999
		slot16 = nil

		for slot20, slot21 in ipairs(slot14) do
			if slot15 < slot21:getValue("position").z then
				slot15 = slot22.z
				slot16 = slot21
			end

			slot14[slot20] = nil
		end

		if slot16 then
			slot0._world:triggerEvent("MANNUAL_SELECT_FISH", {
				wChairID = Hero:getWChairID(),
				dwFishID = slot16:getValue("id")
			})
		elseif slot0.touched then
			slot0._world:triggerEvent("LATENT_FIRE")
		end

		slot13:setValue("collisionEnabled", false)
	end

	fishtdSound:update(slot1)

	slot0.touched = false
end

slot0.handle_ENTER_FOREGROUND = function (slot0)
	slot0._backgroundExitTime = parseInt(TimeApi.getSystemTime())
	slot1 = (slot0._backgroundExitTime - slot0._backgroundEnterTime) / 1000

	for slot6, slot7 in pairs(slot2) do
		slot7:onUpdate(slot1)
	end

	for slot7, slot8 in pairs(slot3) do
		slot8:onUpdate(slot1)
	end
end

slot0.handle_FISH3D_CMD_S_EFFECT_KILL = function (slot0, slot1)
	if not slot0._world:retrieveEntity("fish", slot1.dwFishID) then
		print("Cannot find caster !!!")

		for slot6, slot7 in pairs(slot0._delayedMessages) do
			if slot6.dwFishID == slot1.dwFishID then
				slot0._delayedMessages[slot6] = nil
			end
		end
	else
		slot2:trigger("deadCause", "CAST_EFFECT")
		slot2:setValue("isDead", true)
	end

	for slot6 = 1, 100, 1 do
		if slot1.fishes[slot6] > 0 then
			if slot0._world:retrieveEntity("fish", slot1.fishes[slot6]) then
				if slot7:getValue("isDead") then
					print("Target is already dead !!!")
				else
					if slot2 then
						slot7:trigger("deadCause", "EFFECT_KILL")
					else
						slot7:trigger("deadCause", "NORMAL_KILL")
					end

					slot7:setValue("isDead", true)
				end
			else
				for slot11, slot12 in pairs(slot0._delayedMessages) do
					if slot11.dwFishID == slot1.fishes[slot6] then
						slot0._delayedMessages[slot11] = nil
					end
				end
			end
		else
			break
		end
	end
end

slot0.handle_ENTER_BACKGROUND = function (slot0)
	slot0._backgroundEnterTime = parseInt(TimeApi.getSystemTime())
end

slot0.handle_FIRE_SPEED_CHANGE = function (slot0, slot1)
	if slot0._world:retrieveEntity("cannon", Hero:getWChairID()) then
		slot2:setValue("fireInterval", slot1.freq)
	end

	slot0._currentFiringInterval = slot1.freq
end

slot0.clampAngle = function (slot0, slot1, slot2)
	if slot2 < 2 then
		if slot1 < 0 and slot1 < -math.pi / 2 then
			return math.pi, true
		elseif slot1 < 0 and slot1 >= -math.pi / 2 then
			return 0, true
		end

		return slot1, false
	else
		if slot1 > 0 and slot1 > math.pi / 2 then
			return math.pi, true
		elseif slot1 > 0 and slot1 <= math.pi / 2 then
			return math.pi * 2, true
		end

		return slot1, false
	end
end

slot0.handle_CHANGE_LOCKING_TARGET = function (slot0)
	if not slot0._world:retrieveEntity("cannon", Hero:getWChairID()) then
		return
	end

	slot3 = slot2:getValue("lockingTarget")
	slot5 = -1
	slot6 = -1
	slot7 = nil
	slot8 = false
	slot9 = false

	for slot13, slot14 in pairs(slot4) do
		if slot0:fishAvailable(slot14, slot2) then
			slot9 = true

			if not slot14:getValue("selected") then
				if slot13 == slot3 then
					slot14:setValue("selected", true)

					slot8 = true
				elseif slot5 < slot14:getValue("lockLevel") then
					slot5 = slot14:getValue("lockLevel")
					slot6 = slot13
					slot7 = slot14
					slot8 = true
				end
			end
		end
	end

	if not slot8 and slot9 then
		dump("select reset !!!!")

		for slot13, slot14 in pairs(slot4) do
			slot14:setValue("selected", false)
		end

		slot0:handle_CHANGE_LOCKING_TARGET()
	elseif slot6 > -1 then
		slot7:setValue("selected", true)
		slot0._world:triggerEvent("MANNUAL_SELECT_FISH", {
			wChairID = slot1,
			dwFishID = slot6
		})
	end
end

slot0.fishAvailable = function (slot0, slot1, slot2)
	slot3 = 0
	slot5 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if slot0.gameConfig.PLATFORM_ANDROID then
		slot3 = 100
	end

	if not slot1 then
		return false
	end

	if slot1.isDead._value or slot1.isRemoved._value then
		return false
	end

	if slot1:getValue("bonePosition").x < -slot3 - slot5 or slot6.x > (slot4.width + slot3) - slot5 or slot6.y < -100 or slot6.y > slot0.gameConfig.Height + 100 then
		return false
	else
		slot7 = slot2.position._value

		if slot2.id._value < 2 then
			if slot6.y < slot7.y then
				return false, slot6
			else
				return true, slot6
			end
		elseif slot7.y < slot6.y then
			return false, slot6
		else
			return true, slot6
		end
	end
end

return slot0
