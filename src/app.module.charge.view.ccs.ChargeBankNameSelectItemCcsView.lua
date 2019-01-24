slot2 = "ChargeBankNameSelectItemCcsView"
ChargeBankNameSelectItemCcsView = class(slot1)

ChargeBankNameSelectItemCcsView.onCreationComplete = function (slot0)
	return
end

ChargeBankNameSelectItemCcsView.onClick = function (slot0)
	return
end

ChargeBankNameSelectItemCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnName and slot0.model then
		slot5 = slot0.model
		slot8 = slot0.btnName.txName

		slot0.model.setChargeBankName(slot4, slot0.btnName.txName.getString(slot7))
	end
end

ChargeBankNameSelectItemCcsView.init = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot7 = slot0

	slot0.model.chargeBankNameChangedSignal.add(slot4, slot0.model.chargeBankNameChangedSignal, slot0.onChargeBankNameChanged)

	slot6 = slot2

	slot0.btnName.txName.setString(slot4, slot0.btnName.txName)

	slot5 = slot0

	slot0.onChargeBankNameChanged(slot4)
end

ChargeBankNameSelectItemCcsView.onChargeBankNameChanged = function (slot0)
	slot7 = slot0.btnName.txName
	slot4 = slot0.model.getChargeBankName(slot5) == slot0.btnName.txName.getString(slot0.model)

	slot0.btnName.spBack.setVisible(slot2, slot0.btnName.spBack)
end

ChargeBankNameSelectItemCcsView.destroy = function (slot0)
	if slot0.model then
		slot5 = slot0

		slot0.model.chargeBankNameChangedSignal.remove(slot2, slot0.model.chargeBankNameChangedSignal, slot0.onChargeBankNameChanged)
	end
end

return
