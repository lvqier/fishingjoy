LoginGuestCcsView = class("LoginGuestCcsView")

LoginGuestCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._verifySprite = nil

	slot0.view.layerVerify.char1.root:setIndex(1)
	slot0.view.layerVerify.char2.root:setIndex(2)
	slot0.view.layerVerify.char3.root:setIndex(3)
	slot0.view.layerVerify.char4.root:setIndex(4)
	slot0.model.verifyVoChangedSignal:add(slot0.onVerifyVoChanged, slot0)
	slot0.model.selectedVerifyDicsChangedSignal:add(slot0.onSelectedVerifyChanged, slot0)
	slot0.model.guestVerifyStateChangedSignal:add(slot0.onGuestVerifyStateChanged, slot0)
	slot0.view.layerVerify.btnConfirm:getClickWhenCantTouchSignal():add(slot0.onBtnClick, slot0)
	slot0:onVerifyVoChanged()
	slot0:onSelectedVerifyChanged()
	slot0:onGuestVerifyStateChanged()
end

LoginGuestCcsView.onGuestVerifyStateChanged = function (slot0)
	TweenLite.killTweensOf(slot0.view.layerVerify)
	DisplayUtil.setVisible(slot0.view.layerVerify, false)

	if slot0.model:getGuestVerifyState() == 0 then
		TweenLite.to(slot0.view.layerVerify, 0.05, {
			autoAlpha = 1
		})
	end

	DisplayUtil.setVisible(slot0.view.layerInfo, slot1 ~= 0)

	if slot1 == 1 then
		slot0.view.layerInfo.txtInfo_tf:setText("正在获取验证码...")
	elseif slot1 == 2 then
		slot0.view.layerInfo.txtInfo_tf:setText("获取验证码失败，请刷新")
	end

	slot0.view.layerInfo.btnRefresh:setCanTouch(slot1 == 2)
end

LoginGuestCcsView.onSelectedVerifyChanged = function (slot0)
	slot0.view.layerVerify.btnConfirm:setCanTouch(table.nums(slot1) >= 2)
end

LoginGuestCcsView.onVerifyVoChanged = function (slot0)
	if slot0._verifySprite then
		slot0._verifySprite:removeFromParent()

		slot0._verifySprite = nil
	end

	if slot0.model:getVerifyVo() ~= nil and StringUtil.isStringValid(slot1.chooseText) then
		slot0.view.layerVerify.txtInfo_tf:setHtmlText(slot4)

		slot5 = lua_utils_createSpriteFromBase64(slot1.image)

		slot5:setScale(1.09)
		slot5:setPosition(673, 356)
		slot0.view.layerVerify:addChild(slot5)

		slot0._verifySprite = slot5
	end
end

LoginGuestCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsAccountGuestShowing(false)
	elseif slot1 == slot0.view.layerVerify.btnConfirm then
		slot0.controller:requestLoginGuest()
	end
end

LoginGuestCcsView.destroy = function (slot0)
	slot0.model.verifyVoChangedSignal:remove(slot0.onVerifyVoChanged, slot0)
	slot0.model.selectedVerifyDicsChangedSignal:remove(slot0.onSelectedVerifyChanged, slot0)
	slot0.model.guestVerifyStateChangedSignal:remove(slot0.onGuestVerifyStateChanged, slot0)
	slot0.view.layerVerify.char1.root:destroy()
	slot0.view.layerVerify.char2.root:destroy()
	slot0.view.layerVerify.char3.root:destroy()
	slot0.view.layerVerify.char4.root:destroy()
	TweenLite.killTweensOf(slot0.view.layerVerify)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.layerVerify.btnConfirm)
	slot0.view.layerVerify.txtInfo_tf:destroy()
	slot0.view.layerInfo.txtInfo_tf:destroy()
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.layerVerify.btnConfirm)
	ZoomPopUpChildView.destroy(slot0)
end

return
