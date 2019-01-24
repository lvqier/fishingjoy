slot2 = "ChargeBankCardTypeCcsItem"
ChargeBankCardTypeCcsItem = class(slot1)

ChargeBankCardTypeCcsItem.setData = function (slot0, slot1)
	if slot1 then
		slot5 = slot1.value

		slot0.text.setString(slot3, slot0.text)

		slot0.data = slot1
	end
end

ChargeBankCardTypeCcsItem.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.btnClick and slot0.data then
		slot6 = true

		slot0.model.setSelectTransferType(slot3, slot0.model, slot0.data.key)
	end
end

return
