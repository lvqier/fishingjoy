slot2 = "BankPopUpGiveConfirmCcsView"
BankPopUpGiveConfirmCcsView = class(slot1)

BankPopUpGiveConfirmCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onBankGiveMount(slot2)

	slot3 = slot0

	slot0.onJsrChanged(slot2)

	slot3 = slot0

	slot0.onZsrChanged(slot2)

	if 1 ~= 4 and slot1 ~= 5 and slot1 ~= 6 and slot1 ~= 7 then
	end
end

CCSB = {
	asc = "d2RT"
}

BankPopUpGiveConfirmCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.model.bankGiveMountChangedSignal.add(slot2, slot0.model.bankGiveMountChangedSignal, slot0.onBankGiveMount)

	slot5 = slot0

	slot0.model.bankGiveIdChangedSignal.add(slot2, slot0.model.bankGiveIdChangedSignal, slot0.onJsrChanged)

	slot5 = slot0

	slot0.model.bankGiveNameChangedSignal.add(slot2, slot0.model.bankGiveNameChangedSignal, slot0.onJsrChanged)

	slot5 = slot0

	Hero.dwGameIDChangedSignal.add(slot2, Hero.dwGameIDChangedSignal, slot0.onZsrChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.add(slot2, Hero.pNickNameChangedSignal, slot0.onZsrChanged)
end

BankPopUpGiveConfirmCcsView.onBankGiveMount = function (slot0)
	slot4 = slot0.view.txtHld
	slot7 = slot0.model.getBankGiveMount(slot2)

	slot0.view.txtHld.setString(slot0.model, StringUtil.numberStr2FormatNumberStr(slot6))
end

BankPopUpGiveConfirmCcsView.onJsrChanged = function (slot0)
	slot1 = slot0.model.getBankGiveId(slot2)
	slot4 = slot0.model
	slot3 = ""

	if slot0.model.getBankGiveName(slot0.model) and slot2 ~= "" then
		slot8 = "#8BA3BF"
		slot3 = slot2 .. HtmlUtil.createColorTxt(slot6, "（ID:" .. slot1 .. "）")
	else
		slot7 = "#8BA3BF"
		slot3 = HtmlUtil.createColorTxt(slot5, "ID:" .. slot1)
	end

	slot7 = slot3

	slot0.view.txtJsr_tf.setHtmlText(slot5, slot0.view.txtJsr_tf)
end

BankPopUpGiveConfirmCcsView.onZsrChanged = function (slot0)
	slot4 = Hero
	slot7 = "#8BA3BF"
	slot7 = slot2 .. HtmlUtil.createColorTxt(slot5, "（ID:" .. slot1 .. "）")

	slot0.view.txtZsr_tf.setHtmlText(slot5, slot0.view.txtZsr_tf)
end

BankPopUpGiveConfirmCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBankGiveConfirm(slot4, slot0.model)
	elseif slot1 == slot0.view.btnConfirm then
		slot5 = mainMgr

		if not mainMgr.checkBankGiveIsNeedBindMobile(slot4) then
			if OxFFFFFF and slot0.controller.getWechatinfo ~= OxFFFFFF then
				NEED_ROTATE = true
			else
				slot5 = slot0.controller

				BankController.getWechatinfo(slot4)
			end
		else
			function slot6()
				slot2 = ProxyBank

				ProxyBank.hide(slot1)
			end

			mainMgr.showBindMobileTips(slot4, mainMgr)
		end
	end
end

BankPopUpGiveConfirmCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.bankGiveMountChangedSignal.remove(slot2, slot0.model.bankGiveMountChangedSignal, slot0.onBankGiveMount)

	slot5 = slot0

	slot0.model.bankGiveIdChangedSignal.remove(slot2, slot0.model.bankGiveIdChangedSignal, slot0.onJsrChanged)

	slot5 = slot0

	slot0.model.bankGiveNameChangedSignal.remove(slot2, slot0.model.bankGiveNameChangedSignal, slot0.onJsrChanged)

	slot5 = slot0

	Hero.dwGameIDChangedSignal.remove(slot2, Hero.dwGameIDChangedSignal, slot0.onZsrChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onZsrChanged)

	slot3 = slot0.view.txtJsr_tf

	slot0.view.txtJsr_tf.destroy(slot2)

	slot3 = slot0.view.txtZsr_tf

	slot0.view.txtZsr_tf.destroy(slot2)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnConfirm

	destroySomeObj(slot2)
end

return
