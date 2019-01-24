SerialView = class("SerialView")

requireLuaFromModule("serial.view.ccs.SerialRoomCcsView")
requireLuaFromModule("serial.view.ccs.SerialBattleCcsView")
requireLuaFromModule("serial.view.ccs.SerialBankCcsView")
requireLuaFromModule("serial.view.ccs.SerialNoticeCcsPane")
requireLuaFromModule("serial.view.ccs.SerialReplayHeadItemCcsView")
requireLuaFromModule("serial.view.ccs.SerialReplayDiscussItemCcsView")
requireLuaFromModule("serial.view.ccs.SerialExitCcsView")
requireLuaFromModule("serial.view.ccs.SerialMenuCcsView")
requireLuaFromModule("serial.view.ccs.SerialRuleCcsView")
requireLuaFromModule("serial.view.ccs.SerialLjRuleCcsView")

ccs.SerialRoomView = SerialRoomCcsView
ccs.SerialBattleCcsView = SerialBattleCcsView
ccs.SerialBankView = SerialBankCcsView
ccs.SerialNoticeCcsPane = SerialNoticeCcsPane
ccs.SerialReplayHeadItemCcsView = SerialReplayHeadItemCcsView
ccs.SerialReplayDiscussItemCcsView = SerialReplayDiscussItemCcsView
ccs.SerialExitCcsView = SerialExitCcsView
ccs.SerialMenuCcsView = SerialMenuCcsView
ccs.SerialRuleCcsView = SerialRuleCcsView
ccs.SerialLjRuleCcsView = SerialLjRuleCcsView

SerialView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/serial/csb/layer/Serial.csb")

	slot0._maskOpacity = 0

	slot0:setRootClickable(false)
end

SerialView.onShow = function (slot0)
	BaseModuleUIView.onShow(slot0)
end

SerialView.onHide = function (slot0)
	BaseModuleUIView.onHide(slot0)
end

SerialView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/serial/csb/layer/SerialRoom.csb", slot3, VIEW_TYPE_ROOM, true)
	slot0:bindTabView(slot1, "module/serial/csb/layer/SerialBattle.csb", slot3, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot2, "module/serial/csb/layer/SerialLoading.csb", "isShowingLoading", true, false)
	slot0:bindTabView(slot0:getRootView().layerMenu, "module/serial/csb/layer/SerialMenu.csb", "isShowingMenu", true, false)
	slot0:bindPopUpChildView("rule", "module/serial/csb/layer/SerialRule.csb", "isShowingRule")
	slot0:bindPopUpChildView("setting", "module/serial/csb/layer/SerialSetting.csb", "isShowingSetting")
	slot0:bindPopUpChildView("bank", "module/serial/csb/layer/SerialBank.csb", "isShowingBank")
	slot0:bindPopUpChildView("exit", "module/serial/csb/layer/SerialExit.csb", "isShowingExit")
	slot0:bindPopUpChildView("ljrule", "module/serial/csb/layer/SerialLjRule.csb", "isShowingLjRule")

	slot0.model.noticeControl = slot0:getRootView().layerGameNotice
end

SerialView.hide = function (slot0, slot1, slot2, slot3)
	BaseModuleUIView.hide(slot0, slot1, slot2, slot3)
	audioMgr:playMainMusic()
end

SerialView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
