slot2 = "BankPopUpGetCcsView"
BankPopUpGetCcsView = class(slot1)

BankPopUpGetCcsView.onCreationComplete = function (slot0)
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
end

BankPopUpGetCcsView.initSignal = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.add(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	slot0.view.sliderControl.sliderValueChangedSignal.add(slot2, slot0.view.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getGetSuccessSignal(slot2).add(slot2, slot0.model.getGetSuccessSignal(slot2), slot0.onGetSuccess)
end

BankPopUpGetCcsView.onGetSuccess = function (slot0)
	slot4 = 0

	slot0.view.sliderControl.setSliderValue(slot2, slot0.view.sliderControl)

	slot3 = slot0.view.sliderControl
	slot6 = Hero

	slot0.view.sliderControl.setMaxValue(slot2, Hero.getUserInsure(slot5))

	slot3 = gameMgr.backupsChangedSignal

	gameMgr.backupsChangedSignal.emit(slot2)
end

BankPopUpGetCcsView.onSliderValueChanged = function (slot0)
	slot1 = slot0.view.sliderControl.getSliderValue(slot2)
	slot5 = slot1

	slot0.model.setBankGetMount(slot0.view.sliderControl, slot0.model)

	slot8 = slot1
	slot5 = "(" .. StringUtil.numberStr2ZhHant(slot7) .. ")"

	slot0.view.txtDX.setString(slot0.view.sliderControl, slot0.view.txtDX)

	slot6 = (slot1 and slot1 > 0 and {
		true
	}) or {
		false
	}[1]

	slot0.view.sliderControl.btnClear.setVisible(slot4, slot0.view.sliderControl.btnClear)
end

BankPopUpGetCcsView.onUserInsureChanged = function (slot0)
	slot4 = slot0.view.txtYuEr_tf
	slot8 = "#plist_font_yellow_3_%s.png"

	slot0.view.txtYuEr_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserInsure(slot2)))

	slot5 = Hero.getUserInsure(slot2)

	slot0.view.sliderControl.setMaxValue(Hero, slot0.view.sliderControl)
end

BankPopUpGetCcsView.onUserScoreChanged = function (slot0)
	slot4 = slot0.view.txtDou_tf
	slot8 = "#plist_font_yellow_5_%s.png"

	slot0.view.txtDou_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserScore(slot2)))
end

BankPopUpGetCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBankGet(slot4, slot0.model)
	elseif slot1 == slot0.view.btnConfirm then
		slot5 = slot0.controller

		slot0.controller.requestGetInsure(slot4)
	end
end

BankPopUpGetCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.remove(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	slot0.view.sliderControl.sliderValueChangedSignal.remove(slot2, slot0.view.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)

	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getGetSuccessSignal(slot2).remove(slot2, slot0.model.getGetSuccessSignal(slot2), slot0.onGetSuccess)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnConfirm

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
