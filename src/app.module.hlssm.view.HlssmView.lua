HlssmView = class("HlssmView")

requireLuaFromModule("hlssm.view.ccs.HlssmBattleCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmOnlineCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmOnlinePlayerCcsGrid")
requireLuaFromModule("hlssm.view.ccs.HlssmOnlineCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmLogResultCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmLogScoreCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmCountDownCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmJettonCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmSendCardCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmCenterCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmResultWinCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmResultFailCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmRoomCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordCcsView")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordDLCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordDYZCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordXLCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordXQLCcsItem")
requireLuaFromModule("hlssm.view.ccs.HlssmRecordZPLCcsItem")

ccs.HlssmBattleCcsView = HlssmBattleCcsView
ccs.HlssmOnlineCcsView = HlssmOnlineCcsView
ccs.HlssmOnlineCcsItem = HlssmOnlineCcsItem
ccs.HlssmOnlinePlayerCcsGrid = HlssmOnlinePlayerCcsGrid
ccs.HlssmLogResultCcsItem = HlssmLogResultCcsItem
ccs.HlssmLogScoreCcsItem = HlssmLogScoreCcsItem
ccs.HlssmCountDownCcsView = HlssmCountDownCcsView
ccs.HlssmJettonCcsView = HlssmJettonCcsView
ccs.HlssmSendCardCcsView = HlssmSendCardCcsView
ccs.HlssmCenterCcsView = HlssmCenterCcsView
ccs.HlssmResultWinCcsView = HlssmResultWinCcsView
ccs.HlssmResultFailCcsView = HlssmResultFailCcsView
ccs.HlssmRoomCcsView = HlssmRoomCcsView
ccs.HlssmRecordCcsView = HlssmRecordCcsView
ccs.HlssmRecordDLCcsItem = HlssmRecordDLCcsItem
ccs.HlssmRecordXLCcsItem = HlssmRecordXLCcsItem
ccs.HlssmRecordDYZCcsItem = HlssmRecordDYZCcsItem
ccs.HlssmRecordXQLCcsItem = HlssmRecordXQLCcsItem
ccs.HlssmRecordZPLCcsItem = HlssmRecordZPLCcsItem

HlssmView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/hlssm/csb/layer/Hlssm.csb")
	slot0:setRootClickable(false)
end

HlssmView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/hlssm/csb/layer/HlssmRoom.csb", slot2, VIEW_TYPE_ROOM, false)
	slot0:bindTabView(slot1, "module/hlssm/csb/layer/HlssmBattle.csb", slot2, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot3, "module/hlssm/csb/layer/HlssmMenu.csb", "isShowingMenu", true, false)
	slot0:bindTabView(slot4, "module/hlssm/csb/layer/HlssmLoading.csb", "isShowingLoading", true, false)
	slot0:bindPopUpChildView("win", "module/hlssm/csb/layer/HlssmResultWin.csb", "isShowingWin")
	slot0:bindPopUpChildView("failed", "module/hlssm/csb/layer/HlssmResultFail.csb", "isShowingFailed")
	slot0:bindPopUpChildView("bank", "module/hlssm/csb/layer/HlssmBank.csb", "isShowingBank")
	slot0:bindPopUpChildView("rule", "module/hlssm/csb/layer/HlssmRule.csb", "isShowingRule")
	slot0:bindPopUpChildView("setting", "module/hlssm/csb/layer/HlssmSetting.csb", "isShowingSetting")
	slot0:bindPopUpChildView("online", "module/hlssm/csb/layer/HlssmOnline.csb", "isShowingOnline")
	slot0:bindPopUpChildView("record", "module/hlssm/csb/layer/HlssmRecord.csb", "isShowingRecord")
end

HlssmView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
