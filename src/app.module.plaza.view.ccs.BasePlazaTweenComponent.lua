BasePlazaTweenComponent = class("BasePlazaTweenComponent")

BasePlazaTweenComponent.ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot0._toPos = DisplayUtil.ccpCopy(slot0:getPosition())
	slot0._fromPos = cc.p(slot1 or 0, slot2 or 0)

	createSetterGetter(slot0, "parentView", slot0:getParent())

	slot0._showTweenDurationS = slot3 or 0.3
	slot0._hideTweenDurationS = slot4 or 0.3
	slot0._onShowCompleteCallback = nil
	slot0._onHideCompleteCallback = nil
	slot0._onHide2SwitchCallback = nil
	slot0._isShowing = true

	slot0:retain()
	slot0:hide(nil, 0)
end

BasePlazaTweenComponent.doHide = function (slot0, slot1, slot2)
	if slot1 <= 0 then
		slot0:setPosition(slot0._fromPos)
		slot0:onHideComplete()

		return nil
	else
		return TweenLite.to(slot0, slot1, {
			x = slot0._fromPos.x,
			y = slot0._fromPos.y,
			onComplete = handler(slot0, slot0.onHideComplete),
			delay = slot2
		})
	end
end

BasePlazaTweenComponent.doShow = function (slot0, slot1, slot2)
	if slot1 <= 0 then
		slot0:setPosition(slot0._toPos)
		slot0:onShowComplete()
	else
		TweenLite.to(slot0, slot1, {
			x = slot0._toPos.x,
			y = slot0._toPos.y,
			onComplete = handler(slot0, slot0.onShowComplete),
			delay = slot2,
			ease = CustomEase.byName("myShakeEase1")
		})
	end
end

BasePlazaTweenComponent.isShowing = function (slot0)
	return slot0._isShowing
end

BasePlazaTweenComponent.show = function (slot0, slot1, slot2, slot3)
	if not slot0._isShowing then
		slot0._isShowing = true

		TweenLite.killTweensOf(slot0)
		DisplayUtil.setAddOrRemoveChild(slot0, slot0._parentView, true)

		slot0._onShowCompleteCallback = slot1

		DisplayUtil.setVisible(slot0, true)
		slot0:doShow(slot2 or slot0._showTweenDurationS, slot3)
	else
		applyFunction(slot1)
	end
end

BasePlazaTweenComponent.hide = function (slot0, slot1, slot2, slot3, slot4)
	if slot0._isShowing then
		slot0._isShowing = false

		TweenLite.killTweensOf(slot0)

		slot0._onHideCompleteCallback = slot1
		slot0._onHide2SwitchCallback = slot4

		return slot0:doHide(slot2 or slot0._hideTweenDurationS, slot3)
	else
		applyFunction(slot1)

		return nil
	end
end

BasePlazaTweenComponent.onShowComplete = function (slot0)
	applyFunction(slot0._onShowCompleteCallback)

	slot0._onShowCompleteCallback = nil
end

BasePlazaTweenComponent.onHide2Switch = function (slot0)
	applyFunction(slot0._onHide2SwitchCallback)

	slot0._onHide2SwitchCallback = nil
end

BasePlazaTweenComponent.onHideComplete = function (slot0)
	DisplayUtil.setVisible(slot0, false)
	slot0:removeFromParent()
	slot0:onHide2Switch()
	applyFunction(slot0._onHideCompleteCallback)

	slot0._onHideCompleteCallback = nil
end

BasePlazaTweenComponent.destroy = function (slot0)
	slot0._onShowCompleteCallback = nil
	slot0._onHideCompleteCallback = nil
	slot0._onHide2SwitchCallback = nil

	TweenLite.killTweensOf(slot0)
	slot0:release()
end

return
