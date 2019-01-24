slot2 = "ChargeCommonPayCcsView"
ChargeCommonPayCcsView = class(slot1)

ChargeCommonPayCcsView.onCreationComplete = function (slot0)
	slot0.addBtnS = {
		slot0.btnItem_1,
		slot0.btnItem_2,
		slot0.btnItem_3,
		slot0.btnItem_4,
		slot0.btnItem_5,
		slot0.btnItem_6,
		slot0.btnItem_7,
		slot0.btnItem_8
	}
	slot3 = slot0.inputPayAmount
	slot0._inputPayAmount = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.btnItem_8)
	slot4 = cc.EDITBOX_INPUT_MODE_NUMERIC

	slot0._inputPayAmount.setInputMode(slot0.btnItem_8, slot0._inputPayAmount)
end

ChargeCommonPayCcsView.onShow = function (slot0)
	slot3 = slot0._inputPayAmount

	slot0._inputPayAmount.show(slot2)

	slot5 = slot0.model.getCurChannelConfig(slot2).Tips

	slot0.txt_tscontent.setString(slot0.model, slot0.txt_tscontent)

	slot2 = slot0.model.getCurChannelConfig(slot2).MoneyItems
	slot5 = slot0.addBtnS

	for slot6, slot7 in ipairs(slot0.txt_tscontent) do
		if slot2[slot6] then
			slot11 = true

			slot7.setVisible(slot9, slot7)

			if slot1.CustomAmount then
				slot11 = "+" .. slot2[slot6][2]

				slot7.txt_score.setString(slot9, slot7.txt_score)
			else
				slot10 = slot7.txt_score
				slot13 = slot2[slot6][2]

				slot7.txt_score.setString(slot9, tostring(slot12))
			end

			slot7.addValue = slot2[slot6][2]
		else
			slot11 = false

			slot7.setVisible(slot9, slot7)

			slot7.addValue = 0
		end
	end

	slot6 = slot1.CustomAmount

	slot0._inputPayAmount.setTouchEnabled(slot4, slot0._inputPayAmount)

	slot6 = ""

	slot0._inputPayAmount.setText(slot4, slot0._inputPayAmount)

	if slot1.CustomAmount then
		slot6 = "请输入充值金额"

		slot0._inputPayAmount.setPlaceHolder(slot4, slot0._inputPayAmount)
	else
		slot6 = "请选择以下充值金额"

		slot0._inputPayAmount.setPlaceHolder(slot4, slot0._inputPayAmount)
	end

	slot6 = slot0.txt_exchange
	slot10 = slot0.model.getExchange(slot4)

	slot0.txt_exchange.setString(slot0.model, string.format(slot8, "充值比例：1元=%d欢乐豆"))
end

ChargeCommonPayCcsView.onHide = function (slot0)
	slot3 = slot0._inputPayAmount

	slot0._inputPayAmount.hide(slot2)
end

ChargeCommonPayCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnClearInput then
		slot6 = ""

		slot0._inputPayAmount.setText(slot4, slot0._inputPayAmount)
	elseif slot1 == slot0.btnConfrim then
		slot3 = slot0._inputPayAmount.getText(slot4)
		slot6 = slot0.model

		if slot0.model.getCurChannelConfig(slot0._inputPayAmount) == nil then
			slot8 = "请选择充值渠道"

			tweenMsgMgr.showRedMsg(slot6, tweenMsgMgr)

			return
		end

		slot5 = tonumber(slot6)
		slot8 = slot3

		if string.len(slot3) == 0 then
			slot9 = "请输入充值金额"

			tweenMsgMgr.showRedMsg(slot7, tweenMsgMgr)

			return
		end

		if slot5 == nil then
			slot9 = "输入不合法，请重新输入"

			tweenMsgMgr.showRedMsg(slot7, tweenMsgMgr)

			slot9 = ""

			slot0._inputPayAmount.setText(slot7, slot0._inputPayAmount)

			return
		end

		if slot4.Max < slot5 then
			slot8 = tweenMsgMgr
			slot12 = slot4.Max

			tweenMsgMgr.showRedMsg(slot7, string.format(slot10, "充值金额不能超过%d元"))

			slot8 = slot0._inputPayAmount
			slot11 = slot4.Max

			slot0._inputPayAmount.setText(slot7, tostring(slot10))

			return
		elseif slot5 < slot4.Min then
			slot8 = tweenMsgMgr
			slot12 = slot4.Min

			tweenMsgMgr.showRedMsg(slot7, string.format(slot10, "充值金额不能小于%d元"))

			slot8 = slot0._inputPayAmount
			slot11 = slot4.Min

			slot0._inputPayAmount.setText(slot7, tostring(slot10))

			return
		end

		slot8 = slot0._inputPayAmount
		slot11 = slot5

		slot0._inputPayAmount.setText(slot7, tostring(slot10))

		slot9 = slot5

		slot0.controller.requirePay(slot7, slot0.controller)
	else
		slot5 = slot0.addBtnS

		for slot6, slot7 in ipairs(slot4) do
			if slot1 == slot7 then
				slot11 = slot7.addValue

				slot0.addPayAmount(slot9, slot0)
			end
		end
	end
end

ChargeCommonPayCcsView.addPayAmount = function (slot0, slot1)
	if slot0._inputPayAmount then
		slot2 = slot0._inputPayAmount.getText(slot3)
		slot5 = slot0.model

		if slot0.model.getCurChannelConfig(slot0._inputPayAmount).CustomAmount then
			slot6 = slot2

			if tonumber(slot5) == nil then
				slot6 = slot0._inputPayAmount
				slot9 = slot1

				slot0._inputPayAmount.setText(slot5, tostring(slot8))
			else
				slot6 = slot0._inputPayAmount
				slot11 = slot2
				slot9 = tonumber(slot10) + slot1

				slot0._inputPayAmount.setText(slot5, tostring(slot8))
			end
		else
			slot6 = slot0._inputPayAmount
			slot9 = slot1

			slot0._inputPayAmount.setText(slot5, tostring(slot8))
		end
	end
end

ChargeCommonPayCcsView.destroy = function (slot0)
	slot3 = slot0.btnItem_1

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_2

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_3

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_4

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_5

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_6

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_7

	destroySomeObj(slot2)

	slot3 = slot0.btnItem_8

	destroySomeObj(slot2)

	slot3 = slot0._inputPayAmount

	destroySomeObj(slot2)

	slot3 = slot0.btnClearInput

	destroySomeObj(slot2)

	slot3 = slot0.btnConfrim

	destroySomeObj(slot2)
end

return
