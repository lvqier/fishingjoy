slot2 = "ChargeBankCardValueCcsItem"
ChargeBankCardValueCcsItem = class(slot1)

ChargeBankCardValueCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

ChargeBankCardValueCcsItem.updateView = function (slot0)
	if slot0._data then
		slot3 = slot0.text
		slot6 = slot0._data

		slot0.text.setString(slot2, tostring(slot5))
	end
end

ChargeBankCardValueCcsItem.onClick = function (slot0)
	if slot0._data then
		slot5 = true

		slot0.model.setSelectTransferValue(slot2, slot0.model, slot0._data)
	end
end

return
