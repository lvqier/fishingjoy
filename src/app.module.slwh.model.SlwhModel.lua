slot2 = "SlwhModel"
SlwhModel = class(slot1)

SlwhModel.ctor = function (slot0)
	slot10 = true

	ClassUtil.extends(slot2, slot0, BaseGameModel, true, GameKind_SLWH, nil, nil, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingConfirm", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingExit", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingJetton", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingRewardNormal", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "userGameStatus", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "cellScoreArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "areaUserBetArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "areaTotalBetArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "areaBetMultiplyArray", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "userReward", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "historyRewards", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "remindTime", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "userTotalJetton", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "allUserBetNumber", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "userSessionScore", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "userSessionCaiJin", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "preAreaUserBetOrder", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "curAreaUserBetOrder", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "curSelectdGold", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "canJettonContinue", false)

	if SLWH_AFTER_WITHDRAWAL_CAN_BET == false then
		slot6 = false

		createSetterGetter(slot2, slot0, "selfBetStartMoney", 0)
	end

	slot0.musicBg = Tree.Sound.roomBgSound
	slot0.useCustomizedLogoAnimation = true
	slot0.spineLogoKeyInLoading = "slwh_loading"
	slot0.spineLogoKeyInLoading2 = "slwh_loadinggx"
	slot0.logoAnimationConfig = {
		"start",
		"idle"
	}
	slot0.onlineItemPath = "module/slwh/csb/common/SlwhOnlineThreeItem.csb"
	slot0.onlineItemScoreNumRes = "#slwh_jetton_player_gold_%s.png"
	slot0.onlineDataCount = 3
	slot0._loadingDuration = 4
end

SlwhModel.destroy = function (slot0)
	slot3 = slot0

	BaseGameModel.destroy(slot2)
end

return
