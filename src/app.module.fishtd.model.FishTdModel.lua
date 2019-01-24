FishTdModel = class("FishTdModel")

FishTdModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_FISHTD, nil, nil, nil, true)
	createSetterGetter(slot0, "isAutoLocking", false, true)
	createSetterGetter(slot0, "isAutoFire", false, true)
	createSetterGetter(slot0, "fireSpeed", 1, true)
	createSetterGetter(slot0, "isShowingWikiDetail", false, true)
	createSetterGetter(slot0, "wikiShowType", "normal", true)
	createSetterGetter(slot0, "wikiDetailShowData", nil, true)
	createSetterGetter(slot0, "wikiDetailShowDataIndex", nil, true)
	createSetterGetter(slot0, "normalWikiData", {}, true)
	createSetterGetter(slot0, "specialWikiData", {}, true)
	createSetterGetter(slot0, "bossWikiData", {}, true)
	createSetterGetter(slot0, "isShowingExitConfirm", false, true)
	createSetterGetter(slot0, "isStatisticReceived", false, true)
	createSetterGetter(slot0, "isSendingStatisticRequest", false, true)
	createSetterGetter(slot0, "statisticData", false, true)
	createSetterGetter(slot0, "fishStatisticData", false, true)
	createSetterGetter(slot0, "PLAYER_OUT_OF_MONEY", false, true)
	createSetterGetter(slot0, "SHOW_BONUS", false, true)
	createSetterGetter(slot0, "isShowingPacket", false, true)

	slot0.spineLogoKeyInLoading = "by_loading"
	slot0.useCustomizedLogoAnimation = true
	slot0.logoAnimationConfig = {
		"start",
		"idle"
	}
	slot0._loadingDuration = 5
end

FishTdModel.destroy = function (slot0)
	return
end

return
