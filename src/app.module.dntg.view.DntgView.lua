DntgView = class("DntgView")

requireLuaFromModule("dntg.view.ccs.DntgRoomCcsView")
requireLuaFromModule("dntg.view.ccs.DntgBattleCcsView")
requireLuaFromModule("dntg.view.ccs.DntgExitCcsView")
requireLuaFromModule("dntg.view.ccs.DntgRuleCcsView")
requireLuaFromModule("dntg.view.ccs.DntgLoadingCcsView")
requireLuaFromModule("dntg.view.ccs.DntgBattleLoadingCcsView")

ccs.DntgRoomCcsView = DntgRoomCcsView
ccs.DntgBattleCcsView = DntgBattleCcsView
ccs.DntgExitCcsView = DntgExitCcsView
ccs.DntgRuleCcsView = DntgRuleCcsView
ccs.DntgLoadingCcsView = DntgLoadingCcsView
ccs.DntgBattleLoadingCcsView = DntgBattleLoadingCcsView

DntgView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/dntg/csb/layer/Dntg.csb")
	slot0:setRootClickable(false)
end

DntgView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/dntg/csb/layer/DntgRoom.csb", slot2, VIEW_TYPE_ROOM, false)
	slot0:bindTabView(slot1, "module/dntg/csb/layer/DntgBattle.csb", slot2, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot0:getRootView().layerLoading, "module/dntg/csb/layer/DntgLoading.csb", "isShowingLoading", true, false)
	slot0:bindTabView(slot0:getRootView().layerLoading, "module/dntg/csb/layer/DntgBattleLoading.csb", "isShowingBattleLoading", true, false)
	slot0:bindPopUpChildView("rule", "module/dntg/csb/layer/DntgRule.csb", "isShowingRule")
	slot0:bindPopUpChildView("setting", "module/dntg/csb/layer/DntgSetting.csb", "isShowingSetting")
	slot0:bindPopUpChildView("exit", "module/dntg/csb/layer/DntgExit.csb", "isShowingExit")

	if (IS_IOS_VERIFY and IS_IOS_VERIFY_BANK) or IS_SDK_VERIFY then
		slot0:bindPopUpChildView("bank", "module/dntg/csb/layer/DntgBank.csb", "isShowingBank")
	end
end

DntgView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
