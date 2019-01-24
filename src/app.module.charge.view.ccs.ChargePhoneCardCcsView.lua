slot2 = "ChargePhoneCardCcsView"
ChargePhoneCardCcsView = class(slot1)

ChargePhoneCardCcsView.onCreationComplete = function (slot0)
	slot0._tabsPhoneCardBtn = {
		[CHARGE_PHONE_CARD_DIAN_XIN] = slot0.btnDianXin,
		[CHARGE_PHONE_CARD_YI_DONG] = slot0.btnYiDong,
		[CHARGE_PHONE_CARD_LIAN_TONG] = slot0.btnLianTong
	}
	slot3 = slot0.inputCard
	slot0._inputCard = CCSUtil.changeUITextFeildWithCcsTextInput(CHARGE_PHONE_CARD_LIAN_TONG)
	slot3 = slot0.inputCardPw
	slot0._inputCardPw = CCSUtil.changeUITextFeildWithCcsTextInput(CHARGE_PHONE_CARD_LIAN_TONG)
	slot4 = true
	slot0._groupPhoneCardTabs = ComponentsGroup.new(CHARGE_PHONE_CARD_LIAN_TONG, slot0._tabsPhoneCardBtn)
	slot4 = false

	slot0._groupPhoneCardTabs.setIsAlignMid(CHARGE_PHONE_CARD_LIAN_TONG, slot0._groupPhoneCardTabs)

	slot0._phoneCardMianZhiTabGroup = CcsTabPane.new()
	slot0._phoneCardMianZhiTabs = {}
	slot1 = 1

	while true do
		if slot0["tabMianZhi" .. slot1] then
			slot6 = slot2

			table.insert(slot4, slot0._phoneCardMianZhiTabs)

			slot1 = slot1 + 1
		else
			break
		end
	end

	slot6 = isRenderNextFrame

	slot0.txtWarning_tf.setHtmlText(slot3, slot0.txtWarning_tf, "*请选择与话费充值卡面额一致的金额，否则自行承担差额损失")

	slot5 = slot0._phoneCardMianZhiTabs

	slot0._phoneCardMianZhiTabGroup.pushTabs(slot3, slot0._phoneCardMianZhiTabGroup)

	slot6 = slot0

	slot0._phoneCardMianZhiTabGroup.tabClickSignal.add(slot3, slot0._phoneCardMianZhiTabGroup.tabClickSignal, slot0.onPhoneCardMianZhiTabSelected)

	slot6 = slot0

	slot0.model.curPhoneCardMianZhiTabIndexChangedSignal.add(slot3, slot0.model.curPhoneCardMianZhiTabIndexChangedSignal, slot0.onPhoneCardMianZhiTabIndexChanged)

	slot6 = slot0

	slot0.model.curPhoneCardTypeChangedSignal.add(slot3, slot0.model.curPhoneCardTypeChangedSignal, slot0.onCurPhoneCardTypeChanged)

	slot4 = slot0

	slot0.onPhoneCardMianZhiTabIndexChanged(slot3)

	slot4 = slot0

	slot0.onCurPhoneCardTypeChanged(slot3)
end

ChargePhoneCardCcsView.onPhoneCardMianZhiTabSelected = function (slot0, slot1)
	slot5 = slot1

	slot0.model.setCurPhoneCardMianZhiTabIndex(slot3, slot0.model)
end

ChargePhoneCardCcsView.onHide = function (slot0)
	slot3 = slot0._inputCard

	slot0._inputCard.hide(slot2)

	slot3 = slot0._inputCardPw

	slot0._inputCardPw.hide(slot2)
end

ChargePhoneCardCcsView.onShow = function (slot0)
	slot3 = slot0._inputCard

	slot0._inputCard.show(slot2)

	slot3 = slot0._inputCardPw

	slot0._inputCardPw.show(slot2)
end

ChargePhoneCardCcsView.onPhoneCardMianZhiTabIndexChanged = function (slot0)
	slot5 = slot0.model.getCurPhoneCardMianZhiTabIndex(slot2)

	slot0._phoneCardMianZhiTabGroup.setSelectedTabIndex(slot0.model, slot0._phoneCardMianZhiTabGroup)

	slot4 = slot0

	slot0.updateGoldTxt(slot0.model)
end

ChargePhoneCardCcsView.updateGoldTxt = function (slot0)
	slot1 = nil
	slot4 = slot0.model

	if slot0.model.getCurPhoneCardMianZhiTabIndex(slot3) then
		slot7 = slot0.model.getCurPhoneCardType(slot4)
		slot1 = (slot0.model.getPhoneCardDataBy(slot0.model, slot0.model) ~= nil and slot4.values[slot2]) or nil
	end

	if slot1 then
		slot6 = slot1 * 13000
		slot1 = StringUtil.numberStr2FormatNumberStr(slot5)
	else
		slot1 = "无效数值"
	end

	slot10 = "#ffef84"
	slot7 = true

	slot0.txtHld_tf.setHtmlText(slot4, slot0.txtHld_tf, "可获得欢乐豆：" .. HtmlUtil.createColorTxt(slot8, slot1))
end

ChargePhoneCardCcsView.onCurPhoneCardTypeChanged = function (slot0)
	slot1 = slot0.model.getCurPhoneCardType(slot2)
	slot4 = slot0._tabsPhoneCardBtn

	for slot5, slot6 in pairs(slot0.model) do
		slot11 = slot5 == slot1

		slot6.spSelected.setVisible(slot9, slot6.spSelected)
	end

	slot5 = slot1
	slot2 = slot0.model.getPhoneCardDataBy(slot3, slot0.model)
	slot5 = slot0._phoneCardMianZhiTabs

	for slot6, slot7 in ipairs(slot0.model) do
		slot12 = ((slot2 ~= nil and slot2.values[slot6]) or nil) ~= nil

		slot7.setVisible(slot10, slot7)

		if slot8 then
			slot12 = slot8

			slot7.btnNormal.txt.setString(slot10, slot7.btnNormal.txt)

			slot12 = slot8

			slot7.btnSelected.txt.setString(slot10, slot7.btnSelected.txt)
		end
	end

	slot5 = slot0

	slot0.updateGoldTxt(slot4)
end

ChargePhoneCardCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnChongZhi then
		slot13 = slot0._inputCardPw.getText(slot0._inputCard)

		slot0.controller.requestPhoneCardPay(slot0._inputCardPw, slot0.controller, slot0.model.getCurPhoneCardType(slot4), slot0.model.getCurPhoneCardMianZhiTabIndex(slot0.model), slot0._inputCard.getText(slot0.model))
	else
		slot6 = slot1

		if table.indexof(slot4, slot0._tabsPhoneCardBtn) then
			slot7 = slot3

			slot0.controller.changePhoneCardType(slot5, slot0.controller)
		end
	end
end

ChargePhoneCardCcsView.destroy = function (slot0)
	slot3 = slot0.btnChongZhi

	slot0.btnChongZhi.destroy(slot2)

	slot3 = slot0.txtHld_tf

	slot0.txtHld_tf.destroy(slot2)

	slot3 = slot0.txtWarning_tf

	slot0.txtWarning_tf.destroy(slot2)

	slot3 = slot0._tabsPhoneCardBtn

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0._phoneCardMianZhiTabGroup

	slot0._phoneCardMianZhiTabGroup.destroy(slot2)

	slot5 = slot0

	slot0.model.curPhoneCardMianZhiTabIndexChangedSignal.remove(slot2, slot0.model.curPhoneCardMianZhiTabIndexChangedSignal, slot0.onPhoneCardMianZhiTabIndexChanged)

	slot5 = slot0

	slot0.model.curPhoneCardTypeChangedSignal.remove(slot2, slot0.model.curPhoneCardTypeChangedSignal, slot0.onCurPhoneCardTypeChanged)

	slot3 = slot0._inputCard

	slot0._inputCard.destroy(slot2)

	slot3 = slot0._inputCardPw

	slot0._inputCardPw.destroy(slot2)
end

return
