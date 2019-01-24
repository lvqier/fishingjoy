slot2 = "PdkView"
PdkView = class(slot1)
slot2 = "pdk.view.ccs.PdkGameCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkMinePukeSheetCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkOtherOutPukeSheetCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkResourceCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkResultCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkPlayerInfoCcsPane"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkStateViewCcsPane"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkOutPukeCcsPane"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkHandPukeCcsPane"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkMatchFloatPopupCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkResultCcsItem"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkReadyCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkLoadingCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkRoomBgAutoAdaptWidthCcsPane"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.PdkOpenSheetOtherPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportResultCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportOutPukeAnimateCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportSheetOtherPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportSheetMinePukeCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportMarkCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportListCcsItem"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportResultCcsItem"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportCodeCcsView"

requireLuaFromModule(slot1)

slot2 = "pdk.view.ccs.report.PdkReportJuBaoCcsView"

requireLuaFromModule(slot1)

ccs.PdkGameCcsView = PdkGameCcsView
ccs.PdkRoomCcsView = PdkRoomCcsView
ccs.PdkBattleCcsView = PdkBattleCcsView
ccs.PdkMinePukeSheetCcsView = PdkMinePukeSheetCcsView
ccs.PdkOtherOutPukeSheetCcsView = PdkOtherOutPukeSheetCcsView
ccs.PdkResourceCcsView = PdkResourceCcsView
ccs.PdkResultCcsView = PdkResultCcsView
ccs.PdkMatchFloatPopupCcsView = PdkMatchFloatPopupCcsView
ccs.PdkPlayerInfoCcsPane = PdkPlayerInfoCcsPane
ccs.PdkStateViewCcsPane = PdkStateViewCcsPane
ccs.PdkOutPukeCcsPane = PdkOutPukeCcsPane
ccs.PdkHandPukeCcsPane = PdkHandPukeCcsPane
ccs.PdkResultCcsItem = PdkResultCcsItem
ccs.PdkReadyCcsView = PdkReadyCcsView
ccs.PdkRoomBgAutoAdaptWidthCcsPane = PdkRoomBgAutoAdaptWidthCcsPane
ccs.PdkLoadingCcsView = PdkLoadingCcsView
ccs.PdkReportBattleCcsView = PdkReportBattleCcsView
ccs.PdkReportOutPukeAnimateCcsView = PdkReportOutPukeAnimateCcsView
ccs.PdkReportSheetOtherPukeCcsView = PdkReportSheetOtherPukeCcsView
ccs.PdkReportSheetMinePukeCcsView = PdkReportSheetMinePukeCcsView
ccs.PdkReportListCcsItem = PdkReportListCcsItem
ccs.PdkReportResultCcsItem = PdkReportResultCcsItem
ccs.PdkReportMarkCcsView = PdkReportMarkCcsView
ccs.PdkReportCodeCcsView = PdkReportCodeCcsView
ccs.PdkReportJuBaoCcsView = PdkReportJuBaoCcsView
ccs.PdkReportResultCcsView = PdkReportResultCcsView
ccs.PdkOpenPukeCcsPane = PdkOpenPukeCcsPane
ccs.PdkOpenSheetOtherPukeCcsView = PdkOpenSheetOtherPukeCcsView

PdkView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/pdk/csb/layer/Pdk.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

PdkView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/pdk/csb/layer/PdkRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/pdk/csb/layer/PdkBattle.csb", slot2, VIEW_TYPE_BATTLE)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/pdk/csb/layer/PdkReportBattle.csb", slot2, VIEW_TYPE_BATTLE_REPORT)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/pdk/csb/layer/PdkReady.csb", slot2, VIEW_TYPE_HALL)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/pdk/csb/layer/PdkReady.csb").layerMenu, "module/pdk/csb/layer/PdkMenu.csb", "isShowingMenu", true)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/pdk/csb/layer/PdkMenu.csb").layerLoading, "module/pdk/csb/layer/PdkLoading.csb", "isShowingLoading", true)

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "rule", "module/pdk/csb/layer/PdkRule.csb", "isShowingRule")

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "setting", "module/pdk/csb/layer/PdkSetting.csb", "isShowingSetting")

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "bank", "module/pdk/csb/layer/PdkBank.csb", "isShowingBank")

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerResult

	slot0.bindPopUpChildView(slot4, slot0, "loseresult", "module/pdk/csb/layer/PdkResultLose.csb", "isShowingFailed", nil)

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerResult

	slot0.bindPopUpChildView(slot4, slot0, "winresult", "module/pdk/csb/layer/PdkResultWin.csb", "isShowingWin", nil)

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerMatchFloat

	slot0.bindPopUpChildView(slot4, slot0, "matchFloat", "module/pdk/csb/layer/PdkMatchFloat.csb", "isShowingMatchFloat", nil)

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportMark", "module/pdk/csb/layer/PdkReportMark.csb", "isShowingReportMark")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportCode", "module/pdk/csb/layer/PdkReportCode.csb", "isShowingReportCode")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportJuBao", "module/pdk/csb/layer/PdkReportJuBao.csb", "isShowingReportJuBao")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportLoseResult", "module/pdk/csb/layer/PdkReportResultLose.csb", "isShowingReportOutLose")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportWinResult", "module/pdk/csb/layer/PdkReportResultWin.csb", "isShowingReportOutWin")
end

PdkView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
