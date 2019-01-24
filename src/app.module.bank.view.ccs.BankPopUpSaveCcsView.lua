slot2 = "BankPopUpSaveCcsView"
BankPopUpSaveCcsView = class(slot1)

BankPopUpSaveCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onUserInsureChanged(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.onSliderValueChanged(slot2)

	slot4 = "可存款金额为0"

	slot0.view.sliderControl.setErrorMsg(slot2, slot0.view.sliderControl)
end

BankPopUpSaveCcsView.initSignal = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.add(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	slot0.view.sliderControl.sliderValueChangedSignal.add(slot2, slot0.view.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getSaveSuccessSignal(slot2).add(slot2, slot0.model.getSaveSuccessSignal(slot2), slot0.onSaveSuccess)
end

BankPopUpSaveCcsView.onSliderValueChanged = function (slot0, slot1)
	slot2 = slot0.view.sliderControl.getSliderValue(slot3)
	slot6 = slot2

	slot0.model.setBankSaveMount(slot0.view.sliderControl, slot0.model)

	slot9 = slot2
	slot6 = "(" .. StringUtil.numberStr2ZhHant(slot8) .. ")"

	slot0.view.txtDX.setString(slot0.view.sliderControl, slot0.view.txtDX)

	slot7 = (slot2 and slot2 > 0 and {
		true
	}) or {
		false
	}[1]

	slot0.view.sliderControl.btnClear.setVisible(slot5, slot0.view.sliderControl.btnClear)
end

BankPopUpSaveCcsView.onUserInsureChanged = function (slot0)
	slot4 = slot0.view.txtYuEr_tf
	slot8 = "#plist_font_yellow_3_%s.png"

	slot0.view.txtYuEr_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserInsure(slot2)))
end

BankPopUpSaveCcsView.onUserScoreChanged = function (slot0)
	slot4 = slot0.view.txtDou_tf
	slot8 = "#plist_font_yellow_5_%s.png"

	slot0.view.txtDou_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserScore(slot2)))

	slot5 = Hero.getUserScore(slot2)

	slot0.view.sliderControl.setMaxValue(Hero, slot0.view.sliderControl)
end

BankPopUpSaveCcsView.onSaveSuccess = function (slot0)
	slot4 = 0

	slot0.view.sliderControl.setSliderValue(slot2, slot0.view.sliderControl)

	slot3 = slot0.view.sliderControl
	slot6 = Hero

	slot0.view.sliderControl.setMaxValue(slot2, Hero.getUserScore(slot5))
end

BankPopUpSaveCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBankSave(slot4, slot0.model)
	elseif slot1 == slot0.view.btnConfirm then
		slot5 = slot0.controller

		slot0.controller.requestSaveInsure(slot4)
	end
end

BankPopUpSaveCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.remove(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	slot0.view.sliderControl.sliderValueChangedSignal.remove(slot2, slot0.view.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getSaveSuccessSignal(slot2).remove(slot2, slot0.model.getSaveSuccessSignal(slot2), slot0.onSaveSuccess)

	slot3 = slot0.view.sliderControl

	slot0.view.sliderControl.destroy(slot2)

	slot3 = slot0.view.btnClose

	slot0.view.btnClose.destroy(slot2)

	slot3 = slot0.view.btnConfirm

	slot0.view.btnConfirm.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
