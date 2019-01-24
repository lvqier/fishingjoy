slot2 = "BankPwCcsView"
BankPwCcsView = class(slot1)

BankPwCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)
end

BankPwCcsView.init = function (slot0)
	slot3 = slot0.txtOldPwd
	slot0._txtOldPwd = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot3 = slot0.txtNewPwd1
	slot0._txtNewPwd1 = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot3 = slot0.txtNewPwd2
	slot0._txtNewPwd2 = CCSUtil.changeUITextFeildWithCcsTextInput(slot2)
	slot4 = cc.EDITBOX_INPUT_FLAG_PASSWORD

	slot0._txtOldPwd.setInputFlag(slot2, slot0._txtOldPwd)

	slot4 = cc.EDITBOX_INPUT_FLAG_PASSWORD

	slot0._txtNewPwd1.setInputFlag(slot2, slot0._txtNewPwd1)

	slot4 = cc.EDITBOX_INPUT_FLAG_PASSWORD

	slot0._txtNewPwd2.setInputFlag(slot2, slot0._txtNewPwd2)

	slot3 = slot0._txtOldPwd
	slot7 = slot0.onPwdChanged

	slot0._txtOldPwd.addEditHandler(slot2, handler(slot5, slot0))

	slot3 = slot0._txtNewPwd1
	slot7 = slot0.onPwdChanged

	slot0._txtNewPwd1.addEditHandler(slot2, handler(slot5, slot0))

	slot3 = slot0._txtNewPwd2
	slot7 = slot0.onPwdChanged

	slot0._txtNewPwd2.addEditHandler(slot2, handler(slot5, slot0))
end

BankPwCcsView.initSignal = function (slot0)
	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getPwdChangedSignal(slot2).add(slot2, slot0.model.getPwdChangedSignal(slot2), slot0.onPwdChangedFinish)
end

BankPwCcsView.onShow = function (slot0)
	slot3 = slot0._txtOldPwd

	slot0._txtOldPwd.show(slot2)

	slot3 = slot0._txtNewPwd1

	slot0._txtNewPwd1.show(slot2)

	slot3 = slot0._txtNewPwd2

	slot0._txtNewPwd2.show(slot2)
end

BankPwCcsView.onHide = function (slot0)
	slot3 = slot0._txtOldPwd

	slot0._txtOldPwd.hide(slot2)

	slot3 = slot0._txtNewPwd1

	slot0._txtNewPwd1.hide(slot2)

	slot3 = slot0._txtNewPwd2

	slot0._txtNewPwd2.hide(slot2)
end

BankPwCcsView.onPwdChangedFinish = function (slot0)
	slot4 = ""

	slot0._txtOldPwd.setText(slot2, slot0._txtOldPwd)

	slot4 = ""

	slot0._txtNewPwd1.setText(slot2, slot0._txtNewPwd1)

	slot4 = ""

	slot0._txtNewPwd2.setText(slot2, slot0._txtNewPwd2)
end

BankPwCcsView.onPwdChanged = function (slot0, slot1, slot2)
	if slot1 == "changed" then
		slot5 = slot2
		slot3 = slot2.getText(slot4)

		if slot2 == slot0._txtOldPwd._editBox then
			slot7 = slot3

			slot0.model.setOldPwd(slot5, slot0.model)
		elseif slot2 == slot0._txtNewPwd1._editBox then
			slot7 = slot3

			slot0.model.setNewPwd1(slot5, slot0.model)
		elseif slot2 == slot0._txtNewPwd2._editBox then
			slot7 = slot3

			slot0.model.setNewPwd2(slot5, slot0.model)
		end
	end
end

BankPwCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnConfirm then
		slot5 = slot0.controller

		slot0.controller.requestChangePw(slot4)
	end
end

BankPwCcsView.destroy = function (slot0)
	slot3 = slot0.model
	slot5 = slot0

	slot0.model.getPwdChangedSignal(slot2).remove(slot2, slot0.model.getPwdChangedSignal(slot2), slot0.onPwdChangedFinish)

	slot3 = slot0._txtOldPwd

	slot0._txtOldPwd.destroy(slot2)

	slot3 = slot0._txtNewPwd1

	slot0._txtNewPwd1.destroy(slot2)

	slot3 = slot0._txtNewPwd2

	slot0._txtNewPwd2.destroy(slot2)

	slot3 = slot0.btnConfirm

	destroySomeObj(slot2)
end

return
