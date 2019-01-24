slot2 = "ChargeBankCardMyOrderListCcsItem"
ChargeBankCardMyOrderListCcsItem = class(slot1)

ChargeBankCardMyOrderListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0._stateSps = {
		slot0.spShenHe,
		slot0.spChengGong,
		slot0.spShiBai
	}
	slot0._transferTypes = {
		"银行卡",
		"支付宝",
		"微信"
	}
end

ChargeBankCardMyOrderListCcsItem.onClick = function (slot0)
	if slot0._data and slot0._data.OrderStatus == 0 then
		slot4 = slot0._data

		slot0.model.setWaitPayInfoData(slot2, slot0.model)

		slot4 = true

		slot0.model.setIsShowingChargeWaitPay(slot2, slot0.model)
	end
end

ChargeBankCardMyOrderListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot4 = slot0._data.OrderID

		slot0.txtOrder.setText(slot2, slot0.txtOrder)

		slot4 = slot0._transferTypes[slot0._data.TransType] or ""

		slot0.txtType.setText(slot2, slot0.txtType)

		slot3 = slot0.txtCount
		slot6 = slot0._data.OrderAmount

		slot0.txtCount.setText(slot2, StringUtil.numberStr2FormatNumberStr(slot5))

		slot8 = "\n"

		slot0.txtTime_tf.setHtmlText(slot2, string.gsub(slot5, slot0._data.InsertTime, " "))

		slot1 = slot0._data.OrderStatus + 1
		slot4 = slot0._stateSps

		for slot5, slot6 in ipairs(slot0.txtTime_tf) do
			slot10 = slot5 == slot1

			slot6.setVisible(slot8, slot6)
		end

		slot5 = slot0.model
		slot6 = slot0._itemIndex == #slot0.model.getMyOrderListData(slot4).data.PageData

		slot0.spLineDown.setVisible(slot4, slot0.spLineDown)
	end
end

return
