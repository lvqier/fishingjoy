AccountTourisPhoneBindInfoCcsView = class("AccountTourisPhoneBindInfoCcsView")

AccountTourisPhoneBindInfoCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputNickName = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputNickName)
	slot0._inputPwd = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputPwd)
	slot0._inputPwdConfirm = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputPwdConfirm)
end

AccountTourisPhoneBindInfoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingTouristPhoneBindInfo(false)
	elseif slot1 == slot0.view.layerContent.btnRandomName then
		slot0._inputNickName:setText(mainMgr:getRandomName())
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestBindPhone(slot0.model:getTouristBindPhone(), slot0.model:getTouristBindYzm(), slot0._inputPwd:getText(), slot0._inputPwdConfirm:getText(), slot0._inputNickName:getText())
	end
end

AccountTourisPhoneBindInfoCcsView.onRootClick = function (slot0)
	return
end

AccountTourisPhoneBindInfoCcsView.onShow = function (slot0)
	slot0._inputNickName:show()
	slot0._inputPwd:show()
	slot0._inputPwdConfirm:show()
end

AccountTourisPhoneBindInfoCcsView.onHide = function (slot0)
	slot0._inputNickName:hide()
	slot0._inputPwd:hide()
	slot0._inputPwdConfirm:hide()
end

AccountTourisPhoneBindInfoCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnConfirm)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.layerContent.btnRandomName)
	destroySomeObj(slot0._inputPwd)
	destroySomeObj(slot0._inputPwdConfirm)
	destroySomeObj(slot0._inputNickName)
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
