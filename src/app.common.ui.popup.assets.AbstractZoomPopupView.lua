slot2 = "AbstractZoomPopupView"
AbstractZoomPopupView = class(slot1)

AbstractZoomPopupView.ctor = function (slot0, slot1)
	slot7 = slot1

	ClassUtil.extends(slot3, slot0, AbstractPopupView, true)

	slot6 = true

	createSetterGetter(slot3, slot0, "canHide")

	slot0._zorder = ZORDER_NORMAL_POPUP
	slot0._isMeShowing = nil
	slot0._isZoom2PopUp = true
	slot0._isTween2Show = true
	slot0._bgAlpha = 0.5
	slot4 = slot0._rootView.view
	slot0._viewLayoutX = slot0._rootView.view.getPositionX(slot3)
	slot4 = slot0._rootView.view
	slot0._viewLayoutY = slot0._rootView.view.getPositionY(slot3)
end

AbstractZoomPopupView.isShowing = function (slot0)
	if not slot0._isMeShowing then
		slot3 = slot0
		slot1 = AbstractPopupView.isShowing(slot2)
	end

	return slot1
end

AbstractZoomPopupView.show = function (slot0, slot1)
	if not slot0._isMeShowing then
		slot1 = slot1 or 0
		slot0._isMeShowing = true
		slot4 = slot0

		AbstractPopupView.show(slot3)

		slot4 = slot0

		slot0.onShowBegin(slot3)

		if slot0._isTween2Show then
			slot5 = 0

			slot0._rootView.bg.setOpacity(slot3, slot0._rootView.bg)

			slot5 = 0

			slot0._rootView.view.setOpacity(slot3, slot0._rootView.view)

			if slot0._isZoom2PopUp then
			end

			slot4 = slot0._rootView.bg

			TweenLite.killTweensOf(slot3)

			slot4 = slot0._rootView.view

			TweenLite.killTweensOf(slot3)

			slot6 = slot0._viewLayoutY + slot1

			slot0._rootView.view.setPosition(slot3, slot0._rootView.view, slot0._viewLayoutX)

			slot6 = {
				delay = 0.1,
				alpha = slot0._bgAlpha
			}

			TweenLite.to(slot3, slot0._rootView.bg, 0.3)

			if slot0._isZoom2PopUp then
				slot5 = true

				DisplayUtil.setVisible(slot3, slot0._rootView.view)

				slot4 = {
					onComplete = slot5
				}
				slot5 = handler(slot6, slot0)
				slot2 = TimelineLite.new(slot3)
				slot6 = slot2
				slot11 = {
					scaleX = 1 * 1.1,
					scaleY = 1 * 1.1
				}

				slot2.append(slot5, TweenLite.to(slot0.onShowComplete, slot0._rootView.view, 0.11))

				slot6 = slot2
				slot11 = {
					scaleY = 1,
					scaleX = 1
				}

				slot2.append(slot5, TweenLite.to(slot0.onShowComplete, slot0._rootView.view, 0.11))
			else
				slot6 = {
					alpha = 1,
					onComplete = handler(slot8, slot0)
				}
				slot10 = slot0.onShowComplete

				TweenLite.to(slot3, slot0._rootView.view, 0.3)
			end
		else
			slot5 = 255 * slot0._bgAlpha

			slot0._rootView.bg.setOpacity(slot3, slot0._rootView.bg)

			slot4 = slot0

			slot0.onShowComplete(slot3)
		end
	end
end

AbstractZoomPopupView.onShowComplete = function (slot0)
	return
end

AbstractZoomPopupView.onShowBegin = function (slot0)
	return
end

AbstractZoomPopupView.onHideBegin = function (slot0)
	return
end

AbstractZoomPopupView.hide = function (slot0)
	if slot0._canHide and slot0._isMeShowing then
		slot0._isMeShowing = false
		slot3 = slot0

		slot0.onHideBegin(slot2)

		if slot0._isTween2Show then
			slot3 = slot0._rootView.bg

			TweenLite.killTweensOf(slot2)

			slot3 = slot0._rootView.view

			TweenLite.killTweensOf(slot2)

			slot5 = {
				delay = 0.1,
				alpha = 0,
				onComplete = handler(slot7, slot0)
			}
			slot9 = slot0.onHideComplete

			TweenLite.to(slot2, slot0._rootView.bg, 0.3)

			slot5 = {
				alpha = 0
			}

			TweenLite.to(slot2, slot0._rootView.view, 0.18)

			if slot0._isZoom2PopUp then
			end
		else
			slot3 = slot0

			slot0.onHideComplete(slot2)
		end
	end
end

AbstractZoomPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

AbstractZoomPopupView.onHideComplete = function (slot0)
	slot3 = slot0

	AbstractPopupView.hide(slot2)

	slot3 = slot0

	slot0.try2Destroy(slot2)
end

AbstractZoomPopupView.try2Destroy = function (slot0)
	return
end

AbstractZoomPopupView.destroy = function (slot0)
	slot3 = slot0._rootView.bg

	TweenLite.killTweensOf(slot2)

	slot3 = slot0._rootView.view

	TweenLite.killTweensOf(slot2)

	slot0._closeCallback = nil
	slot3 = slot0._rootView.view.btnClose

	slot0._rootView.view.btnClose.destroy(slot2)

	slot3 = slot0

	AbstractPopupView.destroy(slot2)
end

return
