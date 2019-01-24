slot2 = "BankView"
BankView = class(slot1)
slot2 = "bank.view.ccs.BankCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankAccessCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankPopUpGetCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankPopUpSaveCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankGiveCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankRecordCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankPwCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankPopUpGiveDetailCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankPopUpGiveConfirmCcsView"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankTypeListCcsItem"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankRecordListCcsItem"

requireLuaFromModule(slot1)

slot2 = "bank.view.ccs.BankGiveRecordCcsView"

requireLuaFromModule(slot1)

ccs.BankCcsView = BankCcsView
ccs.BankAccessCcsView = BankAccessCcsView
ccs.BankPopUpGetCcsView = BankPopUpGetCcsView
ccs.BankPopUpSaveCcsView = BankPopUpSaveCcsView
ccs.BankGiveCcsView = BankGiveCcsView
ccs.BankRecordCcsView = BankRecordCcsView
ccs.BankPwCcsView = BankPwCcsView
ccs.BankPopUpGiveDetailCcsView = BankPopUpGiveDetailCcsView
ccs.BankPopUpGiveConfirmCcsView = BankPopUpGiveConfirmCcsView
ccs.BankTypeListCcsItem = BankTypeListCcsItem
ccs.BankRecordListCcsItem = BankRecordListCcsItem
ccs.BankGiveRecordCcsView = BankGiveRecordCcsView
ccs.BankGiveRecordCcsItem = BankGiveRecordCcsItem

BankView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot8 = "csb/layer/Bank.csb"

	ClassUtil.extends(slot4, slot0, BaseModuleUIView, true)

	slot6 = false

	slot0.setRootClickable(slot4, slot0)

	if 1 ~= 4 and slot3 ~= 5 and slot3 ~= 6 and slot3 ~= 7 then
	end

	Bbcgaxx[3] = "45"
end

BankView.bindChildrenViews = function (slot0)
	slot6 = "isShowingBankSave"

	slot0.bindPopUpChildView(slot2, slot0, "banksave", "csb/layer/BankPopUpSave.csb")

	slot6 = "isShowingBankGet"

	slot0.bindPopUpChildView(slot2, slot0, "bankget", "csb/layer/BankPopUpGet.csb")

	slot6 = "isShowingBankGiveConfirm"

	slot0.bindPopUpChildView(slot2, slot0, "bankgiveconfirm", "csb/layer/BankPopUpGiveConfirm.csb")

	slot6 = "isShowingBankGiveDetail"

	slot0.bindPopUpChildView(slot2, slot0, "bankgivedetail", "csb/layer/BankPopUpGiveDetail.csb")

	slot1 = slot0.getRootView(slot2).nodeRight
	slot4 = "bank"
	slot3 = "curTabIndex"
	slot6 = getCSVField(slot0)

	for slot7, slot8 in pairs("csb/layer/BankPopUpGiveDetail.csb") do
		slot15 = slot8.index

		slot0.bindTabView(slot10, slot0, slot1, slot8.resPath, slot3)
	end

	slot7 = slot3

	slot0.onTabChangedByModelTabProperty(slot5, slot0)
end

BankView.destroy = function (slot0)
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
