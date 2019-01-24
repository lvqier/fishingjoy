QznnbView = class("QznnbView")

requireLuaFromModule("qznnb.view.ccs.QznnbCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbAutoCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbBattleCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbHallCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbPlayerInfoCcsPane")
requireLuaFromModule("qznnb.view.ccs.QznnbResultFailedCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbResultWinCcsView")
requireLuaFromModule("qznnb.view.ccs.QznnbRoomCcsView")

ccs.QznnbCcsView = QznnbCcsView
ccs.QznnbAutoCcsView = QznnbAutoCcsView
ccs.QznnbBattleCcsView = QznnbBattleCcsView
ccs.QznnbHallCcsView = QznnbHallCcsView
ccs.QznnbPlayerInfoCcsPane = QznnbPlayerInfoCcsPane
ccs.QznnbResultFailedCcsView = QznnbResultFailedCcsView
ccs.QznnbResultWinCcsView = QznnbResultWinCcsView
ccs.QznnbRoomCcsView = QznnbRoomCcsView

QznnbView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/qznnb/csb/layer/Qznnb.csb")
	slot0:setRootClickable(false)
end

QznnbView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/qznnb/csb/layer/QznnbRoom.csb", slot2, VIEW_TYPE_ROOM, false)
	slot0:bindTabView(slot1, "module/qznnb/csb/layer/QznnbHall.csb", slot2, VIEW_TYPE_HALL, true)
	slot0:bindTabView(slot1, "module/qznnb/csb/layer/QznnbBattle.csb", slot2, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot0:getRootView().layerMenu, "module/qznnb/csb/layer/QznnbMenu.csb", "isShowingMenu", true, false)

	if not NEED_CHANGE_SUB_GAME_NAME then
		slot0:bindTabView(slot0:getRootView().layerLoading, "module/qznnb/csb/layer/QznnbLoading.csb", "isShowingLoading", true, false)
	end

	slot0:bindPopUpChildView("auto", "module/qznnb/csb/layer/QznnbAuto.csb", "isShowingAuto", nil, slot4)
	slot0:bindPopUpChildView("rule", "module/qznnb/csb/layer/QznnbRule.csb", "isShowingRule", nil, slot7)
	slot0:bindPopUpChildView("setting", "module/qznnb/csb/layer/QznnbSetting.csb", "isShowingSetting", nil, slot4)
	slot0:bindPopUpChildView("bank", "module/qznnb/csb/layer/QznnbBank.csb", "isShowingBank", nil, slot6)
	slot0:bindPopUpChildView("win", "module/qznnb/csb/layer/QznnbResultWin.csb", "isShowingWin", nil, slot0:getRootView().layerResult)
end

QznnbView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
