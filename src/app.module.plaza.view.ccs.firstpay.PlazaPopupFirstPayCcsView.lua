PlazaPopupFirstPayCcsView = class("PlazaPopupFirstPayCcsView")

PlazaPopupFirstPayCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
end

PlazaPopupFirstPayCcsView.show = function (slot0)
	slot1 = Hero:getFirstPayPrice() or 0
	slot2 = Hero:getFirstPayScore() or 0

	slot0.view.content.content_tf:setHtmlText(slot3)
	TweenLite.from(slot0.view.content, 0.25, {
		delay = 0.1,
		x = -150,
		ease = Sine.easeOut
	})

	if not slot0._spine then
		slot0._spine = sp.SkeletonAnimation:create("gameres/animation/spine/zsb_scth/zsb_scth.json", "gameres/animation/spine/zsb_scth/zsb_scth.atlas")

		slot0._spine:setAnimation(0, "start", false)
		slot0._spine:addAnimation(0, "idle", true)
		slot0.view.spine:addChild(slot0._spine)
	end

	ZoomPopUpChildView.show(slot0)
end

PlazaPopupFirstPayCcsView.hide = function (slot0)
	ZoomPopUpChildView.hide(slot0)

	if slot0._spine then
		slot0._spine:removeFromParent()

		slot0._spine = nil
	end
end

PlazaPopupFirstPayCcsView.onRootClick = function (slot0)
	return
end

PlazaPopupFirstPayCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingFirstPay(false)
	elseif slot1 == slot0.view.btnClick then
		requireModule("ChargeModule")
		ProxyCharge:show(nil, nil, CHARGE_ORDER_TYPE_FIRST_PAY, Hero:getFirstPayPrice())
		slot0.model:setIsShowingFirstPay(false)
	end
end

PlazaPopupFirstPayCcsView.destroy = function (slot0)
	if slot0._spine then
		slot0._spine:removeFromParent()

		slot0._spine = nil
	end

	destroySomeObj(slot0.view.content.content_tf)
	destroySomeObj(slot0.view.btnClick)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
