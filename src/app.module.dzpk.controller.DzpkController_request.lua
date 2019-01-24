DzpkController.reqReady = function (slot0)
	slot3 = slot0.model

	if slot0.model.getNeedToBuy(slot2) then
		return
	end

	slot3 = "===========请求准备=========="

	print(slot2)

	slot4 = 0

	slot0.model.setScoreByBuy(slot2, slot0.model)

	slot3 = true

	reqReady(slot2)
end

DzpkController.requestAddScore = function (slot0, slot1)
	slot0.clearCd(slot3)

	slot10 = true

	doReqServerViaStruct(slot0, "加注", {
		lScore = slot1
	}, "DZPK_CMD_C_Raise", MDM_GF_GAME, Dzpk_SUB_C_RAISE)
end

DzpkController.requestFollow = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "跟注", nil, nil, MDM_GF_GAME, Dzpk_SUB_C_CALL)
end

DzpkController.requestFFollow = function (slot0, slot1)
	slot0.clearCd(slot3)

	slot10 = true

	doReqServerViaStruct(slot0, "下注", {
		lScore = slot1
	}, "DZPK_CMD_C_Bet", MDM_GF_GAME, Dzpk_SUB_C_BET)
end

DzpkController.requestAllin = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot3 = "================fjsdfjdlskjflskj======"

	print(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "allin", nil, nil, MDM_GF_GAME, Dzpk_SUB_C_ALLIN)
end

DzpkController.requestGiveUp = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "弃牌", nil, nil, MDM_GF_GAME, Dzpk_SUB_C_FOLD)
end

DzpkController.requestPass = function (slot0)
	slot3 = slot0

	slot0.clearCd(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "过牌", nil, nil, MDM_GF_GAME, Dzpk_SUB_C_CHECK)
end

DzpkController.requestMatchInfo = function (slot0)
	slot3 = "============DzpkController:requestMatchInfo================"

	print(slot2)

	slot4 = {}

	slot0.model.setMatchResponseTab(slot2, slot0.model)

	slot4 = Hero
	slot10 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "德州扑克比赛信息", {
		dwUserID = Hero.getDwUserID(slot0.model)
	}, "CMD_MB_LoadTexasHoldemMatchRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_MATCH_REQUEST, true)
end

DzpkController.requestJoinMatchInfo = function (slot0)
	slot4 = {}

	slot0.model.setJoinMatchResponseTab(slot2, slot0.model)

	slot4 = Hero
	slot4 = "============DzpkController:requestJoinMatchInfo================"

	print(slot0.model)

	slot10 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "我参加的德州扑克比赛信息", {
		dwUserID = Hero.getDwUserID(slot0.model)
	}, "CMD_MB_LoadTexasHoldemJoinMatchRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_JOIN_MATCH_REQUEST, true)
end

DzpkController.requestPassMatchInfo = function (slot0)
	slot3 = "===========DzpkController:requestPassMatchKInfo================"

	print(slot2)

	slot4 = {}

	slot0.model.setPassMatchResponseTab(slot2, slot0.model)

	slot4 = Hero
	slot10 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "我的过往比赛信息", {
		dwUserID = Hero.getDwUserID(slot0.model)
	}, "CMD_MB_LoadTexasHoldemMatchRecordRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_MATCH_RECORD_REQUEST, true)
end

DzpkController.requestPassJoinInfo = function (slot0, slot1)
	slot4 = "===========DzpkController:requestPassJoinInfo================"

	print(slot3)

	slot5 = {}

	slot0.model.setPassJoinTab(slot3, slot0.model)

	slot5 = nil

	slot0.model.setMySelfPassJoinRankData(slot3, slot0.model)

	slot5 = Hero
	slot11 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "我的某个过往比赛排名信息", {
		dwPeriodID = slot1,
		dwUserID = Hero.getDwUserID(slot0.model)
	}, "CMD_MB_LoadTexasHoldemMatchResultRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_MATCH_RESULT_REQUEST, true)
end

DzpkController.requestBlindMatchInfo = function (slot0, slot1)
	slot5 = {}

	slot0.model.setBlindResponseTab(slot3, slot0.model)

	slot11 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "德州扑克比赛盲注信息", {
		wMatchID = slot1
	}, "CMD_MB_LoadTexasHoldemBlindRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_BLIND_REQUEST, true)
end

DzpkController.requestBonusInfo = function (slot0, slot1)
	slot5 = {}

	slot0.model.setBonusResponseTab(slot3, slot0.model)

	slot11 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot0.model, "加载某个比赛的固定奖励信息", {
		wMatchID = slot1
	}, "CMD_MB_LoadTexasHoldemFixedBonusRequest", MDM_MB_MATCH, SUB_MB_LOAD_TEXASHOLDEM_FIXEDBONUS_REQUEST, true)
end

DzpkController.requestJoinMatch = function (slot0, slot1, slot2)
	slot6 = Hero
	slot6 = Hero
	slot6 = bridgeMgr
	slot12 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot5, "报名", {
		wMatchID = slot1,
		wServerID = slot2,
		wUserID = Hero.getDwUserID(slot5),
		szTempPassword = Hero.getSzToken(slot5),
		szMachineID = bridgeMgr.getPhoneUUId(slot5)
	}, "CMD_MB_JoinTexasHoldemMatchRequest", MDM_MB_MATCH, SUB_MB_JOIN_TEXASHOLDEM_MATCH_REQUEST, true)
end

DzpkController.requestQuitMatch = function (slot0, slot1, slot2)
	slot6 = Hero
	slot6 = Hero
	slot6 = bridgeMgr
	slot12 = SOCKET_TYPE_LOAD

	doReqServerViaStruct(slot5, "取消报名", {
		wMatchID = slot1,
		wServerID = slot2,
		wUserID = Hero.getDwUserID(slot5),
		szTempPassword = Hero.getSzToken(slot5),
		szMachineID = bridgeMgr.getPhoneUUId(slot5)
	}, "CMD_MB_QuitTexasHoldemMatchRequest", MDM_MB_MATCH, SUB_MB_QUIT_TEXASHOLDEM_MATCH_REQUEST, true)
end

DzpkController.requestBuyScore = function (slot0, slot1)
	print(slot3)

	slot10 = true

	doReqServerViaStruct("===========DzpkController:requestBuyScore================", "重购筹码", {
		lChip = slot1
	}, "CMD_GR_TexasHoldem_Rebuy_Request", MDM_GR_MATCH, SUB_GR_TEXASHOLDEM_REBUY_REQ)
end

DzpkController.requestBuyAddScore = function (slot0, slot1)
	print(slot3)

	slot10 = true

	doReqServerViaStruct("===========DzpkController:requestBuyAddScore================", "重购筹码", {
		lChip = slot1
	}, "CMD_GR_TexasHoldem_Addon_Request", MDM_GR_MATCH, SUB_GR_TEXASHOLDEM_ADDON_REQ)
end

DzpkController.requestMatchKuangInfo = function (slot0)
	slot3 = "===========DzpkController:requestMatchKuangInfo================"

	print(slot2)

	slot8 = true

	doReqServerViaStruct(slot2, "请求赛况", nil, nil, MDM_GR_MATCH, SUB_GR_TEXASHOLDEM_MATCHDETAILINFO_REQ)
end

DzpkController.shareWechat = function (slot0, slot1, slot2)
	slot5 = slot2
	slot11, slot4 = slot2.getPosition(slot4)
	slot8 = uiMgr.getTopLayerInAllScene(slot2)
	slot12 = slot4 + slot2.getContentSize(slot6).height * slot2:getScaleY() * 0.5
	slot10 = DisplayUtil.getPositionFromTo(slot2.getScaleY(), slot2:getParent(), cc.p(uiMgr, slot3))

	popupMgr.showSharePopup(slot2.getParent(), popupMgr, slot1)
end

DzpkController.matchResultshareWechat = function (slot0, slot1)
	slot4 = slot0.model

	if not slot0.model.getMatchShareInfo(slot3) or not slot2.StartTime then
		return
	end

	slot12 = slot2.StartTime.wSecond
	slot2.startTimeStr = string.format(slot5, "%d-%02d-%02d %02d:%02d:%02d", slot2.StartTime.wYear, slot2.StartTime.wMonth, slot2.StartTime.wDay, slot2.StartTime.wHour, slot2.StartTime.wMinute)
	slot9 = slot1

	slot0.shareWechat("%d-%02d-%02d %02d:%02d:%02d", slot0, {
		function ()
			slot3 = gameMgr.dzpkShareFriend

			gameMgr.dzpkShareFriend(slot1, gameMgr)
		end,
		function ()
			slot3 = gameMgr.dzpkShareCircile

			gameMgr.dzpkShareCircile(slot1, gameMgr)
		end
	})
end

DzpkController.matchInfoshareWechat = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	slot2 = {
		szMatchName = slot0.model.getSelMatchData(slot4).szMatchName
	}
	slot5 = slot0.model
	slot5 = slot0.model
	slot5 = slot0.model
	slot5 = slot0.model
	slot2.lAward = slot0.model.getBonusResponseTab(slot4)[1].lAward or 0

	trace_r(slot4)

	slot8 = slot1

	slot0.shareWechat(slot2, slot0, {
		function ()
			slot3 = gameMgr.dzpkMatchInfoShareFriend

			gameMgr.dzpkMatchInfoShareFriend(slot1, gameMgr)
		end,
		function ()
			slot3 = gameMgr.dzpkMatchInfoShareCircile

			gameMgr.dzpkMatchInfoShareCircile(slot1, gameMgr)
		end
	})
end

return
