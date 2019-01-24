slot2 = "DdzView"
DdzView = class(slot1)
slot2 = "ddz.view.ccs.DdzGameCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzRoomCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzKindCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzSheetMinePukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzSheetOtherPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzOutPukeAnimateCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzOpenSheetOtherPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzResultCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzPlayerInfoCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzStateTipsCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzClockCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzPukeCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzBeiShuValueCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzMatchFloatPopupCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzBeiShuTipsCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzResultCcsItem"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzReadyCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.DdzRoomBgAutoAdaptWidthCcsPane"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportResultCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportBattleCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportOutPukeAnimateCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportSheetOtherPukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportSheetMinePukeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportMarkCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportListCcsItem"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportResultCcsItem"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportCodeCcsView"

requireLuaFromModule(slot1)

slot2 = "ddz.view.ccs.report.DdzReportJuBaoCcsView"

requireLuaFromModule(slot1)

ccs.DdzGameCcsView = DdzGameCcsView
ccs.DdzRoomCcsView = DdzRoomCcsView
ccs.DdzBattleCcsView = DdzBattleCcsView
ccs.DdzKindCcsView = DdzKindCcsView
ccs.DdzSheetMinePukeCcsView = DdzSheetMinePukeCcsView
ccs.DdzSheetOtherPukeCcsView = DdzSheetOtherPukeCcsView
ccs.DdzOutPukeAnimateCcsView = DdzOutPukeAnimateCcsView
ccs.DdzOpenSheetOtherPukeCcsView = DdzOpenSheetOtherPukeCcsView
ccs.DdzResultCcsView = DdzResultCcsView
ccs.DdzMatchFloatPopupCcsView = DdzMatchFloatPopupCcsView
ccs.DdzBeiShuTipsCcsView = DdzBeiShuTipsCcsView
ccs.DdzPlayerInfoCcsPane = DdzPlayerInfoCcsPane
ccs.DdzStateTipsCcsPane = DdzStateTipsCcsPane
ccs.DdzClockCcsPane = DdzClockCcsPane
ccs.DdzBeiShuValueCcsPane = DdzBeiShuValueCcsPane
ccs.DdzResultCcsItem = DdzResultCcsItem
ccs.DdzReadyCcsView = DdzReadyCcsView
ccs.DdzRoomBgAutoAdaptWidthCcsPane = DdzRoomBgAutoAdaptWidthCcsPane
ccs.DdzHandPukeCcsPane = DdzHandPukeCcsPane
ccs.DdzOpenPukeCcsPane = DdzOpenPukeCcsPane
ccs.DdzOutPukeCcsPane = DdzOutPukeCcsPane
ccs.DdzReportBattleCcsView = DdzReportBattleCcsView
ccs.DdzReportOutPukeAnimateCcsView = DdzReportOutPukeAnimateCcsView
ccs.DdzReportSheetOtherPukeCcsView = DdzReportSheetOtherPukeCcsView
ccs.DdzReportSheetMinePukeCcsView = DdzReportSheetMinePukeCcsView
ccs.DdzReportListCcsItem = DdzReportListCcsItem
ccs.DdzReportResultCcsItem = DdzReportResultCcsItem
ccs.DdzReportMarkCcsView = DdzReportMarkCcsView
ccs.DdzReportCodeCcsView = DdzReportCodeCcsView
ccs.DdzReportJuBaoCcsView = DdzReportJuBaoCcsView
ccs.DdzReportResultCcsView = DdzReportResultCcsView
ccs.DdzTabPane = DdzTabPane

DdzView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "module/ddz/csb/layer/Ddz.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)
end

DdzView.bindChildrenViews = function (slot0)
	slot3 = slot0
	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzKind.csb", slot2, VIEW_TYPE_DDZ_KIND)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzRoom.csb", slot2, VIEW_TYPE_ROOM)

	slot10 = 100

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzBxpBattle.csb", slot2, VIEW_TYPE_DDZ_BATTLE_BXP)

	slot10 = 100

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzJdBattle.csb", slot2, VIEW_TYPE_DDZ_BATTLE_JD)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzReportBattle.csb", slot2, VIEW_TYPE_BATTLE_REPORT)

	slot10 = true

	slot0.bindTabView(slot4, slot0, slot1, "module/ddz/csb/layer/DdzReady.csb", slot2, VIEW_TYPE_HALL)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/ddz/csb/layer/DdzReady.csb").layerMenu, "module/ddz/csb/layer/DdzMenu.csb", "isShowingMenu", true)

	slot8 = slot0
	slot10 = false

	slot0.bindTabView(slot4, slot0, slot0.getRootView("module/ddz/csb/layer/DdzMenu.csb").layerLoading, "module/ddz/csb/layer/DdzLoading.csb", "isShowingLoading", true)

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "bxprule", "module/ddz/csb/layer/DdzBxpRule.csb", "isShowBxpRule")

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "jdrule", "module/ddz/csb/layer/DdzJdRule.csb", "isShowJdRule")

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "setting", "module/ddz/csb/layer/DdzSetting.csb", "isShowingSetting")

	slot9 = false

	slot0.bindPopUpChildView(slot4, slot0, "bank", "module/ddz/csb/layer/DdzBank.csb", "isShowingBank")

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerResult

	slot0.bindPopUpChildView(slot4, slot0, "loseresult", "module/ddz/csb/layer/DdzResultLose.csb", "isShowingFailed", nil)

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerResult

	slot0.bindPopUpChildView(slot4, slot0, "winresult", "module/ddz/csb/layer/DdzResultWin.csb", "isShowingWin", nil)

	slot12 = slot0
	slot10 = slot0.getRootView(slot11).layerMatchFloat

	slot0.bindPopUpChildView(slot4, slot0, "matchFloat", "module/ddz/csb/layer/DdzMatchFloat.csb", "isShowingMatchFloat", nil)

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportMark", "module/ddz/csb/layer/DdzReportMark.csb", "isShowingReportMark")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportCode", "module/ddz/csb/layer/DdzReportCode.csb", "isShowingReportCode")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportJuBao", "module/ddz/csb/layer/DdzReportJuBao.csb", "isShowingReportJuBao")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportLoseResult", "module/ddz/csb/layer/DdzReportResultLose.csb", "isShowingReportOutLose")

	slot9 = nil

	slot0.bindPopUpChildView(slot4, slot0, "reportWinResult", "module/ddz/csb/layer/DdzReportResultWin.csb", "isShowingReportOutWin")
end

DdzView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
