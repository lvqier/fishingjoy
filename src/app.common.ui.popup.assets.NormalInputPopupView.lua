slot2 = "NormalInputPopupView"
NormalInputPopupView = class(slot1)

NormalInputPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpNormalInput.csb"

	ClassUtil.extends(slot2, slot0, NormalPopupTipView, true)

	slot3 = slot0._rootView.view.input
	slot0._input = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot0._zorder = 10000
end

NormalInputPopupView.show = function (slot0)
	slot3 = slot0

	NormalPopupTipView.show(slot2)

	slot3 = slot0._input

	slot0._input.show(slot2)
end

NormalInputPopupView.hide = function (slot0)
	slot3 = slot0

	NormalPopupTipView.hide(slot2)

	slot3 = slot0._input

	slot0._input.hide(slot2)
end

NormalInputPopupView.checkContentTfPosition = function (slot0)
	return
end

NormalInputPopupView.try2Destroy = function (slot0)
	return
end

NormalInputPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		if slot0._confirmCallback then
			slot7 = slot0._input

			slot0._confirmCallback(slot0._input.getText(slot6))

			slot0._confirmCallback = nil
		end

		slot5 = slot0

		slot0.hide(slot4)
	elseif slot1 == slot0._rootView.view.btnCancel then
		if slot0._cancelCallback then
			slot0._cancelCallback()

			slot0._cancelCallback = nil
		end

		slot5 = slot0

		slot0.hide(slot4)
	end
end

return
