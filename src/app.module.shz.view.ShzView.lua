ShzView = class("ShzView")

if not IS_GUAN_VERIFY then
	requireLuaFromModule("shz.view.ccs.ShzRoomCcsView")

	ccs.ShzRoomCcsView = ShzRoomCcsView
end

requireLuaFromModule("shz.view.ccs.ShzGameItemCcsView")

ccs.ShzGameItemCcsView = ShzGameItemCcsView

requireLuaFromModule("shz.view.ccs.ShzGameItemListCcsView")

ccs.ShzGameItemListCcsView = ShzGameItemListCcsView

requireLuaFromModule("shz.view.ccs.ShzDiceGameCcsView")

ccs.ShzDiceGameCcsView = ShzDiceGameCcsView

requireLuaFromModule("shz.view.ccs.ShzMaryWaiItemCcsView")

ccs.ShzMaryWaiItemCcsView = ShzMaryWaiItemCcsView

requireLuaFromModule("shz.view.ccs.ShzMaryMidItemCcsView")

ccs.ShzMaryMidItemCcsView = ShzMaryMidItemCcsView

requireLuaFromModule("shz.view.ccs.ShzMaryMidItemListCcsView")

ccs.ShzMaryMidItemListCcsView = ShzMaryMidItemListCcsView

requireLuaFromModule("shz.view.ccs.ShzMaryGameCcsView")

ccs.ShzMaryGameCcsView = ShzMaryGameCcsView

requireLuaFromModule("shz.view.ccs.ShzBattleCcsView")

ccs.ShzBattleCcsView = ShzBattleCcsView

ShzView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/shz/csb/layer/Shz.csb")
	slot0:setRootClickable(false)
end

ShzView.bindChildrenViews = function (slot0)
	slot1 = slot0:getRootView().layerView
	slot2 = "curShowingViewType"

	if not IS_GUAN_VERIFY then
		slot0:bindTabView(slot1, "module/shz/csb/layer/ShzRoom.csb", slot2, VIEW_TYPE_ROOM, false)
		slot0:bindTabView(slot0:getRootView().layerLoading, "module/shz/csb/layer/ShzLoading.csb", "isShowingLoading", true, false)
	end

	slot0:bindTabView(slot1, "module/shz/csb/layer/ShzBattle.csb", slot2, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot3, "module/shz/csb/layer/ShzMenu.csb", "isShowingMenu", true, false)
	slot0:bindPopUpChildView("bank", "module/shz/csb/layer/ShzBank.csb", "isShowingBank")
	slot0:bindPopUpChildView("rule", "module/shz/csb/layer/ShzRule.csb", "isShowingRule")
	slot0:bindPopUpChildView("setting", "module/shz/csb/layer/ShzSetting.csb", "isShowingSetting")
end

ShzView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

return
