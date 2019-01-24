slot2 = "FishingJoyController"
FishingJoyController = class(slot1)

FishingJoyController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot4 = slot0

	slot0.initLazy(slot3)
end

FishingJoyController.initLazy = function (slot0)
	slot3 = mainMgr

	mainMgr.onStopTick2Gc(slot2)

	slot4 = {
		onX = 155.4,
		offX = 86.4
	}

	slot0.model.setSwitchStatePos(slot2, slot0.model)

	slot3 = slot0.model

	slot0.model.initializedLocalData(slot2)

	slot0.localBulletContainer = {}
	slot0.bulletRecordId = 0
	slot0.fishProtoBuff = {}
	slot0.fishProtoKey = {}
	slot0.fishProtoBuffDirty = false
	slot0.fishProtoCount = 0
	slot0._resProcessConfigs = FishingJoy_LocalRes_GetResConfig()
	slot0.bossNotice = {
		[27.0] = 2,
		[30.0] = 1
	}
	slot3 = slot0

	slot0.adjustIPhoneX(slot2)

	slot3 = slot0

	slot0.resetTimeService(slot2)

	slot3 = slot0

	slot0.loadDesignConfig(slot2)

	slot3 = slot0

	slot0.resetFishingJoySoundParam(slot2)

	slot4 = false

	slot0.setSyncSelfScore(slot2, slot0)

	if FISHINGJOY_ANDROID_PLATFORM then
		slot1 = {
			["effect/CJ.mp3"] = 4,
			["effect/BigBang.mp3"] = 2,
			["effect/Bigfireworks.mp3"] = 1
		}

		for slot5 = 0, 17, 1 do
			slot1["effect/fisha" .. slot5 .. ".mp3"] = 3
		end

		slot5 = slot1

		slot0.setEffectPriorityConfig(slot3, slot0)

		slot5 = 3

		slot0.setSingleFrameMaxEffect(slot3, slot0)
	end
end

FishingJoyController.adjustIPhoneX = function (slot0)
	slot0.needAdjustIPhoneX = false
	slot0.iphonexOffsetX = 0
	slot0.realScreenWidth = CONFIG_DESIGN_WIDTH
	slot0.realScreenHeight = CONFIG_DESIGN_HEIGHT

	if CONFIG_DESIGN_WIDTH < display.width then
		slot0.needAdjustIPhoneX = true
		slot0.iphonexOffsetX = -(display.width - CONFIG_DESIGN_WIDTH) * 0.5
		slot0.realScreenWidth = display.width
	end
end

FishingJoyController.isNeedAdjustIx = function (slot0)
	return slot0.needAdjustIPhoneX
end

FishingJoyController.getIPhoneXOffsetX = function (slot0)
	return slot0.iphonexOffsetX
end

FishingJoyController.getIPhoneXScreenPixel = function (slot0)
	return slot0.realScreenWidth, slot0.realScreenHeight
end

FishingJoyController.restoreNode = function (slot0, slot1)
	if slot0.needAdjustIPhoneX then
		slot6 = slot1.getPositionX(slot3) - slot0.iphonexOffsetX

		slot1:setPositionX(slot1)
	end
end

FishingJoyController.registerListeners = function (slot0)
	slot3 = slot0

	BaseGameController.registerListeners(slot2)
end

FishingJoyController.canceledListeners = function (slot0)
	slot3 = slot0

	BaseGameController.canceledListeners(slot2)

	slot3 = slot0

	slot0.resetBattle(slot2)
end

FishingJoyController.onViewTypeChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_BATTLE then
		slot4 = true

		slot0.model.setIsShowingBattleLoading(slot2, slot0.model)

		slot4 = true

		slot0.model.setBBattle(slot2, slot0.model)

		slot4 = true

		slot0.model.setActiveUpdateTick(slot2, slot0.model)
	else
		slot4 = false

		slot0.model.setActiveUpdateTick(slot2, slot0.model)

		slot4 = false

		slot0.model.setBBattle(slot2, slot0.model)
	end

	slot3 = slot0

	BaseGameController.onViewTypeChanged(slot2)
end

FishingJoyController._onMsgChangeSpeedUp = function (slot0, slot1)
	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) ~= nil then
		slot7 = slot1.dwStartTick

		slot2.setFireRate(slot4, slot2, slot1.cbSpeedMul)

		slot7 = slot2

		slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
	end
end

FishingJoyController._onMsgTimeSync = function (slot0, slot1)
	slot4 = Hero

	if not Hero.getWChairID(slot3) == slot1.wChiarID then
		return
	end

	slot4 = slot0

	if slot0.checkReady(slot3) == false then
		reqFISHINGJOYBReady()
	end

	slot6 = slot1.dwServerTick

	slot0.executeTimerSync(slot3, slot0, slot1.dwClientTick)

	slot4 = slot0

	slot0.setSyncTime(slot3, socket.gettime())
end

FishingJoyController._onMsgGameConfig = function (slot0, slot1)
	if slot1.nMaxInterval < 1000 then
		slot1.nMaxInterval = 90000
	end

	slot1.nFireInterval = slot1.nFireInterval / 1000
	slot1.nMaxInterval = slot1.nMaxInterval / 1000

	if slot1.nMaxBulletCount == nil then
		slot1.nMaxBulletCount = FISHINGJOY_BULLET_LIMIT
	end

	slot5 = {
		maxBulletLimit = slot1.nMaxBulletCount,
		fireDelta = slot1.nFireInterval,
		deltaMaxLimit = slot1.nMaxInterval
	}

	slot0.model.setGameConfig(slot3, slot0.model)

	slot4 = {
		bAdd = true,
		bAddAll = true,
		wChairID = Hero.getWChairID(slot1.nMaxInterval) or 0
	}
	slot7 = Hero

	reqFISHINGJOYChangeScore(slot3)
end

FishingJoyController._onMsgCreateFish = function (slot0, slot1)
	slot4 = slot1.fDelay * 1000

	if slot0.fishProtoBuff[math.floor(slot3) + slot1.dwCreateTick] == nil then
		slot0.fishProtoBuff[slot2] = {}
		slot0.fishProtoBuffDirty = true
	end

	slot7 = slot1

	table.insert(slot5, slot3)

	slot0.fishProtoCount = slot0.fishProtoCount + 1
	slot0.serverTick = slot1.dwServerTick
end

FishingJoyController.createFishByProto = function (slot0, slot1)
	if slot0.bossNotice[slot1.nTypeID] then
		slot6 = slot2

		slot0.model.setWhichBossComing(slot4, slot0.model)
	end

	slot5 = "mainLogic.FishingJoyGameMgr"
	slot5 = FishingJoyRequireLua(slot4)
	slot5 = FishingJoyRequireLua(slot4).getInstance(slot4)
	slot6 = slot1.dwFishID

	if FishingJoyRequireLua(slot4).getInstance(slot4).getEntityLogic(slot4).findFishFromContainer(slot4, FishingJoyRequireLua(slot4).getInstance(slot4).getEntityLogic(slot4)) then
		return
	end

	slot5 = slot1.nTypeID

	if FishingJoy_Fish_GetFishConfig(slot4) ~= nil then
		slot15 = slot1.FisType

		if slot0.realCreateFish(slot5, slot0, slot3, slot1.fOffestX, slot1.fOffestY, slot1.fDir, slot1.fDelay, slot1.FishSpeed, slot1.nPathID, slot1.bTroop) then
			slot8 = slot3

			slot4.setFishConfig(slot6, slot4)

			slot8 = slot1.nRefershID

			slot4.setBatchId(slot6, slot4)

			slot8 = slot1.dwFishID

			slot4.setEntityId(slot6, slot4)

			slot7 = "mainLogic.FishingJoyGameMgr"
			slot7 = FishingJoyRequireLua(slot6)
			slot7 = FishingJoyRequireLua(slot6).getInstance(slot6)
			slot8 = slot4

			if FishingJoyRequireLua(slot6).getInstance(slot6).getEntityLogic(slot6).newFish2Container(slot6, FishingJoyRequireLua(slot6).getInstance(slot6).getEntityLogic(slot6)) == true then
				slot12 = slot1.dwCreateTick
				slot9 = slot0.getDelayTick(slot10, slot0) / 1000

				slot4.onUpdate(slot7, slot4)
			end
		end
	else
		slot9 = slot1.nTypeID
		slot6 = "没有找到nTypeID为 " .. tostring(slot8) .. " 的鱼。"

		print(slot5)
	end
end

FishingJoyController.onUpdateCreateFish = function (slot0)
	if slot0.fishProtoBuffDirty then
		slot3 = slot0.fishProtoBuff
		slot0.fishProtoKey = TableUtil.getKeys(slot2)

		if #slot0.fishProtoKey > 1 then
			slot3 = slot0.fishProtoKey

			table.sort(slot2)
		end

		slot0.fishProtoBuffDirty = false
	end

	while #slot0.fishProtoKey > 0 do
		slot2 = slot0.fishProtoBuff[slot0.fishProtoKey[1]]
		slot6 = slot0.fishProtoKey[1]

		if -slot0.getDelayTick(slot4, slot0) > 20 then
			slot8 = table.remove(slot5)

			slot0.createFishByProto(slot2, slot0)

			if #slot2 == 0 then
				slot0.fishProtoBuff[slot1] = nil
				slot8 = 1

				table.remove(nil, slot0.fishProtoKey)
			end

			slot0.fishProtoCount = slot0.fishProtoCount - 1

			break
		else
			slot4 = ipairs
			slot6 = slot2 or {}

			for slot7, slot8 in slot4(slot5) do
				slot12 = slot8

				slot0.createFishByProto(slot10, slot0)
			end
		end

		slot0.fishProtoBuff[slot1] = nil
		slot7 = 1

		table.remove(nil, slot0.fishProtoKey)

		slot0.fishProtoCount = slot0.fishProtoCount - #slot2
	end

	if slot0.serverTick then
		slot4 = slot0.serverTick
		slot4 = slot0

		if slot0:getMaxDiffrence() < slot0.getDelayTick(slot2, slot0) then
			slot3 = {
				wChairID = Hero.getWChairID(slot5),
				dwClientTick = slot0.getClientTick(slot5)
			}
			slot6 = Hero
			slot6 = slot0

			reqFISHINGJOYMsgSyncTime(slot2)
		end

		slot0.serverTick = nil
	end
end

FishingJoyController._onMsgBulletSet = function (slot0, slot1)
	if slot1.bFirst then
		FishingJoy_Bullet = {}
	end

	slot6 = {
		bulletSpeed = slot1.nSpeed,
		bulletMul = slot1.nMulriple,
		bulletCatchRadio = slot1.nCatchRadio
	}

	table.insert(slot4, FishingJoy_Bullet)
end

FishingJoyController._onMsgPlayerInfo = function (slot0, slot1)
	slot4 = Hero

	if Hero.getWChairID(slot3) == slot1.wChairID then
		slot4 = {
			wChairID = Hero.getWChairID(slot6),
			dwClientTick = slot0.getClientTick(slot6)
		}
		slot7 = Hero
		slot7 = slot0

		reqFISHINGJOYMsgSyncTime(slot3)

		if slot1.wChairID == 0 or slot1.wChairID == 1 then
			slot5 = true

			slot0.setMirrorSeat(slot3, slot0)
		else
			slot5 = false

			slot0.setMirrorSeat(slot3, slot0)
		end
	end

	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) == nil then
		slot5 = "mainLogic.FishingJoyGameMgr"
		slot5 = FishingJoyRequireLua(slot4)
		slot5 = FishingJoyRequireLua(slot4).getInstance(slot4)
		slot5 = slot1.wChairID
		FishingJoyRequireLua(slot4).getInstance(slot4).getPlayerClass(slot4).new(slot4).hasPlayerInfo = false
	end

	if slot2.hasPlayerInfo then
		return
	end

	slot2.hasPlayerInfo = true
	slot6 = slot1.nCannonMul

	slot2.setFireMul(slot4, slot2)

	slot6 = slot1.nCannonType

	slot2.setCannonRenderType(slot4, slot2)

	slot6 = slot1.lScore

	slot2.setPlayerScore(slot4, slot2)

	if slot1.lScore > 0 then
		slot6 = Hero

		if slot1.wChairID == Hero.getWChairID(slot5) then
			slot6 = slot1.lScore

			Hero.setUserScore(slot4, Hero)
		end
	end

	slot6 = slot1.wChairID

	if gameMgr.getUserDataByChairId(slot4, gameMgr) then
		slot7 = slot3.szNickName

		slot2.setNickName(slot5, slot2)

		slot7 = slot3.dwUserID

		slot2.setUserId(slot5, slot2)
	end

	slot8 = slot2

	slot0.model.setFishingSeatBySeatId(slot5, slot0.model, slot1.wChairID)
end

FishingJoyController._onMsgChangeScore = function (slot0, slot1)
	slot5 = slot1.wChairID

	if not slot0.model.getFishingSeatBySeatId(slot3, slot0.model) then
		return
	end

	slot6 = slot1.lFishScore

	slot2.setPlayerScore(slot4, slot2)

	if slot1.lFishScore > 0 then
		slot6 = Hero

		if slot1.wChairID == Hero.getWChairID(slot5) then
			slot6 = slot1.lFishScore

			Hero.setUserScore(slot4, Hero)
		end
	end

	slot7 = slot2

	slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
end

FishingJoyController._onMsgCannon = function (slot0, slot1)
	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) == nil then
		return
	end

	slot6 = Hero

	if slot1.wChairID == Hero.getWChairID(slot5) then
		if slot1.cannonSet == 0 then
			slot6 = "no"

			slot0.model.setEnergyCannon(slot4, slot0.model)
		else
			slot6 = "yes"

			slot0.model.setEnergyCannon(slot4, slot0.model)
		end
	end

	slot6 = slot1.cannonSet

	slot2.setCannonFireType(slot4, slot2)

	slot6 = slot1.cannonRenderType

	slot2.setCannonRenderType(slot4, slot2)

	slot6 = slot1.cannonMul

	slot2.setFireMul(slot4, slot2)

	slot7 = slot2

	slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
end

FishingJoyController._onMsgCreateBullet = function (slot0, slot1)
	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) == nil then
		return
	end

	slot6 = slot1.lScore

	slot2.setPlayerScore(slot4, slot2)

	if slot1.lScore > 0 then
		slot6 = Hero

		if slot1.wChairID == Hero.getWChairID(slot5) then
			slot6 = slot1.lScore

			Hero.setUserScore(slot4, Hero)
		end
	end

	slot5 = Hero

	if Hero.getWChairID(slot4) == slot1.wChairID then
		if slot0.bulletRecordId == nil or slot0.bulletRecordId == 0 then
			slot0.bulletRecordId = slot1.dwID - slot1.wChairID * 20000
		end

		slot6 = slot1.dwServerTick
		slot6 = slot0

		if slot0:getMaxDiffrence() < slot0.getDelayTick(slot4, slot0) then
			slot5 = {
				wChairID = Hero.getWChairID(slot7),
				dwClientTick = slot0.getClientTick(slot7)
			}
			slot8 = Hero
			slot8 = slot0

			reqFISHINGJOYMsgSyncTime(slot4)
		end
	else
		if slot1.bNew then
			slot5 = slot2

			if slot2.getLockFishId(slot4) == 0 then
				if slot1.wChairID == 2 or slot1.wChairID == 3 then
					slot6 = FISHINGJOY_PI - slot1.fDirection

					slot2.setCannonAngle(slot4, slot2)
				else
					slot6 = slot1.fDirection

					slot2.setCannonAngle(slot4, slot2)
				end
			end

			slot6 = slot1.wChairID

			slot0.model.setPlayCASeatId(slot4, slot0.model)
		end

		slot8 = slot1.fDirection

		slot0.createBullet(slot4, slot0, slot1.wChairID, slot1.dwID)
	end

	slot7 = slot2

	slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
end

FishingJoyController._onMsgKillFish = function (slot0, slot1)
	slot2 = slot1.wChairID
	slot5 = slot1.lScore / slot1.nBScoe
	slot8 = "mainLogic.FishingJoyGameMgr"
	slot8 = FishingJoyRequireLua(slot7)
	slot8 = FishingJoyRequireLua(slot7).getInstance(slot7)
	slot9 = slot1.dwFishID
	slot14 = FISHINGJOY_KILL_BY_BULLET

	slot0.killFish(FishingJoyRequireLua(slot7).getInstance(slot7).getEntityLogic(slot7), slot0, slot1.wChairID, FishingJoyRequireLua(slot7).getInstance(slot7).getEntityLogic(slot7).findFishFromContainer(slot7, FishingJoyRequireLua(slot7).getInstance(slot7).getEntityLogic(slot7)), slot1.nBScoe, slot1.lScore)

	slot10 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(FishingJoyRequireLua(slot7).getInstance(slot7).getEntityLogic(slot7), slot0.model) ~= nil then
		slot13 = slot7
		slot11 = slot7.getPlayerScore(slot12) + slot1.lScore

		slot7.setPlayerScore(slot9, slot7)

		slot12 = slot7

		slot0.model.setFishingSeatBySeatId(slot9, slot0.model, slot1.wChairID)

		slot11 = Hero

		if slot1.wChairID == Hero.getWChairID(slot0.model) then
			slot10 = Hero
			slot13 = slot7

			Hero.setUserScore(slot9, slot7.getPlayerScore(slot12))
		end
	end
end

FishingJoyController._onMsgKillBullet = function (slot0, slot1)
	slot4 = "mainLogic.FishingJoyGameMgr"
	slot4 = FishingJoyRequireLua(slot3)
	slot4 = FishingJoyRequireLua(slot3).getInstance(slot3)
	slot5 = slot1.dwBulletID
	slot6 = slot1.dwBulletID

	slot0.removeSelfBullets(FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLogic(slot3), slot0)

	if FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLogic(slot3).findBulletFromContainer(slot3, FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLogic(slot3)) ~= nil then
		slot6 = FISHINGJOY_ENTITY_STATUS.DEAD

		slot2.setEntityStatus(slot4, slot2)
	end
end

FishingJoyController._onMsgSwitchScene = function (slot0, slot1)
	slot5 = slot1

	slot0.model.setChangeLevel(slot3, slot0.model)

	slot4 = slot0.model

	if slot0.model.getBBattle(slot3) == true then
		slot5 = false

		slot0.model.setBBattle(slot3, slot0.model)
	end
end

FishingJoyController._onMsgAllowFire = function (slot0, slot1)
	slot5 = slot1.m_bAllowFire

	slot0.model.setAllowFire(slot3, slot0.model)
end

FishingJoyController._onMsgLockFish = function (slot0, slot1)
	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) ~= nil then
		slot6 = slot1.dwLockID

		slot2.setLockFishId(slot4, slot2)

		slot7 = slot2

		slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)

		slot6 = Hero

		if slot1.wChairID == Hero.getWChairID(slot0.model) and slot1.dwLockID ~= 0 then
			slot5 = slot0.model

			if slot0.model.getLockFish(slot4) == false then
				slot5 = {
					bLock = false,
					wChairID = slot1.wChairID
				}

				reqFISHINGJOYMsgLockFish(slot4)
			end
		end
	end
end

FishingJoyController._onMsgSendDes = function (slot0, slot1)
	slot5 = true

	slot0.model.setFishGroupComing(slot3, slot0.model)
end

FishingJoyController._onMsgAppendBuff = function (slot0, slot1)
	slot4 = "mainLogic.FishingJoyGameMgr"
	slot4 = FishingJoyRequireLua(slot3)
	slot4 = FishingJoyRequireLua(slot3).getInstance(slot3)
	slot7 = slot1.fBufferTime

	FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLogic(slot3).appendFishBuff(slot3, FishingJoyRequireLua(slot3).getInstance(slot3).getEntityLogic(slot3), slot1.nBufferType, slot1.fBufferParam)
end

FishingJoyController._onMsgFishMul = function (slot0, slot1)
	slot2 = nil
	slot5 = "mainLogic.FishingJoyGameMgr"
	slot5 = FishingJoyRequireLua(slot4)
	slot5 = FishingJoyRequireLua(slot4).getInstance(slot4)
	slot6 = slot1.nFishID

	if FishingJoyRequireLua(slot4).getInstance(slot4).getEntityLogic(slot4).findFishFromContainer(slot4, FishingJoyRequireLua(slot4).getInstance(slot4).getEntityLogic(slot4)) == nil then
		return
	end

	slot6 = slot1.scoreMul

	slot2.setFishScore(slot4, slot2)
end

FishingJoyController._onMsgScoreSync = function (slot0, slot1)
	slot5 = slot1.wChairID

	if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) == nil then
		return
	end

	slot6 = Hero

	if slot1.wChairID == Hero.getWChairID(slot5) then
		slot8 = slot2
		slot6 = slot2.getPlayerScore(slot7) + slot1.lScore

		Hero.setUserScore(slot4, Hero)
	end

	slot8 = slot2
	slot6 = slot2.getPlayerScore(slot7) + slot1.lScore

	slot2.setPlayerScore(slot4, slot2)

	slot7 = slot2

	slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
end

FishingJoyController.onUserScore = function (slot0, slot1)
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

		if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) ~= nil then
			slot6 = slot1.lScore

			slot2.setPlayerScore(slot4, slot2)

			slot7 = slot2

			slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)

			slot6 = Hero

			if slot1.wChairID == Hero.getWChairID(slot0.model) then
				slot6 = slot1.lScore

				Hero.setUserScore(slot4, Hero)
			end
		end
	end
end

FishingJoyController.onUserEnter = function (slot0, slot1)
	return
end

FishingJoyController.onUserStatus = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if US_FREE < slot1.cbUserStatus and slot1.cbUserStatus ~= US_LOOKON then
		slot5 = Hero

		if slot1.wTableID ~= Hero.getWTableID(slot4) then
			return
		end

		slot5 = slot1.wChairID

		if slot0.model.getFishingSeatBySeatId(slot3, slot0.model) == nil then
			slot5 = "mainLogic.FishingJoyGameMgr"
			slot5 = FishingJoyRequireLua(slot4)
			slot5 = FishingJoyRequireLua(slot4).getInstance(slot4)
			slot5 = slot1.wChairID
			slot2 = FishingJoyRequireLua(slot4).getInstance(slot4).getPlayerClass(slot4).new(slot4)
		end

		slot6 = slot1.dwUserID

		slot2.setUserId(slot4, slot2)

		slot6 = slot1.szNickName

		slot2.setNickName(slot4, slot2)

		slot6 = slot1.lScore

		slot2.setPlayerScore(slot4, slot2)

		slot2.hasPlayerInfo = false

		if slot1.lScore > 0 then
			slot6 = Hero

			if slot1.wChairID == Hero.getWChairID(slot5) then
				slot6 = slot1.lScore

				Hero.setUserScore(slot4, Hero)
			end
		end

		slot7 = slot2

		slot0.model.setFishingSeatBySeatId(slot4, slot0.model, slot1.wChairID)
	else
		slot5 = slot0.model.getFishingSeats(slot3)

		for slot6, slot7 in pairs(slot0.model) do
			slot11 = slot7

			if slot1.dwUserID == slot7.getUserId(slot10) then
				slot2[slot6] = nil
				slot12 = true

				slot0.model.setFishingSeats(slot9, slot0.model, slot2)

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

FishingJoyController.loadDesignConfig = function (slot0)
	slot1 = CONFIG_DESIGN_WIDTH
	slot2 = CONFIG_DESIGN_HEIGHT
	slot5 = slot0

	if slot0.isNeedAdjustIx(slot4) then
		slot5 = slot0
		slot1, slot2 = slot0.getIPhoneXScreenPixel(slot4)
	end

	slot9 = slot2

	slot0.setBattleLayerSize(slot4, slot0, 1440, 900, slot1)
end

FishingJoyController.onRoomLoginFinish = function (slot0)
	slot3 = slot0

	slot0.reconnect(slot2)

	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

FishingJoyController.reconnect = function (slot0)
	slot5 = true

	slot0.model.setSelfBulletCount(slot2, slot0.model, 0)

	slot4 = false

	slot0.model.setAutoAttack(slot2, slot0.model)

	slot4 = false

	slot0.model.setLockFish(slot2, slot0.model)

	slot4 = 1

	slot0.model.setCurrentFireRate(slot2, slot0.model)

	for slot4 = 0, 3, 1 do
		slot8 = slot4

		if slot0.model.getFishingSeatBySeatId(slot6, slot0.model) ~= nil then
			slot9 = 0

			slot5.setCannonFireType(slot7, slot5)

			slot10 = slot5

			slot0.model.setFishingSeatBySeatId(slot7, slot0.model, slot4)
		end
	end

	slot0.bulletRecordId = 0
	slot0.localBulletContainer = {}
	slot3 = slot0

	slot0.resetTimeService(slot2)

	slot3 = "mainLogic.FishingJoyGameMgr"
	slot3 = FishingJoyRequireLua(slot2)
	slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)

	if FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2) ~= nil then
		slot3 = "mainLogic.FishingJoyGameMgr"
		slot3 = FishingJoyRequireLua(slot2)
		slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)
		slot4 = true

		FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2).cleanBulletContainer(slot2, FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2))

		slot3 = "mainLogic.FishingJoyGameMgr"
		slot3 = FishingJoyRequireLua(slot2)
		slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)
		slot4 = true

		FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2).cleanFishContainer(slot2, FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2))
	end

	slot0.fishProtoBuff = {}
	slot0.fishProtoKey = {}
	slot0.fishProtoBuffDirty = false
	slot0.fishProtoCount = 0
	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

FishingJoyController.resetBattle = function (slot0)
	slot0.localBulletContainer = {}
	slot3 = slot0.model

	slot0.model.initializedLocalData(slot2)

	slot3 = slot0

	slot0.resetTimeService(slot2)

	slot3 = slot0

	slot0.resetFishingJoySoundParam(slot2)

	slot4 = false

	slot0.model.setIsShowingExit(slot2, slot0.model)

	slot4 = false

	slot0.setSyncSelfScore(slot2, slot0)

	slot0.bulletRecordId = 0
	slot4 = 1

	slot0.model.setCurrentFireRate(slot2, slot0.model)

	slot4 = -1

	slot0.model.setCurrentLevelId(slot2, slot0.model)

	slot4 = false

	slot0.model.setAutoAttack(slot2, slot0.model)

	slot3 = "mainLogic.FishingJoyGameMgr"
	slot3 = FishingJoyRequireLua(slot2)
	slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)

	if FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2) ~= nil then
		slot3 = "mainLogic.FishingJoyGameMgr"
		slot3 = FishingJoyRequireLua(slot2)
		slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)
		slot4 = true

		FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2).cleanBulletContainer(slot2, FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2))

		slot3 = "mainLogic.FishingJoyGameMgr"
		slot3 = FishingJoyRequireLua(slot2)
		slot3 = FishingJoyRequireLua(slot2).getInstance(slot2)
		slot4 = true

		FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2).cleanFishContainer(slot2, FishingJoyRequireLua(slot2).getInstance(slot2).getEntityLogic(slot2))

		slot3 = "mainLogic.FishingJoyGameMgr"
		slot3 = FishingJoyRequireLua(slot2)
		slot4 = false

		FishingJoyRequireLua(slot2).getInstance(slot2).setGameFinishLoad(slot2, FishingJoyRequireLua(slot2).getInstance(slot2))
	end

	slot0.fishProtoBuff = {}
	slot0.fishProtoKey = {}
	slot0.fishProtoBuffDirty = false
	slot0.fishProtoCount = 0
end

FishingJoyController.exitGame = function (slot0)
	slot3 = slot0

	BaseGameController.exitGame(slot2)

	slot3 = mainMgr

	mainMgr.onRestartTick2Gc(slot2)
end

FishingJoyController.praticeTipsTickCall = function (slot0)
	slot3 = slot0

	BaseGameController.praticeTipsTickCall(slot2)

	slot3 = slot0

	slot0.showPraticeTips(slot2)
end

FishingJoyController.createSeatBullet = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot3 == nil then
		return
	end

	slot11 = slot3

	if FishingJoy_Bullet[slot3.getFireMul(slot10) + 1] == nil then
		return
	end

	slot11 = "mainLogic.FishingJoyGameMgr"
	slot11 = FishingJoyRequireLua(slot10)
	slot11 = FishingJoyRequireLua(slot10).getInstance(slot10)
	slot12 = slot2

	if FishingJoyRequireLua(slot10).getInstance(slot10).getEntityLogic(slot10).findBulletFromContainer(slot10, FishingJoyRequireLua(slot10).getInstance(slot10).getEntityLogic(slot10)) then
		return
	end

	slot11 = slot3

	if slot3.getCannonConfig(slot10) == nil then
		return
	end

	slot12 = "mainLogic.FishingJoyGameMgr"
	slot12 = FishingJoyRequireLua(slot11)
	slot10 = FishingJoyRequireLua(slot11).getInstance(slot11).getBulletEntityClass(slot11).new()
	slot13 = slot10
	slot16 = slot3

	slot10.setCannonFireType(FishingJoyRequireLua(slot11).getInstance(slot11), slot3.getCannonFireType(slot15))
	slot10.setSeatId(FishingJoyRequireLua(slot11).getInstance(slot11), slot10)

	slot16 = slot9.Bullet.ResName
	slot13 = string.format(slot1, "res/gameres/module/fishingjoy/fishAnimations/bulletAni/%s")

	if not slot9.Bullet.Position then
		slot17 = 0
		slot14 = cc.p(slot15, 0)
	end

	slot19 = slot9.FishNet.ResName
	slot16 = string.format(slot17, slot11)

	if not slot9.FishNet.Position then
		slot20 = 0
		slot17 = cc.p(slot18, 0)
	end

	slot28 = slot12.ResType
	slot31 = slot12.ResName

	slot10.setBulletLiveRenderData(slot19, slot10, slot12.ResName, slot13, slot12.entityAniName, slot12.entityScale, slot14.x, slot14.y, 0, FishingJoy_RenderOrder_GetRenderOrder(slot30))

	slot28 = slot15.ResType
	slot31 = slot15.ResName

	slot10.setBulletDeadRenderData(slot19, slot10, slot15.ResName, slot16, slot15.entityAniName, slot15.entityScale, slot17.x, slot17.y, 0, FishingJoy_RenderOrder_GetRenderOrder(slot30))

	slot20 = "mainLogic.FishingJoyGameMgr"
	slot20 = FishingJoyRequireLua(slot19)
	slot18 = FishingJoyRequireLua(slot19).getInstance(slot19).getMoveDirectionComponent(slot19)
	slot22 = slot7

	slot18.setFixDirection(FishingJoyRequireLua(slot19).getInstance(slot19), slot18)

	slot22 = slot6

	slot18.setComponentDirection(FishingJoyRequireLua(slot19).getInstance(slot19), slot18)

	slot22 = slot8.bulletSpeed

	slot18.setMoveSpeed(FishingJoyRequireLua(slot19).getInstance(slot19), slot18)
	slot18.setEntityPosition(FishingJoyRequireLua(slot19).getInstance(slot19), slot18, slot4)

	slot22 = true

	slot18.setMoveRebound(FishingJoyRequireLua(slot19).getInstance(slot19), slot18)

	slot22 = slot2

	slot10.setEntityId(FishingJoyRequireLua(slot19).getInstance(slot19), slot10)

	slot22 = FISHINGJOY_ENTITY_STATUS.LIVE

	slot10.setEntityStatus(FishingJoyRequireLua(slot19).getInstance(slot19), slot10)

	slot22 = slot18

	slot10.setEntityMoveComponent(FishingJoyRequireLua(slot19).getInstance(slot19), slot10)

	slot21 = slot10
	slot24 = slot3

	slot10.setEntityTargetId(FishingJoyRequireLua(slot19).getInstance(slot19), slot3.getLockFishId(slot5))

	slot21 = "mainLogic.FishingJoyGameMgr"
	slot21 = FishingJoyRequireLua(FishingJoyRequireLua(slot19).getInstance(slot19))
	slot21 = FishingJoyRequireLua(FishingJoyRequireLua(slot19).getInstance(slot19)).getInstance(FishingJoyRequireLua(slot19).getInstance(slot19))
	slot22 = slot10

	FishingJoyRequireLua(FishingJoyRequireLua(slot19).getInstance(slot19)).getInstance(FishingJoyRequireLua(slot19).getInstance(slot19)).getEntityLogic(FishingJoyRequireLua(slot19).getInstance(slot19)).newBullet2Container(FishingJoyRequireLua(slot19).getInstance(slot19), FishingJoyRequireLua(FishingJoyRequireLua(slot19).getInstance(slot19)).getInstance(FishingJoyRequireLua(slot19).getInstance(slot19)).getEntityLogic(FishingJoyRequireLua(slot19).getInstance(slot19)))

	slot21 = Hero

	if slot1 == Hero.getWChairID(FishingJoyRequireLua(slot19).getInstance(slot19)) then
		slot22 = FISHINGJOY_SOUND_EFFECT.FIRE

		slot0.playFishingJoySoundEffect(slot20, slot0)
	end

	return slot10
end

FishingJoyController.createBullet = function (slot0, slot1, slot2, slot3)
	slot7 = slot1
	slot4 = slot0.getCannonPosition(slot5, slot0)
	slot8 = slot1

	if slot0.model.getFishingSeatBySeatId(slot0, slot0.model) == nil then
		return
	end

	slot10 = true

	slot0.model.setPlayCASeatId(slot7, slot0.model, slot1)

	slot6 = slot3

	if slot0.needAdjustIPhoneX then
		slot12 = math.cos(slot8) * slot0.serverWidthRatioClientWidth
		slot6 = math.atan2(slot6, math.sin(slot6) * slot0.serverHeightRatioClientHeight) + FISHINGJOY_HALF_PI
	end

	slot16 = slot3

	slot0.createSeatBullet(slot8, slot0, slot1, slot2, slot5, slot4.x, slot4.y, slot6)
end

FishingJoyController.killFish = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot2 then
		return
	end

	slot6 = slot2.getFishTypeId(slot7)
	slot7 = slot2:getEntityPosition()
	slot10 = "mainLogic.FishingJoyGameMgr"
	slot10 = FishingJoyRequireLua(slot2)
	slot8 = FishingJoyRequireLua(slot2).getInstance(slot2).getBulletEntityClass(slot2).new()
	slot12 = slot3

	slot8.setBulletScore(FishingJoyRequireLua(slot2).getInstance(slot2), slot8)

	slot12 = slot1

	slot8.setSeatId(FishingJoyRequireLua(slot2).getInstance(slot2), slot8)

	slot16 = slot5
	slot10, slot11 = slot2.executeFishEffects(slot8, slot2, slot8, slot9, false)
	slot15 = FISHINGJOY_ENTITY_STATUS.DEAD

	slot2.setEntityStatus(slot8, slot2)

	slot12 = slot2.getFishConfig(slot8)
	slot15 = slot2

	if slot2:getAppendParticle() == "" then
		slot15 = slot2

		if slot2.getFishType(slot14) ~= FISHINGJOY_SPECIAL_FISH_TYPE.NORMAL then
			slot15 = slot2

			if slot2.getAppendParticle(slot14) ~= "" then
				slot16 = {
					xPos = slot7.x,
					yPos = slot7.y,
					name = slot2.getAppendParticle(slot18)
				}
				slot19 = slot2

				slot0.model.setEffectPartical(slot14, slot0.model)
			else
				slot16 = {
					name = "bomb",
					xPos = slot7.x,
					yPos = slot7.y
				}

				slot0.model.setEffectPartical(slot14, slot0.model)
			end
		end
	end

	slot13 = slot4 / slot3

	if slot12.entityShowBingo and slot13 >= 80 then
		slot17 = {
			chair_id = slot1,
			score = slot4
		}

		slot0.model.setEffectBingo(slot15, slot0.model)
	end

	if slot13 >= 50 then
		slot17 = {
			name = "salute1",
			xPos = slot7.x,
			yPos = slot7.y
		}

		slot0.model.setEffectPartical(slot15, slot0.model)
	end

	slot14 = slot6 == 27 or slot6 == 30
	slot17 = Hero

	if slot1 == Hero.getWChairID(slot16) then
		if slot4 > 0 then
			slot14 = true
		end

		if slot13 < 30 then
			slot18 = FISHINGJOY_SOUND_EFFECT.CATCH

			slot0.playFishingJoySoundEffect(slot16, slot0)
		else
			slot18 = (slot13 < 80 and FISHINGJOY_SOUND_EFFECT.CATCH1) or FISHINGJOY_SOUND_EFFECT.CATCH2

			slot0.playFishingJoySoundEffect(slot16, slot0)
		end
	end

	if slot14 then
		slot18 = slot6

		slot0.playFishingJoyFishEffect(slot16, slot0)
	end

	if slot4 > 0 then
		slot17 = slot2
		slot20.posFishx, slot20.posFishy = slot2.getEntityRenderPositionNoOffset(slot16)
		slot21 = true

		slot0.model.setEffectFishGold(slot18, slot0.model, {
			seatId = slot1,
			posFishx = slot15,
			posFishy = slot16,
			finalScore = slot4,
			baseScore = slot3
		})
	end

	slot17 = slot2
	slot15 = slot2.getEntityId(slot16)
	slot16 = pairs
	slot18 = slot11 or {}

	for slot19, slot20 in slot16(slot17) do
		slot23 = slot20

		if slot20.getEntityId(slot22) ~= slot15 then
			slot28 = FISHINGJOY_KILL_BY_EFFECT

			slot0.killFish(slot22, slot0, slot1, slot20, slot3, 0)
		end
	end
end

FishingJoyController.realCreateFish = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot12 = slot1.entityRenderId

	if FishingJoy_FishRender_GetFishRenderData(slot11) == nil then
		return nil
	end

	if FISHINGJOY_ANDROID_PLATFORM then
		slot13 = slot10
		slot10 = TableUtil.copyDataDep(slot12)

		if slot1.entityRenderId >= 200 and slot1.entityRenderId <= 219 then
			slot11 = ipairs
			slot13 = slot10.entityLiveData or {}

			for slot14, slot15 in slot11(slot12) do
				if slot15.entityName == "shandian" then
					slot10.entityLiveData[slot14] = nil
				end
			end

			slot11 = ipairs
			slot13 = slot10.entityDieData or {}

			for slot14, slot15 in slot11(slot12) do
				if slot15.entityName == "shandianxianjie" then
					slot10.entityDieData[slot14] = nil
				end
			end
		end
	end

	slot13 = slot1.entityBoundingBoxId

	if FishingJoy_BoundingBox_GetBoundingBoxData(slot12).data == nil then
		return nil
	end

	slot14 = "mainLogic.FishingJoyGameMgr"
	slot14 = FishingJoyRequireLua(slot13)
	slot12 = FishingJoyRequireLua(slot13).getInstance(slot13).getFishEntityClass(slot13).new()
	slot16 = slot1.entityTypeId

	slot12.setFishTypeId(FishingJoyRequireLua(slot13).getInstance(slot13), slot12)

	slot16 = slot9

	slot12.setFishType(FishingJoyRequireLua(slot13).getInstance(slot13), slot12)

	slot16 = slot1.entityRenderId

	slot12.setEntityRenderId(FishingJoyRequireLua(slot13).getInstance(slot13), slot12)

	slot16 = slot10

	slot12.setFishRenderData(FishingJoyRequireLua(slot13).getInstance(slot13), slot12)

	slot16 = slot1.entityBoundingBoxId

	slot12.setBoundingBoxId(FishingJoyRequireLua(slot13).getInstance(slot13), slot12)

	slot13 = pairs
	slot15 = slot11 or {}

	for slot16, slot17 in slot13(slot14) do
		slot23 = slot17.radio

		slot12.appendBoundingBox(slot19, slot12, slot17.offset_x, slot17.offset_y)
	end

	if slot7 >= 0 then
		slot16 = slot7
		slot13, slot14 = FishingJoy_Path_GetPathDataAndDuration(slot14, slot8)

		if slot13 == nil or slot14 == nil then
			return nil
		end

		slot13.pathDuration = slot14.pathDuration
		slot17 = "mainLogic.FishingJoyGameMgr"
		slot17 = FishingJoyRequireLua(slot16)
		slot15 = FishingJoyRequireLua(slot16).getInstance(slot16).getMovePointComponent(slot16)
		slot19 = slot13

		slot15.setMovePathData(FishingJoyRequireLua(slot16).getInstance(slot16), slot15)

		slot18 = slot15
		slot22 = slot3

		slot15.setMoveOffset(FishingJoyRequireLua(slot16).getInstance(slot16), cc.p(slot20, slot2))

		slot19 = slot5

		slot15.setMoveDelay(FishingJoyRequireLua(slot16).getInstance(slot16), slot15)

		slot19 = slot6

		slot15.setMoveSpeed(FishingJoyRequireLua(slot16).getInstance(slot16), slot15)

		slot19 = slot15

		slot12.setEntityMoveComponent(FishingJoyRequireLua(slot16).getInstance(slot16), slot12)
	else
		slot15 = "mainLogic.FishingJoyGameMgr"
		slot13 = FishingJoyRequireLua(slot14).getInstance(slot14).getMoveDirectionComponent(slot14)
		slot17 = slot6

		slot13.setMoveSpeed(FishingJoyRequireLua(slot14).getInstance(slot14), slot13)

		slot17 = slot5

		slot13.setMoveDelay(FishingJoyRequireLua(slot14).getInstance(slot14), slot13)

		slot17 = slot4

		slot13.setComponentDirection(FishingJoyRequireLua(slot14).getInstance(slot14), slot13)

		slot18 = slot3

		slot13.setEntityPosition(FishingJoyRequireLua(slot14).getInstance(slot14), slot13, slot2)

		slot17 = slot7 == -1

		slot13.setMoveRebound(FishingJoyRequireLua(slot14), slot13)

		slot17 = slot13

		slot12.setEntityMoveComponent(FishingJoyRequireLua(slot14), slot12)
	end

	if slot1.entityBuff ~= nil then
		slot13 = pairs
		slot15 = slot1.entityBuff or {}

		for slot16, slot17 in slot13(slot14) do
			slot23 = slot17.buffLife

			slot12.appendEntityBuff(slot19, slot12, slot17.buffTypeId, slot17.buffParam)
		end
	end

	if slot1.entityEffect and #slot1.entityEffect > 0 then
		if slot9 == FISHINGJOY_SPECIAL_FISH_TYPE.KINGANDQUAN or slot9 == FISHINGJOY_SPECIAL_FISH_TYPE.KING then
			if slot12.SetSpecialShow ~= nil then
				slot16 = true

				slot12.SetSpecialShow(slot14, slot12)
			end

			slot15 = "mainLogic.FishingJoyGameMgr"
			slot15 = FishingJoyRequireLua(slot14)
			slot15 = FishingJoyRequireLua(slot14).getInstance(slot14)
			slot16 = FISHINGJOY_EFFECT_TYPE.KILL

			if FishingJoyRequireLua(slot14).getInstance(slot14).getEffectFactory(slot14).createEffect(slot14, FishingJoyRequireLua(slot14).getInstance(slot14).getEffectFactory(slot14)) then
				slot16 = slot1.entityTypeId

				if FishingJoy_Specila_GetFishKingConfig(slot15) then
					slot19 = 2

					slot13.setEffectParam(slot16, slot13, 0)

					slot19 = slot1.entityTypeId

					slot13.setEffectParam(slot16, slot13, 1)

					slot19 = slot14.entityMaxScore

					slot13.setEffectParam(slot16, slot13, 2)

					slot18 = slot13

					slot12.appendFishEffect(slot16, slot12)
				end
			end

			slot16 = "mainLogic.FishingJoyGameMgr"
			slot16 = FishingJoyRequireLua(slot15)
			slot16 = FishingJoyRequireLua(slot15).getInstance(slot15)
			slot17 = FISHINGJOY_EFFECT_TYPE.APPENDMONEY

			if FishingJoyRequireLua(slot15).getInstance(slot15).getEffectFactory(slot15).createEffect(slot15, FishingJoyRequireLua(slot15).getInstance(slot15).getEffectFactory(slot15)) then
				slot19 = 1

				slot14.setEffectParam(slot16, slot14, 0)

				slot19 = 10

				slot14.setEffectParam(slot16, slot14, 1)

				slot18 = slot14

				slot12.appendFishEffect(slot16, slot12)
			end
		end

		slot13 = pairs
		slot15 = slot1.entityEffect or {}

		for slot16, slot17 in slot13(slot14) do
			slot20 = "mainLogic.FishingJoyGameMgr"
			slot20 = FishingJoyRequireLua(slot19)
			slot20 = FishingJoyRequireLua(slot19).getInstance(slot19)
			slot21 = slot17.effectTypeId

			if FishingJoyRequireLua(slot19).getInstance(slot19).getEffectFactory(slot19).createEffect(slot19, FishingJoyRequireLua(slot19).getInstance(slot19).getEffectFactory(slot19)) then
				slot21 = slot18

				for slot23 = 0, slot18.getEffectParamSize(slot20), 1 do
					slot24 = 0

					if slot23 == 0 then
						slot24 = slot17.effectParam1
					elseif slot23 == 1 then
						slot24 = slot17.effectParam2
					elseif slot23 == 2 then
						slot24 = slot17.effectParam3
					elseif slot23 == 3 then
						slot24 = slot17.effectParam4
					elseif slot23 == 4 then
						slot24 = slot17.effectParam5
					elseif slot23 == 5 then
						slot24 = slot17.effectParam6
					elseif slot23 == 6 then
						slot24 = slot17.effectParam7
					elseif slot23 == 7 then
						slot24 = slot17.effectParam8
					end

					if slot24 == nil then
						slot24 = 0
					end

					if slot9 == FISHINGJOY_SPECIAL_FISH_TYPE.SANYUAN and slot23 == 1 then
						slot29 = slot24 * 3

						slot18.setEffectParam(slot26, slot18, slot23)
					elseif slot9 == FISHINGJOY_SPECIAL_FISH_TYPE.SIXI and slot23 == 1 then
						slot29 = slot24 * 4

						slot18.setEffectParam(slot26, slot18, slot23)
					else
						slot29 = slot24

						slot18.setEffectParam(slot26, slot18, slot23)
					end
				end

				slot23 = slot18

				slot12.appendFishEffect(slot21, slot12)
			end
		end

		if slot9 == FISHINGJOY_SPECIAL_FISH_TYPE.KINGANDQUAN then
			slot15 = "mainLogic.FishingJoyGameMgr"
			slot15 = FishingJoyRequireLua(slot14)
			slot15 = FishingJoyRequireLua(slot14).getInstance(slot14)
			slot16 = FISHINGJOY_EFFECT_TYPE.CREATE

			if FishingJoyRequireLua(slot14).getInstance(slot14).getEffectFactory(slot14).createEffect(slot14, FishingJoyRequireLua(slot14).getInstance(slot14).getEffectFactory(slot14)) then
				slot18 = slot1.entityTypeId

				slot13.setEffectParam(slot15, slot13, 0)

				slot18 = 3

				slot13.setEffectParam(slot15, slot13, 1)

				slot18 = 30

				slot13.setEffectParam(slot15, slot13, 2)

				slot18 = 1

				slot13.setEffectParam(slot15, slot13, 3)

				slot17 = slot13

				slot12.appendFishEffect(slot15, slot12)
			end
		end
	end

	return slot12
end

FishingJoyController.getMyBulletId = function (slot0)
	slot3 = Hero
	slot1 = Hero.getWChairID(slot2)

	if slot0.bulletRecordId == nil or slot0.bulletRecordId >= 20000 then
		slot0.bulletRecordId = 0
	end

	slot0.bulletRecordId = slot0.bulletRecordId + 1

	return slot1 * 20000 + slot0.bulletRecordId
end

FishingJoyController.playerFireTo = function (slot0, slot1)
	slot2 = slot0.getMyBulletId(slot3)
	slot5 = Hero
	slot3 = Hero.getWChairID(slot0)

	if FISHINGJOY_ANDROID_PLATFORM then
		slot7 = slot0
		slot7 = {
			wChairID = slot3,
			fDirection = slot1,
			dwFireTime = slot0.getServerTick(slot6),
			dwClientID = slot2
		}

		reqFISHINGJOYMsgFire(slot6)
	else
		slot6 = "协议解析：FISHINGJOY_FISH_CMD_C_FIRE"

		DebugUtil.beginMark(slot5)

		slot4 = ""
		slot5 = ByteArray.new()
		slot11 = true

		slot5.writeUShort(slot8, slot5, slot3)
		slot5.writeFloat(slot8, slot5, slot1)

		slot12 = slot0
		slot11 = true

		slot5.writeUInt(slot8, slot5, slot0.getServerTick(slot6))

		slot11 = true

		slot5.writeUInt(slot8, slot5, slot2)

		slot10 = 1

		slot5.setPosition(slot8, slot5)

		slot9 = slot5
		slot9 = "协议解析：FISHINGJOY_FISH_CMD_C_FIRE"

		DebugUtil.endMark(slot8)

		slot10 = true

		reqFISHINGJOYMsgFire(slot8, slot5.toString(slot8))
	end

	slot0.localBulletContainer[slot2] = 1
	slot9 = slot0.model
	slot7 = slot0.model.getSelfBulletCount(slot8) + 1

	slot0.model.setSelfBulletCount(1, slot0.model)

	slot9 = slot1

	slot0.createBullet(1, slot0, slot3, slot2)
end

FishingJoyController.bulletHitFish = function (slot0, slot1, slot2)
	slot3 = Hero.getWChairID(slot4)
	slot7 = slot2
	slot5 = slot2.getEntityId(slot1)

	if slot1.getEntityId(Hero) == 190000 then
		slot9 = FISHINGJOY_ENTITY_STATUS.DESTORY

		slot1.setEntityStatus(slot7, slot1)

		slot9 = slot3

		if slot0.model.getFishingSeatBySeatId(slot7, slot0.model) ~= nil then
			slot10 = slot5

			slot6.setLockFishId(slot8, slot6)

			slot11 = slot6

			slot0.model.setFishingSeatBySeatId(slot8, slot0.model, slot3)
		end

		slot9 = {
			dwFishID = slot5
		}

		reqFISHINGJOYMsgLockSomeFish(slot8)
	elseif slot4 >= slot3 * 20000 + 1 and slot4 <= slot3 * 20000 + 20000 then
		slot10 = slot4

		slot0.removeSelfBullets(slot8, slot0)

		slot9 = {
			dwData = 0,
			dwBulletID = slot4,
			dwFishID = slot5
		}

		reqFISHINGJOYMsgNetCast(slot8)
	else
		slot9 = slot4

		print(slot7, "他人不上报.")
	end
end

FishingJoyController.removeSelfBullets = function (slot0, slot1)
	if slot0.localBulletContainer[slot1] ~= nil then
		slot7 = slot0.model
		slot5 = slot0.model.getSelfBulletCount(slot6) - 1

		slot0.model.setSelfBulletCount(slot3, slot0.model)

		slot0.localBulletContainer[slot1] = nil
	end
end

FishingJoyController.sendMsgChangeCannon = function (slot0, slot1)
	slot4 = slot1

	reqFISHINGJOYMsgChangeCannon(slot3)
end

FishingJoyController.setLockFish = function (slot0, slot1)
	slot4 = slot0.model
	slot7 = Hero

	if slot0.model.getFishingSeatBySeatId(slot3, Hero.getWChairID(slot6)) == nil then
		return
	end

	slot6 = slot1

	slot0.model.setLockFish(slot4, slot0.model)

	slot6 = slot1

	slot2.setLockingFish(slot4, slot2)

	slot5 = {
		wChairID = Hero.getWChairID(slot7),
		bLock = slot1
	}
	slot8 = Hero

	reqFISHINGJOYMsgLockFish(slot4)
end

FishingJoyController.setChangeSpeed = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurrentFireRate(slot2) == 1 then
		slot1 = 2
	elseif slot1 == 2 then
		slot1 = 4
	elseif slot1 == 4 then
		slot1 = 1
	end

	slot5 = slot1

	slot0.model.setCurrentFireRate(slot3, slot0.model)
end

FishingJoyController.checkSyncedSelfScore = function (slot0)
	return slot0.syncedScore
end

FishingJoyController.setSyncSelfScore = function (slot0, slot1)
	slot0.syncedScore = slot1
end

FishingJoyController.destroy = function (slot0)
	slot0.model = nil
end

return
