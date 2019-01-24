slot2 = "BankPopUpGiveDetailCcsView"
BankPopUpGiveDetailCcsView = class(slot1)

BankPopUpGiveDetailCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot6 = true

	mainMgr.setIsShowing4Platform(slot2, mainMgr, slot0.view, "icon")

	slot6 = true

	mainMgr.setIsShowing4Platform(slot2, mainMgr, slot0.view, "downLoadCode")

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onBankGiveCurInfo(slot2)
end

BankPopUpGiveDetailCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.model.bankGiveCurInfoChangedSignal.add(slot2, slot0.model.bankGiveCurInfoChangedSignal, slot0.onBankGiveCurInfo)
end

BankPopUpGiveDetailCcsView.onBankGiveCurInfo = function (slot0)
	slot3 = slot0.model

	if slot0.model.getBankGiveCurInfo(slot2) then
		slot4 = slot0.view.txtHLD
		slot7 = slot1.lScore

		slot0.view.txtHLD.setString(slot3, StringUtil.numberStr2FormatNumberStr(slot6))

		slot5 = false

		slot0.view.txtDxDou.ignoreContentAdaptWithSize(slot3, slot0.view.txtDxDou)

		slot4 = slot0.view.txtDxDou
		slot7 = slot1.lScore

		slot0.view.txtDxDou.setString(slot3, StringUtil.numberStr2ZhHant(slot6))

		slot7 = "#8BA3BF"
		slot8 = "#8BA3BF"
		slot5 = HtmlUtil.createColorTxt("(ID " .. slot1.dwTargetUserID .. ")", "(ID " .. slot1.dwSourceUserID .. ")")
		slot7 = slot1.szTargetNickName .. "  " .. HtmlUtil.createColorTxt(StringUtil.numberStr2ZhHant, "(ID " .. slot1.dwTargetUserID .. ")")

		slot0.view.txtJsr_tf.setHtmlText(slot5, slot0.view.txtJsr_tf)

		slot7 = slot1.szSourceNickName .. "  " .. slot5

		slot0.view.txtZsr_tf.setHtmlText(slot5, slot0.view.txtZsr_tf)

		slot7 = slot1.dtTime

		slot0.view.txtDate.setString(slot5, slot0.view.txtDate)
	end
end

BankPopUpGiveDetailCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBankGiveDetail(slot4, slot0.model)
	elseif slot1 == slot0.view.btnSave then
		slot10 = ProxyBank.view
		slot12 = tickMgr.getServerTime(slot4) or os.time()

		slot0.controller.saveRenderNodeToAlbum(tickMgr, slot0.controller, {
			ProxyBank.view.getRootView("bankGiveDetail" .. tostring(slot11) .. ".jpg").bg,
			slot0
		}, "CaptureScreen")
	end
end

BankPopUpGiveDetailCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.bankGiveCurInfoChangedSignal.remove(slot2, slot0.model.bankGiveCurInfoChangedSignal, slot0.onBankGiveCurInfo)

	slot3 = slot0.view.txtJsr_tf

	slot0.view.txtJsr_tf.destroy(slot2)

	slot3 = slot0.view.txtZsr_tf

	slot0.view.txtZsr_tf.destroy(slot2)

	slot3 = slot0.view.btnSave

	slot0.view.btnSave.destroy(slot2)

	slot3 = slot0.view.btnClose

	slot0.view.btnClose.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
