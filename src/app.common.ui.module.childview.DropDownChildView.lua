slot2 = "DropDownChildView"
DropDownChildView = class(slot1)

DropDownChildView.ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot11 = true

	createSetterGetter(slot6, slot0, "isShowing", true, false)

	slot0._bg = slot2
	slot0._dropLayer = slot3
	slot0._view = slot1
	slot7 = slot0._view

	slot0._view.retain(slot6)

	slot7 = slot0._view
	slot0._parent = slot0._view.getParent(slot6)
	slot7 = slot0._dropLayer
	slot0._initScaleX = slot0._dropLayer.getScaleX(slot6)
	slot7 = slot0._dropLayer
	slot0._initScaleY = slot0._dropLayer.getScaleY(slot6)
	slot7 = slot0._dropLayer
	slot0._initX = slot0._dropLayer.getPositionX(slot6)
	slot7 = slot0._dropLayer
	slot0._initY = slot0._dropLayer.getPositionY(slot6)
	slot0._drop2ShowDelay = 0
	slot0._bgAlpha = 0.4
	slot0._bgShowDuration = 0.2
	slot0._dropOffsetY = slot4 or 300
	slot8 = slot0._dropOffsetY + slot0._initY

	slot0._dropLayer.setPositionY(slot6, slot0._dropLayer)

	slot8 = true

	slot0.setTouchEnabled(slot6, slot0)

	slot7 = slot0
	slot11 = slot0.onRootTouchOperation

	slot0.addTouchEventListener(slot6, handler(slot0._initY, slot0))

	slot0._showEvent = nil
	slot0._hideEvent = nil
	slot0._triggerOffsetPos = nil
	slot0._isDestroy = false
	slot10 = slot0

	eventMgr.add(slot6, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)
end

DropDownChildView.onHideAll2Reglogin = function (slot0)
	if not slot0._isDestroy then
		slot4 = true

		slot0.hide(slot2, slot0)
	end
end

DropDownChildView.onShowTweenComplete = function (slot0)
	return
end

DropDownChildView.onHideTweenComplete = function (slot0)
	return
end

DropDownChildView.onRootClick = function (slot0)
	return
end

DropDownChildView.onRootTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0

		slot0.onRootClick(slot4)
	end
end

DropDownChildView.onShow = function (slot0)
	return
end

DropDownChildView.show = function (slot0, slot1, slot2)
	if not slot0._isShowing then
		slot0._isShowing = true

		if slot0._parent then
			slot7 = true

			DisplayUtil.setAddOrRemoveChild(slot4, slot0._view, slot0._parent)
		else
			slot6 = slot0._view

			uiMgr.centerLocate(slot4, uiMgr)

			slot6 = slot0._view

			uiMgr.showView(slot4, uiMgr)

			slot5 = slot0

			slot0.onShow(slot4)
		end

		if slot0._bg then
			slot6 = 0

			slot0._bg.setOpacity(slot4, slot0._bg)

			slot3 = slot0._bgShowDuration

			if slot1 then
				slot3 = 0
			end

			slot8 = {
				autoAlpha = slot0._bgAlpha
			}

			TweenLite.to(slot5, slot0._bg, slot3)
		end

		slot6 = 255

		slot0._dropLayer.setOpacity(slot4, slot0._dropLayer)

		slot3 = 0.3

		if slot1 then
			slot3 = 0
		end

		slot9 = {
			x = slot0._initX,
			y = slot0._initY,
			delay = slot0._drop2ShowDelay,
			ease = Back.easeOut,
			onComplete = function ()
				slot2 = slot0

				slot0.onShowTweenComplete(slot1)

				slot2 = slot1

				applyFunction(slot1)

				slot2 = slot0._showEvent

				if StringUtil.isStringValid(slot1) then
					slot3 = slot0._showEvent

					eventMgr.dispatch(slot1, eventMgr)
				end
			end
		}

		TweenLite.to(slot6, slot0._dropLayer, slot3)
	end
end

DropDownChildView.setIsShowing = function (slot0, slot1, slot2, slot3)
	if slot1 then
		slot8 = slot3

		slot0.show(slot5, slot0, slot2)
	else
		slot8 = slot3

		slot0.hide(slot5, slot0, slot2)
	end
end

DropDownChildView.hide = function (slot0, slot1, slot2)
	if slot0._isShowing then
		slot0._isShowing = false

		if slot0._bg then
			slot3 = 0.2

			if slot1 then
				slot3 = 0
			end

			slot8 = {
				autoAlpha = 0
			}

			TweenLite.to(slot5, slot0._bg, slot3)
		end

		function slot3()
			slot2 = slot0

			slot0.removeFromParent(slot1)

			slot2 = slot0.removeFromParent

			slot0.removeFromParent.onHideTweenComplete(slot1)

			slot2 = slot1

			applyFunction(slot1)

			slot2 = slot0._hideEvent

			if StringUtil.isStringValid(slot1) then
				slot3 = slot0._hideEvent

				eventMgr.dispatch(slot1, eventMgr)
			end
		end

		slot4 = 0.3

		if slot1 then
			slot4 = 0
		end

		slot11 = {
			x = slot0._initX,
			y = slot0._initY + slot0._dropOffsetY,
			onComplete = slot3
		}

		TweenLite.to(slot8, slot0._dropLayer, slot4)

		slot9 = slot0

		slot0.onHide(slot8)
	end
end

DropDownChildView.onHide = function (slot0)
	return
end

DropDownChildView.destroy = function (slot0)
	slot0._isDestroy = true
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	if slot0._view then
		slot3 = slot0._view

		slot0._view.release(slot2)

		slot0._view = nil
	end

	if slot0._dropLayer then
		slot3 = slot0._dropLayer

		TweenLite.killTweensOf(slot2)

		slot0._dropLayer = nil
	end

	if slot0._bg then
		slot3 = slot0._bg

		TweenLite.killTweensOf(slot2)

		slot0._bg = nil
	end

	slot0._parent = nil
end

return
