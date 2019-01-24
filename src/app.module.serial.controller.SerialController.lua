requireLuaFromModule("serial.EventController")
requireLuaFromModule("serial.SerialCacheManager")

SerialController = class("SerialController")

SerialController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	slot0.model:setSwitchStatePos({
		onX = 105,
		offX = 30
	})

	slot0.battleView = nil

	mainMgr:onStopTick2Gc()
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("serial_number.plist"), true)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("serial_replay_num.plist"), true)
	slot0:setPreloadResource()
	EventController:init()
	slot0:initProtocolConfig()
	SerialCacheManager:init()
	SerialCacheManager:registerCocos2dxObject(Serial.CacheTemplate)
end

SerialController.setPreloadResource = function (slot0)
	slot0._resProcessConfigs = {
		{
			type = "png",
			url = "animation/room/lhdb_chujichang"
		},
		{
			type = "png",
			url = "animation/room/lhdb_gaojichang"
		},
		{
			type = "png",
			url = "animation/room/lhdb_putongchang"
		},
		{
			type = "png",
			url = "animation/room/lhdb_quickstart"
		},
		{
			type = "png",
			url = "animation/room/lhdb_tiyanchang"
		},
		{
			type = "png",
			url = "animation/room/lhdb_zhongjichang"
		},
		{
			type = "png",
			url = "rule/dierguan"
		},
		{
			type = "png",
			url = "rule/disanguan"
		},
		{
			type = "png",
			url = "rule/diyiguan"
		},
		{
			type = "png",
			url = "rule/tanbaoguize"
		},
		{
			type = "jpg",
			url = "ingame/youxizhong_bg"
		},
		{
			type = "png",
			url = "ingame/yxz_bg"
		},
		{
			type = "jpg",
			url = "ingame/chapter_1"
		},
		{
			type = "jpg",
			url = "ingame/chapter_2"
		},
		{
			type = "jpg",
			url = "ingame/chapter_3"
		},
		{
			type = "jpg",
			url = "ingame/chapter_final"
		},
		{
			type = "png",
			url = "ingame/bantou_tongyong"
		},
		{
			type = "png",
			url = "ingame/shipin_you"
		},
		{
			type = "png",
			url = "ingame/shiping_zuo"
		},
		{
			type = "png",
			url = "ingame/dating_you"
		},
		{
			type = "png",
			url = "ingame/dating_zuo"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/plist_fqzs_font"
		},
		{
			type = "png",
			url = "reward/leijijiang"
		},
		{
			type = "png",
			url = "reward/lhdb_gamebaofula"
		},
		{
			type = "png",
			url = "reward/lhdb_tbdj"
		},
		{
			type = "png",
			url = "reward/lhdb_gameljdj"
		},
		{
			type = "png",
			url = "longzhutanbao/lhdb_baoxiangeffect"
		},
		{
			type = "png",
			url = "longzhutanbao/lhdb_jinzhu"
		},
		{
			type = "png",
			url = "levelEffect/lhdb_guanqia1"
		},
		{
			type = "png",
			url = "levelEffect/lhdb_guanqia2"
		},
		{
			type = "png",
			url = "levelEffect/lhdb_guanqia3"
		},
		{
			type = "png",
			url = "levelEffect/lhdb_guanqiaeffect"
		},
		{
			type = "png",
			url = "effect/kaishianniu"
		},
		{
			type = "png",
			url = "effect/lhdb_baojieffect"
		},
		{
			type = "png",
			url = "effect/lhdb_bbcleareffect"
		},
		{
			type = "png",
			url = "effect/lhdb_jzcleareffect"
		},
		{
			type = "png",
			url = "effect/lhdb_ljshuzikuang"
		},
		{
			type = "png",
			url = "effect/lhdb_gamejinbikuang"
		},
		{
			type = "png",
			url = "effect/rock_01"
		},
		{
			type = "png",
			url = "effect/rock_02"
		},
		{
			type = "png",
			url = "effect/rock_03"
		},
		{
			type = "png",
			url = "effect/rock_04"
		},
		{
			type = "png",
			url = "effect/rock_05"
		},
		{
			type = "png",
			url = "effect/rock_06"
		},
		{
			type = "png",
			url = "effect/rock_07"
		},
		{
			type = "png",
			url = "effect/rock_08"
		},
		{
			type = "png",
			url = "effect/rock_09"
		},
		{
			type = "png",
			url = "effect/rock_10"
		},
		{
			type = "png",
			url = "effect/rock_11"
		},
		{
			type = "png",
			url = "effect/rock_12"
		},
		{
			type = "png",
			url = "effect/rock_13"
		},
		{
			type = "png",
			url = "effect/rock_14"
		},
		{
			type = "png",
			url = "effect/rock_15"
		},
		{
			type = "png",
			url = "effect/rock_16"
		}
	}
	slot0._cacheResource = {
		{
			count = 24,
			name = "diamond_spine_explode"
		},
		[1 + 1] = {
			count = 4,
			name = "brick_spine_explode"
		},
		[1 + 1 + 1] = {
			count = 1,
			name = "chapter_level_change"
		},
		[1 + 1 + 1 + 1] = {
			count = 1,
			name = "chapter_level_dragon"
		},
		[1 + 1 + 1 + 1 + 1] = {
			count = 1,
			name = "accumulate_reward"
		},
		[1 + 1 + 1 + 1 + 1 + 1] = {
			count = 1,
			name = "reward_explode"
		}
	}
	slot1 = 1 + 1 + 1 + 1 + 1 + 1 + 1
	slot0._currentIndex = 1
	slot0._preIndex = 0
	slot0._userCallFunc = slot0.loadSpineAndParticle
end

SerialController.loadSpineAndParticle = function (slot0)
	slot0._preIndex = slot0._preIndex + 1

	if slot0._preIndex < 40 then
		return
	end

	if slot0._currentIndex <= #slot0._cacheResource then
		if not slot0._cacheResource[slot0._currentIndex].create_object then
			slot1.create_object = {}
			slot1.cindex = 1
		end

		if slot1.cindex <= slot1.count then
			table.insert(slot1.create_object, SerialCacheManager:getCacheObject(slot1.name))

			slot1.cindex = slot2 + 1
		end

		if slot1.count < slot2 then
			for slot6 = 1, slot1.count, 1 do
				SerialCacheManager:recycleCocos2dxObject(slot1.create_object[slot6])
			end

			slot1.create_object = nil
			slot1.cindex = nil
			slot0._currentIndex = slot0._currentIndex + 1

			print("process-> ", slot1.name)
		end
	end

	return #slot0._cacheResource < slot0._currentIndex
end

SerialController.initProtocolConfig = function (slot0)
	slot0._protocol = {
		[SERIAL_SUB_S_BET] = {
			messageName = "SERIAL_CMD_S_BET",
			func = slot0.onMsgBet
		},
		[SERIAL_SUB_S_TREASURE] = {
			messageName = "SERIAL_CMD_S_TREASURE",
			func = slot0.onMsgTreasure
		},
		[SERIAL_SUB_S_TREASUREINFO] = {
			messageName = "SERIAL_CMD_S_TREASUREINFO",
			func = slot0.onMsgTreasureInfo
		},
		[SERIAL_SUB_S_STORAGE] = {
			messageName = "SERIAL_CMD_S_STORAGE",
			func = slot0.onMsgStorage
		},
		[SERIAL_SUB_S_BROADCAST_JACKPOT] = {
			messageName = "SERIAL_CMD_S_BROADCAST_JACKPOT",
			func = slot0.onMsgBroadcastJackpot
		},
		[SERIAL_SUB_S_BROADCAST_AWARDS] = {
			messageName = "SERIAL_CMD_S_BROADCAST_AWARDS",
			func = slot0.onMsgBroadCastAward
		},
		[SERIAL_SUB_S_JACKPOT_RECORD] = {
			messageName = "SERIAL_CMD_S_LoadJackpotRecord",
			func = slot0.onMsgReplayBet
		},
		[SERIAL_SUB_S_UPDATE_POPULAR] = {
			messageName = "SERIAL_CMD_S_UpdatePopularity",
			func = slot0.onMsgReplayUpdatePopularity
		},
		[SERIAL_SUB_S_SEND_CHAT] = {
			messageName = "SERIAL_CMD_S_Chat",
			func = slot0.onMsgReplayChat
		},
		[SERIAL_SUB_S_LOAD_CHATS] = {
			messageName = "SERIAL_CMD_S_LOAD_CHAT",
			func = slot0.onMsgReplayLoadChat
		}
	}
end

SerialController.onMsgReplayBet = function (slot0, slot1)
	if slot1 == nil or not next(slot1) then
		return
	end

	slot2 = {}
	slot3 = pairs
	slot4 = slot1.record or {}

	for slot6, slot7 in slot3(slot4) do
		if slot7.dwID > 0 then
			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, slot3)
	slot0.model:setReplayPlayerData(slot2, true)
end

SerialController.onMsgReplayUpdatePopularity = function (slot0, slot1)
	return
end

SerialController.onMsgReplayChat = function (slot0, slot1)
	slot3 = pairs
	slot4 = slot0.model:getReplayPlayerData() or {}

	for slot6, slot7 in slot3(slot4) do
		if slot7.dwID == slot1.dwID then
			if slot7.chats == nil then
				slot7.chats = {}
			end

			if #slot7.chats >= 20 then
				table.remove(slot7.chats, 1)
			end

			table.insert(slot7.chats, slot1.chat)

			if slot0.model:getReplayingId() == slot1.dwID then
				slot0.model:setReplayChatData(slot7.chats, true)
			end

			return
		end
	end
end

SerialController.onMsgReplayLoadChat = function (slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = {}
	slot3 = ipairs
	slot4 = slot1.chats or {}

	for slot6, slot7 in slot3(slot4) do
		if slot7.dwUserID > 0 then
			table.insert(slot2, slot7)
		end
	end

	slot4 = pairs
	slot5 = slot0.model:getReplayPlayerData() or {}

	for slot7, slot8 in slot4(slot5) do
		if slot8.dwID == slot1.dwID then
			slot8.chats = slot2

			if slot0.model:getReplayingId() == slot1.dwID then
				slot0.model:setReplayChatData(slot2, true)
			end

			return
		end
	end
end

SerialController.checkReplayBet = function (slot0, slot1)
	if slot0:getOneJackpotData(slot1) == nil then
		return
	end

	if slot1 ~= slot0.model:getReplayingId() then
		reqSerialLoadChats({
			dwID = slot1
		})
		slot0.model:setReplayingId(slot1)
	end

	reqSerialUpdatePopular({
		dwID = slot1
	})
	slot0.model:setDiamondArray(slot2.cbCardArray)
	slot0.model:setWinChapterScore(slot2.lScore)
	slot0.model:setGameBaseJet(slot2.lJetton)
	slot0.model:setAccumulateScore(slot2.lJackpot)
	slot0.model:setBrickEraseReplay(slot2.dwCleapUpBrick)
	EventController:dispatchEvent(Serial.Event.diamondOpennedReplay, slot2)
end

SerialController.getOneJackpotData = function (slot0, slot1)
	slot3 = pairs
	slot4 = slot0.model:getReplayPlayerData() or {}

	for slot6, slot7 in slot3(slot4) do
		if slot7.dwID == slot1 then
			return TableUtil.copyDataDep(slot7, true)
		end
	end

	return nil
end

SerialController.setOneJackpotData = function (slot0, slot1, slot2)
	slot4 = pairs
	slot5 = slot0.model:getReplayPlayerData() or {}

	for slot7, slot8 in slot4(slot5) do
		if slot8.dwID == slot1 then
			slot3[slot7] = slot2

			slot0.model:setReplayPlayerData(slot3, true)

			return
		end
	end
end

SerialController.onUserEnter = function (slot0, slot1)
	return
end

SerialController.onMsgTreasureInfo = function (slot0, slot1)
	slot0.model:setTreasureInfo(slot1)
end

SerialController.onGameSceneByServer = function (slot0, slot1)
	slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "SERIAL_CMD_S_STATUS")

	slot0.model:setCellScore(slot2.lCellScore)
	slot0.model:setWinTotalScore(slot2.lTotalWinScore)
	slot0.model:setBetScore(slot2.dwMultiple)
	slot0.model:setBetLine((slot2.dwLine > 0 and slot2.dwLine) or 1)
	slot0.model:setDiamondArray(slot2.cbCardArray)
	slot0.model:setBrickNumber(slot2.cbBrickCount)
	slot0.model:setBetMultipleArray(slot2.wBetMultiple)
	slot0.model:setJackpotScore(slot2.lJackpot)
	slot0.model:setTreasureInfo({
		lSpecialAward = slot2.lSpecialAward,
		lTreasure = slot2.lTreasure
	})

	slot4 = 1
	slot5 = 0

	while slot4 <= #slot2.wBetMultiple and slot2.wBetMultiple[slot4] > 0 do
		slot4 = slot4 + 1
		slot5 = slot5 + 1
	end

	slot0.model:setBetMultipleArrayCount(slot5)

	slot6 = 1

	slot0.model:setChapter((slot2.cbBrickCount > 0 and 3 - math.ceil(slot2.cbBrickCount / 15) + 1) or 4)
	slot0.model:setUserScoreCarry(slot7)
	slot0.model:setChapterScoreCarry(slot2.lTotalWinScore)
	slot0.model:setIsGameInit(true)
	EventController:dispatchEvent(Serial.Event.userStatusChanged, slot2)
	print("onGameSceneByServer----->")
end

SerialController.onUserStatus = function (slot0, slot1, slot2)
	slot3 = slot1
end

SerialController.onGameMessage = function (slot0, slot1, slot2)
	if slot0._protocol[slot2] then
		slot4 = slot1

		if slot3.messageName then
			slot4 = ffiMgr:castStruct2TableByLuaStr(slot1, slot3.messageName)
		end

		slot3.func(slot0, slot4)
	end
end

SerialController.onTouchBegan = function (slot0, slot1)
	return
end

SerialController.onTouchMoved = function (slot0, slot1)
	return
end

SerialController.onTouchEnded = function (slot0, slot1)
	return
end

SerialController.resetBattle = function (slot0)
	slot0._currentIndex = 1
	slot0._preIndex = 1

	audioMgr:playMainMusic()
	audioMgr:stopAllEffects()
	slot0.model:setIsGameInit(false)
	EventController:dispatchEvent(Serial.Event.battleReset)
	slot0.model:setBroadcastAwardData({})
	slot0.model:setIsShowingExit(false)
end

SerialController.exitGame = function (slot0, slot1)
	if cc.ParticleSystemCache then
		cc.ParticleSystemCache:getInstance():removeAllParticles()
	end

	if sp.SkeletonAnimation.removeAllSkeletonData then
		sp.SkeletonAnimation:removeAllSkeletonData()
	end

	mainMgr:onRestartTick2Gc()
	SerialCacheManager:onDestroy()
	ProxySerial:hide(slot1)

	slot0._preIndex = 1
	slot0._currentIndex = 1
end

SerialController.destroy = function (slot0)
	slot0.model = nil
end

SerialController.onEnterForeground = function (slot0)
	BaseGameController.onEnterForeground(slot0)
end

SerialController.onEnterBackground = function (slot0)
	BaseGameController.onEnterBackground(slot0)
end

SerialController.processAssets = function (slot0, slot1)
	function slot3()
		if slot0 or slot1 then
			slot2.model:setCurShowingViewType(VIEW_TYPE_BATTLE)
			slot2:registerListeners()
			slot2:recoverServerMsgs()
		else
			gameMgr:setGameStackMsgs({})
			gameMgr:setNeedStoreGameStackMsg(false)
		end
	end

	if slot0.model:getIsUseCommonHall() then
		slot3()
	else
		slot0:updateLoading(100, slot0.model:getLoadingDuration(), slot1, nil, slot3)
	end

	mainMgr:onStopTick2Gc()
	slot0:processResource(nil)
end

SerialController.onRoomLoginFinish = function (slot0)
	gameMgr:setGameStackMsgs({})
	gameMgr:setNeedStoreGameStackMsg(false)
end

SerialController.onMsgBet = function (slot0, slot1)
	slot0.model:setDiamondArray(slot1.cbCardArray)
	slot0.model:setWinTotalScore(slot1.lTotalWinScore)
	slot0.model:setWinChapterScore(slot1.lWinScore)
	slot0.model:setNeedEraseBrick(slot2)

	slot3 = 4

	if slot1.cbBrickCount > 0 then
		slot3 = 3 - math.ceil(slot1.cbBrickCount / 15) + 1
	end

	slot0.model:setChapter(slot3)
	slot0.model:setBrickNumber(slot1.cbBrickCount)
	slot0.model:setGameBaseJet(slot1.lJettonScore)
	slot0.model:setUserScoreCarry(slot0.model:getUserScoreCarry() - slot1.lJettonScore)
	slot0.model:setAccumulateScore(slot1.lJackpot)
	EventController:dispatchEvent(Serial.Event.diamondOpenned, slot1)
end

SerialController.onMsgBroadcastJackpot = function (slot0, slot1)
	slot0.model:setJackpotScore(slot1.lJackpot)
	EventController:dispatchEvent(Serial.Event.jackpotChanged, slot1)
end

SerialController.onMsgStorage = function (slot0, slot1)
	return
end

SerialController.onMsgTreasure = function (slot0, slot1)
	slot1.lTreasure = slot0.model:getTreasureInfo().lTreasure
	slot1.lSpecialAward = slot0.model.getTreasureInfo().lSpecialAward

	slot0.model:setDragonExplore(slot1)
	slot0.model:setChapter(4)
	EventController:dispatchEvent(Serial.Event.dragonExploreEvent, bodyData)
end

SerialController.onMsgBroadCastAward = function (slot0, slot1)
	if Hero:getPNickName() == slot1.szNickName then
		table.insert(slot0.model:getBroadcastAwardData(), slot1)
	else
		EventController:dispatchEvent(Serial.Event.broadcastAward, slot1)
	end
end

SerialController.onNetMessageCabcelCache = function (slot0)
	gameMgr:setGameStackMsgs({})
	gameMgr:setNeedStoreGameStackMsg(false)
end

SerialController.playLevelBg = function (slot0, slot1)
	if slot1 == 1 then
		slot0:playMusic(Serial.Sound.Level_1_bg)
	elseif slot1 == 2 then
		slot0:playMusic(Serial.Sound.Level_2_bg)
	elseif slot1 == 3 then
		slot0:playMusic(Serial.Sound.Level_3_bg)
	end
end

SerialController.playLevelBoom = function (slot0, slot1)
	if slot1 == 1 then
		slot0:playGameEffect(Serial.Sound.Level_1_boom)
	elseif slot1 == 2 then
		slot0:playGameEffect(Serial.Sound.Level_2_boom)
	elseif slot1 == 3 then
		slot0:playGameEffect(Serial.Sound.Level_3_boom)
	end
end

SerialController.playLjRewardEffect = function (slot0)
	slot0:playGameEffect(Serial.Sound.LjReward)
end

SerialController.playBfRewardEffect = function (slot0)
	slot0:playGameEffect(Serial.Sound.BfReward)
end

SerialController.playDrillEffect = function (slot0)
	slot0:playGameEffect(Serial.Sound.Drill)
end

SerialController.playBrickEffect = function (slot0)
	slot0:playGameEffect(Serial.Sound.Brick)
end

SerialController.playAfterBoomEffect = function (slot0)
	slot0:playGameEffect(Serial.Sound.AfterBoom)
end

SerialController.playDiamondDroping = function (slot0)
	return slot0:playGameEffect(Serial.Sound.DiamondDroping, nil, true)
end

SerialController.playDiamondDispare = function (slot0)
	slot0:playGameEffect(Serial.Sound.DiamondDispare)
end

SerialController.playDragonFallDown = function (slot0)
	slot0:playGameEffect(Serial.Sound.DragonFallDown)
end

SerialController.playButtonClick = function (slot0)
	slot0.playGameEffect("click.mp3")
end

SerialController.try2ExitBattle = function (slot0)
	slot0:requestExitBattle()
end

SerialController.getBetDataByRoomType = function (slot0, slot1)
	slot2 = {}

	if not Hero["getSerialBetMap" .. slot1] then
		Hero:createSOProperty("serialBetMap" .. slot1, BaseHero.INT, 0)

		slot2.bet_line = math.floor(Hero["getSerialBetMap" .. slot1](Hero) / 100)
		slot2.bet_index = Hero["getSerialBetMap" .. slot1](Hero) % 100
	else
		slot2.bet_line = math.floor(slot3(Hero) / 100)
		slot2.bet_index = slot3(Hero) % 100
	end

	return slot2
end

SerialController.saveBetDataByRoomType = function (slot0, slot1, slot2, slot3)
	if not Hero["getSerialBetMap" .. slot1] then
		Hero:createSOProperty("serialBetMap" .. slot1, BaseHero.INT, 0)
		Hero["setSerialBetMap" .. slot1](Hero, slot2 * 100 + slot3)
	else
		Hero["setSerialBetMap" .. slot1](Hero, slot2 * 100 + slot3)
	end
end

return
