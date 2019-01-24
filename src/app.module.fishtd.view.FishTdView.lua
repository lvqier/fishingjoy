FishTdView = class("FishTdView")

requireLuaFromModule("fishtd.view.ccs.FishTdRoomCcsView")
requireLuaFromModule("fishtd.view.ccs.FishTdBattleCcsView")
requireLuaFromModule("fishtd.view.ccs.FishTdWikiView")
requireLuaFromModule("fishtd.view.ccs.FishTdWikiDetailView")
requireLuaFromModule("fishtd.view.ccs.FishTdWikiListItem")
requireLuaFromModule("fishtd.view.ccs.FishTdWikiListRow")
requireLuaFromModule("fishtd.view.ccs.FishTdExitConfirm")
requireLuaFromModule("fishtd.view.ccs.FishTdExitListRow")
requireLuaFromModule("fishtd.view.ccs.FishTdExitListItem")

ccs.FishTdRoomCcsView = FishTdRoomCcsView
ccs.FishTdBattleCcsView = FishTdBattleCcsView
ccs.FishTdWikiView = FishTdWikiView
ccs.FishTdWikiDetailView = FishTdWikiDetailView
ccs.FishTdWikiListItem = FishTdWikiListItem
ccs.FishTdWikiListRow = FishTdWikiListRow
ccs.FishTdExitConfirm = FishTdExitConfirm
ccs.FishTdExitListRow = FishTdExitListRow
ccs.FishTdExitListItem = FishTdExitListItem

FishTdView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	ClassUtil.extends(slot0, BaseModuleUIView, true, "module/fishtd/csb/layer/FishTd.csb")

	slot0._maskOpacity = 0

	slot0:setRootClickable(false)
end

FishTdView.onShow = function (slot0)
	slot0.controller:clearMessageCache()
end

FishTdView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "module/fishtd/csb/layer/FishTdRoom.csb", slot3, VIEW_TYPE_ROOM, true)
	slot0:bindTabView(slot1, "module/fishtd/csb/layer/FishTdBattle.csb", slot3, VIEW_TYPE_BATTLE, true)
	slot0:bindTabView(slot4, "module/fishtd/csb/layer/FishTdMenu.csb", "isShowingMenu", true, false)
	slot0:bindTabView(slot2, "module/fishtd/csb/layer/FishTdLoading.csb", "isShowingLoading", true, false)
	slot0:bindPopUpChildView("setting", "module/fishtd/csb/layer/FishTdSetting.csb", "isShowingSetting")
	slot0:bindPopUpChildView("rule", "module/fishtd/csb/layer/FishTdWiki.csb", "isShowingRule")
	slot0:bindPopUpChildView("wikiDetail", "module/fishtd/csb/layer/FishTdWikiDetail.csb", "isShowingWikiDetail")
	slot0:bindPopUpChildView("exitConfirm", "module/fishtd/csb/layer/FishTdExitConfirm.csb", "isShowingExitConfirm")
end

FishTdView.destroy = function (slot0)
	BaseModuleUIView.destroy(slot0)

	slot0.model = nil
	slot0.controller = nil
end

FishTdView.onHide = function (slot0)
	BaseModuleUIView.onHide(slot0)
end

return
