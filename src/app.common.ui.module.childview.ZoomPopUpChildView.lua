slot2 = "ZoomPopUpChildView"
ZoomPopUpChildView = class(slot1)
slot0 = 0

ZoomPopUpChildView.ctor = function (slot0, slot1, slot2, slot3)
	slot7 = AbstractTouchBlockView

	ClassUtil.extends(slot5, slot0)

	slot9 = slot1

	ClassUtil.extends(slot5, slot0, AbstractTopResView, true)

	slot10 = true

	createSetterGetter(slot5, slot0, "isShowing", false, false)

	slot0._bg = slot2
	slot0._zoomLayer = slot3
	slot0._view = slot1
	slot6 = slot0._view

	slot0._view.retain(slot5)

	slot0._zorder = nil
	slot6 = slot0._view
	slot0._parent = slot0._view.getParent(slot5)
	slot6 = slot0._zoomLayer
	slot0._initScaleX = slot0._zoomLayer.getScaleX(slot5)
	slot6 = slot0._zoomLayer
	slot0._initScaleY = slot0._zoomLayer.getScaleY(slot5)
	slot6 = slot0._zoomLayer
	slot0._initX = slot0._zoomLayer.getPositionX(slot5)
	slot6 = slot0._zoomLayer
	slot0._initY = slot0._zoomLayer.getPositionY(slot5)
	slot0._popupDelay = 0
	slot0._bgAlpha = 1
	slot0._bgShowDuration = 0.2
	slot7 = true

	slot0.setTouchEnabled(slot5, slot0)

	slot7 = false

	slot0._view.setTouchEnabled(slot5, slot0._view)

	if slot0._bg and slot0._bg.setTouchEnabled then
		slot7 = false

		slot0._bg.setTouchEnabled(slot5, slot0._bg)
	end

	slot6 = slot0
	slot10 = slot0.onRootTouchOperation

	slot0.addTouchEventListener(slot5, handler(slot8, slot0))

	slot0._showEvent = nil
	slot0._hideEvent = nil
	slot0._isDestroy = false
	slot0._triggerTarget = nil
	slot0._triggerOffsetPos = nil

	if slot0._bg then
		slot8 = CUR_SELECTED_HEIGHT * 100

		DisplayUtil.scale2Full(slot5, slot0._bg, CUR_SELECTED_WIDTH * 100)
	end

	slot9 = slot0

	eventMgr.add(slot5, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	slot0._fullScreenBg = nil
	slot0._fullScreenBgUrl = nil
	slot0._uiSceneConfigType = nil
	slot0._preSceneType = nil
end

ZoomPopUpChildView.canReturnPreScene = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = mainMgr
	slot3 = uiMgr
	slot4 = slot0._preSceneType
	slot3 = uiMgr
	slot4 = uiMgr

	return uiMgr.getHideAllModulesToSceneType(slot2) == uiMgr.getCurMainSceneType(uiMgr)
end

ZoomPopUpChildView.hasScene = function (slot0)
	return slot0._fullScreenBgUrl ~= nil
end

ZoomPopUpChildView.check2CreateBg = function (slot0)
	if slot0._fullScreenBgUrl and not slot0._fullScreenBg then
		slot3 = slot0._fullScreenBgUrl
		slot0._fullScreenBg = display.newSprite(slot2)
		slot5 = CONFIG_DESIGN_HEIGHT * 100

		DisplayUtil.scale2Full(slot2, slot0._fullScreenBg, CONFIG_DESIGN_WIDTH * 100)

		slot5 = display.cy

		slot0._fullScreenBg.setPosition(slot2, slot0._fullScreenBg, display.cx)

		if slot0._bg then
			slot3 = slot0._bg

			slot0._bg.removeFromParent(slot2)

			slot0._bg = nil
		end
	end
end

ZoomPopUpChildView.onHideAll2Reglogin = function (slot0)
	if not slot0._isDestroy and slot0._isShowing then
		slot4 = true

		slot0.hide(slot2, slot0)
	end
end

ZoomPopUpChildView.onZoomShowTweenComplete = function (slot0)
	return
end

ZoomPopUpChildView.onZoomHideTweenComplete = function (slot0)
	return
end

ZoomPopUpChildView.onRootClick = function (slot0)
	return
end

ZoomPopUpChildView.onRootTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0

		slot0.onRootClick(slot4)
	end
end

ZoomPopUpChildView.show = function (slot0, slot1, slot2)
	if not slot0._isShowing then
		slot0._isShowing = true
		slot5 = slot0._view

		slot0._view.removeFromParent(slot4)

		if not slot0._zorder then
			slot6 = slot0._view
			slot3 = slot0._view.getLocalZOrder(slot5)

			if not slot0._parent then
				slot3 = ZORDER_UI_DEFAULT
			end
		end

		slot6 = slot0

		if slot0.hasScene(slot5) then
			slot0._parent = nil
			slot6 = slot0

			slot0.check2CreateBg(slot5)

			if not slot0._uiSceneConfigType then
				slot6 = slot0 + 1
				slot0 + 1._uiSceneConfigType = slot0 + 1.getName(slot5) .. " class:" .. slot0 + 1.__cname .. " index:" .. slot0 + 1
			end

			slot13 = slot0._preSceneType

			print(uiMgr, "要切换的场景场景名字：", slot0._uiSceneConfigType, "当前场景名字：", uiMgr.getCurSceneType(slot6), "前一个场景名字：")

			if uiMgr.getCurSceneType(slot6) ~= slot0._uiSceneConfigType then
				slot0._preSceneType = slot5
			end

			slot12 = true

			uiMgr.showScene(slot7, uiMgr, slot4, nil, nil)

			slot9 = slot0._fullScreenBg

			uiMgr.showView(slot7, uiMgr)
		end

		slot8 = slot0._parent

		AbstractTouchBlockView.show(slot5, slot0, slot3)

		slot7 = slot3

		slot0._view.setLocalZOrder(slot5, slot0._view)

		slot7 = true

		DisplayUtil.setVisible(slot5, slot0._view)

		if slot0._parent then
			slot8 = true

			DisplayUtil.setAddOrRemoveChild(slot5, slot0._view, slot0._parent)
		else
			slot7 = slot0._view

			uiMgr.centerLocate(slot5, uiMgr)

			slot8 = slot3

			uiMgr.showView(slot5, uiMgr, slot0._view)
		end

		if slot0._bg then
			slot7 = 0

			slot0._bg.setOpacity(slot5, slot0._bg)

			slot4 = slot0._bgShowDuration

			if slot1 then
				slot4 = 0
			end

			slot9 = {
				autoAlpha = slot0._bgAlpha
			}

			TweenLite.to(slot6, slot0._bg, slot4)
		end

		function slot4()
			slot2 = AbstractTopResView.onTopResShow

			AbstractTopResView.onTopResShow(slot1)

			slot2 = AbstractTopResView.onTopResShow

			AbstractTopResView.onTopResShow.onZoomShowTweenComplete(slot1)

			slot2 = slot1

			applyFunction(slot1)

			if applyFunction._showEvent then
				slot3 = slot0._showEvent

				eventMgr.dispatch(slot1, eventMgr)
			end
		end

		if slot0._triggerTarget then
			slot7 = slot0._triggerTarget
			slot10 = slot0._zoomLayer
			slot5 = DisplayUtil.getPositionFromTo(slot6, slot0._zoomLayer.getParent(slot9))

			if slot0._triggerOffsetPos then
				slot9 = slot0._triggerOffsetPos
				slot5 = cc.pAdd(slot7, slot5)
			end

			slot9 = slot5

			slot0._zoomLayer.setPosition(slot7, slot0._zoomLayer)
		end

		slot7 = slot0._zoomLayer

		TweenLite.killTweensOf(slot6)

		slot9 = slot0._initY

		slot0._zoomLayer.setPosition(slot6, slot0._zoomLayer, slot0._initX)

		slot8 = true

		DisplayUtil.setVisible(slot6, slot0._zoomLayer)

		slot8 = slot0._initScaleX

		slot0._zoomLayer.setScaleX(slot6, slot0._zoomLayer)

		slot8 = slot0._initScaleY

		slot0._zoomLayer.setScaleY(slot6, slot0._zoomLayer)

		if not slot1 then
			if slot0.doShowCustomPopupEffect then
				slot8 = slot4

				slot0.doShowCustomPopupEffect(slot6, slot0)
			else
				slot7 = {
					onComplete = slot4
				}
				slot5 = TimelineLite.new(slot6)
				slot9 = slot5
				slot14 = {
					scaleX = slot0._initScaleX * 1.1,
					scaleY = slot0._initScaleY * 1.1
				}

				slot5.append(slot8, TweenLite.to(slot11, slot0._zoomLayer, 0.11))

				slot9 = slot5
				slot14 = {
					scaleX = slot0._initScaleX,
					scaleY = slot0._initScaleY
				}

				slot5.append(slot8, TweenLite.to(slot11, slot0._zoomLayer, 0.11))
			end
		else
			slot4()
		end
	end
end

ZoomPopUpChildView.setIsShowing = function (slot0, slot1, slot2, slot3)
	if slot1 then
		slot8 = slot3

		slot0.show(slot5, slot0, slot2)
	else
		slot8 = slot3

		slot0.hide(slot5, slot0, slot2)
	end
end

ZoomPopUpChildView.hide = function (slot0, slot1, slot2)
	if slot0._isShowing then
		slot5 = uiMgr

		if uiMgr.getIsHidingAllModules(slot4) or slot0._preSceneType then
			slot1 = true
		end

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

		slot5 = slot0

		AbstractTopResView.onTopResHide(slot4)

		function slot3()
			AbstractTouchBlockView.hide(slot1)

			slot3 = slot0

			slot0.removeFromParent(AbstractTouchBlockView.hide)

			slot3 = slot0

			slot0.hideFullBg(AbstractTouchBlockView.hide)

			if slot0._preSceneType then
				slot3 = slot0

				if slot0.canReturnPreScene(slot2) then
					slot7 = true

					uiMgr.showScene(slot2, uiMgr, slot0._preSceneType, nil, nil)
				end

				slot0._preSceneType = nil
			end

			slot3 = slot0

			slot0.onZoomHideTweenComplete(slot2)

			slot3 = applyFunction

			applyFunction(slot2)

			if slot0 then
				slot4 = slot0

				eventMgr.dispatch(slot2, eventMgr)
			end
		end

		slot4 = 0.2
		slot5 = 0.15

		if slot1 then
			slot4 = 0
			slot5 = 0
		end

		slot6 = slot0._initX
		slot7 = slot0._initY

		if slot0._triggerTarget then
			slot10 = slot0._triggerTarget

			if not tolua.isnull(slot9) then
				slot10 = slot0._triggerTarget

				if DisplayUtil.isInDisplayList(slot9) then
					slot10 = slot0._triggerTarget
					slot13 = slot0._zoomLayer
					slot8 = DisplayUtil.getPositionFromTo(slot9, slot0._zoomLayer.getParent(slot12))

					if slot0._triggerOffsetPos then
						slot12 = slot0._triggerOffsetPos
						slot8 = cc.pAdd(slot10, slot8)
					end

					slot6 = slot8.x
					slot7 = slot8.y
				end
			end
		else
			slot0._triggerTarget = nil
		end

		if slot0._zoomLayer then
			if slot0.doHideCustomPopupEffect then
				slot11 = slot3

				slot0.doHideCustomPopupEffect(slot9, slot0)
			else
				slot12 = {
					autoAlpha = 0
				}

				TweenLite.to(slot9, slot0._zoomLayer, slot5)

				slot12 = {
					scaleX = 0.01,
					scaleY = 0.01,
					x = slot6,
					y = slot7,
					onComplete = slot3
				}

				TweenLite.to(slot9, slot0._zoomLayer, slot4)
			end
		end
	end
end

ZoomPopUpChildView.hideFullBg = function (slot0)
	if slot0._fullScreenBg then
		slot3 = slot0._fullScreenBg

		slot0._fullScreenBg.removeFromParent(slot2)

		slot0._fullScreenBg = nil
	end
end

ZoomPopUpChildView.destroy = function (slot0)
	slot0._isDestroy = true
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	slot3 = slot0

	AbstractTouchBlockView.destroy(slot2)

	slot3 = slot0

	AbstractTopResView.destroy(slot2)

	if slot0._zoomLayer then
		slot3 = slot0._zoomLayer

		TweenLite.killTweensOf(slot2)

		slot0._zoomLayer = nil
	end

	slot3 = slot0

	slot0.hideFullBg(slot2)

	if slot0._bg then
		slot3 = slot0._bg

		TweenLite.killTweensOf(slot2)

		slot0._bg = nil
	end

	if slot0._view then
		slot3 = slot0._view

		slot0._view.release(slot2)

		slot0._view = nil
	end

	slot0._parent = nil
end

return
