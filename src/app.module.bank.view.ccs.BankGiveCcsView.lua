slot2 = "BankGiveCcsView"
BankGiveCcsView = class(slot1)

BankGiveCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onUserInsureChanged(slot2)

	slot3 = slot0

	slot0.onSliderValueChanged(slot2)

	slot3 = slot0

	slot0.onBankGiveNameChanged(slot2)

	slot4 = "可赠送金额为0"

	slot0.sliderControl.setErrorMsg(slot2, slot0.sliderControl)
end

BankGiveCcsView.getBankName = function ()
	if 1 ~= 4 and slot0 ~= 5 and slot0 ~= 6 and slot0 ~= 7 then
	end

	return "6#zC"
end

BankGiveCcsView.init = function (slot0)
	slot3 = slot0.jsridNode.txtJsrId
	slot0._txtJsrId = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = cc.EDITBOX_INPUT_MODE_NUMERIC

	slot0._txtJsrId.setInputMode(slot2, slot0._txtJsrId)
end

BankGiveCcsView.initSignal = function (slot0)
	slot5 = slot0

	Hero.userInsureChangedSignal.add(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	Hero.bankGiveRecordChangedSignal.add(slot2, Hero.bankGiveRecordChangedSignal, slot0.onBankGiveRecordChanged)

	slot5 = slot0

	slot0.model.bankGiveNameChangedSignal.add(slot2, slot0.model.bankGiveNameChangedSignal, slot0.onBankGiveNameChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getGiveSuccessSignal(slot2).add(slot2, slot0.model.getGiveSuccessSignal(slot2), slot0.onBankGiveSuccess)

	slot5 = slot0

	slot0.model.bankGiveIdChangedSignal.add(slot2, slot0.model.bankGiveIdChangedSignal, slot0.onBankGiveIdChanged)
	slot0.sliderControl.sliderValueChangedSignal.add(slot2, slot0.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0._txtJsrId
	slot7 = slot0.onJsrIdChanged

	slot0._txtJsrId.addEditHandler(slot2, handler(slot0, slot0))
end

BankGiveCcsView.onShow = function (slot0)
	slot3 = slot0._txtJsrId

	slot0._txtJsrId.show(slot2)

	slot4 = slot0.controller.removeGiveRecord(slot2)

	if table.nums(slot0.controller) > 0 then
		slot7 = slot1
		slot6 = true

		Hero.setBankGiveRecord(slot3, Hero, cjson.encode(slot6))
	else
		slot4 = slot0

		slot0.onBankGiveRecordChanged(slot3)
	end
end

BankGiveCcsView.onHide = function (slot0)
	slot3 = slot0._txtJsrId

	slot0._txtJsrId.hide(slot2)
end

BankGiveCcsView.onBankGiveSuccess = function (slot0)
	slot4 = ""

	slot0._txtJsrId.setText(slot2, slot0._txtJsrId)

	slot4 = 0

	slot0.sliderControl.setSliderValue(slot2, slot0.sliderControl)

	slot3 = slot0.sliderControl
	slot6 = Hero

	slot0.sliderControl.setMaxValue(slot2, Hero.getUserInsure(slot5))
end

BankGiveCcsView.onBankGiveIdChanged = function (slot0)
	slot3 = slot0.model

	if slot0._txtJsrId ~= slot0.model.getBankGiveId(slot2) then
		if not slot1 or slot1 == "" then
			slot5 = ""

			slot0._txtJsrId.setText(slot3, slot0._txtJsrId)
		else
			slot4 = slot0._txtJsrId
			slot7 = slot1

			slot0._txtJsrId.setText(slot3, tostring(slot6))
		end
	end
end

BankGiveCcsView.onBankGiveNameChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getBankGiveName(slot2) or slot1 == "" then
		slot5 = ""

		slot0.txtJsr.setString(slot3, slot0.txtJsr)
	else
		slot5 = "(" .. slot1 .. ")"

		slot0.txtJsr.setString(slot3, slot0.txtJsr)
	end
end

BankGiveCcsView.onUserInsureChanged = function (slot0)
	slot5 = Hero.getUserInsure(slot2)

	slot0.sliderControl.setMaxValue(Hero, slot0.sliderControl)

	slot4 = slot0.txtHld_tf
	slot8 = "#plist_font_yellow_5_%s.png"

	slot0.txtHld_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserInsure(slot2)))
end

BankGiveCcsView.onBankGiveRecordChanged = function (slot0)
	slot3 = Hero
	slot2 = nil

	if Hero.getBankGiveRecord(slot2) and slot1 ~= "" then
		slot5 = slot1
		slot2 = cjson.decode(slot4)
	end

	if slot2 then
		slot5 = slot2

		if table.nums(slot4) > 0 then
			slot0._recordDic = slot2
		end
	else
		slot0._recordDic = nil
	end

	if slot0._recordDic ~= nil then
		slot7 = table.nums(slot4) > 0

		slot0.btnJt.setVisible(slot0._recordDic, slot0.btnJt)

		if not slot3 then
			slot7 = false

			slot0.model.setIsShowGiveRecordView(slot5, slot0.model)
		else
			slot7 = slot0._recordDic

			slot0.listRecord.setDataDic(slot5, slot0.listRecord)
		end
	end
end

BankGiveCcsView.onJsrIdChanged = function (slot0, slot1, slot2)
	if slot1 == "changed" then
		slot5 = slot0.model
		slot8 = slot2

		slot0.model.setBankGiveId(slot4, slot2.getText(slot7))
	end
end

BankGiveCcsView.onSliderValueChanged = function (slot0)
	slot5 = slot0.sliderControl.getSliderValue(slot2)

	slot0.model.setBankGiveMount(slot0.sliderControl, slot0.model)

	slot8 = slot0.sliderControl.getSliderValue(slot2)
	slot5 = "(" .. StringUtil.numberStr2ZhHant(slot7) .. ")"

	slot0.tipsNode.txtTips_tf.setHtmlText(slot0.sliderControl, slot0.tipsNode.txtTips_tf)
end

BankGiveCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnConfirm then
		slot5 = mainMgr

		if not mainMgr.checkBankGiveIsNeedBindMobile(slot4) then
			slot5 = slot0.controller

			slot0.controller.requestGiveVerify(slot4)
		else
			function slot6()
				slot2 = ProxyBank

				ProxyBank.hide(slot1)
			end

			mainMgr.showBindMobileTips(slot4, mainMgr)

			slot6 = NEWBIE_TRIGGER_BANK_GIVE_NEED_BIND_PHONE

			newbieMgr.checkBeginNewbie(slot4, newbieMgr)
		end
	elseif slot1 == slot0.btnCheck then
		slot5 = slot0.controller

		slot0.controller.requestGiveIdCheck(slot4)
	elseif slot1 == slot0.btnJt then
		slot6 = true

		slot0.model.setIsShowGiveRecordView(slot4, slot0.model)
	end
end

BankGiveCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userInsureChangedSignal.remove(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	Hero.bankGiveRecordChangedSignal.remove(slot2, Hero.bankGiveRecordChangedSignal, slot0.onBankGiveRecordChanged)

	slot5 = slot0

	slot0.model.bankGiveNameChangedSignal.remove(slot2, slot0.model.bankGiveNameChangedSignal, slot0.onBankGiveNameChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getGiveSuccessSignal(slot2).remove(slot2, slot0.model.getGiveSuccessSignal(slot2), slot0.onBankGiveSuccess)

	slot5 = slot0

	slot0.model.bankGiveIdChangedSignal.remove(slot2, slot0.model.bankGiveIdChangedSignal, slot0.onBankGiveIdChanged)

	slot5 = slot0

	slot0.sliderControl.sliderValueChangedSignal.remove(slot2, slot0.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0._txtJsrId

	slot0._txtJsrId.destroy(slot2)

	slot3 = slot0.listRecord

	slot0.listRecord.destroy(slot2)

	slot3 = slot0.btnConfirm

	destroySomeObj(slot2)

	slot3 = slot0.btnCheck

	destroySomeObj(slot2)

	slot3 = slot0.btnJt

	destroySomeObj(slot2)

	slot3 = slot0.tipsNode.txtTips_tf

	destroySomeObj(slot2)
end

return
