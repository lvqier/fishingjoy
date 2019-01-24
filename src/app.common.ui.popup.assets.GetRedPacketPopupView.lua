slot2 = "GetRedPacketPopupView"
GetRedPacketPopupView = class(slot1)

GetRedPacketPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpRedPacketTip.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot5 = false
	slot9 = slot0.onContentTxtChanged

	createSetterGetterHandler(slot2, slot0, "contentTxt", handler(slot7, slot0))

	slot4 = "confirmCallback"

	createSetterGetterHandler(slot2, slot0)

	slot0._contentTf = slot0._rootView.view.txtContent_tf
	slot4 = false

	slot0._rootView.setTouchEnabled(slot2, slot0._rootView)

	slot4 = TextField.H_CENTER

	slot0._contentTf.setHAlign(slot2, slot0._contentTf)
end

GetRedPacketPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		if slot0._confirmCallback then
			slot0._confirmCallback()
		end

		slot5 = slot0

		slot0.hide(slot4)
	elseif slot1 == slot0._rootView.view.btnClose or slot0._rootView.view.btnCancel then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

GetRedPacketPopupView.onContentTxtChanged = function (slot0)
	slot4 = slot0._contentTxt

	slot0._contentTf.setHtmlText(slot2, slot0._contentTf)
end

GetRedPacketPopupView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)
end

GetRedPacketPopupView.destroy = function (slot0)
	slot3 = slot0._rootView.view.btnConfirm

	slot0._rootView.view.btnConfirm.destroy(slot2)

	slot3 = slot0._rootView.view.btnClose

	slot0._rootView.view.btnClose.destroy(slot2)

	slot3 = slot0._rootView.view.btnCancel

	slot0._rootView.view.btnCancel.destroy(slot2)
end

return
