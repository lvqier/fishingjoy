slot2 = "ChargeBankCardTabCreateOrderCcsView"
ChargeBankCardTabCreateOrderCcsView = class(slot1)

ChargeBankCardTabCreateOrderCcsView.onCreationComplete = function (slot0)
	slot4 = "csb/common/ChargeBankCardTypeMenuItem.csb"

	slot0.transferType.menu.setItemResCcsFileName(slot2, slot0.transferType.menu)

	slot4 = "csb/common/ChargeBankCardValueMenuItem.csb"

	slot0.transferValue.menu.setItemResCcsFileName(slot2, slot0.transferValue.menu)

	slot4 = 10

	slot0.transferType.menu.setGap(slot2, slot0.transferType.menu)

	slot3 = slot0.transferName.input_name
	slot0._inputName = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot3 = slot0.transferBank.input_bank
	slot0._inputBank = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot3 = slot0.transferValue.input_value
	slot0._inputValue = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = cc.EDITBOX_INPUT_MODE_NUMERIC

	slot0._inputValue.setInputMode(slot2, slot0._inputValue)

	slot3 = slot0._inputValue
	slot5 = slot0

	slot0._inputValue.getEndSignal(slot2).add(slot2, slot0._inputValue.getEndSignal(slot2), slot0.onValueInputEnd)

	slot5 = slot0

	slot0.model.selectTransferValueChangedSignal.add(slot2, slot0.model.selectTransferValueChangedSignal, slot0.onSelectValueChanged)

	slot5 = slot0

	slot0.model.selectTransferTypeChangedSignal.add(slot2, slot0.model.selectTransferTypeChangedSignal, slot0.onSelectTypeChanged)

	slot5 = slot0

	Hero.chargeBankNameChangedSignal.add(slot2, Hero.chargeBankNameChangedSignal, slot0.onSelectBankNameChanged)

	slot5 = slot0

	slot0.model.exchangeChangedSignal.add(slot2, slot0.model.exchangeChangedSignal, slot0.onExchangeChanged)

	slot0._typeStrMap = {
		[CHARGE_BANK_CARD_TRANSFER_BNAK] = "银行卡",
		[CHARGE_BANK_CARD_TRANSFER_ALI] = "支付宝",
		[CHARGE_BANK_CARD_TRANSFER_WECHAT] = "微信"
	}
	slot5 = {
		{
			key = CHARGE_BANK_CARD_TRANSFER_BNAK,
			value = slot0._typeStrMap[CHARGE_BANK_CARD_TRANSFER_BNAK]
		},
		{
			key = CHARGE_BANK_CARD_TRANSFER_ALI,
			value = slot0._typeStrMap[CHARGE_BANK_CARD_TRANSFER_ALI]
		},
		{
			key = CHARGE_BANK_CARD_TRANSFER_WECHAT,
			value = slot0._typeStrMap[CHARGE_BANK_CARD_TRANSFER_WECHAT]
		}
	}

	slot0.transferType.menu.setDatas(slot0._typeStrMap[CHARGE_BANK_CARD_TRANSFER_WECHAT], slot0.transferType.menu)
end

ChargeBankCardTabCreateOrderCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.transferType.btnDown then
		slot4 = slot0.transferType.menu

		slot0.transferType.menu.show(slot3)
	elseif slot1 == slot0.transferValue.btnDown then
		slot4 = slot0.transferValue.menu

		slot0.transferValue.menu.show(slot3)
	elseif slot1 == slot0.transferBank.btnDown then
		slot5 = true

		slot0.model.setIsShowingBankNameSelect(slot3, slot0.model)
	elseif slot1 == slot0.btnKF then
		slot4 = slot0.controller

		slot0.controller.gotoCustomService(slot3)
	elseif slot1 == slot0.btnCommit then
		slot6 = slot0._inputName.getText(slot0._inputBank)
		slot9 = slot0._inputValue

		slot0.controller.requestBankCardCreateOrder(slot3, slot0.controller, slot0._inputBank.getText(slot6), slot0._inputValue.getText(slot0._inputName))
	end
end

ChargeBankCardTabCreateOrderCcsView.onSelectBankNameChanged = function (slot0)
	slot5 = Hero.getChargeBankName(slot2)

	slot0._inputBank.setText(Hero, slot0._inputBank)
end

ChargeBankCardTabCreateOrderCcsView.onSelectValueChanged = function (slot0)
	slot3 = slot0.transferValue.menu

	slot0.transferValue.menu.hide(slot2)

	slot4 = slot0._inputValue
	slot7 = slot0.model.getSelectTransferValue(slot2)

	slot0._inputValue.setText(slot0.model, tostring(slot6))
end

ChargeBankCardTabCreateOrderCcsView.onValueInputEnd = function (slot0)
	slot4 = slot0._inputValue.getText(slot2)
	slot5 = tonumber(slot0._inputValue) or 0

	if math.floor(slot4) <= 0 then
		slot6 = ""

		slot0._inputValue.setText(slot4, slot0._inputValue)
	else
		slot5 = slot0._inputValue
		slot8 = slot2

		slot0._inputValue.setText(slot4, tostring(slot7))
	end
end

ChargeBankCardTabCreateOrderCcsView.onSelectTypeChanged = function (slot0)
	slot3 = slot0.transferType.menu

	slot0.transferType.menu.hide(slot2)

	slot5 = slot0._typeStrMap[slot0.model.getSelectTransferType(slot2)]

	slot0.transferType.value.setString(slot0.model, slot0.transferType.value)

	if slot0.model.getSelectTransferType(slot2) == CHARGE_BANK_CARD_TRANSFER_BNAK then
		slot5 = "转账银行"

		slot0.transferBank.title_bank.setString(slot3, slot0.transferBank.title_bank)

		slot5 = "请输入或选择银行"

		slot0._inputBank.setPlaceHolder(slot3, slot0._inputBank)

		slot5 = true

		slot0.transferBank.btnDown.setVisible(slot3, slot0.transferBank.btnDown)
	elseif slot1 == CHARGE_BANK_CARD_TRANSFER_ALI then
		slot5 = "转账支付宝"

		slot0.transferBank.title_bank.setString(slot3, slot0.transferBank.title_bank)

		slot5 = "请输入支付宝账号"

		slot0._inputBank.setPlaceHolder(slot3, slot0._inputBank)

		slot5 = false

		slot0.transferBank.btnDown.setVisible(slot3, slot0.transferBank.btnDown)
	else
		slot5 = "转账微信号"

		slot0.transferBank.title_bank.setString(slot3, slot0.transferBank.title_bank)

		slot5 = "请输入微信号"

		slot0._inputBank.setPlaceHolder(slot3, slot0._inputBank)

		slot5 = false

		slot0.transferBank.btnDown.setVisible(slot3, slot0.transferBank.btnDown)
	end

	slot5 = ""

	slot0._inputBank.setText(slot3, slot0._inputBank)
end

ChargeBankCardTabCreateOrderCcsView.onShow = function (slot0)
	slot3 = slot0.txt_id
	slot8 = Hero

	slot0.txt_id.setString(slot2, tostring(Hero.getDwGameID(slot7)))

	slot3 = slot0._inputName

	slot0._inputName.show(slot2)

	slot3 = slot0._inputBank

	slot0._inputBank.show(slot2)

	slot3 = slot0._inputValue

	slot0._inputValue.show(slot2)

	slot3 = slot0

	slot0.onExchangeChanged(slot2)

	slot3 = slot0.model
	slot2 = {}
	slot5 = slot0.model.getCurChannelConfig(slot2).MoneyItems

	for slot6, slot7 in ipairs(tostring) do
		slot11 = slot7[2]

		table.insert(slot9, slot2)
	end

	slot6 = slot2

	slot0.transferValue.menu.setDatas(slot4, slot0.transferValue.menu)
end

ChargeBankCardTabCreateOrderCcsView.onExchangeChanged = function (slot0)
	slot4 = slot0.txt_exchange
	slot8 = slot0.model.getExchange(slot2)

	slot0.txt_exchange.setString(slot0.model, string.format(slot6, "1元=%d欢乐豆"))
end

ChargeBankCardTabCreateOrderCcsView.onHide = function (slot0)
	slot3 = slot0._inputName

	slot0._inputName.hide(slot2)

	slot3 = slot0._inputBank

	slot0._inputBank.hide(slot2)

	slot3 = slot0._inputValue

	slot0._inputValue.hide(slot2)
end

ChargeBankCardTabCreateOrderCcsView.destroy = function (slot0)
	slot3 = slot0._inputValue
	slot5 = slot0

	slot0._inputValue.getEndSignal(slot2).remove(slot2, slot0._inputValue.getEndSignal(slot2), slot0.onValueInputEnd)

	slot5 = slot0

	slot0.model.selectTransferValueChangedSignal.remove(slot2, slot0.model.selectTransferValueChangedSignal, slot0.onSelectValueChanged)

	slot5 = slot0

	slot0.model.selectTransferTypeChangedSignal.remove(slot2, slot0.model.selectTransferTypeChangedSignal, slot0.onSelectTypeChanged)

	slot5 = slot0

	Hero.chargeBankNameChangedSignal.remove(slot2, Hero.chargeBankNameChangedSignal, slot0.onSelectBankNameChanged)

	slot5 = slot0

	slot0.model.exchangeChangedSignal.remove(slot2, slot0.model.exchangeChangedSignal, slot0.onExchangeChanged)

	slot3 = slot0._inputName

	destroySomeObj(slot2)

	slot3 = slot0._inputBank

	destroySomeObj(slot2)

	slot3 = slot0._inputValue

	destroySomeObj(slot2)

	slot3 = slot0.transferType.menu

	destroySomeObj(slot2)

	slot3 = slot0.transferValue.menu

	destroySomeObj(slot2)
end

return
