LoginAccountRegCcsView = class("LoginAccountRegCcsView")

LoginAccountRegCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	ClassUtil.extends(slot0, TickBase)

	slot0._inputPhone = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputPhone)
	slot0._inputYZM = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.inputYZM)

	slot0._inputYZM:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
	slot0.view.cbAgreement:bindModelBoolProperty("isAgree")
	slot0.view.cbAgreement.txt_tf:setHtmlText("我已阅读并同意" .. HtmlUtil.createColorTxt("《" .. YOUXIMINGZI .. "服务协议》", "#86D7FF"))

	slot1 = DisplayUtil.rgb2ccc3("#7A93AC")
	slot1.a = 255

	slot0._inputPhone:setPlaceHolderColor(slot1)
	slot0._inputPhone:setInputMode(3)
	slot0._inputYZM:setPlaceHolderColor(slot1)
	slot0.model.regSmsCdChangedSignal:add(slot0.tick, slot0)
	slot0:tick()
end

LoginAccountRegCcsView.tick = function (slot0)
	slot0.view.btnYZM:setVisible(not (tickMgr:getDeltaToServerTime(slot0.model:getRegSmsCd()) > 0))
	slot0.view.layerCd:setVisible(tickMgr.getDeltaToServerTime(slot0.model.getRegSmsCd()) > 0)

	if tickMgr.getDeltaToServerTime(slot0.model.getRegSmsCd()) > 0 then
		slot0.view.layerCd.txtCd_tf:setHtmlText(tostring(parseInt(slot1)) .. "s")

		if not slot0:getIsTicking() then
			slot0:startTick(3)
		end
	elseif slot0:getIsTicking() then
		slot0:stopTick()
	end
end

LoginAccountRegCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputPhone:show()
	slot0._inputYZM:show()
end

LoginAccountRegCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)

	if slot0.model:getIsAccountRegInfoShowing() then
		slot0._inputPhone:setText("")
	else
		slot0.model:setRegSmsCode("")
	end

	slot0._inputYZM:setText("")
	slot0._inputPhone:hide()
	slot0._inputYZM:hide()
end

LoginAccountRegCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsAccountRegShowing(false)
	elseif slot1 == slot0.view.btnYZM then
		slot0.controller:requestGetSmsCode(slot0._inputPhone:getText(), TYPE_REGIST)
	elseif slot1 == slot0.view.btnNext then
		slot0.controller:requestCheckSmsCode(slot0._inputPhone:getText(), slot0._inputYZM:getText(), TYPE_REGIST)
	end
end

LoginAccountRegCcsView.destroy = function (slot0)
	slot0.model.regSmsCdChangedSignal:remove(slot0.tick, slot0)
	destroySomeObj(slot0.view.btnClos)
	destroySomeObj(slot0.view.btnYZM)
	destroySomeObj(slot0.view.btnNext)
	slot0.view.layerCd.txtCd_tf:destroy()
	slot0.view.cbAgreement:destroy()
	slot0._inputPhone:destroy()
	slot0._inputYZM:destroy()
	TickBase.destroy(slot0)
	ZoomPopUpChildView.destroy(slot0)
end

return
