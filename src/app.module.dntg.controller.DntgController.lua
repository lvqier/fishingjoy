DntgController = class("DntgController")

requireLuaFromModule("dntg.model.Dntg_Fish")
requireLuaFromModule("dntg.model.Dntg_Duration")
requireLuaFromModule("dntg.model.Dntg_TroopDuration")
requireLuaFromModule("dntg.model.Dntg_BoundingBox")
requireLuaFromModule("dntg.model.Dntg_System")
requireLuaFromModule("dntg.model.Dntg_Special")

slot0 = requireLuaFromModule("dntg.model.DntgModel+Fish")
slot1 = requireLuaFromModule("dntg.Effect.EffectFatory")
slot2 = requireLuaFromModule("dntg.Effect.EffectAddMoney")
slot3 = requireLuaFromModule("dntg.Effect.EffectKill")
slot4 = requireLuaFromModule("dntg.Effect.EffectAddBuffer")
slot5 = requireLuaFromModule("dntg.Effect.EffectProduce")
slot6 = requireLuaFromModule("dntg.Effect.EffectBlackWater")
slot7 = requireLuaFromModule("dntg.Effect.EffectAward")
slot8 = requireLuaFromModule("dntg.model.DntgModel+Bullet")
slot9 = requireLuaFromModule("dntg.model.DntgModel+Player")

DntgController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	mainMgr:onStopTick2Gc()
	slot0:adjustIX()
	slot0.model:setSwitchStatePos({
		onX = 155.4,
		offX = 86.4
	})

	slot0.battleView = nil
	slot0.tBulletID = {}
	slot0._cannonTick = {}

	slot0:resetBattle()

	slot0.effectFatory = slot0.new()

	slot0.effectFatory:Register(DNTG_EffectType.ETP_ADDMONEY, slot1)
	slot0.effectFatory:Register(DNTG_EffectType.ETP_KILL, slot0.effectFatory.Register)
	slot0.effectFatory:Register(DNTG_EffectType.ETP_ADDBUFFER, slot0.effectFatory)
	slot0.effectFatory:Register(DNTG_EffectType.ETP_PRODUCE, )
	slot0.effectFatory:Register(DNTG_EffectType.ETP_BLACKWATER, DNTG_EffectType.ETP_PRODUCE)
	slot0.effectFatory:Register(DNTG_EffectType.ETP_AWARD, slot6)

	slot0._resProcessConfigs = {
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/dntg_num_plist"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/dntg_battle_ui"
		},
		{
			type = "jpg",
			url = "fishgame2d/scene/Map_0"
		},
		{
			type = "jpg",
			url = "fishgame2d/scene/Map_1"
		},
		{
			type = "jpg",
			url = "fishgame2d/scene/Map_2"
		},
		{
			type = "jpg",
			url = "fishgame2d/scene/Map_3"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/effect_bg_water/effect_bg_water0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/effect_bg_water/effect_bg_water1"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/effect_bg_water/effect_bg_water2"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/dntg_bullet0/dntg_bullet0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/dntg_bullet1/dntg_bullet1"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/dntg_bullet2/dntg_bullet2"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/dntg_bullet3/dntg_bullet3"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/effect_transition_water/effect_transition_water0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/effect_transition_water/effect_transition_water1"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_1/fish_10"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_2/fish_20"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_3/fish_30"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_4/fish_40"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_5/fish_50"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_6/fish_60"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_7/fish_70"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_8/fish_80"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_9/fish_90"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_10/fish_100"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_11/fish_110"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_12/fish_120"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_13/fish_130"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_14/fish_140"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_15/fish_150"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_16/fish_160"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_17/fish_170"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_18/fish_180"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_21/fish_210"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_26/fish_260"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_28/fish_280"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_29/fish_290"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_33/fish_330"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_35/fish_350"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_36/fish_360"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_37/fish_370"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_40/fish_400"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_41/fish_410"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_42/fish_420"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_45/fish_450"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_47/fish_470"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_48/fish_480"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_49/fish_490"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_50/fish_500"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_52/fish_520"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish_55/fish_550"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish24_die/fish24_die0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish24_move/fish24_move0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish25_die/fish25_die0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish25_move/fish25_move0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish32_die_suo/fish32_die_suo0"
		},
		{
			type = "plist",
			url = "fishgame2d/animation/fish32_move/fish32_move0"
		},
		{
			type = "plist",
			url = "fishgame2d/ui/fish_jinbi_1/dntg_fish_jinbi_10"
		}
	}

	for slot6, slot7 in pairs(slot2) do
		slot0._resProcessConfigs[#slot0._resProcessConfigs + 1] = slot7
	end

	if isAndroid then
		slot3 = {
			["effect/CJ.mp3"] = 4,
			["effect/BigBang.mp3"] = 2,
			["effect/Bigfireworks.mp3"] = 1
		}

		for slot7 = 0, 17, 1 do
			slot3["effect/Fisha" .. slot7 .. ".mp3"] = 3
		end

		slot0:setEffectPriorityConfig(slot3)
		slot0:setSingleFrameMaxEffect(2)
	end

	slot0:adjustIX()
end

DntgController.onGameLuckMoneyMessage = function (slot0, slot1)
	BaseGameController.onGameLuckMoneyMessage(slot0, slot1)

	slot1.playAni = true

	if fishgame.FishObjectManager:GetInstance():FindFish(slot1.dwParam) ~= nil then
		slot1.fishPosition = slot2:GetPosition()

		slot0.model:setLuckPacketEvt(slot1, true)
	end
end

DntgController.onGameLuckMoneyEnterMessage = function (slot0, slot1)
	BaseGameController.onGameLuckMoneyEnterMessage(slot0, slot1)

	slot1.playAni = false

	slot0.model:setLuckPacketEvt(slot1, true)
end

DntgController.adjustIX = function (slot0)
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

DntgController.isNeedAdjustIx = function (slot0)
	return slot0._needAdjustIx
end

DntgController.getIXOffsetX = function (slot0)
	return slot0._ixOffsetx
end

DntgController.getIxScreenPixel = function (slot0)
	return slot0._realScreenW, slot0._realScreenH
end

DntgController.adjustNode = function (slot0, slot1)
	if slot0._needAdjustIx then
		slot1:setPositionX(slot1:getPositionX() + slot0._ixOffsetx)
	end
end

DntgController.restoreNode = function (slot0, slot1)
	if slot0._needAdjustIx then
		slot1:setPositionX(slot1:getPositionX() - slot0._ixOffsetx)
	end
end

DntgController.registerListeners = function (slot0)
	BaseGameController.registerListeners(slot0)
	fishgame.FishObjectManager:GetInstance():RegisterBulletHitFishHandler(handler(slot0, slot0.onActionBulletHitFish))
end

DntgController.onViewTypeChanged = function (slot0)
	if slot0.model:getCurShowingViewType() == VIEW_TYPE_BATTLE then
		slot0.model:setIsShowingBattleLoading(true)
		slot0.model:setBBattle(true)
	end

	BaseGameController.onViewTypeChanged(slot0)
end

DntgController.loadSystemConfig = function (slot0)
	slot1 = Dntg_System.SystemSet.DefaultScreenSet
	slot2 = CONFIG_DESIGN_WIDTH
	slot3 = CONFIG_DESIGN_HEIGHT

	if slot0:isNeedAdjustIx() then
		slot2, slot3 = slot0:getIxScreenPixel()
	end

	slot0:setBattleLayerSize(slot1.width, slot1.height, slot2, slot3)
end

DntgController.SetGameLoaded = function (slot0, slot1)
	fishgame.FishObjectManager:GetInstance():SetGameLoaded(slot1 or false)

	if fishgame.FishObjectManager:GetInstance().SetIsUpdateCacheForFish ~= nil then
		fishgame.FishObjectManager:GetInstance():SetIsUpdateCacheForFish(DNTG_IS_UPDATE_CACHE)
	end

	if fishgame.FishObjectManager:GetInstance().SetIsUpdateCacheForBullet ~= nil then
		fishgame.FishObjectManager:GetInstance():SetIsUpdateCacheForBullet(DNTG_IS_UPDATE_CACHE)
	end
end

DntgController.exitGame = function (slot0, slot1)
	BaseGameController.exitGame(slot0, slot1)
	mainMgr:onRestartTick2Gc()
end

DntgController.resetBattle = function (slot0)
	for slot4, slot5 in pairs(slot0._cannonTick) do
		if slot5.timer then
			slot5.timer:stop()
		end
	end

	slot0._cannonTick = {}
	slot0.tBulletID = {}

	slot0.model:setBulletCount(0, true)
	slot0.model:setCurrSceneId(-1)
	slot0.model:reset()
	slot0:resetTimeService()
	slot0:loadSystemConfig()
	slot0:resetDntgSoundManager()
	slot0:setSyncSelfScore(false)
	slot0.model:setIsShowingExit(false)

	slot0.nBulletID = 0
	slot0.cbMulti = nil

	slot0:SetGameLoaded(false)
	fishgame.FishObjectManager:GetInstance():RemoveAllBullets(true)
	fishgame.FishObjectManager:GetInstance():RemoveAllFishes(true)
	fishgame.FishObjectManager:GetInstance():RegisterBulletHitFishHandler(handler(slot0, slot0.onActionBulletHitFish))
end

DntgController.onUserScore = function (slot0, slot1)
	if slot1 and slot1.dwUserID == Hero:getDwUserID() then
		Hero:setUserScore(slot1.lScore)
	end

	if slot1.wTableID == Hero:getWTableID() and US_FREE < slot1.cbUserStatus and slot1.cbUserStatus ~= US_LOOKON and slot1.wChairID ~= INVALID_WORD and slot0.model:getPlayerByChairID(slot1.wChairID) ~= nil then
		slot2:SetScore(slot1.lScore)
		slot0.model:setPlayerByChairID(slot1.wChairID, slot2)

		if slot1.wChairID == Hero:getWChairID() then
			Hero:setUserScore(slot1.lScore)
		end
	end
end

DntgController.onUserEnter = function (slot0, slot1)
	return
end

DntgController.onUserStatus = function (slot0, slot1)
	if slot1.cbUserStatus == US_LOOKON then
		return
	end

	if US_FREE < slot1.cbUserStatus and slot1.cbUserStatus ~= US_LOOKON then
		if slot1.wTableID ~= Hero:getWTableID() then
			return
		end

		if slot0.model:getPlayerByChairID(slot1.wChairID) == nil then
			slot0.new(slot1.wChairID):SetRoomKind(slot0.model:getRoomKind())
		end

		slot2:SetUserId(slot1.dwUserID)
		slot2:SetNickName(slot1.szNickName)
		slot2:SetScore(slot1.lScore)

		slot2.hasPlayerInfo = false

		if slot1.lScore > 0 and slot1.wChairID == Hero:getWChairID() then
			Hero:setUserScore(slot1.lScore)
		end

		slot0.model:setPlayerByChairID(slot1.wChairID, slot2)
	else
		for slot6, slot7 in pairs(slot2) do
			if slot1.dwUserID == slot7:GetUserId() then
				slot2[slot6] = nil

				slot0.model:setFishPlayer(slot2, true)

				if slot1.dwUserID == Hero:getDwUserID() then
					slot0:exitBattle()
				end

				break
			end
		end
	end
end

DntgController.praticeTipsTickCall = function (slot0)
	BaseGameController.praticeTipsTickCall(slot0)
	slot0:showPraticeTips()
end

DntgController.onRoomLoginFinish = function (slot0)
	slot0:reConnetServer()
	gameMgr:setGameStackMsgs({})
	gameMgr:setNeedStoreGameStackMsg(false)
end

DntgController.onGameSceneByServer = function (slot0, slot1)
	return
end

DntgController.reConnetServer = function (slot0)
	slot0:resetTimeService()
	slot0.model:setBulletCount(0, true)
	slot0.model:setBAutoAttack(false, true)
	slot0.model:setBLockFish(false, true)
	fishgame.FishObjectManager:GetInstance():RegisterBulletHitFishHandler(handler(slot0, slot0.onActionBulletHitFish))
	fishgame.FishObjectManager:GetInstance():RemoveAllBullets(true)
	fishgame.FishObjectManager:GetInstance():RemoveAllFishes(true)
	gameMgr:setGameStackMsgs({})
	gameMgr:setNeedStoreGameStackMsg(false)
end

DntgController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == DNTG_SUB_S_TIME_SYNC then
		slot0:onMsgTimeSync(slot1)
	elseif slot2 == DNTG_SUB_S_SEND_FISH then
		slot0:onMsgCreateFish(slot1)
	elseif slot2 == DNTG_SUB_S_USER_INFO then
		slot0:onMsgPlayerInfo(slot1)
	elseif slot2 == DNTG_SUB_S_CHANGE_SCORE then
		slot0:onMsgChangeScore(slot1)
	elseif slot2 == DNTG_SUB_S_CANNON_SET then
		slot0:onMsgCannonSet(slot1)
	elseif slot2 == DNTG_SUB_S_SEND_BULLET then
		slot0:onMsgCreateBullet(slot1)
	elseif slot2 == DNTG_SUB_S_KILL_FISH then
		slot0:onMsgKillFish(slot1)
	elseif slot2 == DNTG_SUB_S_KILL_BULLET then
		slot0:onMsgKillBullet(slot1)
	elseif slot2 == DNTG_SUB_S_SWITCH_SCENE then
		slot0:onMsgSwitchScene(slot1)
	elseif slot2 == DNTG_SUB_S_ALLOW_FIRE then
		slot0:onMsgAllowFire(slot1)
	elseif slot2 == DNTG_SUB_S_GAME_CONFIG then
		slot0:onMsgGameConfig(slot1)
	elseif slot2 == DNTG_SUB_S_LOCK_FISH then
		slot0:onMsgLockFish(slot1)
	elseif slot2 == DNTG_SUB_S_SEND_DES then
		slot0:onMsgSendDes(slot1)
	elseif slot2 == DNTG_SUB_S_FORCE_TIME_SYNC then
		slot0:onMsgForceTimeSync(slot1)
	elseif slot2 == DNTG_SUB_S_BULLET_SET then
		slot0:onMsgBulletSet(slot1)
	elseif slot2 == DNTG_SUB_S_ADD_BUFFER then
		slot0:onMsgAddBuffer(slot1)
	elseif slot2 == DNTG_SUB_S_FIRE_FAILE then
		slot0:onMsgFireFailed(slot1)
	elseif slot2 == DNTG_SUB_S_ACTIVITY_NOTIFY then
		slot0:onMsgActivityNotice(slot1)
	elseif slot2 == DNTG_SUB_S_FISH_MUL then
		slot0:onMsgFishMul(slot1)
	elseif slot2 == DNTG_SUB_S_SCORE_SYNC then
		slot0:onMsgScoreSync(slot1)
	elseif slot2 == DNTG_SUB_S_SPEEDUP then
		slot0:onMsgChangeSpeedUp(slot1)
	end
end

DntgController.onMsgChangeSpeedUp = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SPEEDUP") and slot0.model:getPlayerByChairID(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SPEEDUP").wChairID) ~= nil then
		slot3:SetBulletSpeedRate(slot2.cbSpeedMul, slot2.dwStartTick)
		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)
	end
end

DntgController.onMsgTimeSync = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_TIME_SYNC") then
		if not Hero:getWChairID() == ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_TIME_SYNC").wChiarID then
			return
		end

		if slot0:BeReady() == false then
			reqDNTGBReady()
		end

		slot0:TimerSync(slot2.dwClientTick, slot2.dwServerTick)
		slot0:SetSyncTime(socket.gettime())
	end
end

DntgController.onMsgGameConfig = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_GameConfig") then
		if ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_GameConfig").nMaxInterval < 1000 then
			slot2.nMaxInterval = 90000
		end

		slot2.nFireInterval = slot2.nFireInterval / 1000
		slot2.nMaxInterval = slot2.nMaxInterval / 1000

		if slot2.nMaxBulletCount == nil then
			slot2.nMaxBulletCount = 80
		end

		slot0.model:setGameconfig(slot2)
		reqDNTGChangeScore({
			bAdd = true,
			bAddAll = true,
			wChairID = Hero:getWChairID()
		})
	end
end

DntgController.onMsgBulletSet = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_BULLET_SET") then
		if ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_BULLET_SET").bFirst then
			Dntg_BulletSet = {
				BulletSet = {}
			}
		end

		table.insert(Dntg_BulletSet.BulletSet, {
			BulletSize = slot2.nBulletSize,
			CannonType = slot2.nCannonType,
			Speed = slot2.nSpeed,
			Mulriple = slot2.nMulriple,
			MaxCatch = slot2.nMaxCatch,
			CatchRadio = slot2.nCatchRadio
		})
	end
end

DntgController.onMsgPlayerInfo = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_USER_INFO") then
		if Hero:getWChairID() == ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_USER_INFO").wChairID then
			reqDNTGMsgSyncTime({
				wChairID = Hero:getWChairID(),
				dwClientTick = slot0:GetClientTick()
			})

			slot3 = slot0.model:getMirror()
			slot4 = false

			if slot2.wChairID == 0 or slot2.wChairID == 1 then
				fishgame.FishObjectManager:GetInstance():SetMirrowShow(true)
				slot0.model:setMirror(true)
				slot0:SetMirrowShow(true)

				if slot3 == false then
					slot4 = true
				end
			else
				fishgame.FishObjectManager:GetInstance():SetMirrowShow(false)
				slot0.model:setMirror(false)
				slot0:SetMirrowShow(false)

				if slot3 == true then
					slot4 = true
				end
			end

			if slot4 == true then
				for slot9, slot10 in pairs(slot5) do
					slot10:SetUpdateNickName()
					slot10:SetUpdateCannonDirection()
					slot10:SetUpdateScore()
					slot10:SetUpdateCannon()
					slot10:SetShowMyPosition()
				end

				slot0.model:setFishPlayer(slot5)
			end
		end

		if slot0.model:getPlayerByChairID(slot2.wChairID) == nil then
			slot0.new(slot2.wChairID):SetRoomKind(slot0.model:getRoomKind())

			slot0.new(slot2.wChairID).hasPlayerInfo = false
		end

		if slot3.hasPlayerInfo then
			return
		end

		slot3.hasPlayerInfo = true

		slot3:SetCannonMultiply(slot2.nCannonMul)
		slot3:SetCannonType(slot2.nCannonType)
		slot3:SetScore(slot2.lScore)

		if slot2.lScore > 0 and slot2.wChairID == Hero:getWChairID() then
			Hero:setUserScore(slot2.lScore)
		end

		if gameMgr:getUserDataByChairId(slot2.wChairID) then
			slot3:SetNickName(slot4.szNickName)
			slot3:SetUserId(slot4.dwUserID)
		end

		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)
	end
end

DntgController.onMsgChangeScore = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_CHANGE_SCORE") then
		if slot0.model:getPlayerByChairID(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_CHANGE_SCORE").wChairID) == nil then
			return
		end

		slot3:SetScore(slot2.lFishScore)

		if slot2.lFishScore > 0 and slot2.wChairID == Hero:getWChairID() then
			Hero:setUserScore(slot2.lFishScore)
		end

		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)

		if slot0:GetChairID() == Hero:getWChairID() and slot2.lFishScore > 0 then
			slot0:playDntgGameEffect(DNTG_GAME_EFFECT.INSERT)
		end
	end
end

DntgController.onMsgCannonSet = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_CANNON_SET") then
		if slot0.model:getPlayerByChairID(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_CANNON_SET").wChairID) == nil then
			return
		end

		if slot2.wChairID == Hero:getWChairID() then
			if slot2.cannonSet == 0 then
				slot0.model:setIsEnergyCannon("no")
			else
				slot0.model:setIsEnergyCannon("yes")
			end
		end

		if not slot0._cannonTick[slot2.wChairID] then
			function cannonTickCallBack()
				if not slot0._isEnterBack and slot0._cannonTick[slot1.wChairID] then
					count = slot0._cannonTick[slot1.wChairID].count
					count = count + 1
					count + 1._cannonTick[slot1.wChairID.wChairID].count = count

					if count > 7 then
						if slot0.model:getPlayerByChairID(slot1.wChairID) and slot0:GetCannonSetType() ~= 0 then
							if slot1.wChairID == Hero:getWChairID() then
								slot0.model:setIsEnergyCannon("no")
							end

							slot0:SetCannonSetType(0)
							slot0:SetUpdateCannon()
							slot0.model:setPlayerByChairID(slot1.wChairID, slot0)
						end

						if slot0._cannonTick[slot1.wChairID].timer then
							slot0._cannonTick[slot1.wChairID].timer:stop()
						end

						slot0._cannonTick[slot1.wChairID] = nil
					end
				end
			end

			_tick = tickMgr:delayedCall(cannonTickCallBack, 1000, -1)

			_tick:start()

			slot0._cannonTick[slot2.wChairID] = {
				count = 0,
				timer = _tick
			}
		end

		slot3:SetCannonSetType(slot2.cannonSet)
		slot3:SetCannonType(slot2.cannonType)
		slot3:SetCannonMultiply(slot2.cannonMul)
		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)
	end
end

DntgController.CreateChairBullet = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = nil

	if ((Dntg_BulletSet ~= nil and Dntg_BulletSet.BulletSet ~= nil) or Dntg_BulletSetLocal[gameMgr:getCurRoomKind()]) and Dntg_BulletSet.BulletSet[slot3:GetCannonMultiply() + 1] == nil then
		return
	end

	if slot3 == nil then
		print("玩家不存在，不能发射子弹")

		return
	end

	if slot3:GetCannonConfig() == nil then
		return
	end

	slot10 = slot0.new()

	slot10:SetChairID(slot1)
	slot10:SetCannonSetType(slot3:GetCannonSetType())
	slot10:SetCannonType(slot3:GetCannonType())
	slot10:SetVisualData(slot2, slot2)

	slot11 = "res/gameres/module/dntg/fishgame2d/animation/"

	for slot15 = 1, #slot9.Bullet, 1 do
		slot17 = slot11 .. slot9.Bullet[slot15].ResName .. "/" .. slot9.Bullet[slot15].ResName

		if slot10.AddVisualLiveDataWithZOrder ~= nil then
			slot10:AddVisualLiveDataWithZOrder(slot16.ResName, slot17, slot16.Name, slot16.Scale, 0, 0, 0, slot16.ResType, 100)
		else
			slot10:AddVisualLiveData(slot16.ResName, slot17, slot16.Name, slot16.Scale, 0, 0, 0, slot16.ResType)
		end
	end

	for slot15 = 1, #slot9.Net, 1 do
		slot17 = slot11 .. slot9.Net[slot15].ResName .. "/" .. slot9.Net[slot15].ResName

		if slot10.AddVisualDieDataWithZOrder ~= nil then
			slot10:AddVisualDieDataWithZOrder(slot16.ResName, slot17, slot16.Name, slot16.Scale, 0, 0, 0, slot16.ResType, 101)
		else
			slot10:AddVisualDieData(slot16.ResName, slot17, slot16.Name, slot16.Scale, 0, 0, 0, slot16.ResType)
		end
	end

	slot10:SetCatchRadio(slot8.CatchRadio)

	slot12 = fishgame.MoveByDirection:create()

	slot12:SetSpeed(slot8.Speed)
	slot12:SetDirection(slot6)
	slot12:SetPosition(slot4, slot5)
	slot12:SetRebound(true)
	slot10:SetMoveCompent(slot12)
	slot10:SetState(DNTG_EOS_OBJ.EOS_LIVE)
	slot10:SetId(slot2)
	slot10:SetTarget(slot13)
	fishgame.FishObjectManager:GetInstance():AddBullet(slot10)

	return slot10
end

DntgController.createBullet = function (slot0, slot1, slot2, slot3)
	slot4, slot5 = slot0:GetCannonPosition(slot1)

	if slot0.model:getPlayerByChairID(slot1) == nil then
		print("没有找到玩家椅子号是 " .. tostring(slot1) .. " 的玩家。")

		return
	end

	slot0.model:setPlayerCannonAnimation(slot1, true)

	slot7 = slot3

	if slot0._needAdjustIx then
		slot7 = math.atan2(slot9, math.cos(slot7) * slot0.widthRatioSC) + M_PI_2
	end

	slot0:CreateChairBullet(slot1, slot2, slot6, slot4, slot5, slot7)
end

DntgController.onMsgCreateBullet = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SEND_BULLET") then
		slot2 = nil

		if isAndroid then
			slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SEND_BULLET")
		else
			DebugUtil.beginMark("协议解析：DNTGT_FISH_CMD_S_SEND_BULLET")

			slot2 = {
				dwID = slot4:readUInt(slot3),
				wChairID = slot4:readUShort(slot3),
				dwCreateTick = slot4:readUInt(slot3),
				fXpos = slot4:readFloat(slot3),
				fYPos = slot4:readFloat(slot3),
				nCannonType = slot4:readInt(slot3),
				nMultiply = slot4:readInt(slot3),
				lScore = slot4:readByte2Integer(8, true, false),
				fDirection = slot4:readFloat(slot3),
				bNew = slot4:readBool(slot3),
				dwServerTick = slot4:readUInt(slot3),
				IsDouble = slot4:readBool(true)
			}
			slot4 = ByteArray.new(slot1)

			DebugUtil.endMark("协议解析：DNTGT_FISH_CMD_S_SEND_BULLET")
		end

		if slot0.model:getPlayerByChairID(slot2.wChairID) == nil then
			print("没有玩家")

			return
		end

		if slot2.lScore > 0 and slot2.wChairID == Hero:getWChairID() then
			slot0.model:updateCostBulletCount(slot3:GetScore() - slot2.lScore)
		end

		slot3:SetScore(slot2.lScore)

		if slot2.lScore > 0 and slot2.wChairID == Hero:getWChairID() then
			Hero:setUserScore(slot2.lScore)
		end

		if Hero:getWChairID() == slot2.wChairID then
			if slot0.nBulletID == nil or slot0.nBulletID == 0 then
				slot0.nBulletID = slot2.dwID - slot2.wChairID * 20000
			end

			if slot0:getMaxDiffrence() < slot0:GetDelayTick(slot2.dwServerTick) then
				reqDNTGMsgSyncTime({
					wChairID = Hero:getWChairID(),
					dwClientTick = slot0:GetClientTick()
				})
			end

			slot0:playDntgGameEffect(DNTG_GAME_EFFECT.FIRE)
		else
			if slot2.bNew then
				if slot3:GetLockFishID() == 0 then
					if slot2.wChairID == 2 or slot2.wChairID == 3 then
						slot3:GetCannon():SetCannonAngle(M_PI - slot2.fDirection)
					else
						slot3:GetCannon():SetCannonAngle(slot2.fDirection)
					end
				end

				slot0.model:setPlayerCannonAnimation(slot2.wChairID)
			end

			slot0:createBullet(slot2.wChairID, slot2.dwID, slot2.fDirection)
		end

		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)
	end
end

DntgController.onMsgKillFish = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_KILL_FISH") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_KILL_FISH")
		slot3 = slot2.wChairID
		slot6 = slot2.lScore / slot2.nBScoe

		slot0:KillFish(slot2.wChairID, fishgame.FishObjectManager:GetInstance():FindFish(slot2.dwFishID), slot2.nBScoe, slot2.lScore)

		if slot0.model:getPlayerByChairID(slot2.wChairID) ~= nil then
			slot8:SetScore(slot8:GetScore() + slot2.lScore)
			slot0.model:setPlayerByChairID(slot2.wChairID, slot8)

			if slot2.wChairID == Hero:getWChairID() then
				Hero:setUserScore(slot8:GetScore())
				slot0.model:updateGetGoldCount(slot2.lScore)
			end
		end
	end
end

DntgController.KillFish = function (slot0, slot1, slot2, slot3, slot4)
	if not slot2 then
		return
	end

	slot5 = slot0.new()

	slot5:SetScore(slot3)
	slot5:SetChairID(slot1)

	slot7, slot8 = slot2:ExecuteEffects(slot5, slot6, false)

	slot2:SetState(DNTG_EOS_OBJ.EOS_DEAD)

	if slot1 == Hero:getWChairID() then
		slot0.model:updateKillFish(slot2:GetTypeID())
	end

	slot9 = slot2:GetFishCofigData()

	if slot2:GetParticle() ~= "" or slot2:GetFishType() ~= DNTG_SpecialFishType.ESFT_NORMAL then
		if slot2:GetParticle() ~= "" then
			slot0.model:setAddEffectPartical({
				xPos = slot2:GetPosition().x,
				yPos = slot2:GetPosition().y,
				name = slot2:GetParticle()
			})
		else
			slot0.model:setAddEffectPartical({
				name = "bomb",
				xPos = slot2:GetPosition().x,
				yPos = slot2:GetPosition().y
			})
		end
	end

	slot10 = slot4 / slot3

	if slot9.ShowBingo and slot10 >= 80 then
		slot0.model:setAddBingo({
			chair_id = slot1,
			score = slot4
		})
	end

	if slot10 >= 50 then
		slot0.model:setAddEffectPartical({
			name = "salute1",
			xPos = slot2:GetPosition().x,
			yPos = slot2:GetPosition().y
		})
	end

	if slot1 == Hero:getWChairID() then
		if slot4 > 0 then
			slot0:PlayDntgFishEffect(slot2:GetTypeID())
		end

		if slot10 < 30 then
			slot0:playDntgGameEffect(DNTG_GAME_EFFECT.CATCH)
		else
			slot0:playDntgGameEffect((slot10 < 80 and DNTG_GAME_EFFECT.CATCH1) or DNTG_GAME_EFFECT.CATCH2)
		end
	end

	slot0.model:setAddFishGold({
		wChairID = slot1,
		fishX = slot2:GetPosition().x,
		fishY = slot2.GetPosition().y,
		score = slot4,
		baseScore = slot3
	}, true)

	for slot15, slot16 in ipairs(slot8) do
		if slot16:GetId() ~= slot2:GetId() then
			slot0:KillFish(slot1, slot16, slot3, 0)
		end
	end
end

DntgController.onMsgKillBullet = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_KILL_BULLET") then
		slot0:removeSelfBullets(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_KILL_BULLET").dwBulletID)

		if fishgame.FishObjectManager:GetInstance():FindBullet(ffiMgr.castStruct2TableByLuaStr(slot1, "FISH_CMD_S_KILL_BULLET").dwBulletID) then
			slot3:SetState(DNTG_EOS_OBJ.EOS_DEAD)
		end
	end
end

DntgController.onMsgSwitchScene = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SWITCH_SCENE") then
		slot0.model:setSwitchingScene(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SWITCH_SCENE"))

		if slot0.model:getBBattle() == true then
			slot0.model:setBBattle(false)
		end
	end
end

DntgController.onMsgAllowFire = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_ALLOW_FIRE") then
		slot0.model:setAllowFire(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_ALLOW_FIRE").m_bAllowFire)
	end
end

DntgController.onMsgLockFish = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_LOCK_FISH") and slot0.model:getPlayerByChairID(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_LOCK_FISH").wChairID) ~= nil then
		slot3:SetLockFishID(slot2.dwLockID)
		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)

		if slot2.wChairID == Hero:getWChairID() and slot2.dwLockID ~= 0 and slot0.model:getBLockFish() == false then
			reqDNTGMsgLockFish({
				bLock = false,
				wChairID = slot2.wChairID
			})
		end
	end
end

DntgController.onMsgSendDes = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SEND_DES") then
		dump(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SEND_DES"), "onMsgSendDes:")
	end
end

DntgController.onMsgForceTimeSync = function (slot0, slot1)
	reqDNTGMsgSyncTime({
		wChairID = Hero:getWChairID(),
		dwClientTick = slot0:GetClientTick()
	})
end

DntgController.onMsgAddBuffer = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_ADD_BUFFER") then
		slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_ADD_BUFFER")

		fishgame.FishObjectManager:GetInstance():AddFishBuff(slot2.nBufferType, slot2.fBufferParam, slot2.fBufferTime)
	end
end

DntgController.onMsgFireFailed = function (slot0, slot1)
	return
end

DntgController.onMsgActivityNotice = function (slot0, slot1)
	slot2 = ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_ACTIVITY_NOTIFY") and ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_ACTIVITY_NOTIFY")
end

DntgController.onMsgFishMul = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_FISH_MUL") then
		if fishgame.FishObjectManager:GetInstance():FindFish(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_FISH_MUL").nFishID) == nil then
			return
		end

		slot3:SetScore(slot2.nMul)
	end
end

DntgController.onMsgScoreSync = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SCORE_SYNC") then
		if slot0.model:getPlayerByChairID(ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SCORE_SYNC").wChairID) == nil then
			return
		end

		if slot2.wChairID == Hero:getWChairID() then
			slot0.model:updateCostBulletCount(-1 * slot2.lScore)
			Hero:setUserScore(slot3:GetScore() + slot2.lScore)
		end

		slot3:SetScore(slot3:GetScore() + slot2.lScore)
		slot0.model:setPlayerByChairID(slot2.wChairID, slot3)
	end
end

DntgController.CreateFish = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot11 = Dntg_BoundingBox.BoundingBox[slot1.BoundingBox].BB

	if Dntg_Visual.VisualSet.Visual[slot1.VisualID] == nil or slot11 == nil then
		return nil
	end

	slot12 = slot0.new()

	slot12:SetTypeID(slot1.TypeID)
	slot12:SetFishType(slot9)
	slot12:SetVisualID(slot1.VisualID)
	slot12:SetVisualData(slot10.Id, slot10.TypeID)

	for slot16, slot17 in ipairs(slot10.Live) do
		slot12:AddVisualLiveData(slot17.Image, "res/gameres/module/dntg/fishgame2d/animation/" .. slot17.Image .. "/" .. slot17.Image, slot17.Name, slot17.Scale, slot17.OffestX, slot17.OffestY, slot17.Direction, slot17.AniType)
	end

	for slot16, slot17 in ipairs(slot10.Die) do
		slot12:AddVisualDieData(slot17.Image, "res/gameres/module/dntg/fishgame2d/animation/" .. slot17.Image .. "/" .. slot17.Image, slot17.Name, slot17.Scale, slot17.OffestX, slot17.OffestY, slot17.Direction, slot17.AniType)
	end

	for slot16, slot17 in pairs(slot11) do
		slot12:AddBoundingBox(slot17.OffestX, slot17.OffestY, slot17.Radio)
	end

	if slot7 >= 0 then
		slot13 = fishgame.MoveByPath:create()

		slot13:SetOffest(cc.p(slot2, slot3))
		slot13:SetDelay(slot5)

		slot14, slot15 = nil

		if slot8 == false then
			slot14 = slot0.model:getNormalPath(slot7)
			slot15 = Dntg_Duration.FishPath.Path[slot7 + 1].Duration
		else
			slot14 = slot0.model:getTroopPath(slot7)
			slot15 = Dntg_TroopDuration.FishPath.Path[slot7].Duration
		end

		if slot14 == nil or slot15 == nil then
			return nil
		end

		slot13:SetPathMoveData(slot14.Type, slot14.xPos[1], slot14.xPos[2], slot14.xPos[3], slot14.xPos[4], slot14.yPos[1], slot14.yPos[2], slot14.yPos[3], slot14.yPos[4], slot14.nPointCount, 0, slot15)
		slot13:SetSpeed(slot6)
		slot12:SetMoveCompent(slot13)

		slot13 = nil
	else
		slot13 = fishgame.MoveByDirection:create()

		slot13:SetSpeed(slot6)
		slot13:SetDelay(slot5)
		slot13:SetDirection(slot4)
		slot13:SetPosition(slot2, slot3)
		slot13:SetRebound(slot7 == -1)
		slot12:SetMoveCompent(slot13)

		slot13 = nil
	end

	if slot1.Buffer ~= nil then
		for slot16, slot17 in pairs(slot1.Buffer) do
			slot12:AddBuff(slot17.TypeID, slot17.Param, slot17.Life)
		end
	end

	if #slot1.Effect > 0 then
		if slot9 == DNTG_SpecialFishType.ESFT_KINGANDQUAN or slot9 == DNTG_SpecialFishType.ESFT_KING then
			if slot12.SetSpecialShow ~= nil then
				slot12:SetSpecialShow(true)
			end

			if slot0.effectFatory:CreateEffect(DNTG_EffectType.ETP_KILL) and Dntg_Special.FishKing[slot1.TypeID] then
				slot13:SetParam(0, 2)
				slot13:SetParam(1, slot1.TypeID)
				slot13:SetParam(2, slot14.MaxScore)
				slot12:AddEffect(slot13)
			end

			if slot0.effectFatory:CreateEffect(DNTG_EffectType.ETP_ADDMONEY) then
				slot14:SetParam(0, 1)
				slot14:SetParam(1, 10)
				slot12:AddEffect(slot14)
			end
		end

		for slot16, slot17 in ipairs(slot1.Effect) do
			if slot0.effectFatory:CreateEffect(slot17.TypeID) then
				for slot23 = 0, slot18:GetParamSize(), 1 do
					slot24 = 0

					if slot23 == 0 then
						slot24 = slot17.Param1
					elseif slot23 == 1 then
						slot24 = slot17.Param2
					elseif slot23 == 2 then
						slot24 = slot17.Param3
					elseif slot23 == 3 then
						slot24 = slot17.Param4
					elseif slot23 == 4 then
						slot24 = slot17.Param5
					elseif slot23 == 5 then
						slot24 = slot17.Param6
					elseif slot23 == 6 then
						slot24 = slot17.Param7
					elseif slot23 == 7 then
						slot24 = slot17.Param8
					end

					if slot24 == nil then
						slot24 = 0
					end

					if slot9 == DNTG_SpecialFishType.ESFT_SANYUAN and slot23 == 1 then
						slot18:SetParam(slot23, slot24 * 3)
					elseif slot9 == DNTG_SpecialFishType.ESFT_SIXI and slot23 == 1 then
						slot18:SetParam(slot23, slot24 * 4)
					else
						slot18:SetParam(slot23, slot24)
					end
				end

				slot12:AddEffect(slot18)
			end
		end

		if slot9 == DNTG_SpecialFishType.ESFT_KINGANDQUAN and slot0.effectFatory:CreateEffect(DNTG_EffectType.ETP_PRODUCE) then
			slot13:SetParam(0, slot1.TypeID)
			slot13:SetParam(1, 3)
			slot13:SetParam(2, 30)
			slot13:SetParam(3, 1)
			slot12:AddEffect(slot13)
		end
	end

	return slot12
end

DntgController.onMsgCreateFish = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "FISH_CMD_S_SendFish") then
		if Dntg_Fish.FishSet.Fish[ffiMgr:castStruct2TableByLuaStr(slot1, "FISH_CMD_S_SendFish").nTypeID] ~= nil then
			if slot0:CreateFish(slot3, slot2.fOffestX, slot2.fOffestY, slot2.fDir, slot2.fDelay, slot2.FishSpeed, slot2.nPathID, slot2.bTroop, slot2.FisType) then
				slot4:SetFishCofigData(slot3)
				slot4:SetId(slot2.dwFishID)
				slot4:SetRefershID(slot2.nRefershID)
				slot4:OnUpdate(slot0:GetDelayTick(slot2.dwCreateTick) / 1000)
				fishgame.FishObjectManager:GetInstance():AddFish(slot4)

				slot4 = nil
			end

			if slot0:getMaxDiffrence() < slot0:GetDelayTick(slot2.dwServerTick) then
				reqDNTGMsgSyncTime({
					wChairID = Hero:getWChairID(),
					dwClientTick = slot0:GetClientTick()
				})
			end
		else
			print("没有找到nTypeID为 " .. tostring(slot2.nTypeID) .. " 的鱼。")
		end
	end
end

DntgController.getMyBulletId = function (slot0)
	slot1 = Hero:getWChairID()

	if slot0.nBulletID == nil or slot0.nBulletID >= 20000 then
		slot0.nBulletID = 0
	end

	slot0.nBulletID = slot0.nBulletID + 1

	return slot1 * 20000 + slot0.nBulletID
end

DntgController.playerFireTo = function (slot0, slot1)
	slot2 = slot0:getMyBulletId()
	slot3 = Hero:getWChairID()

	if isAndroid then
		reqDNTGMsgFire({
			wChairID = slot3,
			fDirection = slot1,
			dwFireTime = slot0:GetServerTick(),
			dwClientID = slot2
		})
	else
		DebugUtil.beginMark("协议解析：DNTGT_FISH_CMD_C_FIRE")

		slot4 = ""
		slot5 = ByteArray.new()

		slot5:writeUShort(slot3, slot6)
		slot5:writeFloat(slot1, slot6)
		slot5:writeUInt(slot0:GetServerTick(), slot6)
		slot5:writeUInt(slot2, true)
		slot5:setPosition(1)
		DebugUtil.endMark("协议解析：DNTGT_FISH_CMD_C_FIRE")
		reqDNTGMsgFire(slot5:toString(), true)
	end

	slot0.tBulletID[slot2] = 1

	slot0.model:setBulletCount(slot0.model:getBulletCount() + 1)
	slot0:createBullet(slot3, slot2, slot1)
end

DntgController.onActionBulletHitFish = function (slot0, slot1, slot2)
	slot4 = slot2:GetId()
	slot5 = Hero:getWChairID()
	slot6 = slot1:GetChairID()

	if slot1:GetId() == 190000 then
		slot1:SetState(DNTG_EOS_OBJ.EOS_DESTORY)
		reqDNTGMsgLockSomeFish({
			dwFishID = slot2:GetId()
		})

		if slot0.model:getPlayerByChairID(slot5) ~= nil then
			slot7:SetLockFishID(slot4)
			slot0.model:setPlayerByChairID(slot5, slot7)
		end
	else
		slot0:removeSelfBullets(slot3)
		reqDNTGMsgNetCast({
			dwData = 0,
			dwBulletID = slot3,
			dwFishID = slot4
		})

		if slot6 == slot5 and slot2:GetTypeID() > 10 then
			slot0:playDntgGameEffect(DNTG_GAME_EFFECT.EFFECT_BULLET_BOMB)
		end
	end
end

DntgController.removeSelfBullets = function (slot0, slot1)
	if slot0.tBulletID[slot1] ~= nil then
		slot0.model:setBulletCount(slot0.model:getBulletCount() - 1)

		slot0.tBulletID[slot1] = nil
	end
end

DntgController.sendMsgChangeCannon = function (slot0, slot1)
	reqDNTGMsgChangeCannon(slot1)
end

DntgController.setAutoAttack = function (slot0, slot1)
	slot0.model:setBAutoAttack(slot1)
end

DntgController.setLockFish = function (slot0, slot1)
	if slot0.model:getPlayerByChairID(Hero:getWChairID()) == nil then
		return
	end

	slot0.model:setBLockFish(slot1)
	slot2:SetLocking(slot1)
	reqDNTGMsgLockFish({
		wChairID = Hero:getWChairID(),
		bLock = slot1
	})
end

DntgController.setChangeSpeed = function (slot0)
	if DNTG_IS_SHIELDING_SPEEDUP == true then
		return
	end

	if slot0.cbMulti == nil then
		slot0.cbMulti = 1
	end

	if slot0.cbMulti == 1 then
		slot0.cbMulti = 2
	elseif slot0.cbMulti == 2 then
		slot0.cbMulti = 4
	elseif slot0.cbMulti == 4 then
		slot0.cbMulti = 1
	end

	slot0.model:setMCurSpeedRate(slot0.cbMulti)
end

DntgController.hasSyncSelfScore = function (slot0)
	return slot0.bSyncScore
end

DntgController.setSyncSelfScore = function (slot0, slot1)
	slot0.bSyncScore = slot1
end

DntgController.destroy = function (slot0)
	slot0.model = nil
end

return
