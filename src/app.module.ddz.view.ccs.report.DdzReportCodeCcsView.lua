slot2 = "DdzReportCodeCcsView"
DdzReportCodeCcsView = class(slot1)

DdzReportCodeCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0.view.inputCode
	slot0._inputCode = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
end

DdzReportCodeCcsView.onZoomShowTweenComplete = function (slot0)
	slot3 = slot0

	ZoomPopUpChildView.onZoomShowTweenComplete(slot2)

	slot3 = slot0._inputCode

	slot0._inputCode.show(slot2)
end

DdzReportCodeCcsView.hide = function (slot0, slot1, slot2)
	slot5 = slot0._inputCode

	slot0._inputCode.hide(slot4)

	slot7 = slot2

	ZoomPopUpChildView.hide(slot4, slot0, slot1)
end

DdzReportCodeCcsView.onRootClick = function (slot0)
	return
end

DdzReportCodeCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot5 = false

		slot0.model.setIsShowingReportCode(slot3, slot0.model)
	elseif slot1 == slot0.view.btnOK then
		slot4 = slot0.controller
		slot7 = slot0._inputCode

		slot0.controller.try2LoadReportByReportCode(slot3, slot0._inputCode.getText(slot6))
	end
end

DdzReportCodeCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnOK

	destroySomeObj(slot2)

	slot3 = slot0._inputCode

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
