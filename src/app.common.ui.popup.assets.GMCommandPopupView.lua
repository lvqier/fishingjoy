slot2 = "GMCommandPopupView"
GMCommandPopupView = class(slot1)

GMCommandPopupView.ctor = function (slot0)
	slot6 = "csb/common/PopUpGMCommand.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot0._zorder = ZORDER_LOADING_ACTIVITY + 1
	slot3 = uiMgr
	slot0._popupParent = uiMgr.getTopLayerInAllScene(slot2)
	slot5 = nil

	createSetterGetter(slot2, slot0, "onConfirmCallback")

	slot3 = slot0._rootView.view.txtPw
	slot0._input = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
end

GMCommandPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnConfirm then
		slot7 = slot0._input.getText(slot4)

		if not gmMgr.checkGmCommand(slot0._input, gmMgr) then
			slot7 = "无效gm指令"

			tweenMsgMgr.showRedMsg(slot5, tweenMsgMgr)
		end

		slot6 = slot0

		slot0.hide(slot5)
	elseif slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

GMCommandPopupView.show = function (slot0, slot1)
	slot0._onConfirmCallback = slot1
	slot4 = slot0

	AbstractZoomPopupView.show(slot3)

	slot4 = slot0._input

	slot0._input.show(slot3)
end

GMCommandPopupView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)

	slot3 = slot0._input

	slot0._input.hide(slot2)
end

GMCommandPopupView.destroy = function (slot0)
	slot3 = slot0._input

	slot0._input.destroy(slot2)

	slot3 = slot0._rootView.view.btnConfirm

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
