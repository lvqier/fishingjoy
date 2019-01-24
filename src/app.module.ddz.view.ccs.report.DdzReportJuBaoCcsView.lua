slot2 = "DdzReportJuBaoCcsView"
DdzReportJuBaoCcsView = class(slot1)

DdzReportJuBaoCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot4 = "提交举报后，工作人员会进行核实处理。乱举报者也会严肃处理。"

	slot0.view.txtDec_tf.setHtmlText(slot2, slot0.view.txtDec_tf)

	slot3 = slot0.view.inputContent
	slot0._inputContent = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = 26

	slot0._inputContent.setFontSize(slot2, slot0._inputContent)

	slot4 = [[
请输入描述内容


]]

	slot0._inputContent.setPlaceHolder(slot2, slot0._inputContent)

	slot4 = cc.EDITBOX_INPUT_MODE_ANY

	slot0._inputContent.setInputMode(slot2, slot0._inputContent)

	slot4 = cc.KEYBOARD_RETURNTYPE_DEFAULT

	slot0._inputContent.setReturnType(slot2, slot0._inputContent)
end

DdzReportJuBaoCcsView.onRootClick = function (slot0)
	return
end

DdzReportJuBaoCcsView.show = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.show(slot2)

	slot3 = slot0._inputContent

	slot0._inputContent.show(slot2)
end

DdzReportJuBaoCcsView.hide = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.hide(slot2)

	slot3 = slot0._inputContent

	slot0._inputContent.hide(slot2)
end

DdzReportJuBaoCcsView.onComplaintFinish = function (slot0)
	slot4 = ""

	slot0._inputContent.setText(slot2, slot0._inputContent)
end

DdzReportJuBaoCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot5 = false

		slot0.model.setIsShowingReportJuBao(slot3, slot0.model)

		slot4 = slot0

		slot0.onComplaintFinish(slot3)
	elseif slot1 == slot0.view.btnOk then
		slot6 = slot0._inputContent.getText(slot0.model)
		slot10 = slot0.onComplaintFinish

		slot0.controller.requestComplaintReport(slot3, slot0.controller, slot0.model.getCurReportCode(slot6), handler(slot0._inputContent, slot0))
	end
end

DdzReportJuBaoCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnOk

	destroySomeObj(slot2)

	slot3 = slot0._inputContent

	slot0._inputContent.destroy(slot2)

	slot0._inputContent = nil
	slot3 = slot0.view.txtDec_tf

	slot0.view.txtDec_tf.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
