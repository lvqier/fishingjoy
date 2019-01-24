slot2 = "JxlwView"
JxlwView = class(slot1)

if not IS_GUAN_VERIFY then
	slot2 = "jxlw.view.ccs.JxlwRoomCcsView"

	requireLuaFromModule(slot1)

	ccs.JxlwRoomCcsView = JxlwRoomCcsView
end

slot2 = "jxlw.view.ccs.JxlwBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "jxlw.view.ccs.JxlwNoticeCcsPane"

requireLuaFromModule(slot1)

ccs.JxlwBattleCcsView = JxlwBattleCcsView
ccs.JxlwNoticeCcsPane = JxlwNoticeCcsPane

JxlwView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/jxlw/csb/layer/Jxlw.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

JxlwView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot1 = slot0.getRootView(slot2).layerView
	slot2 = "curShowingViewType"

	if not IS_GUAN_VERIFY then
		slot10 = false

		slot0.bindTabView(slot4, slot0, slot1, "module/jxlw/csb/layer/JxlwRoom.csb", slot2, VIEW_TYPE_ROOM)

		slot8 = slot0
		slot10 = false

		slot0.bindTabView(slot4, slot0, slot0.getRootView("module/jxlw/csb/layer/JxlwRoom.csb").layerLoading, "module/jxlw/csb/layer/JxlwLoading.csb", "isShowingLoading", true)
	end

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/jxlw/csb/layer/JxlwBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot11 = false

	slot0:bindTabView(slot0, slot3, "module/jxlw/csb/layer/JxlwMenu.csb", "isShowingMenu", true)

	slot9 = "isShowingBank"

	slot0:bindPopUpChildView(slot0, "bank", "module/jxlw/csb/layer/JxlwBank.csb")

	slot9 = "isShowingRule"

	slot0:bindPopUpChildView(slot0, "rule", "module/jxlw/csb/layer/JxlwRule.csb")

	slot9 = "isShowingSetting"

	slot0:bindPopUpChildView(slot0, "setting", "module/jxlw/csb/layer/JxlwSetting.csb")

	slot7 = slot0
	slot0.model.noticeControl = slot0:getRootView().layerGameNotice
end

JxlwView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
