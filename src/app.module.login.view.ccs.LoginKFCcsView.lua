LoginKFCcsView = class("LoginKFCcsView")

LoginKFCcsView.onCreationComplete = function (slot0)
	slot0._titleSpine = sp.SkeletonAnimation:create(slot1, slot2)

	slot0._titleSpine:setTimeScale(2.2)
	slot0._titleSpine:setPositionY(-10)
	slot0.layerTitle:addChild(slot0._titleSpine)
	slot0.layerTitle.txtKFzx:setLocalZOrder(1)

	slot0.layerTitle._orgY = slot0.layerTitle:getPositionY()

	DisplayUtil.setVisible(slot0.layerTitle, false)
	slot0.layerTitle:setPositionY(slot0.layerTitle._orgY + 50)

	slot0._tabs = {
		slot0.layerTabs.btnQnA,
		slot0.layerTabs.btnOnlineKF
	}

	for slot6, slot7 in ipairs(slot0._tabs) do
		slot7.__orgX = slot7:getPositionX()
		slot7.__hideX = slot7.__orgX + 200

		slot7:setPositionX(slot7.__hideX)
		DisplayUtil.setVisible(slot7, false)
	end
end

LoginKFCcsView._onTabChangedShow = function (slot0, slot1)
	DisplayUtil.setAddOrRemoveChild(slot0, slot1, true)
end

LoginKFCcsView._onTabChangedHide = function (slot0, slot1, slot2)
	slot0._try2Put2PoolFuc = slot2
end

LoginKFCcsView.onShow = function (slot0)
	slot0._titleSpine:clearTracks()
	slot0._titleSpine:setAnimation(0, "start", false)
	slot0._titleSpine:addAnimation(0, "idle", true)
	TweenLite.to(slot0.layerTitle, 0.2, {
		autoAlpha = 1,
		y = slot0.layerTitle._orgY,
		onComplete = onTitleShowComplete
	})

	for slot4, slot5 in ipairs(slot0._tabs) do
		TweenLite.to(slot5, 0.2, {
			autoAlpha = 1,
			x = slot5.__orgX
		})
	end
end

LoginKFCcsView.onHide = function (slot0)
	slot0._titleSpine:clearTracks()

	slot0._isHiding = true

	TweenLite.to(slot0.layerTitle, 0.2, {
		autoAlpha = 0,
		y = slot0.layerTitle._orgY + 50,
		onComplete = function ()
			applyFunction(slot0._try2Put2PoolFuc)

			applyFunction._try2Put2PoolFuc = nil
			applyFunction._isHiding = false
		end
	})

	for slot5, slot6 in ipairs(slot0._tabs) do
		TweenLite.to(slot6, 0.2, {
			autoAlpha = 0,
			x = slot6.__hideX
		})
	end
end

LoginKFCcsView.onBtnClick = function (slot0, slot1)
	if slot0._isHiding then
		return
	end

	if slot1 == slot0.layerTop.btnBack then
		slot0.model:setIsKfShowing(false)
	elseif slot1 == slot0.layerTabs.btnQnA then
		slot0.model:setIsShowingKfQnA(true)
	elseif slot1 == slot0.layerTabs.btnOnlineKF then
		slot0.model:setIsKfQQShowing(true)
	end
end

LoginKFCcsView.destroy = function (slot0)
	destroySomeObj(slot0.layerTop.btnBack)
	destroySomeObj(slot0.layerTabs.btnQnA)
	destroySomeObj(slot0.layerTabs.btnOnlineKF)
end

return
