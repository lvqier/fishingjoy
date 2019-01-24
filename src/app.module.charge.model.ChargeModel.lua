slot2 = "ChargeModel"
ChargeModel = class(slot1)
CHARGE_SHOW_WEBVIEW = false
CHARGE_ORDER_TYPE_SCORE = 0
CHARGE_ORDER_TYPE_MONTH_CARD = 1
CHARGE_ORDER_TYPE_FIRST_PAY = 2
CHARGE_PHONE_CARD_DIAN_XIN = 1
CHARGE_PHONE_CARD_YI_DONG = 2
CHARGE_PHONE_CARD_LIAN_TONG = 3
CHARGE_WEB_CHECK_MAX_NUM = 12

if IS_IOS_VERIFY then
	CHARGE_APPLE_PAY_ORDER_URL = "/create_apple2?userId=%d&money=%d&score=%d&Sign=%s&isexamine=%d&device=%d"
else
	CHARGE_APPLE_PAY_ORDER_URL = "/create_apple?userId=%d&money=%d&score=%d&Sign=%s&isexamine=%d&device=%d"
end

CHARGE_APPLE_PAY_ORDER_KEY = "xxxxxxxxxxxxkey1"
CHARGE_APPLE_PAY_CALLBACK_KEY = "xxxxxxxxxxxxkey2"
CHARGE_APPLE_PAY_CALLBACK_URL = "/pay_phone_endit_apple"
CHARGE_PAY_PHONE_CARD_URL = "/payment_api?pd_Timestamp=%s&pd_UserId=%d&pd_Amount=%d&pd_FrpId=%s&pd_InterFaceType=PAY_PAYMENT&Sign=%s&pd_PayType=%s&card_no=%s&card_pwd=%s&card_main_type=%s&card_sub_type=%s&ordertype=%d"
CHARGE_BANK_CARD_TRANSFER_BNAK = 1
CHARGE_BANK_CARD_TRANSFER_ALI = 2
CHARGE_BANK_CARD_TRANSFER_WECHAT = 3
CHARGE_PAY_TYPE_NAME_APPLE = "apple"
CHARGE_PAY_TYPE_NAME_BANK_CARD = "BankCardTransfer"
CHARGE_PAY_TYPE_NAME_MIDAS = "midas"
CHARGE_PAY_TYPE_NAME_OPPO = "oppo"
CHARGE_PAY_TYPE_NAME_VIVO = "vivo"
CHARGE_PAY_TYPE_PHONE_CARD = "PhoneCard"
CHARGE_PAY_TYPE_SDK = {
	CHARGE_PAY_TYPE_NAME_MIDAS,
	CHARGE_PAY_TYPE_NAME_OPPO,
	CHARGE_PAY_TYPE_NAME_VIVO
}
CHARGE_APP_NAME_ALI = "alipay"
CHARGE_APP_NAME_WECHAT = "wechat"
CHARGE_APP_NAME_QQ = "qq"

ChargeModel.ctor = function (slot0)
	slot6 = true

	createSetterGetter(slot2, slot0, "orderType", 0)

	slot5 = 0

	createSetterGetter(slot2, slot0, "orderPrice")

	slot6 = true

	createSetterGetter(slot2, slot0, "curTabIndex", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowLoading", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "loadingCheck", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "checkUrl", nil)

	slot6 = false

	createSetterGetter(slot2, slot0, "loadingNum", 0)

	slot6 = false

	createSetterGetter(slot2, slot0, "onRechargeBankCall", nil)

	slot6 = false

	createSetterGetter(slot2, slot0, "isJump2Pay", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "isStopCheckPayState", false)

	slot9 = true

	createSetterGetter(slot2, slot0, "checkNum", 0, false, false, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowWebView", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "webViewConfig", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "requestUrl", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "curPhoneCardType", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "phoneCardData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "bankCardTabIndex", 1)

	slot6 = true

	createSetterGetter(slot2, slot0, "curPhoneCardMianZhiTabIndex", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "chargeBankName", "")

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingBankNameSelect", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "selectTransferValue", 0)

	slot6 = true

	createSetterGetter(slot2, slot0, "selectTransferType", CHARGE_BANK_CARD_TRANSFER_BNAK)

	slot5 = {}

	createSetterGetter(slot2, slot0, "waitPayInfoData")

	slot6 = true

	createSetterGetter(slot2, slot0, "myOrderListData", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "exchange", 14000)

	slot0.m_applePayConfig = PAY_CONFIG_APPLE
	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingChargeWaitPay", false)

	slot6 = true

	createSetterGetter(slot2, slot0, "isShowingTransferGuide", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "channelConfigs", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "noticeConfig", {})

	slot6 = false

	createSetterGetter(slot2, slot0, "curChannelConfig", {})
end

ChargeModel.getAppleItemConfig = function (slot0)
	if slot0.m_applePayConfig[PACKAGE_DEVICE_TYPE] then
		return slot0.m_applePayConfig[PACKAGE_DEVICE_TYPE]
	else
		return slot0.m_applePayConfig[0]
	end
end

ChargeModel.getPhoneCardDataBy = function (slot0, slot1)
	if slot0._phoneCardData then
		slot4 = slot0._phoneCardData

		for slot5, slot6 in pairs(slot3) do
			if slot6.type == slot1 then
				return slot6
			end
		end
	end

	return nil
end

ChargeModel.destroy = function (slot0)
	slot3 = slot0

	SignalAs3.clearAllSignal(slot2)
end

return
