AccountPwModifyCcsView = class("AccountPwModifyCcsView")

AccountPwModifyCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._inputOldPw = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputOldPw)
	slot0._inputNewPw1 = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputNewPw1)
	slot0._inputNewPw2 = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.view.layerContent.inputNewPw2)

	slot0._inputOldPw:setInputFlag(0)
	slot0._inputNewPw1:setInputFlag(0)
	slot0._inputNewPw2:setInputFlag(0)
	slot0.model:getResetPwSignal():add(slot0.onResetPw, slot0)
end

AccountPwModifyCcsView.onResetPw = function (slot0)
	slot0._inputOldPw:setText("")
	slot0._inputNewPw1:setText("")
	slot0._inputNewPw2:setText("")
end

AccountPwModifyCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingPwModify(false)
end

AccountPwModifyCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0._inputOldPw:show()
	slot0._inputNewPw1:show()
	slot0._inputNewPw2:show()
end

AccountPwModifyCcsView.hide = function (slot0, slot1, slot2)
	slot0._inputOldPw:hide()
	slot0._inputNewPw1:hide()
	slot0._inputNewPw2:hide()
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

AccountPwModifyCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingPwModify(false)
	elseif slot1 == slot0.view.btnConfirm then
		slot0.controller:try2ChangePw(slot0._inputOldPw:getText(), slot0._inputNewPw1:getText(), slot0._inputNewPw2:getText())
	end
end

AccountPwModifyCcsView.destroy = function (slot0)
	slot0.model:getResetPwSignal():remove(slot0.onResetPw, slot0)
	destroySomeObj(slot0.btnClose)
	destroySomeObj(slot0.btnConfirm)
	destroySomeObj(slot0._inputOldPw)
	destroySomeObj(slot0._inputNewPw1)
	destroySomeObj(slot0._inputNewPw2)
	ZoomPopUpChildView.destroy(slot0)
end

return
