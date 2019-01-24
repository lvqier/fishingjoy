slot2 = "ChargeScoreCcsView"
ChargeScoreCcsView = class(slot1)

ChargeScoreCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.add(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndex)

	slot3 = slot0

	slot0.initEffect(slot2)
end

ChargeScoreCcsView.initEffect = function (slot0)
	slot7 = ResConfig.getSpinePath("chongzhititle/chongzhititle.json")
	slot3 = sp.SkeletonAnimation.create("chongzhititle/chongzhititle.atlas", sp.SkeletonAnimation, slot1)
	slot9 = true

	slot3.setAnimation(sp.SkeletonAnimation, slot3, 0, "animation")

	slot8 = 55

	slot3.setPosition(sp.SkeletonAnimation, slot3, 5)

	slot7 = slot3

	slot0.layerTopSpine.addChild(sp.SkeletonAnimation, slot0.layerTopSpine)
end

ChargeScoreCcsView.onShow = function (slot0)
	slot0.tabs = {}
	slot3 = slot0.controller
	slot2 = 1
	slot5 = slot0.controller.getPayOpenList(slot2)

	for slot6, slot7 in ipairs(slot4) do
		slot2 = slot2 + 1
		slot12 = {
			uiIndex = slot2,
			config = slot7
		}

		table.insert(slot10, slot0.tabs)
	end

	slot6 = "csb/common/ChargeTabItem.csb"

	slot0.tabs_lv.setItemResCcsFileName(slot4, slot0.tabs_lv)

	slot6 = true

	slot0.tabs_lv.setIsScrollableOnlyInNeed(slot4, slot0.tabs_lv)

	slot6 = 12

	slot0.tabs_lv.setGap(slot4, slot0.tabs_lv)

	slot6 = 10

	slot0.tabs_lv.setLeftMargin(slot4, slot0.tabs_lv)

	slot6 = slot0.tabs

	slot0.tabs_lv.setDatas(slot4, slot0.tabs_lv)

	slot8 = nil

	slot0.tabs_lv.jumpToPercent(slot4, slot0.tabs_lv, nil, 0)

	slot5 = slot0.model

	if slot0.model.getNoticeConfig(slot4).ShowNotice and slot3.NoticeDetails then
		slot7 = slot3.NoticeDetails

		popupMgr.showAlert(slot5, popupMgr)
	end

	slot8 = true

	slot0.model.setCurTabIndex(slot5, slot0.model, 1)
end

ChargeScoreCcsView.onHide = function (slot0)
	return
end

ChargeScoreCcsView.onTabIndex = function (slot0)
	slot5 = slot0.tabs[slot0.model.getCurTabIndex(slot2)].config

	slot0.model.setCurChannelConfig(slot0.model, slot0.model)

	slot4 = slot0

	slot0.onUpdatePage(slot0.model)
end

ChargeScoreCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnClose then
		slot5 = ProxyCharge

		ProxyCharge.hide(slot4)
	end
end

ChargeScoreCcsView.onUpdatePage = function (slot0)
	slot3 = slot0.model
	slot2 = slot0.model.getCurChannelConfig(slot2) == nil
	slot3 = false
	slot4 = false
	slot5 = false
	slot6 = false

	if lastPage ~= nil and lastPage.onHide then
		slot9 = lastPage

		lastPage.onHide(slot8)
	end

	if not slot2 then
		if slot1.PayType == CHARGE_PAY_TYPE_NAME_APPLE then
			slot5 = true
			lastPage = slot0.layerNormal
		elseif slot7 == CHARGE_PAY_TYPE_NAME_BANK_CARD then
			slot4 = true
			lastPage = slot0.layerBankCard
		elseif slot7 == CHARGE_PAY_TYPE_PHONE_CARD then
			slot3 = true
			lastPage = slot0.layerPhoneCard
		elseif slot7 == CHARGE_PAY_TYPE_NAME_OPPO or slot7 == CHARGE_PAY_TYPE_NAME_VIVO or slot7 == CHARGE_PAY_TYPE_NAME_MIDAS then
			slot5 = true
			lastPage = slot0.layerNormal
		else
			slot6 = true
			lastPage = slot0.layerCommon
		end

		if lastPage and lastPage.onShow then
			slot10 = lastPage

			lastPage.onShow(slot9)
		end
	end

	slot10 = slot5

	slot0.layerNormal.setVisible(slot8, slot0.layerNormal)

	slot10 = slot3

	slot0.layerPhoneCard.setVisible(slot8, slot0.layerPhoneCard)

	slot10 = slot4

	slot0.layerBankCard.setVisible(slot8, slot0.layerBankCard)

	slot10 = slot6

	slot0.layerCommon.setVisible(slot8, slot0.layerCommon)
end

ChargeScoreCcsView.destroy = function (slot0)
	slot3 = slot0.layerPhoneCard

	slot0.layerPhoneCard.destroy(slot2)

	slot3 = slot0.layerNormal

	slot0.layerNormal.destroy(slot2)

	slot3 = slot0.layerCommon

	slot0.layerCommon.destroy(slot2)

	slot3 = slot0.layerBankCard

	slot0.layerBankCard.destroy(slot2)

	slot5 = slot0

	slot0.model.curTabIndexChangedSignal.remove(slot2, slot0.model.curTabIndexChangedSignal, slot0.onTabIndex)

	slot3 = slot0.btnClose

	destroySomeObj(slot2)
end

return
