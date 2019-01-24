CcsScrollView = class("CcsScrollView", function ()
	return ccui.Layout:create()
end)
CcsScrollView.SCROLL_V = 1
CcsScrollView.SCROLL_H = 2
CcsScrollView.SCROLL_BOTH = 3
CcsScrollView.CAN_ALL_SCROLL = true
CcsScrollView.isScreenOrientationRotated = false
DISTANCE_2_TRIGGER_MOVE_H = 3
DISTANCE_2_TRIGGER_MOVE_V = 5

CcsScrollView.ctor = function (slot0, slot1)
	slot0:setAnchorPoint(cc.p(0, 0))
	createSetterGetter(slot0, "innerContainer", ccui.Layout:create(), false, true)
	createSetterGetter(slot0, "innerContainerSize", cc.size(0, 0), false, true)
	createSetterGetter(slot0, "vScrollBar", nil, false, true)
	createSetterGetter(slot0, "vScrollBarTrack", nil, false, true)
	createSetterGetter(slot0, "vUpdateNode", nil, false, true)
	createSetterGetter(slot0, "canScrollBottom2Load", false, false, false, false, false, handler(slot0, slot0.oncanScrollBottom2LoadChanged))
	createSetterGetter(slot0, "isLoadingMore", false, false, false, false, false, handler(slot0, slot0.onIsLoadingMoreChanged))
	createSetterGetter(slot0, "scrollAreaNode", nil, false, true)
	createSetterGetter(slot0, "scrollPolicy", CcsScrollView.SCROLL_V)
	createSetterGetter(slot0, "isScrollable", true, false)
	createSetterGetter(slot0, "isItemClickable", true, false)
	createSetterGetter(slot0, "bottomMargin", 0, false, true)
	createSetterGetter(slot0, "leftMargin", 0, false, true)
	createSetterGetter(slot0, "rightMargin", 0, false, false, false, false, false, handler(slot0, slot0.updateMarginInfos))
	createSetterGetter(slot0, "topMargin", 0, false, true)
	createSetterGetter(slot0, "isCenterWhileNeed", false)
	createSetterGetter(slot0, "isScrollableOnlyInNeed", false)
	createSetterGetter(slot0, "canLongClick", false, false, true)
	createSetterGetter(slot0, "longClickIntervalMs", 250, false, true)
	createSetterGetter(slot0, "loadMoreSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "itemClickSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "viewTouchSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "viewClickSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "viewPushSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "onPosChangedSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "isScrollViewNotRotated", false)
	createSetterGetter(slot0, "isScrollViewForceRotated", false)
	createSetterGetter(slot0, "canScrollAlways", false)
	createSetterGetter(slot0, "maxPosBounceOffset", 100)
	createSetterGetter(slot0, "minPosBounceOffset", 100)
	createSetterGetter(slot0, "canMaxDrag", true)
	createSetterGetter(slot0, "isPauseBounce", false, nil, nil, nil, nil, handler(slot0, slot0.onIsPauseBouceChanged))

	slot0._vUpdateNodeGap = 5
	slot0._longClickTimer = nil
	slot0._loadMoreBottomMarginOffset = 0
	slot0._vScrollBarMinHeight = 70
	slot0._innerContainerSizeWithMargin = cc.size(0, 0)
	slot0._leftX = 0
	slot0._rightX = 0
	slot0._topY = 0
	slot0._bottomY = 0
	slot0._tempTouchPos = nil
	slot0._easingFactor = 0.08
	slot0._bounceDuration = 0.6
	slot0._curVx = 0
	slot0._curVy = 0
	slot0._defaultA = 3
	slot0._aX = slot0._defaultA
	slot0._aY = slot0._defaultA
	slot0._isAutoCheckItemVisible = true
	slot0._scrollItems = {}

	slot0._innerContainer:setAnchorPoint(cc.p(0, 0))
	slot0._innerContainer:setTouchEnabled(false)
	slot0:addChild(slot0._innerContainer)
	slot0:setClippingEnabled(true)
	ClassUtil.extends(slot0, TickBase)
	slot0:setTouchEnabled(false)
	slot0:setScrollAreaNode(slot1 or slot0)

	slot0._pushDownNotMove = false
	slot0._curPushingDownItem = nil
	slot0._isTouching = false
	slot0._preBtn = nil
	slot0._nextBtn = nil
	slot0._btnsInHandle = {}
	slot0._btnsDicInHandle = {}
end

CcsScrollView.onIsPauseBouceChanged = function (slot0)
	if slot0._isPauseBounce then
		TweenLite.killTweensOf(slot0._innerContainer)
	else
		slot0:jumpTo(0, 0, 0.2)
	end
end

CcsScrollView.removeBtnInHandleTouchOperate = function (slot0, slot1)
	table.removebyvalue(slot0._btnsInHandle, slot1)

	slot0._btnsDicInHandle[slot1] = nil
end

CcsScrollView.addBtn2HandleTouchOperate = function (slot0, slot1)
	if slot1 and not slot0._btnsDicInHandle[slot1] then
		slot0._btnsDicInHandle[slot1] = {}

		table.insert(slot0._btnsInHandle, slot1)
		slot1:setInteractiveTouchEnable(false)
	end
end

CcsScrollView.checkBtnsTouchEvent = function (slot0, slot1, slot2)
	if slot1 == ccs.TOUCH_EVENT_MOVED then
		if slot0._tempTouchPos and slot0:checkDistance2TriggerMove(slot2) then
			slot1 = ccs.TOUCH_EVENT_CANCELED
		else
			return
		end
	end

	function slot3(slot0, slot1)
		if slot1.touchWorldPos then
			slot1.touchWorldPos = nil

			slot0:onTouchOperation(slot0, ccs.TOUCH_EVENT_CANCELED)
		end
	end

	slot4 = nil

	for slot8 = #slot0._btnsInHandle, 1, -1 do
		slot10 = slot0._btnsDicInHandle[slot0._btnsInHandle[slot8]]

		if slot1 ~= ccs.TOUCH_EVENT_CANCELED and DisplayUtil.isInDisplayList(slot9) and slot9:getInteractiveObj():hitTest(slot2, nil, nil) then
			if slot1 == ccs.TOUCH_EVENT_BEGAN then
				if not slot4 then
					slot4 = slot9
					slot10.touchWorldPos = slot2

					slot9:onTouchOperation(slot9, slot1)
				end
			elseif slot1 == ccs.TOUCH_EVENT_ENDED and slot10.touchWorldPos then
				slot10.touchWorldPos = nil

				slot9:onTouchOperation(slot9, slot1)
			end
		else
			slot3(slot9, slot10)
		end
	end
end

CcsScrollView.onIsLoadingMoreChanged = function (slot0)
	if slot0._isLoadingMore then
		slot0._loadMoreSignal:emit()
	elseif slot0._loadMoreBottomMarginOffset > 0 then
		slot0:setBottomMargin(slot0._bottomMargin - slot0._loadMoreBottomMarginOffset, nil, 0.3)
	end
end

CcsScrollView.oncanScrollBottom2LoadChanged = function (slot0)
	if not slot0._canScrollBottom2Load and slot0._vUpdateNode then
		slot0._vUpdateNode:setVisible(false)
	end
end

CcsScrollView.tick = function (slot0, slot1, slot2)
	if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
		if math.abs(slot0._curVy) <= slot0._aY then
			slot0:stopSpeedDown()
		else
			slot0:speedDown()
		end
	elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		if math.abs(slot0._curVx) <= slot0._aX then
			slot0:stopSpeedDown()
		else
			slot0:speedDown()
		end
	end
end

CcsScrollView.setTopMargin = function (slot0, slot1)
	if slot0._topMargin ~= slot1 then
		slot0._topMargin = slot1

		slot0:updateMarginInfos()
		slot0._innerContainer:setPositionY(slot0._innerContainer:getPositionY() - (slot1 - slot0._topMargin))
	end
end

CcsScrollView.setBottomMargin = function (slot0, slot1, slot2, slot3)
	if slot0._bottomMargin ~= slot1 then
		slot4 = slot0._bottomMargin
		slot0._bottomMargin = slot1

		slot0:updateMarginInfos()

		if not slot2 then
			if slot0._bottomY < slot0._innerContainer:getPositionY() + slot1 - slot4 then
				slot6 = slot0._bottomY
			end

			slot0:resetScrollState()

			if slot3 then
				TweenLite.to(slot0._innerContainer, slot3, {
					y = slot6
				})
			else
				slot0._innerContainer:setPositionY(slot6)
			end
		end
	end
end

CcsScrollView.setLeftMargin = function (slot0, slot1)
	if slot0._leftMargin ~= slot1 then
		slot0._leftMargin = slot1

		slot0:updateMarginInfos()
		slot0._innerContainer:setPositionX(slot0._innerContainer:getPositionX() + slot1 - slot0._leftMargin)
	end
end

CcsScrollView.speedDown = function (slot0)
	slot1 = cc.p(slot0._innerContainer:getPosition())

	if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
		slot0._curVx = 0

		if slot0._curVy < 0 then
			slot0._curVy = slot0._curVy + slot0._aY
		else
			slot0._curVy = slot0._curVy - slot0._aY
		end
	elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		slot0._curVy = 0

		if slot0._curVx < 0 then
			slot0._curVx = slot0._curVx + slot0._aX
		else
			slot0._curVx = slot0._curVx - slot0._aX
		end
	end

	slot0:scrollView2(slot1.x + slot0._curVx, slot1.y + slot0._curVy, nil, false, true)
end

CcsScrollView.stopSpeedDown = function (slot0)
	slot0._curVy = 0
	slot0._curVx = 0

	slot0:stopTick()
	slot0:checkScrollCancel(false)
end

CcsScrollView.checkDistance2TriggerMove = function (slot0, slot1)
	slot2 = false

	if slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		slot3 = nil
		slot2 = DISTANCE_2_TRIGGER_MOVE_H < (((not slot0._isScrollViewForceRotated and (slot0._isScrollViewNotRotated or not CcsScrollView.isScreenOrientationRotated)) or math.abs(slot1.y - slot0._tempTouchPos.y)) and math.abs(slot1.x - slot0._tempTouchPos.x))
	else
		slot3 = nil

		return DISTANCE_2_TRIGGER_MOVE_V < (((not slot0._isScrollViewForceRotated and (slot0._isScrollViewNotRotated or not CcsScrollView.isScreenOrientationRotated)) or math.abs(slot1.x - slot0._tempTouchPos.x)) and math.abs(slot1.y - slot0._tempTouchPos.y))
	end
end

CcsScrollView.rotationPos = function (slot0, slot1)
	return cc.p(slot1.y, slot1.x)
end

CcsScrollView.onTouchOperation = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0._isTouching = true
		slot3 = DisplayUtil.ccpCopy(slot0:getScrollAreaNode():getTouchBeganPosition())

		if not slot0._pushDownNotMove then
			slot0._pushDownNotMove = true

			slot0._viewPushSignal:emit(slot0._pushDownNotMove, slot3, slot2)
		end

		slot0:resetScrollState()

		slot0._tempTouchPos = DisplayUtil.ccpCopy(slot3)

		if slot0:checkScrollItemsPushDown(slot0._tempTouchPos) and slot0._longClickTimer then
			slot0._longClickTimer:reset()
			slot0._longClickTimer:start()
		end

		slot0:setBarVisible(true)
		slot0._viewTouchSignal:emit(slot3, slot2)
		slot0:checkBtnsTouchEvent(slot2, slot3)
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		if CcsScrollView.CAN_ALL_SCROLL or slot0._canScrollAlways then
			slot0:checkBtnsTouchEvent(slot2, DisplayUtil.ccpCopy(slot0:getScrollAreaNode():getTouchMovePosition()))

			if not slot0._pushDownNotMove or slot0:checkDistance2TriggerMove(slot3) then
				if slot0._pushDownNotMove then
					slot0._pushDownNotMove = false

					slot0._viewPushSignal:emit(slot0._pushDownNotMove, slot3, slot2)
				end

				if slot0:canScroll() then
					slot0:checkScrollMove()
					slot0:checkScrollItemsMove()
				end
			end

			if slot0._longClickTimer then
				slot0._longClickTimer:reset()
			end

			slot0._viewTouchSignal:emit(slot3, slot2)
		end
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED or slot2 == ccs.TOUCH_EVENT_ENDED then
		slot0._isTouching = false
		slot3 = DisplayUtil.ccpCopy(slot0:getScrollAreaNode():getTouchEndPosition())

		if slot0:canScroll() then
			slot0:checkScrollBottom2Load()
		end

		slot0:checkScrollCancel(true)
		slot0:checkScrollItemsRelease(slot3)

		if slot0._longClickTimer then
			slot0._longClickTimer:reset()
		end

		if slot0._pushDownNotMove then
			if slot2 == ccs.TOUCH_EVENT_ENDED then
				slot0._viewClickSignal:emit(slot3, slot2)
			end

			slot0._pushDownNotMove = false

			slot0._viewPushSignal:emit(slot0._pushDownNotMove, slot3, slot2)
		end

		slot0._viewTouchSignal:emit(slot3, slot2)
		slot0:checkBtnsTouchEvent(slot2, slot3)
	end

	slot0:checkItemTouchEvent(slot2, slot3)
end

CcsScrollView.checkItemTouchEvent = function (slot0, slot1, slot2)
	if slot0._curPushingDownItem then
		slot0._curPushingDownItem:onTouchEvent(slot1, slot2)

		if slot1 == ccs.TOUCH_EVENT_CANCELED or slot1 == ccs.TOUCH_EVENT_ENDED then
			slot0._curPushingDownItem = nil
		end
	end
end

CcsScrollView.canScroll = function (slot0)
	if not slot0._isScrollable then
		return false
	elseif slot0._isScrollableOnlyInNeed then
		if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
			return slot0:getContentSize().height < slot0._innerContainerSizeWithMargin.height
		else
			return slot0:getContentSize().width < slot0._innerContainerSizeWithMargin.width
		end
	else
		return true
	end
end

CcsScrollView.checkScrollBottom2Load = function (slot0, slot1)
	if slot0:canShowBottomUpdateNode() and not slot0._isLoadingMore then
		slot2, slot3 = slot0._innerContainer:getPosition()

		if slot3 > 0 + 10 + math.abs(slot0._vUpdateNode:getPositionY()) + slot0._vUpdateNode:getContentSize().height * slot0._vUpdateNode:getAnchorPoint().y then
			slot0._loadMoreBottomMarginOffset = slot5

			slot0:setBottomMargin(slot6, true)
			slot0:setIsLoadingMore(true)
		end
	end
end

CcsScrollView.setBarVisible = function (slot0, slot1)
	if slot1 and slot0:isShowScroller() then
		if slot0._vScrollBar then
			TweenLite.killTweensOf(slot0._vScrollBar)
			TweenLite.to(slot0._vScrollBar, 0.5, {
				autoAlpha = 1
			})
		end

		if slot0._vScrollBarTrack then
			TweenLite.killTweensOf(slot0._vScrollBarTrack)
			TweenLite.to(slot0._vScrollBarTrack, 0.5, {
				autoAlpha = 1
			})
		end
	else
		if slot0._vScrollBar then
			TweenLite.killTweensOf(slot0._vScrollBar)
			TweenLite.to(slot0._vScrollBar, 0.5, {
				autoAlpha = 0,
				delay = 0.3
			})
		end

		if slot0._vScrollBarTrack then
			TweenLite.killTweensOf(slot0._vScrollBarTrack)
			TweenLite.to(slot0._vScrollBarTrack, 0.5, {
				autoAlpha = 0,
				delay = 0.3
			})
		end
	end
end

CcsScrollView.checkScrollItemsPushDown = function (slot0, slot1)
	slot2 = false

	if slot0._isItemClickable then
		for slot6, slot7 in ipairs(slot0._scrollItems) do
			if slot2 then
				slot7:setIsTouchPushDown(false, slot1)
			else
				slot7:setIsTouchPushDown(slot7:checkTouchInMe(slot1), slot1)

				if slot7.checkTouchInMe(slot1) then
					slot0._curPushingDownItem = slot7
				end
			end
		end
	end

	return slot2
end

CcsScrollView.setAllItemsNotPushDown = function (slot0)
	for slot4, slot5 in ipairs(slot0._scrollItems) do
		slot5:setIsTouchPushDown(false)
	end
end

CcsScrollView.checkScrollItemsMove = function (slot0)
	slot0:setAllItemsNotPushDown()
end

CcsScrollView.checkScrollItemsRelease = function (slot0, slot1)
	slot2 = nil

	for slot6, slot7 in ipairs(slot0._scrollItems) do
		if slot7:getIsTouchPushDown() then
			if slot7:checkTouchInMe(slot1) then
				slot2 = slot7
			end

			slot7:setIsTouchPushDown(false, slot1)

			break
		end
	end

	if slot2 then
		if slot2:canPlayClickSound(slot1) then
			slot2:playClickSoundEffect()
		end

		slot0._itemClickSignal:emit(slot2)
		slot2:onClick(slot1)
	end
end

CcsScrollView.resetScrollState = function (slot0)
	slot0._curVy = 0
	slot0._curVx = 0
	slot0._tempTouchPos = nil

	slot0:stopTick()
	TweenLite.killTweensOf(slot0._innerContainer)
end

CcsScrollView.checkScrollCancel = function (slot0, slot1)
	slot2 = cc.p(slot0._innerContainer:getPosition())

	if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
		if slot2.y < slot0._topY then
			slot0:scrollView2(nil, slot0._topY, slot0._bounceDuration, true, true)
		elseif slot0._bottomY < slot2.y then
			slot0:scrollView2(nil, slot0._bottomY, slot0._bounceDuration, true, true)
		elseif slot1 then
			if slot0._tempTouchPos then
				slot6 = 0

				if math.pow(slot0._curVy, 2) / (2 * slot0._defaultA) > ((slot0._curVy > 0 and math.abs(slot0._bottomY - slot2.y) + slot0._maxPosBounceOffset) or math.abs(slot0._topY - slot2.y) + slot0._minPosBounceOffset) then
					slot3 = slot4 / (2 * slot6)
				end

				slot0._aY = slot3

				slot0:startTick()
			end
		else
			slot0:setBarVisible(false)
		end
	elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		if slot2.x < slot0._rightX then
			slot0:scrollView2(slot0._rightX, nil, slot0._bounceDuration, true, true)
		elseif slot0._leftX < slot2.x then
			slot0:scrollView2(slot0._leftX, nil, slot0._bounceDuration, true, true)
		elseif slot1 then
			if slot0._tempTouchPos then
				slot6 = 0

				if math.pow(slot0._curVx, 2) / (2 * slot0._defaultA) > ((slot0._curVx > 0 and math.abs(slot0._leftX - slot2.x) + slot0._maxPosBounceOffset) or math.abs(slot0._rightX - slot2.x) + slot0._minPosBounceOffset) then
					slot3 = slot4 / (2 * slot6)
				end

				slot0._aX = slot3

				slot0:startTick()
			end
		else
			slot0:setBarVisible(false)
		end
	end

	slot0._tempTouchPos = nil
end

CcsScrollView.checkIgnoreMove = function (slot0, slot1, slot2)
	if slot1 * slot2 > 0 then
		return math.abs(slot1) > math.abs(slot2) + 30
	end

	return false
end

CcsScrollView.checkScrollMove = function (slot0)
	slot1 = DisplayUtil.ccpCopy(slot0:getScrollAreaNode():getTouchMovePosition())

	if slot0._tempTouchPos then
		slot2 = slot1.x - slot0._tempTouchPos.x
		slot3 = slot1.y - slot0._tempTouchPos.y

		if slot0._isScrollViewForceRotated or (not slot0._isScrollViewNotRotated and CcsScrollView.isScreenOrientationRotated) then
			slot2 = slot3
			slot3 = -slot2

			if isAndroid then
				slot2 = -slot2
				slot3 = -slot3
			end
		end

		if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
			if slot0:checkIgnoreMove(slot0._curVy, slot3) then
				return
			end
		elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H and slot0:checkIgnoreMove(slot0._curVx, slot2) then
			return
		end

		slot0._curVx = slot2
		slot0._curVy = slot3
		slot5 = slot0:checkScrollMoveOffset(slot0._curVx, cc.p(slot0._innerContainer:getPosition()).x, slot0._leftX, slot0._rightX)
		slot6 = slot0:checkScrollMoveOffset(slot0._curVy, cc.p(slot0._innerContainer.getPosition()).y, slot0._bottomY, slot0._topY)

		if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
			slot5 = 0
		elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H then
			slot6 = 0
		end

		slot0:scrollView2(slot4.x + slot5, slot4.y + slot6, nil, false, true)
	end

	slot0._tempTouchPos = slot1
end

CcsScrollView.checkScrollMoveOffset = function (slot0, slot1, slot2, slot3, slot4)
	slot6 = nil

	if slot2 + slot1 < slot4 and slot1 < 0 then
		slot6 = (slot2 + (slot4 - slot0._minPosBounceOffset - slot2) * slot0._easingFactor) - slot2
	elseif slot3 < slot5 and slot1 > 0 then
		slot7 = slot0._maxPosBounceOffset

		if not slot0._canMaxDrag and slot0._isTouching then
			slot7 = 0
		end

		slot6 = (slot2 + ((slot3 + slot7) - slot2) * slot0._easingFactor) - slot2
	end

	if slot6 then
		if math.abs(slot1) < math.abs(slot6) then
			return slot1
		else
			return slot6
		end
	else
		return slot1
	end
end

CcsScrollView.scrollView2 = function (slot0, slot1, slot2, slot3, slot4, slot5)
	TweenLite.killTweensOf(slot0._innerContainer)

	if not slot5 then
		slot1 = slot1 and MathUtil.getValueBetween(slot1, slot0._leftX, slot0._rightX)
		slot2 = slot2 and MathUtil.getValueBetween(slot2, slot0._topY, slot0._bottomY)
	end

	if slot3 then
		slot6 = nil

		if slot4 then
			slot6 = Back.easeOut
		end

		if not slot0._isPauseBounce or not slot4 then
			TweenLite.to(slot0._innerContainer, slot3, {
				x = slot1,
				y = slot2,
				ease = slot6,
				onUpdate = handler(slot0, slot0.onPositionChanged),
				onComplete = handler(slot0, slot0.setBarVisible),
				onCompleteParams = {
					false
				}
			})
		end
	else
		slot0._innerContainer:setPosition(cc.p(slot1 or slot0._innerContainer:getPositionX(), slot2 or slot0._innerContainer:getPositionY()))
		slot0:onPositionChanged()
	end
end

CcsScrollView.deployBtns = function (slot0, slot1, slot2)
	if slot0._preBtn then
		slot0._preBtn:getClickSignal():remove(slot0.onBtnClick, slot0)
		slot0._nextBtn:getClickSignal():remove(slot0.onBtnClick, slot0)
	end

	slot0._preBtn = slot1
	slot0._nextBtn = slot2

	if slot0._preBtn then
		slot0._preBtn:getClickSignal():add(slot0.onBtnClick, slot0)
		slot0._nextBtn:getClickSignal():add(slot0.onBtnClick, slot0)
	end
end

CcsScrollView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0._preBtn then
		slot0:jumpPage(true)
	elseif slot1 == slot0._nextBtn then
		slot0:jumpPage(false)
	end
end

CcsScrollView.jumpPage = function (slot0, slot1)
	slot2, slot3 = nil

	if slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		if slot1 then
			slot2 = slot0._innerContainer:getPositionX() + slot0:getContentSize().width
		else
			slot2 = slot0._innerContainer:getPositionX() - slot0:getContentSize().width
		end
	else
		slot0:jumpTo(slot2, (slot1 and slot0._innerContainer:getPositionY() + slot0:getContentSize().height) or slot0._innerContainer:getPositionY() - slot0:getContentSize().height, 0.3)

		return
	end
end

CcsScrollView.checkBtnsCanShow = function (slot0)
	if slot0._preBtn then
		if slot0._scrollPolicy == CcsScrollView.SCROLL_H then
			slot0._preBtn:setVisible(slot0._innerContainer:getPositionX() < slot0._leftX - 5)
			slot0._nextBtn:setVisible(slot0._innerContainer:getPositionX() > slot0._rightX + 5)
		else
			slot0._preBtn:setVisible(slot0._topY < slot0._innerContainer:getPositionY())
			slot0._nextBtn:setVisible(slot0._innerContainer:getPositionY() < slot0._bottomY)
		end
	end
end

CcsScrollView.onPositionChanged = function (slot0)
	slot0:checkBtnsCanShow()
	slot0:checkItemsVisible()
	slot0:updateScrollBarPosition()
	slot0._onPosChangedSignal:emit()
end

CcsScrollView.checkItemsVisible = function (slot0)
	if slot0._isAutoCheckItemVisible then
		if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
			slot1 = -slot0._innerContainer:getPositionY()
			slot2 = -slot0._innerContainer:getPositionY() + slot0:getContentSize().height

			for slot6, slot7 in ipairs(slot0._scrollItems) do
				if slot7:getParent() == slot0._innerContainer then
					slot11 = slot7:getPositionY() - slot7:getAnchorPoint().y * slot7:getContentSize().height - slot7:getEndGap() < slot2 and (slot1 < slot9 or slot1 < slot7.getPositionY() - slot7.getAnchorPoint().y * slot7.getContentSize().height - slot7.getEndGap() + slot7:getItemSize().height + slot7:getBeginGap() + slot7:getEndGap())

					if slot7:isVisible() ~= slot11 then
						slot7:setVisible(slot11)
					end
				end
			end
		elseif slot0._scrollPolicy == CcsScrollView.SCROLL_H then
		end
	end
end

CcsScrollView.updateUpdateNodePosition = function (slot0)
	if slot0._vUpdateNode then
		slot0._vUpdateNode:setPositionY(0 - slot0._vUpdateNode:getContentSize().height * (1 - slot0._vUpdateNode:getAnchorPoint().y) - slot0._vUpdateNodeGap)
		slot0._vUpdateNode:setVisible(slot0:canShowBottomUpdateNode())
	end
end

CcsScrollView.canShowBottomUpdateNode = function (slot0)
	return slot0._scrollPolicy == CcsScrollView.SCROLL_V and slot0._canScrollBottom2Load and slot0:getContentSize().height < slot0._innerContainerSizeWithMargin.height
end

CcsScrollView.updateScrollBarSize = function (slot0)
	if slot0._vScrollBar then
		slot0._vScrollBar:setContentSize(cc.size(slot0._vScrollBar:getContentSize().width, math.max(slot0._vScrollBarMinHeight, slot0:getContentSize().height * slot0.getContentSize().height / slot0._innerContainerSizeWithMargin.height)))
	end
end

CcsScrollView.isShowScroller = function (slot0)
	return slot0._bottomY - slot0._topY > slot0._topMargin + slot0._bottomMargin
end

CcsScrollView.updateScrollBarPosition = function (slot0)
	if slot0._vScrollBar and slot0:isShowScroller() then
		slot0._vScrollBar:setPosition(cc.p(slot0._vScrollBar:getPositionX(), (slot0:getContentSize().height - slot0._vScrollBar:getContentSize().height * slot0._vScrollBar:getScaleY()) * (slot0._innerContainer:getPositionY() - slot0._bottomY) / (slot0._topY - slot0._bottomY)))
	end
end

CcsScrollView.updateMarginInfos = function (slot0)
	slot0._innerContainerSizeWithMargin.height = math.max(slot0:getContentSize().height, slot0._innerContainerSize.height + slot0._bottomMargin + slot0._topMargin)
	slot0._innerContainerSizeWithMargin.width = math.max(slot0.getContentSize().width, slot0._innerContainerSize.width + slot0._leftMargin + slot0._rightMargin)

	if slot0._scrollPolicy == CcsScrollView.SCROLL_V then
		if slot1.height < slot0._innerContainerSizeWithMargin.height then
			slot0._bottomY = slot0._bottomMargin
		else
			slot0._bottomY = -slot0._topMargin
		end
	end

	slot0._topY = slot1.height - slot0._innerContainerSizeWithMargin.height + slot0._bottomMargin
	slot0._leftX = slot0._leftMargin
	slot0._rightX = slot1.width - slot0._innerContainerSizeWithMargin.width + slot0._leftMargin
end

CcsScrollView.setInnerContainerSize = function (slot0, slot1)
	slot1.height = math.max(slot0:getContentSize().height, slot1.height)
	slot1.width = math.max(slot0.getContentSize().width, slot1.width)

	if slot0._innerContainerSize.width == slot1.width and slot0._innerContainerSize.height == slot1.height then
		return false
	end

	slot3 = slot0._innerContainer:getPositionX()
	slot4 = slot0._innerContainer:getPositionY()
	slot5 = 0
	slot6 = slot0._innerContainerSize.height == 0

	if not slot6 then
		slot5 = math.max(0, slot0._innerContainerSizeWithMargin.height - slot2.height - (slot0._bottomMargin - slot4))
	end

	slot0._innerContainerSize.width = slot1.width
	slot0._innerContainerSize.height = slot1.height

	slot0._innerContainer:setContentSize(slot1)
	slot0:updateMarginInfos()
	slot0:updateScrollBarSize()
	slot0:updateUpdateNodePosition()
	slot0:scrollView2(slot3, (slot0._scrollPolicy == CcsScrollView.SCROLL_V and slot0._bottomMargin - (slot0._innerContainerSizeWithMargin.height - slot0:getContentSize().height - slot5)) or slot0._bottomMargin)

	return true
end

CcsScrollView.removeContentChild = function (slot0, slot1)
	table.removebyvalue(slot0._scrollItems, slot1)

	if slot1:getParent() == slot0._innerContainer then
		slot1:removeFromParent()
	end
end

CcsScrollView.removeAllChildren = function (slot0, slot1)
	slot2 = #slot0._scrollItems

	while slot2 > 0 do
		slot3 = slot0._scrollItems[1]

		if not slot1 and ClassUtil.is(slot3, CcsScrollViewItem) then
			slot3:destroy()
		else
			slot0:removeContentChild(slot3)
		end

		slot2 = slot2 - 1
	end

	slot0._scrollItems = {}
end

CcsScrollView.setContentChild = function (slot0, slot1)
	if slot1:getContentSize().height < slot0:getContentSize().height then
		slot1:setPositionY(slot3.height - slot2.height)
	end

	slot0:addContentChild(slot1)
end

CcsScrollView.addContentChild = function (slot0, slot1)
	if slot1:getParent() ~= slot0._innerContainer then
		DisplayUtil.setAddOrRemoveChild(slot1, slot0._innerContainer, true)

		if ClassUtil.is(slot1, CcsScrollViewItem) then
			TableUtil.push(slot0._scrollItems, slot1)
			slot1:setScrollViewParent(slot0)
			slot1:handleScrollBtns(slot0)
		end
	end
end

CcsScrollView.jumpTo = function (slot0, slot1, slot2, slot3)
	slot0:scrollView2(slot1, slot2, slot3)
end

CcsScrollView.jumpToPercent = function (slot0, slot1, slot2, slot3)
	slot4, slot5 = nil

	if slot1 then
		slot4 = -MathUtil.getValueBetweenByPercent(slot1, slot0._leftX, -slot0._rightX)
	end

	if slot2 then
		slot5 = MathUtil.getValueBetweenByPercent(slot2, slot0._topY, slot0._bottomY)
	end

	slot0:jumpTo(slot4, slot5, slot3)
end

CcsScrollView.setScrollAreaNode = function (slot0, slot1)
	if slot0._scrollAreaNode ~= (slot1 or slot0) then
		if slot0:getScrollAreaNode() then
			slot0:getScrollAreaNode():setTouchEnabled(false)
		end

		slot0._scrollAreaNode = slot1

		slot0._scrollAreaNode:setTouchEnabled(true)
		slot0:getScrollAreaNode():addTouchEventListener(handler(slot0, slot0.onTouchOperation))
	end
end

CcsScrollView.setLongClickIntervalMs = function (slot0, slot1)
	if slot0._longClickIntervalMs ~= slot1 then
		slot0._longClickIntervalMs = slot1

		if slot0._longClickTimer then
			slot0._longClickTimer.delayInMs = slot1
		end
	end
end

CcsScrollView.setCanLongClick = function (slot0, slot1)
	slot0._canLongClick = slot1

	if slot1 then
		if not slot0._longClickTimer then
			slot0._longClickTimer = TimerBase.new(handler(slot0, slot0.onLongClickTimer), slot0._longClickIntervalMs, nil, "CcsScrollView:_longClickTimer")

			slot0._longClickTimer:setAutoDispose(false)
		end

		slot0._longClickTimer:reset()
	elseif slot0._longClickTimer then
		slot0._longClickTimer:destroy()

		slot0._longClickTimer = nil
	end
end

CcsScrollView.onLongClickTimer = function (slot0)
	for slot4, slot5 in ipairs(slot0._scrollItems) do
		if slot5:getIsTouchPushDown() then
			slot5:onLongClick(slot6)
			slot5:setIsTouchPushDown(false, DisplayUtil.ccpCopy(slot0:getScrollAreaNode():getTouchBeganPosition()))

			break
		end
	end
end

CcsScrollView.setVScrollBarTrack = function (slot0, slot1)
	if slot0._vScrollBarTrack ~= slot1 then
		if slot0._vScrollBarTrack then
			slot0._vScrollBarTrack:removeFromParent()
		end

		slot0._vScrollBarTrack = slot1

		slot1:setLocalZOrder(slot0._innerContainer:getLocalZOrder() + 1)
		DisplayUtil.insertChild2(slot1, slot0)
		DisplayUtil.setVisible(slot1, false)
	end
end

CcsScrollView.setVUpdateNode = function (slot0, slot1)
	if slot0._vUpdateNode ~= slot1 then
		if slot0._vUpdateNode then
			slot0._vUpdateNode:removeFromParent()
		end

		slot0._vUpdateNode = slot1

		slot0:setCanScrollBottom2Load(slot1 ~= nil)

		if slot1 then
			slot1:setLocalZOrder(slot0._innerContainer:getLocalZOrder() + 1)
			DisplayUtil.insertChild2(slot1, slot0._innerContainer)
			DisplayUtil.setVisible(slot1, true)
			slot0:updateUpdateNodePosition()
		end
	end
end

CcsScrollView.setVScrollBar = function (slot0, slot1)
	if slot0._vScrollBar ~= slot1 then
		if slot0._vScrollBar then
			slot0._vScrollBar:removeFromParent()
		end

		slot0._vScrollBar = slot1

		slot1:setAnchorPoint(cc.p(0.5, 0))
		slot1:setLocalZOrder(slot0._innerContainer:getLocalZOrder() + 2)
		DisplayUtil.insertChild2(slot1, slot0)
		DisplayUtil.setVisible(slot1, false)
		slot0:updateScrollBarSize()
	end
end

CcsScrollView.destroy = function (slot0)
	TweenLite.killTweensOf(slot0._innerContainer)
	slot0:resetScrollState()

	for slot5, slot6 in ipairs(slot1) do
		slot6:destroy()
	end

	TickBase.destroy(slot0)
	slot0:removeFromParent()

	if slot0._longClickTimer then
		slot0._longClickTimer:destroy()

		slot0._longClickTimer = nil
	end

	if slot0._viewPushSignal then
		slot0._viewPushSignal:removeAll()

		slot0._viewPushSignal = nil
	end

	if slot0._viewTouchSignal then
		slot0._viewTouchSignal:removeAll()

		slot0._viewTouchSignal = nil
	end

	if slot0._itemClickSignal then
		slot0._itemClickSignal:removeAll()

		slot0._itemClickSignal = nil
	end

	if slot0._viewClickSignal then
		slot0._viewClickSignal:removeAll()

		slot0._viewClickSignal = nil
	end

	if slot0._onPosChangedSignal then
		slot0._onPosChangedSignal:removeAll()

		slot0._onPosChangedSignal = nil
	end

	if slot0._loadMoreSignal then
		slot0._loadMoreSignal:removeAll()

		slot0._loadMoreSignal = nil
	end

	if slot0._preBtn then
		slot0._preBtn:getClickSignal():remove(slot0.onBtnClick, slot0)
		slot0._nextBtn:getClickSignal():remove(slot0.onBtnClick, slot0)

		slot0._preBtn = nil
		slot0._nextBtn = nil
	end

	slot0._btnsInHandle = nil
	slot0._btnsDicInHandle = nil
	slot0._scrollItems = nil
end

return
