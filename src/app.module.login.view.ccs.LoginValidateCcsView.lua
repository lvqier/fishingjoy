LoginValidateCcsView = class("LoginValidateCcsView")

LoginValidateCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputYZM = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputYZM)

	slot0._inputYZM:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)

	DisplayUtil.rgb2ccc3("#7A93AC").a = 255

	slot0._inputYZM:setPlaceHolderColor(slot1)
	slot0.model.validateSmsCdChangedSignal:add(slot0.tick, slot0)
	slot0:tick()
end

LoginValidateCcsView.tick = function (slot0)
	slot0.view.btnYZM:setVisible(not (tickMgr:getDeltaToServerTime(slot0.model:getValidateSmsCd()) > 0))
	slot0.view.layerCd:setVisible(tickMgr.getDeltaToServerTime(slot0.model.getValidateSmsCd()) > 0)

	if tickMgr.getDeltaToServerTime(slot0.model.getValidateSmsCd()) > 0 then
		slot0.view.layerCd.txtCd_tf:setHtmlText(tostring(parseInt(slot1)) .. "s")

		if not slot0:getIsTicking() then
			slot0:startTick(3)
		end
	elseif slot0:getIsTicking() then
		slot0:stopTick()
	end
end

LoginValidateCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, slot1, slot2)
	slot0.view.txtPhoneNum:setString(mainMgr:removePhoneJeffFormat(slot0.model:getBindPhone()))
end

LoginValidateCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputYZM:show()
end

LoginValidateCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
	slot0.model:setValidateSmsCode("")
	slot0._inputYZM:hide()
end

LoginValidateCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsValidateShowing(false)
	elseif slot1 == slot0.view.btnYZM then
		slot0.controller:requestGetSmsCode(slot0.model:getBindPhone(), TYPE_VALIDATE)
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:requestCheckSmsCode(slot0.model:getBindPhone(), slot0._inputYZM:getText(), TYPE_VALIDATE)
	end
end

LoginValidateCcsView.destroy = function (slot0)
	slot0.model.validateSmsCdChangedSignal:remove(slot0.tick, slot0)
	slot0._inputYZM:destroy()
	slot0.view.layerCd.txtCd_tf:destroy()
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnYZM)
	destroySomeObj(slot0.view.btnConfirm)
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
