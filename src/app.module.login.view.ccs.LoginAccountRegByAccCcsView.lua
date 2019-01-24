LoginAccountRegByAccCcsView = class("LoginAccountRegByAccCcsView")

LoginAccountRegByAccCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputPw = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPw)
	slot0._inputPwConfirm = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPwConfirm)
	slot0._inputAccount = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputAccount)

	slot0._inputPw:setInputFlag(0)
	slot0._inputPwConfirm:setInputFlag(0)

	slot1 = DisplayUtil.rgb2ccc3("#7A93AC")
	slot1.a = 255

	slot0._inputPw:setPlaceHolderColor(slot1)
	slot0._inputPwConfirm:setPlaceHolderColor(slot1)
	slot0._inputAccount:setPlaceHolderColor(slot1)
end

LoginAccountRegByAccCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsAccountRegByAccShowing(false)
	elseif slot1 == slot0.view.btnRandomName then
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestRegisterByAcc(slot0._inputAccount:getText(), slot0._inputPw:getText(), slot0._inputPwConfirm:getText())
	end
end

LoginAccountRegByAccCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputPw:show()
	slot0._inputPwConfirm:show()
	slot0._inputAccount:show()
	slot0._inputPw:setText("")
	slot0._inputPwConfirm:setText("")
	slot0._inputAccount:setText("")
end

LoginAccountRegByAccCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0._inputPw:hide()
	slot0._inputPwConfirm:hide()
	slot0._inputAccount:hide()
end

LoginAccountRegByAccCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnRandomName)
	destroySomeObj(slot0.view.btnConfirm)
	slot0._inputAccount:destroy()
	slot0._inputPw:destroy()
	slot0._inputPwConfirm:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
