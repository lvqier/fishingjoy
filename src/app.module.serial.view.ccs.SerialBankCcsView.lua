SerialBankCcsView = class("SerialBankCcsView")

SerialBankCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseBankTakePopupCcsView)
	BaseBankTakePopupCcsView.onCreationComplete(slot0)

	slot0._originPlaceHolder = slot0._inputPwd._placeHolder
end

SerialBankCcsView.onZoomShowTweenComplete = function (slot0)
	BaseBankTakePopupCcsView.onZoomShowTweenComplete(slot0)

	if slot0._inputPwd._editBox then
		for slot6 = 1, #slot1:getChildren(), 1 do
			if slot2[slot6].getString and slot7:getString() == slot0._originPlaceHolder then
				slot7:setColor(cc.WHITE)

				break
			end
		end
	end
end

SerialBankCcsView.onUserInsureChanged = function (slot0)
	slot0.view.sliderControl:setMaxValue(slot1)
	slot0.view.txtDeposit_tf:setText(StringUtil.numberStr2FormatNumberStr(Hero:getUserInsure()))
end

SerialBankCcsView.onUserScoreChanged = function (slot0)
	slot0.view.txtCash_tf:setText(StringUtil.numberStr2FormatNumberStr(slot1))
	EventController:dispatchEvent(Serial.Event.userScoreChanged, parseInt(Hero:getUserScore()))
end

SerialBankCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.txtDeposit_tf)
	destroySomeObj(slot0.view.txtCash_tf)
	BaseBankTakePopupCcsView.destroy(slot0)
end

return
