slot2 = "FishingJoyView"
FishingJoyView = class(slot1)

FishingJoyView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/fishingjoy/csb/layer/fishingJoy.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

FishingJoyView.bindChildrenViews = function (slot0)
	slot9 = false

	slot0:bindTabView(slot0, slot1, "module/fishingjoy/csb/layer/fishingJoyRoom.csb", "curShowingViewType", VIEW_TYPE_ROOM)

	slot9 = true

	slot0:bindTabView(slot0, slot1, "module/fishingjoy/csb/layer/fishingJoyBattle.csb", "curShowingViewType", VIEW_TYPE_BATTLE)

	slot7 = slot0
	slot9 = false

	slot0:bindTabView(slot0, slot0.getRootView("module/fishingjoy/csb/layer/fishingJoyBattle.csb").layerLoading, "module/fishingjoy/csb/layer/fishingJoyLoading.csb", "isShowingLoading", true)

	slot7 = slot0
	slot9 = false

	slot0:bindTabView(slot0, slot0.getRootView("module/fishingjoy/csb/layer/fishingJoyLoading.csb").layerLoading, "module/fishingjoy/csb/layer/fishingJoyBattleLoading.csb", "isShowingBattleLoading", true)

	slot7 = "isShowingRule"

	slot0:bindPopUpChildView(slot0, "rule", "module/fishingjoy/csb/layer/fishingJoyRule.csb")

	slot7 = "isShowingSetting"

	slot0:bindPopUpChildView(slot0, "setting", "module/fishingjoy/csb/layer/fishingJoySetting.csb")

	slot7 = "isShowingExit"

	slot0:bindPopUpChildView(slot0, "exit", "module/fishingjoy/csb/layer/fishingJoyExit.csb")
end

FishingJoyView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return FishingJoyView
