CONFIG_HEAD_BG = CONFIG_HEAD_BG or {}
CONFIG_HEAD_BG[tostring(GameKind_HLSSM) .. tostring(GAME_STATE.ROOM) .. tostring(SEX_TYPE.BOY)] = "gameres/module/hlssm/ui/common/Hlssm_Game_Head_Bg_Boy.png"
CONFIG_HEAD_BG[tostring(GameKind_HLSSM) .. tostring(GAME_STATE.ROOM) .. tostring(SEX_TYPE.GIRL)] = "gameres/module/hlssm/ui/common/Hlssm_Game_Head_Bg_Girl.png"
CONFIG_HEAD_BG[tostring(GameKind_HLSSM) .. tostring(GAME_STATE.BATTLE) .. tostring(SEX_TYPE.BOY)] = "gameres/module/hlssm/ui/common/Hlssm_Game_Head_Bg_Boy.png"
CONFIG_HEAD_BG[tostring(GameKind_HLSSM) .. tostring(GAME_STATE.BATTLE) .. tostring(SEX_TYPE.GIRL)] = "gameres/module/hlssm/ui/common/Hlssm_Game_Head_Bg_Girl.png"
Hlssm_sound_StartBet = "START_W.mp3"
Hlssm_sound_EndBet = "STOP_W.mp3"
Hlssm_sound_SendCard = "FAIPAI.mp3"
Hlssm_sound_Bet = "ADD_GOLD.mp3"
Hlssm_sound_Win = "GAME_WIN.mp3"
Hlssm_sound_Lose = "GAME_LOSE.mp3"
Hlssm_sound_XianWin = "SETTLEMENT.mp3"
HLSSM_RESULT_NIL = -1
HLSSM_RESULT_ZHUANG = 1
HLSSM_RESULT_XIAN = 2
HLSSM_RESULT_PING = 3
HlssmModel = class("HlssmModel")

HlssmModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_HLSSM, nil, nil, nil, true)
	createSetterGetter(slot0, "logTabIndex", 1, true)

	slot0._loadingDuration = 0.7

	createSetterGetter(slot0, "gameStatus", GAME_STATUS_FREE, true)
	createSetterGetter(slot0, "isShowingBankerList", false, true)
	createSetterGetter(slot0, "isShowingRecord", false, true)
	createSetterGetter(slot0, "isInBankerList", false, true)
	createSetterGetter(slot0, "curBankerUser", {}, true)
	createSetterGetter(slot0, "bankerList", {}, true)
	createSetterGetter(slot0, "bMeApplyBanker", false, true)
	createSetterGetter(slot0, "wBankerTime", 0, true)
	createSetterGetter(slot0, "lBankerWinScore", 0, true)

	slot0.bankerChangedSignal = SignalAs3.new()

	createSetterGetter(slot0, "recordList", {}, true)
	createSetterGetter(slot0, "startData", {}, true)
	createSetterGetter(slot0, "endData", {}, true)
	createSetterGetter(slot0, "freeData", {}, true)
	createSetterGetter(slot0, "statusData", {}, true)
	createSetterGetter(slot0, "xtVec", {}, true)
	createSetterGetter(slot0, "tempXtVec", {}, true)
	createSetterGetter(slot0, "isMeBank", false, true)
	createSetterGetter(slot0, "userBetAllScore", 0, true)
	createSetterGetter(slot0, "lUserJettonScore", {}, true)
	createSetterGetter(slot0, "lAllJettonScore", {}, true)
	createSetterGetter(slot0, "allTableBet", {}, true)
	createSetterGetter(slot0, "placeJetton", 0, true)
	createSetterGetter(slot0, "isBet", false, true)
	createSetterGetter(slot0, "lMeMaxScore", 0, true)
	createSetterGetter(slot0, "lAreaLimitScore", 0, true)
	createSetterGetter(slot0, "lApplyBankerCondition", 0, true)
	createSetterGetter(slot0, "myGrade", 0, true)
	createSetterGetter(slot0, "curSelectGold", 0, true)
	createSetterGetter(slot0, "lPlayAllScore", 0, true)
	createSetterGetter(slot0, "lBankerCurGameScore", 0, true)
	createSetterGetter(slot0, "userBetAllScore", 0, true)
	createSetterGetter(slot0, "cardArray", {}, true)
	createSetterGetter(slot0, "startTotalJetton", 0, true)
	createSetterGetter(slot0, "lBankerStartScore", 0, true)

	slot0.spineLogoKeyInLoading = "hl30m"
	slot0.musicBg = "BACK_GROUND.mp3"
	slot0.onlineItemPath = "module/hlssm/csb/common/HlssmOnlineItem.csb"
	slot0.jettons = {
		5000000,
		1000000,
		100000,
		10000,
		1000
	}

	if IS_HL_VERSION then
		slot0.onlineItemPath = "module/hlssm/csb/common/HlssmOnlineItemHl.csb"
		slot0.onlineItemHeadBGRes = "common/hlssm_online_head_mask_hl.png"
		slot0.onlineItemFuHaoTxtRes = "txt/hlssm_online_rich_txt_hl.png"
		slot0.onlineItemNumRes = "#hlssm_online_richRank_hl_%s.png"
		slot0.onlineItemScoreNumRes = "#hlssm_online_userScore_hl_%s.png"
		slot0.jettons = {
			50000,
			10000,
			5000,
			1000,
			100
		}
	end
end

HlssmModel.updateEndDataByStatusData = function (slot0)
	slot0._endData.cbTimeLeave = slot0._statusData.cbTimeLeave
	slot0._endData.cbTableCardArray = slot0._statusData.cbTableCardArray
	slot0._endData.lPlayAllScore = slot0._statusData.lPlayAllScore
	slot0._endData.lBankerScore = slot0._statusData.lEndBankerScore
	slot0._endData.lBankerTotallScore = slot0._statusData.lBankerWinScore
	slot0._endData.nBankerTime = slot0._statusData.wBankerTime
	slot0._endData.cbRankCount = slot0._statusData.cbRankCount
	slot0._endData.RankUser = slot0._statusData.RankUser
	slot1 = {
		{},
		{}
	}

	for slot5 = 1, 2, 1 do
		for slot9 = 1, slot0._statusData.cbCardCount[slot5], 1 do
			slot1[slot5][slot9] = slot0._statusData.cbTableCardArray[slot5][slot9]
		end
	end

	slot0:setCardArray(slot1)
end

HlssmModel.isMeBanker = function (slot0)
	if slot0:getCurBankerUser() and Hero:getWChairID() == slot1.wBankerUser then
		return true
	end

	return false
end

HlssmModel.destroy = function (slot0)
	return
end

return
