slot2 = "SlwhView"
SlwhView = class(slot1)
slot2 = "slwh.view.ccs.SlwhLoadingCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhBankCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhMenuItemCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhNoticeCcsPane"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhJettonCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhRewardCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhRuleCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhOnlineCcsView"

requireLuaFromModule(slot1)

slot2 = "slwh.view.ccs.SlwhJettonNewCcsView"

requireLuaFromModule(slot1)

ccs.SlwhRoomView = SlwhRoomCcsView
ccs.SlwhBankCcsView = SlwhBankCcsView
ccs.SlwhBattleCcsView = SlwhBattleCcsView
ccs.SlwhJettonCcsView = SlwhJettonCcsView
ccs.SlwhNoticeCcsPane = SlwhNoticeCcsPane
ccs.SlwhMenuItemCcsView = SlwhMenuItemCcsView
ccs.SlwhRuleCcsView = SlwhRuleCcsView
ccs.SlwhLoadingCcsView = SlwhLoadingCcsView
ccs.SlwhJettonNewCcsView = SlwhJettonNewCcsView
ccs.SlwhOnlineCcsView = SlwhOnlineCcsView

SlwhView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/slwh/csb/layer/Slwh.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot0._maskOpacity = 0
	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

SlwhView.onShow = function (slot0)
	slot3 = slot0

	BaseModuleUIView.onShow(slot2)
end

SlwhView.onHide = function (slot0)
	slot3 = slot0

	BaseModuleUIView.onHide(slot2)
end

SlwhView.bindChildrenViews = function (slot0)
	slot5 = slot0
	slot12 = true

	slot0.bindTabView(slot6, slot0, slot1, "module/slwh/csb/layer/SlwhRoom.csb", slot4, VIEW_TYPE_ROOM)

	slot12 = true

	slot0.bindTabView(slot6, slot0, slot1, "module/slwh/csb/layer/SlwhBattle.csb", slot4, VIEW_TYPE_BATTLE)

	slot12 = false

	slot0.bindTabView(slot6, slot0, slot2, "module/slwh/csb/layer/SlwhLoading.csb", "isShowingLoading", true)

	slot10 = slot0
	slot12 = false

	slot0.bindTabView(slot6, slot0, slot0.getRootView("module/slwh/csb/layer/SlwhLoading.csb").layerMenu, "module/slwh/csb/layer/SlwhMenu.csb", "isShowingMenu", true)

	slot10 = "isShowingRule"

	slot0.bindPopUpChildView(slot6, slot0, "rule", "module/slwh/csb/layer/SlwhRule.csb")

	slot10 = "isShowingSetting"

	slot0.bindPopUpChildView(slot6, slot0, "setting", "module/slwh/csb/layer/SlwhSetting.csb")

	slot10 = "isShowingBank"

	slot0.bindPopUpChildView(slot6, slot0, "bank", "module/slwh/csb/layer/SlwhBank.csb")

	slot12 = slot0:getRootView().layer_tips

	slot0.bindPopUpChildView(slot6, slot0, "jetton_panel", "module/slwh/csb/layer/SlwhJettonNew.csb", "isShowingJetton", true)

	slot10 = "isShowingOnline"

	slot0.bindPopUpChildView(slot6, slot0, "online", "module/slwh/csb/layer/SlwhOnline.csb")

	slot7 = slot0
	slot0.model.noticeControl = slot0.getRootView(slot6).layerGameNotice
	slot9 = slot0
	slot0.model._layerTips = slot0.getRootView("online").layer_tips
end

SlwhView.hide = function (slot0, slot1, slot2, slot3)
	slot9 = slot3

	BaseModuleUIView.hide(slot5, slot0, slot1, slot2)

	slot6 = audioMgr

	audioMgr.playMainMusic(slot5)
end

SlwhView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
