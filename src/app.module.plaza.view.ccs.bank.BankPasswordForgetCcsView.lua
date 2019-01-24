BankPasswordForgetCcsView = class("BankPasswordForgetCcsView")

BankPasswordForgetCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputYZM = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputYZM)

	slot0._inputYZM:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.view.txtPhoneNum:setString("")

	DisplayUtil.rgb2ccc3("#7A93AC").a = 255

	slot0._inputYZM:setPlaceHolderColor(slot1)
	slot0.model.forgetSmsCdChangedSignal:add(slot0.tick, slot0)
	slot0:tick()
end

BankPasswordForgetCcsView.tick = function (slot0)
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

BankPasswordForgetCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)

	slot1 = 0

	function requestGetPhone()
		mainMgr:requestGetBindPhone(Hero:getDwUserID(), function (slot0)
			slot0.view.txtPhoneNum:setString(slot1)
			slot0.model:setPhoneNumStr(slot0)
			slot0._inputYZM:show()
		end, function ()
			if slot0 + 1 >= 3 then
				tweenMsgMgr:showRedMsg("请先绑定手机再修改银行密码，或者联系客服")
				slot1.model:setIsShowingBankPasswordForget(false)
			else
				requestGetPhone()
			end
		end, true)
	end

	requestGetPhone()
end

BankPasswordForgetCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)

	if slot0.model:getIsShowingBankPasswordReset() then
		slot0.view.txtPhoneNum:setString("")
		slot0._inputYZM:setText("")
	else
		slot0.model:setForgetSmsCode("")
	end

	slot0._inputYZM:hide()
end

BankPasswordForgetCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBankPasswordForget(false)
	elseif slot1 == slot0.view.btnYZM then
		slot0.controller:requestBankPwForgetGetSmsCode(slot0.model:getPhoneNumStr())
	elseif slot1 == slot0.view.btnNext then
		slot0.controller:requestBankPwForgetCheckSmsCode(slot0.model:getPhoneNumStr(), slot0._inputYZM:getText())
	end
end

BankPasswordForgetCcsView.destroy = function (slot0)
	slot0.model.forgetSmsCdChangedSignal:remove(slot0.tick, slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnYZM)
	destroySomeObj(slot0.view.btnNext)
	slot0._inputYZM:destroy()
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
