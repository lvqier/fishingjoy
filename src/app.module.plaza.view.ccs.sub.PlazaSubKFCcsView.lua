PlazaSubKFCcsView = class("PlazaSubKFCcsView")

PlazaSubKFCcsView.onCreationComplete = function (slot0)
	mainMgr:setIsShowing4Platform(slot0.layerTabs.btnOnlineKF, "tip850Online", true)

	slot0._titleSpine = sp.SkeletonAnimation:create(slot2, slot3)

	slot0._titleSpine:setTimeScale(2.2)
	slot0._titleSpine:setPositionY(-10)
	slot0.layerTitle:addChild(slot0._titleSpine)
	slot0.layerTitle.txtKFzx:setLocalZOrder(1)

	slot0.layerTitle._orgY = slot0.layerTitle:getPositionY()

	DisplayUtil.setVisible(slot0.layerTitle, false)
	ClassUtil.extends(slot0, BasePlazaSubView, true, {
		{
			btn = slot0.layerTabs.btnQnA
		},
		{
			btn = slot0.layerTabs.btnOnlineKF
		},
		{
			btn = slot0.layerTabs.btnWx
		}
	})
end

PlazaSubKFCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTabs.btnQnA then
		slot0.model:setIsShowingKfQnA(true)
		trackMgr:recordTracks(TRACK_KEFU_CKCJWT)
	elseif slot1 == slot0.layerTabs.btnOnlineKF then
		slot0.model:setIsShowingKfQQ(true)
	elseif slot1 == slot0.layerTabs.btnWx then
		slot0.controller:showWechatGuanZhu()
	else
		BasePlazaSubView.onBtnClick(slot0, slot1, slot2)
	end
end

PlazaSubKFCcsView.show = function (slot0, slot1, slot2, slot3)
	slot0._titleSpine:clearTracks()
	slot0._titleSpine:setAnimation(0, "start", false)
	slot0._titleSpine:addAnimation(0, "idle", true)
	TweenLite.to(slot0.layerTitle, 0.2, {
		autoAlpha = 1,
		y = slot0.layerTitle._orgY,
		onComplete = onTitleShowComplete
	})
	BasePlazaSubView.show(slot0, slot1, slot2, slot3)
end

PlazaSubKFCcsView.hide = function (slot0, slot1, slot2, slot3, slot4)
	slot0._titleSpine:clearTracks()
	TweenLite.to(slot0.layerTitle, 0.2, {
		autoAlpha = 0,
		y = slot0.layerTitle._orgY + 50
	})
	BasePlazaSubView.hide(slot0, slot1, slot2, slot3, slot4)
end

return
