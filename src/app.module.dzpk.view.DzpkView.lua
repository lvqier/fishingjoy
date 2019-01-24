slot2 = "DzpkView"
DzpkView = class(slot1)
slot2 = "dzpk.view.ccs.DzpkBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkBetInfoCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkBtnCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPlayerInfoCcsPane"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkEffectCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkSlider"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkBonusPoolItem"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkLoadingCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchEnrollCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchItemCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchInfoCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkJiangliItemCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMangzhuItemCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkCompetitionCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchBuyCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchReadyCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkMatchRewardCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPassMatchItemCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPassMatchListCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPassJoinItemCcsView"

requireLuaFromModule(slot1)

slot2 = "dzpk.view.ccs.DzpkPassJoinListCcsView"

requireLuaFromModule(slot1)

ccs.DzpkBattleCcsView = DzpkBattleCcsView
ccs.DzpkRoomCcsView = DzpkRoomCcsView
ccs.DzpkBetInfoCcsView = DzpkBetInfoCcsView
ccs.DzpkBtnCcsView = DzpkBtnCcsView
ccs.DzpkPlayerInfoCcsPane = DzpkPlayerInfoCcsPane
ccs.DzpkEffectCcsView = DzpkEffectCcsView
ccs.DzpkPukeCcsView = DzpkPukeCcsView
ccs.DzpkBonusPoolItem = DzpkBonusPoolItem
ccs.DzpkLoadingCcsView = DzpkLoadingCcsView
ccs.DzpkMatchItemCcsView = DzpkMatchItemCcsView
ccs.DzpkMatchEnrollCcsView = DzpkMatchEnrollCcsView
ccs.DzpkMatchInfoCcsView = DzpkMatchInfoCcsView
ccs.DzpkJiangliItemCcsView = DzpkJiangliItemCcsView
ccs.DzpkMangzhuItemCcsView = DzpkMangzhuItemCcsView
ccs.DzpkCompetitionCcsView = DzpkCompetitionCcsView
ccs.DzpkMatchBuyCcsView = DzpkMatchBuyCcsView
ccs.DzpkMatchReadyCcsView = DzpkMatchReadyCcsView
ccs.DzpkMatchRewardCcsView = DzpkMatchRewardCcsView
ccs.DzpkPassMatchItemCcsView = DzpkPassMatchItemCcsView
ccs.DzpkPassMatchListCcsView = DzpkPassMatchListCcsView
ccs.DzpkPassJoinItemCcsView = DzpkPassJoinItemCcsView
ccs.DzpkPassJoinListCcsView = DzpkPassJoinListCcsView
ccs.DzpkSlider = DzpkSlider

DzpkView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/dzpk/csb/layer/TexasHoldem.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

DzpkView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot1, "module/dzpk/csb/layer/TexasHoldemRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/dzpk/csb/layer/TexasHoldemBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot11 = false

	slot0:bindTabView(slot0, slot3, "module/dzpk/csb/layer/TexasHoldemMenu.csb", "isShowingMenu", true)

	slot9 = slot0
	slot11 = false

	slot0:bindTabView(slot0, slot0.getRootView("module/dzpk/csb/layer/TexasHoldemMenu.csb").layerLoading, "module/dzpk/csb/layer/TexasHoldemLoading.csb", "isShowingLoading", true)

	slot9 = "isShowingRule"

	slot0:bindPopUpChildView(slot0, "rule", "module/dzpk/csb/layer/TexasHoldemRule.csb")

	slot9 = "isShowingSetting"

	slot0:bindPopUpChildView(slot0, "setting", "module/dzpk/csb/layer/TexasHoldemSetting.csb")

	slot9 = "isShowingBank"

	slot0:bindPopUpChildView(slot0, "bank", "module/dzpk/csb/layer/TexasHoldemBank.csb")

	slot9 = "isShowingMatchEnroll"

	slot0:bindPopUpChildView(slot0, "matchEnroll", "module/dzpk/csb/layer/TexasHoldemMatchEnroll.csb")

	slot9 = "isShowingMatchInfo"

	slot0:bindPopUpChildView(slot0, "matchInfo", "module/dzpk/csb/layer/TexasHoldemMatchInfo.csb")

	slot9 = "isShowingMatchBuyInfo"

	slot0:bindPopUpChildView(slot0, "buymatchInfo", "module/dzpk/csb/layer/TexasHoldemAdd.csb")

	slot9 = "isShowingMatchReadyUI"

	slot0:bindPopUpChildView(slot0, "readyUI", "module/dzpk/csb/layer/TexasHoldemReady.csb")

	slot9 = "isShowingMatchReward"

	slot0:bindPopUpChildView(slot0, "rewards", "module/dzpk/csb/layer/TexasHoldemReward.csb")

	slot9 = "isShowPassMatchList"

	slot0:bindPopUpChildView(slot0, "passMatchList", "module/dzpk/csb/layer/TexasHoldemPassMatchList.csb")

	slot9 = "isShowPassJoinList"

	slot0:bindPopUpChildView(slot0, "joinList", "module/dzpk/csb/layer/TexasHoldemPassJoinList.csb")
end

DzpkView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
