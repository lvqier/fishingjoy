slot2 = "YszView"
YszView = class(slot1)
slot2 = "ysz.view.ccs.YszBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszBetInfoCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszBetMenuCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszBtnCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszPlayerInfoCcsPane"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszEffectCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszJettonCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszCompareCcsView"

requireLuaFromModule(slot1)

slot2 = "ysz.view.ccs.YszLoadingCcsView"

requireLuaFromModule(slot1)

ccs.YszBattleCcsView = YszBattleCcsView
ccs.YszRoomCcsView = YszRoomCcsView
ccs.YszBetInfoCcsView = YszBetInfoCcsView
ccs.YszBetMenuCcsView = YszBetMenuCcsView
ccs.YszBtnCcsView = YszBtnCcsView
ccs.YszPlayerInfoCcsPane = YszPlayerInfoCcsPane
ccs.YszEffectCcsView = YszEffectCcsView
ccs.YszJettonCcsView = YszJettonCcsView
ccs.YszPukeCcsView = YszPukeCcsView
ccs.YszCompareCcsView = YszCompareCcsView
ccs.YszLoadingCcsView = YszLoadingCcsView

YszView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/ysz/csb/layer/Ysz.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

YszView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot1, "module/ysz/csb/layer/YszRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/ysz/csb/layer/YszBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot11 = false

	slot0:bindTabView(slot0, slot0.getRootView(slot4).layerMenu, "module/ysz/csb/layer/YszMenu.csb", "isShowingMenu", true)

	if not NEED_CHANGE_SUB_GAME_NAME then
		slot9 = slot0
		slot11 = false

		slot0.bindTabView(slot5, slot0, slot0.getRootView(slot8).layerLoading, "module/ysz/csb/layer/YszLoading.csb", "isShowingLoading", true)
	end

	slot9 = "isShowingRule"

	slot0.bindPopUpChildView(slot5, slot0, "rule", "module/ysz/csb/layer/YszRule.csb")

	slot9 = "isShowingSetting"

	slot0.bindPopUpChildView(slot5, slot0, "setting", "module/ysz/csb/layer/YszSetting.csb")

	slot9 = "isShowingBank"

	slot0.bindPopUpChildView(slot5, slot0, "bank", "module/ysz/csb/layer/YszBank.csb")
end

YszView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
