slot2 = "BankRecordCcsView"
BankRecordCcsView = class(slot1)

BankRecordCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)
end

BankRecordCcsView.init = function (slot0)
	slot4 = "csb/common/BankRecordItem.csb"

	slot0.list_lv.setItemResCcsFileName(slot2, slot0.list_lv)

	if slot0.panel_noRecord then
		slot4 = false

		slot0.panel_noRecord.setVisible(slot2, slot0.panel_noRecord)
	end
end

BankRecordCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.model.bankRecordInfoChangedSignal.add(slot2, slot0.model.bankRecordInfoChangedSignal, slot0.onBankRecordInfoChanged)
end

BankRecordCcsView.onBankRecordInfoChanged = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getBankRecordInfo(slot2)

	if slot0.panel_noRecord then
		if slot1 then
			slot4 = slot1

			if next(slot3) == nil then
				slot5 = true

				slot0.panel_noRecord.setVisible(slot3, slot0.panel_noRecord)

				slot4 = slot0.panel_noRecord
				slot7 = slot0.list_lv

				slot0.panel_noRecord.setPosition(slot3, slot0.list_lv.getPosition(slot6))
			elseif #slot1 > 0 then
				slot5 = false

				slot0.panel_noRecord.setVisible(slot3, slot0.panel_noRecord)
			end
		end
	end

	slot6 = true

	slot0.list_lv.setDatas(slot3, slot0.list_lv, slot1)
end

BankRecordCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

BankRecordCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.bankRecordInfoChangedSignal.remove(slot2, slot0.model.bankRecordInfoChangedSignal, slot0.onBankRecordInfoChanged)

	slot3 = slot0.list_lv

	slot0.list_lv.destroy(slot2)
end

return
