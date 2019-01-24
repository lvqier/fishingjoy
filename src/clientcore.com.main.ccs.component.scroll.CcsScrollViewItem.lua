CcsScrollViewItem = class("CcsScrollViewItem")

CcsScrollViewItem.ctor = function (slot0)
	slot0:getInteractiveObject():setTouchEnabled(false)
	createSetterGetter(slot0, "scrollViewParent", nil, nil, nil, nil, nil, handler(slot0, slot0.onScrollViewParentChanged))
	createSetterGetter(slot0, "isTouchPushDown", false, false, true)
	slot0:retain()
end

CcsScrollViewItem.handleScrollBtns = function (slot0, slot1)
	return
end

CcsScrollViewItem.onScrollViewParentChanged = function (slot0)
	return
end

CcsScrollViewItem.getItemSize = function (slot0)
	return slot0:getContentSize()
end

CcsScrollViewItem.getInteractiveObject = function (slot0)
	return slot0
end

CcsScrollViewItem.getPushZoomView = function (slot0)
	return slot0.view or slot0
end

CcsScrollViewItem.checkTouchInMe = function (slot0, slot1)
	slot2 = slot0:getInteractiveObject()

	return slot1 and slot2:isEnabled() and slot2:hitTest(slot1, nil, nil) and slot2:isClippingParentContainsPoint(slot1)
end

CcsScrollViewItem.onLongClick = function (slot0, slot1)
	return
end

CcsScrollViewItem.playClickSoundEffect = function (slot0)
	audioMgr:playDefaultBtnClickSound()
end

CcsScrollViewItem.onClick = function (slot0, slot1)
	return
end

CcsScrollViewItem.onPushDownChanged = function (slot0, slot1, slot2, slot3)
	if slot1 then
		if slot2 then
			TweenLite.to(slot1, 0.1, {
				scale = 0.98
			})
		else
			TweenLite.to(slot1, 0.1, {
				scale = 1
			})
		end
	end
end

CcsScrollViewItem.setIsTouchPushDown = function (slot0, slot1, slot2)
	if slot0._isTouchPushDown ~= slot1 then
		slot0._isTouchPushDown = slot1

		slot0:onPushDownChanged(slot0:getPushZoomView(), slot1, slot2)
	end
end

CcsScrollViewItem.onTouchEvent = function (slot0, slot1, slot2)
	return
end

CcsScrollViewItem.canPlayClickSound = function (slot0, slot1)
	return slot0:isVisible()
end

CcsScrollViewItem.getEndGap = function (slot0)
	return 0
end

CcsScrollViewItem.getBeginGap = function (slot0)
	return 0
end

CcsScrollViewItem.destroy = function (slot0)
	if slot0._scrollViewParent then
		slot0._scrollViewParent:removeContentChild(slot0)

		slot0._scrollViewParent = nil
	end

	slot0:release()
end

return
