LhdModel = class("LhdModel")

LhdModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_LHD, nil, nil, false, true)

	slot0._loadingDuration = 1.1

	createSetterGetter(slot0, "gameStatus", LHD_EVT_GAME_FREE, true)
	createSetterGetter(slot0, "selfUserData", nil, true)
	createSetterGetter(slot0, "gameTimer", {}, true)
	createSetterGetter(slot0, "isShowingBalance", false, true)

	if LHD_AFTER_WITHDRAWAL_CAN_BET then
		createSetterGetter(slot0, "selfCanBetMaxScore", 0, false, nil, true)
	else
		createSetterGetter(slot0, "selfCanBetMaxScore", 0, false)
		createSetterGetter(slot0, "selfBetStartMoney", 0, false)
	end

	createSetterGetter(slot0, "areaAllJettonScore", {
		[0] = 0,
		0,
		0
	}, true)
	createSetterGetter(slot0, "areaSelfJettonScore", {
		[0] = 0,
		0,
		0
	}, true)
	createSetterGetter(slot0, "selfHasBettedScore", 0, true)
	createSetterGetter(slot0, "gameResultHistory", {}, true)
	createSetterGetter(slot0, "balanceData", {}, false)
	createSetterGetter(slot0, "balanceHistoryData", {}, true)
	createSetterGetter(slot0, "balanceRealHistoryData", {}, false)
	createSetterGetter(slot0, "balanceHistoryCount", 0, true)
	createSetterGetter(slot0, "selectingGold", -1, true)
	createSetterGetter(slot0, "selfCanBetLeftScore", 0, true)
	createSetterGetter(slot0, "areaAllLimitBetScore", {}, false)
	createSetterGetter(slot0, "areaSelfLimitBetScore", 0, false)
	createSetterGetter(slot0, "gamingTipID", 0, true)
	createSetterGetter(slot0, "preGameBetData", nil, false)
	createSetterGetter(slot0, "hasSentRemandBet", false, false)
	createSetterGetter(slot0, "starerHasBetted", false, false)
	createSetterGetter(slot0, "isFirstGame", false, false)
	createSetterGetter(slot0, "isCanRemand", true, false)

	slot0.gameEventChangedSignal = SignalAs3.new("LhdGameEvt")
	slot0.onlineItemPath = LHD_ONLINE_ITEM_CSB
	slot0.onlineItemScoreNumRes = "#lhd_online_richRank_%s.png"
	slot0.musicBg = LHD_SOUND.MUSIC_BG
	slot0.onlineDataCount = 4
end

LhdModel.isMeBet = function (slot0)
	for slot5, slot6 in pairs(slot1) do
		if slot6 > 0 then
			return true
		end
	end

	return false
end

if LHD_AFTER_WITHDRAWAL_CAN_BET then
	LhdModel.getSelfCanBetMaxScore = function (slot0)
		return math.min(slot0._areaSelfLimitBetScore / 3, Hero:getUserScore())
	end
end

LhdModel.dispatchEvt = function (slot0, slot1, ...)
	if slot0.gameEventChangedSignal then
		slot0.gameEventChangedSignal:emit(slot1, ...)
	end
end

return
