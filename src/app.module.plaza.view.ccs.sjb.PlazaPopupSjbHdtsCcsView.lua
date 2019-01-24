PlazaPopupSjbHdtsCcsView = class("PlazaPopupSjbHdtsCcsView")

PlazaPopupSjbHdtsCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
end

PlazaPopupSjbHdtsCcsView.show = function (slot0)
	ZoomPopUpChildView.show(slot0)

	if not slot0._spine then
		function slot1()
			slot0._spine = sp.SkeletonAnimation:create("gameres/animation/spine/sjb_hdtc/sjb_hdtc.json", "gameres/animation/spine/sjb_hdtc/sjb_hdtc.atlas")

			slot0._spine:setAnimation(0, "start", false)
			slot0._spine.setAnimation._spine:addAnimation(0, "idle", true)
			slot0._spine.setAnimation._spine.addAnimation.view.spine:addChild(slot0._spine)
		end

		if slot0._delayedCall then
			slot0._delayedCall:destroy()
		end

		slot0._delayedCall = tickMgr:delayedCall(slot1, 200)
	end
end

PlazaPopupSjbHdtsCcsView.hide = function (slot0)
	ZoomPopUpChildView.hide(slot0)

	if slot0._spine then
		slot0._spine:removeFromParent()

		slot0._spine = nil
	end

	if slot0._delayedCall then
		slot0._delayedCall:destroy()

		slot0._delayedCall = nil
	end
end

PlazaPopupSjbHdtsCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowSjbHdts(false)
	popupMgr:pop(POPUP_ID_WORLD_CUP)
end

PlazaPopupSjbHdtsCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowSjbHdts(false)
		popupMgr:pop(POPUP_ID_WORLD_CUP)
	elseif slot1 == slot0.view.btnClick then
		slot0.controller:onSjbEntranceBtnClick()
		slot0.model:setIsShowSjbHdts(false)
	end
end

PlazaPopupSjbHdtsCcsView.destroy = function (slot0)
	slot0._spine:removeFromParent()

	slot0._spine = nil

	destroySomeObj(slot0.view.btnClick)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
