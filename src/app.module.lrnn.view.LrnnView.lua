slot2 = "LrnnView"
LrnnView = class(slot1)
slot2 = "lrnn.view.ccs.LrnnCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnHallCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnPlayerInfoCcsPane"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnResultFailedCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnResultWinCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnSelectRoomTypeCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnPoolListCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnPoolRulePopupCcsView"

requireLuaFromModule(slot1)

slot2 = "lrnn.view.ccs.LrnnPoolListCcsItem"

requireLuaFromModule(slot1)

ccs.LrnnCcsView = LrnnCcsView
ccs.LrnnBattleCcsView = LrnnBattleCcsView
ccs.LrnnHallCcsView = LrnnHallCcsView
ccs.LrnnPlayerInfoCcsPane = LrnnPlayerInfoCcsPane
ccs.LrnnResultFailedCcsView = LrnnResultFailedCcsView
ccs.LrnnResultWinCcsView = LrnnResultWinCcsView
ccs.LrnnRoomCcsView = LrnnRoomCcsView
ccs.LrnnSelectRoomTypeCcsView = LrnnSelectRoomTypeCcsView
ccs.LrnnPoolListCcsView = LrnnPoolListCcsView
ccs.LrnnPoolRulePopupCcsView = LrnnPoolRulePopupCcsView
ccs.LrnnPoolListCcsItem = LrnnPoolListCcsItem

LrnnView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/lrnn/csb/layer/Lrnn.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

LrnnView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot1, "module/lrnn/csb/layer/LrnnRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/lrnn/csb/layer/LrnnHall.csb", slot2, VIEW_TYPE_HALL)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/lrnn/csb/layer/LrnnBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot11 = false

	slot0:bindTabView(slot0, slot0.getRootView(slot4).layerMenu, "module/lrnn/csb/layer/LrnnMenu.csb", "isShowingMenu", true)

	if not NEED_CHANGE_SUB_GAME_NAME then
		slot12 = false

		slot0:bindTabView(slot0, slot0.getRootView(slot5).layerLoading, "module/lrnn/csb/layer/LrnnLoading.csb", "isShowingLoading", true)
	end

	slot15 = slot0:getRootView().layerBank

	slot0:bindPopUpChildView(slot0, "roomType", "module/lrnn/csb/layer/LrnnCc.csb", "isShowingSelectRoomType", nil)

	slot15 = slot0.getRootView(slot5).layerPopup

	slot0:bindPopUpChildView(slot0, "poolRule", "module/lrnn/csb/layer/LrnnCcRule.csb", "isShowingPoolRule", nil)

	slot15 = slot0.getRootView(slot5).layerPopup

	slot0:bindPopUpChildView(slot0, "poolList", "module/lrnn/csb/layer/LrnnCcWjpm.csb", "isShowingPoolList", nil)

	slot15 = slot0:getRootView().layerHelp

	slot0:bindPopUpChildView(slot0, "rule", "module/lrnn/csb/layer/LrnnRule.csb", "isShowingRule", nil)

	slot15 = slot0.getRootView(slot5).layerPopup

	slot0:bindPopUpChildView(slot0, "setting", "module/lrnn/csb/layer/LrnnSetting.csb", "isShowingSetting", nil)

	slot15 = slot0.getRootView().layerBank

	slot0:bindPopUpChildView(slot0, "bank", "module/lrnn/csb/layer/LrnnBank.csb", "isShowingBank", nil)

	slot15 = slot0:getRootView().layerResult

	slot0:bindPopUpChildView(slot0, "win", "module/lrnn/csb/layer/LrnnResultWin.csb", "isShowingWin", nil)
end

LrnnView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
