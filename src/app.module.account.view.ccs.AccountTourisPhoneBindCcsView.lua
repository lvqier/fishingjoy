AccountTourisPhoneBindCcsView = class("AccountTourisPhoneBindCcsView")

AccountTourisPhoneBindCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputPhone = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputPhone)
	slot0._inputYzm = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputYzm)

	slot0._inputYzm:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.model.phoneBindYzmCdChangedSignal:add(slot0.onYzmCdChanged, slot0)

	slot0._inputNickName = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputNickName)
	slot0._inputPwd = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputPwd)

	slot0:onYzmCdChanged()
end

AccountTourisPhoneBindCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingTouristPhoneBind(false)
		slot0.model:setIsShowingTouristPhoneBindInfo(false)
	elseif slot1 == slot0.view.layerContent.btnRandomName then
		slot0._inputNickName:setText(mainMgr:getRandomName())
	elseif slot1 == slot0.view.layerContent.btnYZM then
		slot0.controller:requestBindPhoneYzm(slot0._inputPhone:getText())
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestBindPhone(slot0._inputPhone:getText(), slot0._inputYzm:getText(), slot0._inputPwd:getText(), slot0._inputPwd:getText(), slot0._inputNickName:getText())
	end
end

AccountTourisPhoneBindCcsView.onYzmCdChanged = function (slot0)
	if tickMgr:getDeltaToServerTime(slot0.model:getPhoneBindYzmCd() or 0) > 0 then
		if not slot0:getIsTicking() then
			slot0:startTick(3)
		else
			slot0:stopTick()
		end
	else
		slot0:stopTick()
	end

	slot0:tick()
end

AccountTourisPhoneBindCcsView.tick = function (slot0)
	slot0.view.layerContent.layerCd:setVisible(tickMgr:getDeltaToServerTime(slot0.model:getPhoneBindYzmCd() or 0) > 0)
	slot0.view.layerContent.btnYZM:setVisible(slot2 <= 0)

	if slot2 > 0 then
		slot0.view.layerContent.layerCd.txtCd_tf:setHtmlText(tostring(parseInt(slot2)) .. "s")
	end

	if slot2 <= 0 then
		slot0:stopTick()
	end
end

AccountTourisPhoneBindCcsView.onRootClick = function (slot0)
	return
end

AccountTourisPhoneBindCcsView.onShow = function (slot0)
	slot0._inputPhone:show()
	slot0._inputYzm:show()
	slot0._inputNickName:show()
	slot0._inputPwd:show()
end

AccountTourisPhoneBindCcsView.onHide = function (slot0)
	slot0._inputPhone:hide()
	slot0._inputYzm:hide()
	slot0._inputNickName:hide()
	slot0._inputPwd:hide()
end

AccountTourisPhoneBindCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.layerContent.layerCd.txtCd_tf)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.layerContent.btnYZM)
	destroySomeObj(slot0.view.btnConfirm)
	destroySomeObj(slot0._inputPhone)
	destroySomeObj(slot0._inputYzm)
	destroySomeObj(slot0.view.layerContent.btnRandomName)
	destroySomeObj(slot0._inputPwd)
	destroySomeObj(slot0._inputNickName)
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
