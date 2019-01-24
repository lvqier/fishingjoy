PlazaModel = class("PlazaModel")
PLAZA_MAIN = 10
PLAZA_SUB_BU_YU = 21
PLAZA_SUB_QI_PAI = 22
PLAZA_SUB_XIU_XIAN = 23
PLAZA_SUB_DUO_REN = 24
PLAZA_ROOM = 31
PLAZA_SUB_GROUP_NIU_NIU = 51

PlazaModel.ctor = function (slot0)
	createSetterGetter(slot0, "curGameKind", nil, true)
	createSetterGetter(slot0, "curGameType", nil, true)
	createSetterGetter(slot0, "isSwitchViewBackOrForward", false)
	createSetterGetter(slot0, "curShowingViewType", nil, true, true)
	createSetterGetter(slot0, "curShowingView", nil)
	createSetterGetter(slot0, "preShowingViewType", nil, false, true)
	createSetterGetter(slot0, "isShowingRoomList", false, true)
	createSetterGetter(slot0, "isShowingBankPasswordForget", false, true)
	createSetterGetter(slot0, "isShowingBankPasswordReset", false, true)
	createSetterGetter(slot0, "isShowingFirstPay", false, true)
	createSetterGetter(slot0, "rankListData", {}, true)
	createSetterGetter(slot0, "rankTabIndex", nil, true)
	createSetterGetter(slot0, "isShowingBankLogin", false, true)
	createSetterGetter(slot0, "isShowingRank", false, true)
	createSetterGetter(slot0, "isShowingCustomService", false, true)
	createSetterGetter(slot0, "isShowingEMailDetail", false, true)
	createSetterGetter(slot0, "isShowingNewbieReward", false, true)
	createSetterGetter(slot0, "isShowSjbHdts", false, true)
	createSetterGetter(slot0, "isShowDzpkMatchHdts", false, true)
	createSetterGetter(slot0, "isShowingReport", false, true)
	createSetterGetter(slot0, "isShowingRouletee", false, true)
	createSetterGetter(slot0, "isShowingBackups", false, true)
	createSetterGetter(slot0, "isShowingRouleteeReward", false, true)
	createSetterGetter(slot0, "rouleteeTabIndex", 0, true)
	createSetterGetter(slot0, "rouleteeData", nil, true)
	createSetterGetter(slot0, "rouleteeListData", nil, true)
	createSetterGetter(slot0, "rouleteeRewardData", nil, true)
	createSetterGetter(slot0, "isShowingYydbResult", false, true)
	createSetterGetter(slot0, "yydbWinningNumber", false, true)
	createSetterGetter(slot0, "yydbEffectEndSignal", SignalAs3.new(), nil, true)
	createSetterGetter(slot0, "curSelectedKfQnAData", nil, true)
	createSetterGetter(slot0, "updateKfListViewSignal", SignalAs3.new(), nil, true)
	createSetterGetter(slot0, "gzhFileUrl", nil, true)
	createSetterGetter(slot0, "eMailListData", {}, true)
	createSetterGetter(slot0, "hasNewEMailCount", 0, true)
	createSetterGetter(slot0, "bShowEMailDataLoading", false, true)
	createSetterGetter(slot0, "isDeleteAllEmail", false, true)
	createSetterGetter(slot0, "isQuickStart", false, true)
	createSetterGetter(slot0, "forgetSmsCd", 0, true)
	createSetterGetter(slot0, "forgetSmsCode", "")
	createSetterGetter(slot0, "bankPassword", "")
	createSetterGetter(slot0, "phoneNumStr", "")
	createSetterGetter(slot0, "curEMailDetail", "")
	createSetterGetter(slot0, "curEMailMsgId", 0)
	createSetterGetter(slot0, "curEMailDetailType", 1)
	createSetterGetter(slot0, "csTabIndex", nil, true)
	createSetterGetter(slot0, "isShowingSignIn", false, true)
	createSetterGetter(slot0, "isShowingMonthCard", false, true)
	createSetterGetter(slot0, "monthCardData", {}, true)
	createSetterGetter(slot0, "signInData", {}, true)
	createSetterGetter(slot0, "isShowingRedPacketMain", false, true)
	createSetterGetter(slot0, "isShowingRedPacketHdxq", false, true)
	createSetterGetter(slot0, "redPacketInfo", nil, true)
	createSetterGetter(slot0, "redPacketRewardScore", 0, true)
end

PlazaModel.setCurShowingViewType = function (slot0, slot1, slot2, slot3)
	if slot1 ~= slot0._curShowingViewType then
		slot0._preShowingViewType = slot0._curShowingViewType
		slot0._curShowingViewType = slot1

		if not slot3 then
			slot0.curShowingViewTypeChangedSignal:emit(slot1)
		end
	end
end

PlazaModel.destroy = function (slot0)
	return
end

return
