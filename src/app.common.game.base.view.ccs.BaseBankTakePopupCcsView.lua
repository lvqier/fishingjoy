slot2 = "BaseBankTakePopupCcsView"
BaseBankTakePopupCcsView = class(slot1)

BaseBankTakePopupCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onSliderValueChanged(slot2)

	slot3 = slot0

	slot0.onUserInsureChanged(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)
end

BaseBankTakePopupCcsView.onRootClick = function (slot0)
	return
end

BaseBankTakePopupCcsView.init = function (slot0)
	slot0._takeMount = 0
	slot0._pwdStr = ""
	slot3 = slot0.view.txtPwd
	slot0._inputPwd = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = cc.EDITBOX_INPUT_FLAG_PASSWORD

	slot0._inputPwd.setInputFlag(slot2, slot0._inputPwd)

	slot4 = "请输入取款密码，默认888888"

	slot0._inputPwd.setPlaceHolder(slot2, slot0._inputPwd)
end

BaseBankTakePopupCcsView.onZoomShowTweenComplete = function (slot0)
	slot3 = slot0._inputPwd

	slot0._inputPwd.show(slot2)
end

BaseBankTakePopupCcsView.show = function (slot0, slot1, slot2)
	slot5 = mainMgr

	mainMgr.requestUserInfo(slot4)

	slot7 = slot2

	ZoomPopUpChildView.show(slot4, slot0, slot1)

	slot7 = slot0

	Hero.userScoreChangedSignal.add(slot4, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	slot0.onUserScoreChanged(slot4)
end

BaseBankTakePopupCcsView.hide = function (slot0, slot1, slot2)
	slot7 = slot0

	Hero.userScoreChangedSignal.remove(slot4, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0._inputPwd

	slot0._inputPwd.hide(slot4)

	slot7 = slot2

	ZoomPopUpChildView.hide(slot4, slot0, slot1)
end

BaseBankTakePopupCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.view.sliderControl.sliderValueChangedSignal.add(slot2, slot0.view.sliderControl.sliderValueChangedSignal, slot0.onSliderValueChanged)
	Hero.userInsureChangedSignal.add(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot3 = slot0._inputPwd
	slot7 = slot0.onTxtPwdChanged

	slot0._inputPwd.addEditHandler(slot2, handler(slot0, slot0))
end

BaseBankTakePopupCcsView.onSliderValueChanged = function (slot0)
	slot3 = slot0.view.sliderControl
	slot0._takeMount = slot0.view.sliderControl.getSliderValue(slot2)

	if slot0.view.txtHantRmb then
		slot3 = slot0.view.txtHantRmb
		slot6 = slot0._takeMount

		slot0.view.txtHantRmb.setString(slot2, StringUtil.numberStr2ZhHant(slot5))

		if slot0.view.sliderControl.btnClear then
			slot5 = (slot0._takeMount and slot0._takeMount > 0 and {
				true
			}) or {
				false
			}[1]

			slot0.view.sliderControl.btnClear.setVisible(slot3, slot0.view.sliderControl.btnClear)
		end
	end
end

BaseBankTakePopupCcsView.onTxtPwdChanged = function (slot0, slot1, slot2)
	if slot1 == "changed" then
		slot5 = slot2
		slot0._pwdStr = slot2.getText(slot4)
	end
end

BaseBankTakePopupCcsView.onUserInsureChanged = function (slot0)
	slot5 = Hero.getUserInsure(slot2)

	slot0.view.sliderControl.setMaxValue(Hero, slot0.view.sliderControl)

	slot4 = slot0.view.txtDeposit
	slot7 = Hero.getUserInsure(slot2)

	slot0.view.txtDeposit.setString(Hero, StringUtil.numberStr2FormatNumberStr(slot6))
end

BaseBankTakePopupCcsView.onUserScoreChanged = function (slot0)
	slot4 = slot0.view.txtCash
	slot7 = Hero.getUserScore(slot2)

	slot0.view.txtCash.setString(Hero, StringUtil.numberStr2FormatNumberStr(slot6))
end

BaseBankTakePopupCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBank(slot4, slot0.model)
	elseif slot1 == slot0.view.btnQk then
		slot6 = slot0._pwdStr

		if not gmMgr.checkGmCommand(slot4, gmMgr) then
			slot6 = SOCKET_TYPE_ROOM

			if socketMgr.isConnected(slot4, socketMgr) then
				slot7 = slot0._takeMount

				slot0.controller.requestTakeInsure(slot4, slot0.controller, slot0._pwdStr)
			else
				slot7 = slot0._takeMount

				slot0.controller.requestTakeLoadInsure(slot4, slot0.controller, slot0._pwdStr)
			end

			slot6 = ""

			slot0._inputPwd.setText(slot4, slot0._inputPwd)

			slot6 = 0

			slot0.view.sliderControl.setSliderValue(slot4, slot0.view.sliderControl)
		end
	end
end

BaseBankTakePopupCcsView.destroy = function (slot0)
	slot5 = slot0

	Hero.userInsureChangedSignal.remove(slot2, Hero.userInsureChangedSignal, slot0.onUserInsureChanged)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnQk

	destroySomeObj(slot2)

	slot3 = slot0.view.sliderControl

	slot0.view.sliderControl.destroy(slot2)

	slot3 = slot0._inputPwd

	slot0._inputPwd.destroy(slot2)

	slot0._inputPwd = nil
	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
