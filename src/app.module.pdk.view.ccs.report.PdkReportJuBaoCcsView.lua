slot2 = "PdkReportJuBaoCcsView"
PdkReportJuBaoCcsView = class(slot1)

PdkReportJuBaoCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot4 = "提交举报后，工作人员会进行核实处理。乱举报者也会严肃处理。"

	slot0.view.txtDec_tf.setHtmlText(slot2, slot0.view.txtDec_tf)
end

PdkReportJuBaoCcsView.onRootClick = function (slot0)
	return
end

PdkReportJuBaoCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot5 = false

		slot0.model.setIsShowingReportJuBao(slot3, slot0.model)
	elseif slot1 == slot0.view.btnOk then
		slot5 = slot0.model.getCurReportCode(slot6)
		slot8 = slot0.view.inputContent

		slot0.controller.requestComplaintReport(slot3, slot0.controller, slot0.view.inputContent.getString(slot0.model))
	end
end

PdkReportJuBaoCcsView.destroy = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnOk

	destroySomeObj(slot2)
end

return
