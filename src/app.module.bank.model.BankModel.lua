slot2 = "BankModel"
BankModel = class(slot1)

BankModel.ctor = function (slot0)
	slot6 = true

	createSetterGetter(slot2, slot0, "curTabIndex", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowGiveRecordView", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBankGet", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBankSave", false)

	slot13 = slot0.onIsShowingBankGive

	createSetterGetter(slot2, slot0, "isShowingBankGiveDetail", false, true, nil, nil, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBankGiveConfirm", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankSaveMount", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankGetMount", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankGiveMount", 0)

	slot9 = false
	slot13 = slot0.onBankGiveIdChanged

	createSetterGetter(slot2, slot0, "bankGiveId", "", true, false, false, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "bankGiveName", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "bankGiveCurInfo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankRecordInfo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "oldPwd", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "newPwd1", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "newPwd2", "")

	slot4 = "pwdChangedSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "giveSuccessSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "saveSuccessSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())

	slot4 = "getSuccessSignal"

	createSetterGetter(slot2, slot0, SignalAs3.new())
end

BankModel.onBankGiveIdChanged = function (slot0)
	slot4 = ""

	slot0.setBankGiveName(slot2, slot0)
end

BankModel.onIsShowingBankGive = function (slot0)
	if not slot0._isShowingBankGiveDetail then
		slot4 = 0

		slot0.setBankGiveMount(slot2, slot0)

		slot4 = ""

		slot0.setBankGiveId(slot2, slot0)

		slot4 = ""

		slot0.setBankGiveName(slot2, slot0)

		slot4 = nil

		slot0.setBankGiveCurInfo(slot2, slot0)

		slot3 = slot0._giveSuccessSignal

		slot0._giveSuccessSignal.emit(slot2)
	end
end

BankModel.destroy = function (slot0)
	slot3 = slot0

	SignalAs3.clearAllSignal(slot2)
end

return
