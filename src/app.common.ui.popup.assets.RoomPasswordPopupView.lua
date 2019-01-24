slot2 = "RoomPasswordPopupView"
RoomPasswordPopupView = class(slot1)

RoomPasswordPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpRoomPassword.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot5 = nil

	createSetterGetter(slot2, slot0, "onConfirmCallback")

	slot3 = slot0._rootView.view.txtPw
	slot0._txtPwd = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = cc.EDITBOX_INPUT_FLAG_PASSWORD

	slot0._txtPwd.setInputFlag(slot2, slot0._txtPwd)
end

RoomPasswordPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		slot5 = slot0._txtPwd
		slot3 = slot0._txtPwd.getText(slot4)

		if slot0._onConfirmCallback then
			slot6 = slot3

			slot0._onConfirmCallback(slot5)

			slot0._onConfirmCallback = nil
		end

		slot6 = slot0

		slot0.hide(slot5)
	elseif slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

RoomPasswordPopupView.show = function (slot0, slot1)
	slot0._onConfirmCallback = slot1
	slot4 = slot0

	AbstractZoomPopupView.show(slot3)

	slot4 = slot0._txtPwd

	slot0._txtPwd.show(slot3)

	slot5 = ""

	slot0._txtPwd.setText(slot3, slot0._txtPwd)
end

RoomPasswordPopupView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)

	slot3 = slot0._txtPwd

	slot0._txtPwd.hide(slot2)
end

RoomPasswordPopupView.destroy = function (slot0)
	slot3 = slot0._txtPwd

	slot0._txtPwd.destroy(slot2)

	slot3 = slot0._rootView.view.btnConfirm

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
