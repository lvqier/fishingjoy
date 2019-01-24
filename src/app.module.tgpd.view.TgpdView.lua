slot2 = "TgpdView"
TgpdView = class(slot1)
slot2 = "tgpd.view.ccs.TgpdRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "tgpd.view.ccs.TgpdBankCcsView"

requireLuaFromModule(slot1)

slot2 = "tgpd.view.ccs.TgpdBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "tgpd.view.ccs.TgpdNoticeCcsPane"

requireLuaFromModule(slot1)

ccs.TgpdRoomCcsView = TgpdRoomCcsView
ccs.TgpdBankCcsView = TgpdBankCcsView
ccs.TgpdBattleCcsView = TgpdBattleCcsView
ccs.TgpdNoticeCcsPane = TgpdNoticeCcsPane

TgpdView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/tgpd/csb/layer/Tgpd.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot0._maskOpacity = 0
	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

TgpdView.onShow = function (slot0)
	slot3 = slot0

	BaseModuleUIView.onShow(slot2)
end

TgpdView.onHide = function (slot0)
	slot3 = slot0

	BaseModuleUIView.onHide(slot2)
end

TgpdView.bindChildrenViews = function (slot0)
	slot4 = slot0
	slot11 = true

	slot0.bindTabView(slot5, slot0, slot1, "module/tgpd/csb/layer/TgpdRoom.csb", slot3, VIEW_TYPE_ROOM)

	slot11 = true

	slot0.bindTabView(slot5, slot0, slot1, "module/tgpd/csb/layer/TgpdBattle.csb", slot3, VIEW_TYPE_BATTLE)

	slot11 = false

	slot0.bindTabView(slot5, slot0, slot2, "module/tgpd/csb/layer/TgpdLoading.csb", "isShowingLoading", true)

	slot9 = slot0
	slot11 = false

	slot0.bindTabView(slot5, slot0, slot0.getRootView("module/tgpd/csb/layer/TgpdLoading.csb").layerMenu, "module/tgpd/csb/layer/TgpdMenu.csb", "isShowingMenu", true)

	slot9 = "isShowingSetting"

	slot0.bindPopUpChildView(slot5, slot0, "setting", "module/tgpd/csb/layer/TgpdSetting.csb")

	slot9 = "isShowingBank"

	slot0.bindPopUpChildView(slot5, slot0, "bank", "module/tgpd/csb/layer/TgpdBank.csb")

	slot6 = slot0
	slot0.model.noticeControl = slot0.getRootView(slot5).layerGameNotice
end

TgpdView.hide = function (slot0, slot1, slot2, slot3)
	slot9 = slot3

	BaseModuleUIView.hide(slot5, slot0, slot1, slot2)

	slot6 = audioMgr

	audioMgr.playMainMusic(slot5)
end

TgpdView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
