slot2 = "ActivityLoadingPopUpView"
ActivityLoadingPopUpView = class(slot1)

ActivityLoadingPopUpView.ctor = function (slot0)
	slot6 = "csb/common/PopUpReconnect.csb"

	ClassUtil.extends(slot2, slot0, AbstractPopupView, true)

	slot0._zorder = ZORDER_LOADING_ACTIVITY
	slot3 = uiMgr
	slot0._popupParent = uiMgr.getTopLayerInAllScene(slot2)
	slot0._dotTweenTl = nil
	slot0._dots = nil
	slot4 = 0

	slot0._view.setOpacity(slot2, slot0._view)

	slot0._isLoadingShowing = false
	slot3 = slot0

	slot0.initTween(slot2)
end

ActivityLoadingPopUpView.isShowing = function (slot0)
	return slot0._isLoadingShowing
end

ActivityLoadingPopUpView.initTween = function (slot0)
	if not slot0._dotTweenTl then
		slot5 = {
			rotation = "360",
			repeatCount = -1,
			ease = Linear.easeNone
		}
		slot0._dotTweenTl = TweenMax.to(slot2, slot0._rootView.view.spDots, 1)
	end
end

ActivityLoadingPopUpView.changeContent = function (slot0, slot1)
	slot5 = slot1

	slot0._rootView.view.txtContent_tf.setHtmlText(slot3, slot0._rootView.view.txtContent_tf)
end

ActivityLoadingPopUpView.onSceneChanged = function (slot0)
	if slot0._isShowing then
		slot3 = slot0

		AbstractPopupView.show(slot2)
	end
end

ActivityLoadingPopUpView.onRootTouchOperation = function (slot0, slot1, slot2)
	return
end

ActivityLoadingPopUpView.show = function (slot0)
	if not slot0._isLoadingShowing then
		slot0._isLoadingShowing = true
		slot3 = slot0._view

		TweenLite.killTweensOf(slot2)

		slot3 = slot0

		AbstractPopupView.hide(slot2)

		slot4 = 0

		slot0._view.setOpacity(slot2, slot0._view)

		slot3 = slot0

		AbstractPopupView.show(slot2)

		slot5 = {
			alpha = 1,
			delay = 0.8
		}

		TweenLite.to(slot2, slot0._view, 0.1)

		slot6 = slot0

		eventMgr.add(slot2, eventMgr, GameEvent.OnSceneChanged, slot0.onSceneChanged)

		slot3 = slot0._dotTweenTl

		slot0._dotTweenTl.resume(slot2)
	end
end

ActivityLoadingPopUpView.hide = function (slot0, slot1)
	if slot0._isLoadingShowing then
		slot0._isLoadingShowing = false

		TweenLite.killTweensOf(slot3)

		slot7 = {
			alpha = 0,
			onComplete = function ()
				slot2 = slot0._dotTweenTl

				slot0._dotTweenTl.pause(slot1)

				slot2 = slot0._view

				TweenLite.killTweensOf(slot1)

				slot5 = eventMgr.remove

				eventMgr.remove(slot1, eventMgr, GameEvent.OnSceneChanged, slot0.onSceneChanged)

				slot2 = AbstractPopupView.hide

				AbstractPopupView.hide(slot1)
			end
		}

		TweenLite.to(slot0._view, slot0._view, 0.1)
	end
end

return
