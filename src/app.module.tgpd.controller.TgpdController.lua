slot2 = "tgpd.CandyDispatcher"

requireLuaFromModule(slot1)

slot2 = "tgpd.func.CandyFunc"

requireLuaFromModule(slot1)

slot2 = "tgpd.CandyCacheManager"

requireLuaFromModule(slot1)

slot2 = "TgpdController"
TgpdController = class(slot1)

TgpdController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = {
		onX = 105,
		offX = 30
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot0.battleView = nil
	slot4 = mainMgr

	mainMgr.onStopTick2Gc(slot3)

	slot8 = "serial_number.plist"

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(slot6, slot0))

	slot8 = "serial_replay_num.plist"
	slot6 = true

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(true, slot0))

	slot4 = slot0

	slot0.setPreloadResource(slot3)

	slot4 = CandyDispatcher

	CandyDispatcher.init(slot3)

	slot4 = slot0

	slot0.initProtocolConfig(slot3)

	slot4 = CandyCacheManager

	CandyCacheManager.init(slot3)

	slot5 = Candy.CacheTemplate

	CandyCacheManager.registerCocos2dxObject(slot3, CandyCacheManager)
end

TgpdController.setPreloadResource = function (slot0)
	slot0._resProcessConfigs = {
		{
			type = "png",
			url = "animation/brick/tgpd_bingganeffect"
		},
		{
			type = "png",
			url = "animation/explode/tgpd_tgboom"
		}
	}
	slot0._cacheResource = {}
	slot1 = 1

	while slot1 < 16 do
		slot5 = slot1
		slot0._cacheResource[slot1] = {
			use = -1,
			object_key = string.format(slot3, "candy_%d"),
			type = Candy.CacheType.CacheType_Spine
		}
		slot1 = slot1 + 1
	end

	slot5 = {
		use = -1,
		object_key = "candy_17",
		type = Candy.CacheType.CacheType_Spine
	}

	table.insert(slot3, slot0._cacheResource)

	slot5 = {
		use = -1,
		object_key = "candy_18",
		type = Candy.CacheType.CacheType_Spine
	}

	table.insert(slot3, slot0._cacheResource)

	slot1 = 1

	while slot1 < 4 do
		slot5 = {
			use = -1,
			object_key = string.format(slot7, "brick_%d"),
			type = Candy.CacheType.CacheType_Spine
		}
		slot9 = slot1

		table.insert(slot3, slot0._cacheResource)

		slot1 = slot1 + 1
	end

	slot0._currentIndex = 1
	slot0._userCallFunc = slot0.loadSpineAndParticle
end

TgpdController.loadSpineAndParticle = function (slot0)
	if slot0._currentIndex <= #slot0._cacheResource then
		slot5 = slot0._cacheResource[slot0._currentIndex].object_key
		slot2 = CandyCacheManager.getCacheInfo(slot3, CandyCacheManager)

		if sp.SkeletonAnimation.isExistSkeletonDataInCache then
			slot8 = slot2.atlas

			sp.SkeletonAnimation.readSkeletonDataToCacheByJson(slot4, sp.SkeletonAnimation, slot2.cache, slot2.json)

			slot2.isRead = true
		end

		slot0._currentIndex = slot0._currentIndex + 1
	end

	return #slot0._cacheResource < slot0._currentIndex
end

TgpdController.initProtocolConfig = function (slot0)
	slot0._protocol = {
		[TGPD_SUB_S_BET] = {
			messageName = "TGPD_CMD_S_Bet",
			func = slot0.onMsgBet
		},
		[TGPD_SUB_S_BROADCAST_JACKPOT] = {
			messageName = "TGPD_CMD_S_BroadcastJackpot",
			func = slot0.onMsgBroadcastJackpot
		},
		[TGPD_SUB_S_BROADCAST_AWARDS] = {
			messageName = "TGPD_CMD_S_BroadcastAwards",
			func = slot0.onMsgBroadCastAward
		}
	}
end

TgpdController.onGameSceneByServer = function (slot0, slot1)
	slot6 = "TGPD_CMD_S_Status"
	slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
	slot6 = slot2.lCellScore

	slot0.model.setCellScore(ffiMgr, slot0.model)

	slot6 = slot2.cbCardArray

	slot0.model.setDiamondArray(ffiMgr, slot0.model)

	slot6 = slot2.nCookies

	slot0.model.setBrickNumber(ffiMgr, slot0.model)

	slot6 = slot2.nCookies

	slot0.model.setBrickNumberCarry(ffiMgr, slot0.model)

	slot6 = slot2.wBetMultiple

	slot0.model.setBetMultipleArray(ffiMgr, slot0.model)

	slot3 = 1
	slot4 = 0

	while slot3 <= #slot2.wBetMultiple and slot2.wBetMultiple[slot3] > 0 do
		slot3 = slot3 + 1
		slot4 = slot4 + 1
	end

	slot8 = slot4

	slot0.model.setBetMultipleArrayCount(slot6, slot0.model)

	slot5 = 1

	if slot2.nCookies > 0 then
		slot8 = slot2.nCookies / 15
		slot5 = 4 - math.ceil(slot7)
	else
		slot5 = 4
	end

	slot9 = slot5

	slot0.model.setChapter(slot7, slot0.model)

	slot9 = slot2.nFreeTimes

	slot0.model.setFreeCandyTimes(slot7, slot0.model)
	slot0.model.setFreeCandyTimesSession(slot7, slot0.model)

	slot10 = Hero
	slot10 = parseInt(Hero.getUserScore(0))

	slot0.model.setUserScoreCarry(Hero.getUserScore, slot0.model)

	slot10 = slot2.lTotalWinScore

	slot0.model.setChapterScoreCarry(Hero.getUserScore, slot0.model)

	slot11 = slot2

	CandyDispatcher.dispatchEvent(Hero.getUserScore, CandyDispatcher, Candy.Event.userStatusChanged)

	slot9 = "onGameSceneByServer----->"

	print(Hero.getUserScore)
end

TgpdController.onUserStatus = function (slot0, slot1, slot2)
	slot3 = slot1
end

TgpdController.onGameMessage = function (slot0, slot1, slot2)
	if slot0._protocol[slot2] then
		slot4 = slot1

		if slot3.messageName then
			slot9 = slot3.messageName
			slot4 = ffiMgr.castStruct2TableByLuaStr(slot6, ffiMgr, slot1)
		end

		slot8 = slot4

		slot3.func(slot6, slot0)
	end
end

TgpdController.onNetMessageCabcelCache = function (slot0)
	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

TgpdController.onMsgBet = function (slot0, slot1)
	slot5 = slot1.lWinScore

	slot0.model.setWinSessionScore(slot3, slot0.model)

	slot5 = slot1.nCookies

	slot0.model.setBrickNumber(slot3, slot0.model)

	slot5 = slot1.lJettonScoreEx

	slot0.model.setGameBaseJet(slot3, slot0.model)

	slot5 = slot1.lJackpot

	slot0.model.setJackpotScore(slot3, slot0.model)

	slot5 = slot1.lTotalWinScore

	slot0.model.setWinChapterScore(slot3, slot0.model)

	slot5 = slot1.lJettonScore

	print(slot3, "-->bodyData.lJettonScore-->")

	slot7 = slot0.model
	slot5 = slot0.model.getUserScoreCarry(slot6) - slot1.lJettonScore

	slot0.model.setUserScoreCarry(slot3, slot0.model)

	slot6 = 4 - math.ceil(slot3)

	slot0.model.setChapter(slot1.nCookies / 15, slot0.model)

	slot7 = slot1.nFreeTimes

	slot0.model.setFreeCandyTimes(slot0.model, slot0.model)

	slot7 = slot1.nFreeTimes - slot0.model.getFreeCandyTimes(slot1.nCookies / 15)

	slot0.model.setFreeCandyTimesSession(slot0.model, slot0.model)

	slot8 = slot1.cbCardArray

	CandyDispatcher.dispatchEvent(slot0.model, CandyDispatcher, Candy.Event.newSessionStart)
end

TgpdController.onMsgBroadcastJackpot = function (slot0, slot1)
	slot6 = slot1

	CandyDispatcher.dispatchEvent(slot3, CandyDispatcher, Candy.Event.jackpotChanged)
end

TgpdController.onMsgBroadCastAward = function (slot0, slot1)
	slot4 = "onMsgBroadCastAward->gao-bei-jiang"

	print(slot3)

	slot4 = Hero

	if Hero.getPNickName(slot3) == slot1.szNickName then
		slot7 = slot1

		table.insert(slot0.model, slot0.model.getBroadcastData(slot4))
	else
		slot7 = slot1

		CandyDispatcher.dispatchEvent(slot4, CandyDispatcher, Candy.Event.broadcastAward)
	end
end

TgpdController.processAssets = function (slot0, slot1)
	slot4 = slot0.model

	function slot3()
		if slot0 or slot1 then
			slot3 = VIEW_TYPE_BATTLE

			slot2.model.setCurShowingViewType(slot1, slot2.model)
			slot2.model.registerListeners(slot1)

			slot2 = slot2.model

			slot2.model.recoverServerMsgs(slot1)
		else
			slot3 = {}

			gameMgr.setGameStackMsgs(slot1, gameMgr)

			slot3 = false

			gameMgr.setNeedStoreGameStackMsg(slot1, gameMgr)
		end
	end

	if slot0.model.getIsUseCommonHall(slot3) then
		slot3()
	else
		slot10 = slot0.model
		slot11 = slot3

		slot0.updateLoading(slot5, slot0, 100, slot0.model.getLoadingDuration(slot9), slot1, nil)
	end

	slot6 = mainMgr

	mainMgr.onStopTick2Gc(slot5)

	slot7 = nil

	slot0.processResource(slot5, slot0)
end

TgpdController.resetBattle = function (slot0)
	slot0._currentIndex = 1
	slot0._preIndex = 1
	slot3 = audioMgr

	audioMgr.playMainMusic(slot2)

	slot3 = audioMgr

	audioMgr.stopAllEffects(slot2)

	slot4 = Candy.Event.battleReset

	CandyDispatcher.dispatchEvent(slot2, CandyDispatcher)
end

TgpdController.exitGame = function (slot0, slot1)
	if cc.ParticleSystemCache then
		slot4 = cc.ParticleSystemCache
		slot4 = cc.ParticleSystemCache.getInstance(slot3)

		cc.ParticleSystemCache.getInstance(slot3).removeAllParticles(slot3)
	end

	if sp.SkeletonAnimation.removeAllSkeletonData then
		slot4 = sp.SkeletonAnimation

		sp.SkeletonAnimation.removeAllSkeletonData(slot3)
	end

	slot4 = mainMgr

	mainMgr.onRestartTick2Gc(slot3)

	slot4 = CandyCacheManager

	CandyCacheManager.onDestroy(slot3)

	slot5 = slot1

	ProxyTgpd.hide(slot3, ProxyTgpd)

	slot0._preIndex = 1
	slot0._currentIndex = 1
end

return
