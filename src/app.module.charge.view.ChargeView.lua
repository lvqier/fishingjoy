slot2 = "ChargeView"
ChargeView = class(slot1)
slot2 = "charge.view.ccs.ChargeCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargePhoneCardCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.RechargeCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.RechargeCcsItem"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeScoreCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeMonthCardCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeTabCcsItem"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardTabMyOrderCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardMyOrderListCcsItem"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeWaitPayCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeGuidePopUpCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankNameSelectCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankNameSelectItemCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardTabCreateOrderCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardTypeCcsItem"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeBankCardValueCcsItem"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeCommonPayCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeItemsPayCcsView"

requireLuaFromModule(slot1)

slot2 = "charge.view.ccs.ChargeMonthCardCcsItem"

requireLuaFromModule(slot1)

ccs.ChargeCcsView = ChargeCcsView
ccs.ChargePhoneCardCcsView = ChargePhoneCardCcsView
ccs.RechargeCcsView = RechargeCcsView
ccs.RechargeCcsItem = RechargeCcsItem
ccs.ChargeScoreCcsView = ChargeScoreCcsView
ccs.ChargeMonthCardCcsView = ChargeMonthCardCcsView
ccs.ChargeTabCcsItem = ChargeTabCcsItem
ccs.ChargeBankCardCcsView = ChargeBankCardCcsView
ccs.ChargeBankCardTabMyOrderCcsView = ChargeBankCardTabMyOrderCcsView
ccs.ChargeBankCardMyOrderListCcsItem = ChargeBankCardMyOrderListCcsItem
ccs.ChargeWaitPayCcsView = ChargeWaitPayCcsView
ccs.ChargeGuidePopUpCcsView = ChargeGuidePopUpCcsView
ccs.ChargeBankNameSelectCcsView = ChargeBankNameSelectCcsView
ccs.ChargeBankNameSelectItemCcsView = ChargeBankNameSelectItemCcsView
ccs.ChargeBankCardTabCreateOrderCcsView = ChargeBankCardTabCreateOrderCcsView
ccs.ChargeBankCardTypeCcsItem = ChargeBankCardTypeCcsItem
ccs.ChargeBankCardValueCcsItem = ChargeBankCardValueCcsItem
ccs.ChargeCommonPayCcsView = ChargeCommonPayCcsView
ccs.ChargeItemsPayCcsView = ChargeItemsPayCcsView
ccs.ChargeMonthCardCcsItem = ChargeMonthCardCcsItem

ChargeView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2

	if IS_IOS_VERIFY and not isAndroid then
		slot11 = false

		ClassUtil.extends(slot4, slot0, TweenToTargetModuleView, true, "csb/layer/Recharge.csb", nil, UIConfig.ALIGN_CENTER)
	else
		slot11 = false

		ClassUtil.extends(slot4, slot0, TweenToTargetModuleView, true, "csb/layer/Charge.csb", nil, UIConfig.ALIGN_CENTER)
	end
end

ChargeView.onRootClick = function (slot0)
	slot3 = ProxyCharge

	ProxyCharge.hide(slot2)
end

ChargeView.bindChildrenViews = function (slot0)
	slot6 = "isShowingChargeWaitPay"

	slot0.bindPopUpChildView(slot2, slot0, "waitPay", "csb/layer/ChargeWaitPay.csb")

	slot6 = "isShowingTransferGuide"

	slot0.bindPopUpChildView(slot2, slot0, "chargeGuide", "csb/layer/ChargeGuidePopUp.csb")

	slot6 = "isShowingBankNameSelect"

	slot0.bindPopUpChildView(slot2, slot0, "bankName", "csb/layer/ChargeBankNameSelect.csb")
end

ChargeView.destroy = function (slot0)
	slot3 = slot0

	TweenToTargetModuleView.destroy(slot2)

	slot0.model = nil
	slot0.controller = nil
end

return
