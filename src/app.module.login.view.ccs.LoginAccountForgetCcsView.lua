LoginAccountForgetCcsView = class("LoginAccountForgetCcsView")

LoginAccountForgetCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputPhone = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPhone)
	slot0._inputYZM = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputYZM)

	slot0._inputYZM:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)

	slot1 = DisplayUtil.rgb2ccc3("#7A93AC")
	slot1.a = 255

	slot0._inputPhone:setPlaceHolderColor(slot1)
	slot0._inputYZM:setPlaceHolderColor(slot1)
	slot0.model.forgetSmsCdChangedSignal:add(slot0.tick, slot0)
	slot0:tick()
end

LoginAccountForgetCcsView.tick = function (slot0)
	slot0.view.btnYZM:setVisible(not (tickMgr:getDeltaToServerTime(slot0.model:getForgetSmsCd()) > 0))
	slot0.view.layerCd:setVisible(tickMgr.getDeltaToServerTime(slot0.model.getForgetSmsCd()) > 0)

	if tickMgr.getDeltaToServerTime(slot0.model.getForgetSmsCd()) > 0 then
		slot0.view.layerCd.txtCd_tf:setHtmlText(tostring(parseInt(slot1)) .. "s")

		if not slot0:getIsTicking() then
			slot0:startTick(3)
		end
	elseif slot0:getIsTicking() then
		slot0:stopTick()
	end
end

LoginAccountForgetCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputPhone:setText(slot0.model:getAccount())
	slot0._inputPhone:show()
	slot0._inputYZM:show()
end

LoginAccountForgetCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)

	if slot0.model:getIsAccountResetShowing() then
		slot0._inputPhone:setText("")
		slot0._inputYZM:setText("")
	else
		slot0.model:setForgetSmsCode("")
	end

	slot0._inputPhone:hide()
	slot0._inputYZM:hide()
end

LoginAccountForgetCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsAccountForgetShowing(false)
	elseif slot1 == slot0.view.btnYZM then
		slot0.controller:requestGetSmsCode(slot0._inputPhone:getText(), TYPE_FIND_PS)
	elseif slot1 == slot0.view.btnNext then
		slot0.controller:requestCheckSmsCode(slot0._inputPhone:getText(), slot0._inputYZM:getText(), TYPE_FIND_PS)
	end
end

LoginAccountForgetCcsView.destroy = function (slot0)
	slot0.model.forgetSmsCdChangedSignal:remove(slot0.tick, slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnYZM)
	destroySomeObj(slot0.view.btnNext)
	slot0._inputPhone:destroy()
	slot0._inputYZM:destroy()
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
