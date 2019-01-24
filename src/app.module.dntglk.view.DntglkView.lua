slot2 = "DntglkView"
DntglkView = class(slot1)
slot2 = "dntglk.view.ccs.DntglkRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "dntglk.view.ccs.DntglkBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "dntglk.view.ccs.DntglkRuleCcsView"

requireLuaFromModule(slot1)

slot2 = "dntglk.view.ccs.DntglkExitCcsView"

requireLuaFromModule(slot1)

slot2 = "dntglk.view.ccs.DntglkLoadingCcsView"

requireLuaFromModule(slot1)

slot2 = "dntglk.view.ccs.DntglkBattleLoadingCcsView"

requireLuaFromModule(slot1)

ccs.DntglkRoomCcsView = DntglkRoomCcsView
ccs.DntglkBattleCcsView = DntglkBattleCcsView
ccs.DntglkRuleCcsView = DntglkRuleCcsView
ccs.DntglkExitCcsView = DntglkExitCcsView
ccs.DntglkLoadingCcsView = DntglkLoadingCcsView
ccs.DntglkBattleLoadingCcsView = DntglkBattleLoadingCcsView

DntglkView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/dntglk/csb/layer/Dntg.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

DntglkView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot1, "module/dntglk/csb/layer/DntgRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/dntglk/csb/layer/DntgBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/dntglk/csb/layer/DntgBattle.csb").layerLoading, "module/dntglk/csb/layer/DntgLoading.csb", "isShowingLoading", true)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/dntglk/csb/layer/DntgLoading.csb").layerLoading, "module/dntglk/csb/layer/DntgBattleLoading.csb", "isShowingBattleLoading", true)

	slot8 = "isShowingRule"

	slot0.bindPopUpChildView(slot4, slot0, "rule", "module/dntglk/csb/layer/DntgRule.csb")

	slot8 = "isShowingSetting"

	slot0.bindPopUpChildView(slot4, slot0, "setting", "module/dntglk/csb/layer/DntgSetting.csb")

	slot8 = "isShowingExit"

	slot0.bindPopUpChildView(slot4, slot0, "exit", "module/dntglk/csb/layer/DntgExit.csb")

	slot8 = "isShowingQualityTip"

	slot0.bindPopUpChildView(slot4, slot0, "qualityTip", "module/dntglk/csb/layer/DntgQualityTip.csb")

	if IS_IOS_VERIFY and IS_IOS_VERIFY_BANK then
		slot8 = "isShowingBank"

		slot0.bindPopUpChildView(slot4, slot0, "bank", "module/dntglk/csb/layer/DntgBank.csb")
	end
end

DntglkView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
