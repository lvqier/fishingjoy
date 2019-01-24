BankPasswordResetCcsView = class("BankPasswordResetCcsView")

BankPasswordResetCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputPw = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPw)
	slot0._inputPwConfirm = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPwConfirm)

	slot0._inputPw:setInputFlag(0)
	slot0._inputPwConfirm:setInputFlag(0)

	slot1 = DisplayUtil.rgb2ccc3("#7A93AC")
	slot1.a = 255

	slot0._inputPw:setPlaceHolderColor(slot1)
	slot0._inputPwConfirm:setPlaceHolderColor(slot1)
end

BankPasswordResetCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBankPasswordReset(false)
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestResetBankPw(slot0._inputPw:getText(), slot0._inputPwConfirm:getText())
	end
end

BankPasswordResetCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputPw:show()
	slot0._inputPwConfirm:show()
end

BankPasswordResetCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0._inputPw:hide()
	slot0._inputPwConfirm:hide()
	slot0._inputPw:setText("")
	slot0._inputPwConfirm:setText("")
end

BankPasswordResetCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnConfirm)
	slot0._inputPw:destroy()
	slot0._inputPwConfirm:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
