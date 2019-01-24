LhdView = class("LhdView")

requireLuaFromModule("lhd.view.ccs.LhdLoadingCcsView")
requireLuaFromModule("lhd.view.ccs.LhdRoomCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBattleCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBankCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExDLItemCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExDYZItemCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExXLItemCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExXQLItemCcsView")
requireLuaFromModule("lhd.view.ccs.LhdBalanceExZPItemCcsView")

ccs.LhdLoadingCcsView = LhdLoadingCcsView
ccs.LhdRoomCcsView = LhdRoomCcsView
ccs.LhdBattleCcsView = LhdBattleCcsView
ccs.LhdBalanceCcsView = LhdBalanceCcsView
ccs.LhdBankCcsView = LhdBankCcsView
ccs.LhdBalanceExCcsView = LhdBalanceExCcsView
ccs.LhdBalanceExDLItemCcsView = LhdBalanceExDLItemCcsView
ccs.LhdBalanceExDYZItemCcsView = LhdBalanceExDYZItemCcsView
ccs.LhdBalanceExXLItemCcsView = LhdBalanceExXLItemCcsView
ccs.LhdBalanceExXQLItemCcsView = LhdBalanceExXQLItemCcsView
ccs.LhdBalanceExZPItemCcsView = LhdBalanceExZPItemCcsView

LhdView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/lhd/csb/layer/Lhd.csb")
	slot0:setRootClickable(false)
end

LhdView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/lhd/csb/layer/LhdRoom.csb", slot2, VIEW_TYPE_ROOM, false)
	slot0:bindTabView(slot1, "module/lhd/csb/layer/LhdBattle.csb", slot2, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot0:getRootView().layerMenu, "module/lhd/csb/layer/LhdMenu.csb", "isShowingMenu", true, false)
	slot0:bindTabView(slot0:getRootView().layerLoading, "module/lhd/csb/layer/LhdLoading.csb", "isShowingLoading", true, false)
	slot0:bindPopUpChildView("rule", "module/lhd/csb/layer/LhdRule.csb", "isShowingRule")
	slot0:bindPopUpChildView("setting", "module/lhd/csb/layer/LhdSetting.csb", "isShowingSetting")
	slot0:bindPopUpChildView("bank", "module/lhd/csb/layer/LhdBank.csb", "isShowingBank")
	slot0:bindPopUpChildView("balance", "module/lhd/csb/layer/LhdBalanceEx.csb", "isShowingBalance")
	slot0:bindPopUpChildView("online", "module/lhd/csb/layer/LhdOnline.csb", "isShowingOnline")
end

LhdView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
