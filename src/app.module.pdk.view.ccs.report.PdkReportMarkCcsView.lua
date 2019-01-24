slot2 = "PdkReportMarkCcsView"
PdkReportMarkCcsView = class(slot1)

PdkReportMarkCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot4 = "module/pdk/csb/common/PdkReportListItem.csb"

	slot0.view.nodeList.list_lv.setItemResCcsFileName(slot2, slot0.view.nodeList.list_lv)

	slot5 = slot0

	slot0.model.reportDatasChangedSignal.add(slot2, slot0.model.reportDatasChangedSignal, slot0.onReportData)

	slot3 = slot0

	slot0.onReportData(slot2)
end

PdkReportMarkCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot4 = slot0

		slot0.onRootClick(slot3)
	elseif slot1 == slot0.view.btnOtherReport then
		slot5 = true

		slot0.model.setIsShowingReportCode(slot3, slot0.model)
	end
end

PdkReportMarkCcsView.onReportData = function (slot0)
	slot5 = slot0.model.getReportDatas(slot2) or {}

	slot0.view.nodeList.list_lv.setDatas(slot0.model, slot0.view.nodeList.list_lv)
end

PdkReportMarkCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingReportMark(slot2, slot0.model)
end

PdkReportMarkCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.reportDatasChangedSignal.remove(slot2, slot0.model.reportDatasChangedSignal, slot0.onReportData)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnOtherReport

	destroySomeObj(slot2)

	slot3 = slot0.view.nodeList.list_lv

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
