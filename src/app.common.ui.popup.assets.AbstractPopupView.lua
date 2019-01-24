slot2 = "AbstractPopupView"
AbstractPopupView = class(slot1)

AbstractPopupView.ctor = function (slot0, slot1)
	slot5 = AbstractTouchBlockView

	ClassUtil.extends(slot3, slot0)

	slot0._popupParent = nil
	slot5 = slot0
	slot0._view = ResConfig.loadCsNode(slot3, slot1)
	slot0._rootView = slot0._view.ccsChildren[1]

	if slot0._rootView.bg then
		slot6 = CUR_SELECTED_HEIGHT * 100

		DisplayUtil.scale2Full(slot3, slot0._rootView.bg, CUR_SELECTED_WIDTH * 100)
	end

	slot5 = true

	slot0._rootView.setTouchEnabled(slot3, slot0._rootView)

	slot0._zorder = 1000
	slot4 = slot0._view

	DisplayUtil.setAllCascadeOpacityEnabled(slot3)

	slot4 = slot0._view

	slot0._view.retain(slot3)

	slot8 = true

	createSetterGetter(slot3, slot0, "isShowing", false, false)

	slot6 = nil

	createSetterGetter(slot3, slot0, "hideCallback")

	slot7 = slot0

	eventMgr.add(slot3, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	slot6 = slot0

	uiMgr.isScreenOrientationRotatedChangedSignal.add(slot3, uiMgr.isScreenOrientationRotatedChangedSignal, slot0.onScreenOrientationChanged)

	slot0._isDestroy = false
end

AbstractPopupView.onScreenOrientationChanged = function (slot0)
	if slot0._isShowing and slot0._view then
		slot11 = slot0._view
		slot8 = slot0._view.getContentSize(slot2).height * slot0._view.getScaleY(slot0._view)

		uiMgr.locate(slot0._view, uiMgr, UIConfig.ALIGN_CENTER, slot0._view, slot0._view.getContentSize(slot2).width * slot0._view.getScaleX(slot9))
	end
end

AbstractPopupView.onHideAll2Reglogin = function (slot0)
	if not slot0._isDestroy then
		slot3 = slot0

		slot0.hide(slot2)
	end
end

AbstractPopupView.show = function (slot0)
	if not slot0._isShowing then
		slot0._isShowing = true
		slot5 = slot0._popupParent

		AbstractTouchBlockView.show(slot2, slot0, slot0._zorder)

		slot3 = slot0

		slot0.onScreenOrientationChanged(slot2)

		if slot0._popupParent then
			slot4 = slot0._zorder

			slot0._view.setLocalZOrder(slot2, slot0._view)

			slot5 = true

			DisplayUtil.setAddOrRemoveChild(slot2, slot0._view, slot0._popupParent)
		else
			slot5 = slot0._zorder

			uiMgr.showView(slot2, uiMgr, slot0._view)
		end
	end
end

AbstractPopupView.hide = function (slot0)
	if slot0._isShowing then
		slot0._isShowing = false
		slot3 = slot0

		AbstractTouchBlockView.hide(slot2)

		slot3 = slot0._view

		slot0._view.removeFromParent(slot2)

		slot3 = slot0._hideCallback

		applyFunction(slot2)
	end
end

AbstractPopupView.isShowing = function (slot0)
	slot3 = slot0

	return slot0.getIsShowing(slot2)
end

AbstractPopupView.destroy = function (slot0)
	slot0._isDestroy = true
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	slot5 = slot0

	uiMgr.isScreenOrientationRotatedChangedSignal.remove(slot2, uiMgr.isScreenOrientationRotatedChangedSignal, slot0.onScreenOrientationChanged)

	slot3 = slot0

	AbstractTouchBlockView.destroy(slot2)

	if slot0._view then
		slot4 = false

		slot0._rootView.setTouchEnabled(slot2, slot0._rootView)

		slot3 = slot0._view

		slot0._view.removeFromParent(slot2)

		slot3 = slot0._view

		slot0._view.release(slot2)

		slot0._view = nil
	end
end

return
