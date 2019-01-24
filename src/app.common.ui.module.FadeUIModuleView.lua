slot2 = "FadeUIModuleView"
FadeUIModuleView = class(slot1)

FadeUIModuleView.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0._fadeInDurationInS = slot4 or 0.2
	slot0._fadeOutDurationInS = slot5 or 0.2
	slot0._fadeInEase = slot6 or Sine.easeOut
	slot0._fadeOutEase = slot7 or Sine.easeOut
	slot0._fadeBlockLayer = nil
	slot0._onShowTweenCompleteCallback = nil
	slot0._onHideTweenCompleteCallback = nil
	slot10 = slot0

	slot0.initTweenBlockLayer(slot9)

	slot15 = slot3

	ClassUtil.extends(slot9, slot0, BaseModuleUIView, true, slot1, slot2)

	slot0._isTweeningShow = false
	slot0._isTweeningHide = false
	slot0._showEvent = nil
	slot0._hideEvent = nil
end

FadeUIModuleView.initTweenBlockLayer = function (slot0)
	slot3 = ccui.Layout
	slot0._fadeBlockLayer = ccui.Layout.create(slot2)
	slot3 = slot0._fadeBlockLayer
	slot7 = CUR_SELECTED_HEIGHT

	slot0._fadeBlockLayer.setContentSize(slot2, cc.size(slot5, CUR_SELECTED_WIDTH))

	slot3 = slot0._fadeBlockLayer
	slot7 = 0.5

	slot0._fadeBlockLayer.setAnchorPoint(slot2, cc.p(slot5, 0.5))
	slot0._fadeBlockLayer.setPosition(slot2, slot0._fadeBlockLayer, display.cx)

	slot4 = true

	slot0._fadeBlockLayer.setTouchEnabled(slot2, slot0._fadeBlockLayer)

	slot4 = 0

	slot0._fadeBlockLayer.setBackGroundColorType(slot2, slot0._fadeBlockLayer)

	slot3 = slot0._fadeBlockLayer
	slot9 = 255

	slot0._fadeBlockLayer.setBackGroundColor(slot2, cc.c4b(display.cy, 0, 0, 255))

	slot4 = 100

	slot0._fadeBlockLayer.setBackGroundColorOpacity(slot2, slot0._fadeBlockLayer)

	slot4 = ZORDER_WORLD_TOUCH_BLOCK_LAYOUT

	slot0._fadeBlockLayer.setLocalZOrder(slot2, slot0._fadeBlockLayer)

	slot3 = slot0._fadeBlockLayer

	slot0._fadeBlockLayer.retain(slot2)
end

FadeUIModuleView.show = function (slot0, slot1, slot2, slot3)
	slot0._isTweeningShow = true

	if slot1 == nil then
		slot1 = true
	end

	slot4 = slot0._isShowing
	slot5 = slot0.view ~= nil
	slot12 = slot3

	BaseModuleUIView.show(slot8, slot0, function ()
		if not slot0 then
			slot1._onShowTweenCompleteCallback = slot2
			slot0 = slot1:getRootView()

			if not slot3 then
				slot4 = true

				slot0.setCascadeOpacityEnabled(slot2, slot0)
			end

			slot4 = slot1._fadeBlockLayer

			uiMgr.showView(slot2, uiMgr)

			if uiMgr.showView._maskBg then
				slot4 = 0

				slot1._maskBg.setOpacity(slot2, slot1._maskBg)
			end

			slot0.setOpacity(slot2, slot0)

			slot1 = 0

			if 0 then
				slot1 = slot1._fadeInDurationInS
			end

			slot6 = slot1

			slot1.tweenToShow(slot3, slot1, slot0)
		else
			slot1._isTweeningShow = false
		end
	end, nil)
end

FadeUIModuleView.hide = function (slot0, slot1, slot2)
	slot0._isTweeningHide = true

	if slot0._isShowing then
		slot5 = uiMgr

		if uiMgr.getIsHidingAllModules(slot4) then
			slot1 = false
		end

		if slot1 == nil then
			slot1 = true
		end

		slot3 = slot0.view.ccsChildren[1]
		slot7 = slot0._fadeBlockLayer

		uiMgr.showView(slot5, uiMgr)

		slot4 = slot0._fadeOutDurationInS

		if not slot1 then
			slot4 = 0
		end

		slot0._onHideTweenCompleteCallback = slot2
		slot9 = slot4

		slot0.tweenToHide(slot6, slot0, slot3)
	else
		slot0._isTweeningHide = false
	end
end

FadeUIModuleView.tweenToShow = function (slot0, slot1, slot2)
	slot0._isTweeningShow = true
	slot6 = slot2

	slot0.checkBgTweenToShow(slot4, slot0)

	slot7 = {
		nodeAlpha = 1,
		onComplete = handler(slot9, slot0),
		ease = slot0._fadeInEase
	}
	slot11 = slot0.onShowTweenComplete

	TweenLite.to(slot4, slot1, slot2)
end

FadeUIModuleView.checkBgTweenToHide = function (slot0, slot1)
	slot5 = slot1

	slot0.checkOldUILayerShow(slot3, slot0)

	if slot0._maskBg then
		slot6 = {
			nodeAlpha = 0
		}

		TweenLite.to(slot3, slot0._maskBg, slot1)
	end

	if slot0._fullScreenBg then
		slot6 = {
			alpha = 0
		}

		TweenLite.to(slot3, slot0._fullScreenBg, slot1)
	end
end

FadeUIModuleView.checkBgTweenToShow = function (slot0, slot1)
	slot5 = 0

	slot0.checkOldUILayerHide(slot3, slot0)

	if slot0._maskBg then
		slot6 = {
			nodeAlpha = slot0._maskBg._showOpacity / 255
		}

		TweenLite.to(slot3, slot0._maskBg, slot1)
	end

	if slot0._fullScreenBg then
		slot4 = slot0._fullScreenBg

		TweenLite.killTweensOf(slot3)

		slot5 = 0

		slot0._fullScreenBg.setOpacity(slot3, slot0._fullScreenBg)

		slot6 = {
			alpha = 1
		}

		TweenLite.to(slot3, slot0._fullScreenBg, slot1)
	end
end

FadeUIModuleView.checkOldUILayerHide = function (slot0, slot1)
	return
end

FadeUIModuleView.checkOldUILayerShow = function (slot0, slot1)
	if slot0._preSceneType then
		slot4 = slot0

		if slot0.hasScene(slot3) then
			slot4 = slot0

			if slot0.canReturnPreScene(slot3) and (slot0._preSceneType ~= slot0._uiSceneConfigType or slot0._preSceneType ~= SceneType.scene_fullui) then
				slot6 = slot0._preSceneType
				slot3 = uiMgr.getUILayerByScene(uiMgr, uiMgr)
				slot7 = 0

				slot3.setOpacity(uiMgr, slot3)

				slot6 = slot3

				slot3.removeFromParent(uiMgr)

				slot6 = uiMgr
				slot7 = slot3

				uiMgr.getCurScene(uiMgr).addChild(uiMgr, uiMgr.getCurScene(uiMgr))

				slot7 = 0

				slot3.setLocalZOrder(uiMgr, slot3)

				slot7 = 1

				uiMgr.getCurUiLayer(slot3).setLocalZOrder(uiMgr, slot2)

				slot6 = slot3

				TweenLite.killTweensOf(uiMgr)

				slot8 = {
					alpha = 1
				}

				TweenLite.to(uiMgr, slot3, slot1)
			end
		end
	end
end

FadeUIModuleView.onShowTweenComplete = function (slot0)
	slot4 = true

	AbstractTopResView.setTopResPaneShowing(slot2, slot0)

	slot0._isTweeningShow = false
	slot3 = slot0._fadeBlockLayer

	slot0._fadeBlockLayer.removeFromParent(slot2)

	if slot0._onShowTweenCompleteCallback then
		slot0._onShowTweenCompleteCallback()

		slot0._onShowTweenCompleteCallback = nil
	end

	if slot0._showEvent then
		slot4 = slot0._showEvent

		eventMgr.dispatch(slot2, eventMgr)
	end

	slot3 = slot0

	if slot0.getRootView(slot2) and slot1.onRootViewShowComplete then
		slot4 = slot1

		slot1.onRootViewShowComplete(slot3)
	end
end

FadeUIModuleView.tweenToHide = function (slot0, slot1, slot2)
	slot7 = true

	AbstractTopResView.setTopResPaneShowing(slot4, slot0, false)

	if slot1 and slot1.onRootViewHideBegin then
		slot5 = slot1

		slot1.onRootViewHideBegin(slot4)
	end

	slot0._isTweeningHide = true
	slot6 = slot2

	slot0.checkBgTweenToHide(slot4, slot0)

	slot7 = {
		nodeAlpha = 0,
		onComplete = handler(slot9, slot0),
		ease = slot0._fadeOutEase
	}
	slot11 = slot0.onHideTweenComplete

	TweenLite.to(slot4, slot1, slot2)
end

FadeUIModuleView.setTopResPaneShowing = function (slot0, slot1)
	return
end

FadeUIModuleView.onHideTweenComplete = function (slot0)
	slot0._isTweeningHide = false
	slot3 = slot0

	BaseModuleUIView.hide(slot2)

	slot3 = slot0._fadeBlockLayer

	slot0._fadeBlockLayer.removeFromParent(slot2)

	if slot0._onHideTweenCompleteCallback then
		slot0._onHideTweenCompleteCallback()

		slot0._onHideTweenCompleteCallback = nil
	end

	if slot0._hideEvent then
		slot4 = slot0._hideEvent

		eventMgr.dispatch(slot2, eventMgr)
	end
end

FadeUIModuleView.destroy = function (slot0)
	slot0._fadeInDurationInS = nil
	slot0._fadeOutDurationInS = nil
	slot0._fadeInEase = nil
	slot0._fadeOutEase = nil
	slot0._onShowTweenCompleteCallback = nil
	slot0._onHideTweenCompleteCallback = nil
	slot0._isTweeningShow = nil
	slot0._isTweeningHide = nil
	slot0._showEvent = nil
	slot0._hideEvent = nil
	slot3 = slot0._fadeBlockLayer

	slot0._fadeBlockLayer.removeFromParent(slot2)

	slot3 = slot0._fadeBlockLayer

	slot0._fadeBlockLayer.release(slot2)

	slot0._fadeBlockLayer = nil
	slot3 = slot0

	BaseModuleUIView.destroy(slot2)
end

return
