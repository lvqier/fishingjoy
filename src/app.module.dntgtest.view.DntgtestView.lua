slot2 = "DntgtestView"
DntgtestView = class(slot1)
slot2 = "dntgtest.view.ccs.DntgtestRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "dntgtest.view.ccs.DntgtestBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "dntgtest.view.ccs.DntgtestRuleCcsView"

requireLuaFromModule(slot1)

slot2 = "dntgtest.view.ccs.DntgtestExitCcsView"

requireLuaFromModule(slot1)

slot2 = "dntgtest.view.ccs.DntgtestLoadingCcsView"

requireLuaFromModule(slot1)

slot2 = "dntgtest.view.ccs.DntgtestBattleLoadingCcsView"

requireLuaFromModule(slot1)

ccs.DntgtestRoomCcsView = DntgtestRoomCcsView
ccs.DntgtestBattleCcsView = DntgtestBattleCcsView
ccs.DntgtestRuleCcsView = DntgtestRuleCcsView
ccs.DntgtestExitCcsView = DntgtestExitCcsView
ccs.DntgtestLoadingCcsView = DntgtestLoadingCcsView
ccs.DntgtestBattleLoadingCcsView = DntgtestBattleLoadingCcsView

DntgtestView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/dntgtest/csb/layer/Dntg.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

DntgtestView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot1, "module/dntgtest/csb/layer/DntgRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/dntgtest/csb/layer/DntgBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/dntgtest/csb/layer/DntgBattle.csb").layerLoading, "module/dntgtest/csb/layer/DntgLoading.csb", "isShowingLoading", true)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/dntgtest/csb/layer/DntgLoading.csb").layerLoading, "module/dntgtest/csb/layer/DntgBattleLoading.csb", "isShowingBattleLoading", true)

	slot8 = "isShowingRule"

	slot0.bindPopUpChildView(slot4, slot0, "rule", "module/dntgtest/csb/layer/DntgRule.csb")

	slot8 = "isShowingSetting"

	slot0.bindPopUpChildView(slot4, slot0, "setting", "module/dntgtest/csb/layer/DntgSetting.csb")

	slot8 = "isShowingExit"

	slot0.bindPopUpChildView(slot4, slot0, "exit", "module/dntgtest/csb/layer/DntgExit.csb")

	slot8 = "isShowingQualityTip"

	slot0.bindPopUpChildView(slot4, slot0, "qualityTip", "module/dntgtest/csb/layer/DntgQualityTip.csb")

	if IS_IOS_VERIFY and IS_IOS_VERIFY_BANK then
		slot8 = "isShowingBank"

		slot0.bindPopUpChildView(slot4, slot0, "bank", "module/dntgtest/csb/layer/DntgBank.csb")
	end
end

DntgtestView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
