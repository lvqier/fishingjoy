CcsSliderView = class("CcsSliderView", function ()
	return ccui.Layout:create()
end)

CcsSliderView.ctor = function (slot0, slot1)
	slot0:setAnchorPoint(cc.p(0, 0))
	createSetterGetter(slot0, "datas", {}, false, true)
	createSetterGetter(slot0, "pageChangeBeginSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "pageChangeCompleteSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "itemClickSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "itemResCcsFileName", nil)
	createSetterGetter(slot0, "innerContainer", ccui.Layout:create(), false, true)
	createSetterGetter(slot0, "vScrollBar", nil, false, true)
	createSetterGetter(slot0, "scrollAreaNode", nil, false, true)
	createSetterGetter(slot0, "bounceFactor", 0.8)
	createSetterGetter(slot0, "dragFactor", 0.8)
	slot0._innerContainer:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0._innerContainer)
	slot0:setClippingEnabled(true)
	slot0:setTouchEnabled(false)
	slot0:setScrollAreaNode(slot1 or slot0)

	slot0._tempTouchPos = nil
	slot0._itemGap = 0
	slot0._v = 0
	slot0._pageTotal = 0
	slot0._curPageIndex = 1
	slot0._isScrollMoving = false
	slot0._isTweening = false
	slot0._dataLen = 0
	slot0._tempDataFromIndex = nil
	slot0._cacheItems = {}
	slot0._cacheItemsNumInNeed = 0
	slot0._itemHeight = 0
	slot0._itemWidth = 0
	slot0._itemRealHeight = 0
	slot0._itemRealWidth = 0
	slot0._itemScale = 1
	slot0._isPushDownNotMove = false
	slot0._isItemClickable = true
end

CcsSliderView.setDatas = function (slot0, slot1, slot2)
	slot0._datas = slot1 or {}
	slot0._dataLen = #(slot1 or )
	slot0._pageTotal = slot0._dataLen

	if slot0._dataLen > 0 then
		slot4 = 1

		if not (slot0._cacheItemsNumInNeed == 0) then
			slot4 = math.min(slot0._pageTotal, slot0._curPageIndex)
		end

		slot0:checkItems()
		slot0:checkItemPosition()
		slot0:jump2Page(slot4)
	end
end

CcsSliderView.checkItems = function (slot0)
	slot1 = math.min(slot0._cacheItemsNumInNeed, slot0._dataLen)

	while slot0._cacheItemsNumInNeed == 0 or #slot0._cacheItems < slot1 do
		slot2 = slot0:createItem()

		slot2:setScale(slot0._itemScale)
		slot0._innerContainer:addChild(slot2)

		if slot0._itemHeight == 0 then
			slot0._itemHeight = slot2:getItemSize().height
			slot0._itemWidth = slot2:getItemSize().width
			slot0._itemRealWidth = slot0._itemWidth * slot0._itemScale
			slot0._itemRealHeight = slot0._itemHeight * slot0._itemScale
			slot0._cacheItemsNumInNeed = slot0:calCacheItemNum()
			slot1 = math.min(slot0._cacheItemsNumInNeed, slot0._dataLen)
		end

		TableUtil.push(slot0._cacheItems, slot2)
	end
end

CcsSliderView.calCacheItemNum = function (slot0)
	return math.ceil(slot0:getContentSize().width / (slot0._itemRealWidth + slot0._itemGap)) + 1
end

CcsSliderView.checkItemPosition = function (slot0)
	slot1 = 0
	slot1 = (-slot0._innerContainer:getPositionX() % (slot0._itemRealWidth + slot0._itemGap) >= slot0._itemRealWidth or math.ceil(-slot0._innerContainer:getPositionX() / (slot0._itemRealWidth + slot0._itemGap))) and math.ceil(-slot0._innerContainer.getPositionX() / (slot0._itemRealWidth + slot0._itemGap)) + 1

	if slot0._tempDataFromIndex ~= MathUtil.getValueBetween(slot1, 1, slot0._pageTotal) then
		slot0._tempDataFromIndex = slot1

		slot0:rearrangeItems(slot1)

		for slot9, slot10 in ipairs(slot0._cacheItems) do
			slot10:setPosition(cc.p((slot0._itemRealWidth + slot0._itemGap) * ((slot1 + slot9) - 1 - 1), 0))

			if slot0._datas[(slot1 + slot9) - 1] ~= nil then
				slot10:setItemIndex(slot11)
				slot10:setData(slot12)
			end

			DisplayUtil.setAddOrRemoveChild(slot10, slot0._innerContainer, slot12 ~= nil)
		end
	end
end

CcsSliderView.rearrangeItems = function (slot0, slot1)
	if slot1 then
		slot2 = nil

		for slot6, slot7 in ipairs(slot0._cacheItems) do
			if slot7:getItemIndex() == slot1 then
				slot2 = slot6

				break
			end
		end

		if slot2 and slot2 > 1 then
			slot0._cacheItems = TableUtil.concat(slot0._cacheItems, TableUtil.removeByPos(slot0._cacheItems, 1, slot2 - 1))
		end
	end
end

CcsSliderView.createItem = function (slot0)
	slot1 = nil

	if type(slot0._itemResCcsFileName) == "string" then
		slot1 = ResConfig.loadCsLayout(slot0._itemResCcsFileName, slot0)
	elseif type(slot0._itemResCcsFileName) == "table" then
		slot0._itemResCcsFileName.new(true).model = slot0.model
		slot0._itemResCcsFileName.new(true).controller = slot0.controller

		if slot0._itemResCcsFileName.new(true).onCreationComplete then
			slot1:onCreationComplete()
		end
	end

	return slot1
end

CcsSliderView.onScrollReach = function (slot0, slot1)
	slot0._isTweening = false

	if slot1 then
		slot0._pageChangeCompleteSignal:emit()
	end
end

CcsSliderView.jump2ItemData = function (slot0, slot1, slot2)
	if table.indexof(slot0._datas, slot1) then
		slot0:jump2Page(slot3, slot2)
	end
end

CcsSliderView.jump2Page = function (slot0, slot1, slot2)
	slot3 = slot0._curPageIndex ~= slot1

	if not slot0._isTweening or slot3 then
		slot0._curPageIndex = slot1
		slot0._isTweening = true
		slot2 = slot2 or 0

		if slot3 then
			slot0._pageChangeBeginSignal:emit()
		end

		TweenLite.killTweensOf(slot0._innerContainer)
		TweenLite.to(slot0._innerContainer, slot2, {
			x = slot0:getContentSize().width * 0.5 - ((slot1 - 1) * (slot0._itemRealWidth + slot0._itemGap) + slot0._itemRealWidth * 0.5),
			onComplete = handler(slot0, slot0.onScrollReach),
			onCompleteParams = {
				slot3
			},
			onUpdate = handler(slot0, slot0.checkItemPosition)
		})
	end
end

CcsSliderView.setScrollAreaNode = function (slot0, slot1)
	if slot0._scrollAreaNode ~= (slot1 or slot0) then
		if slot0:getScrollAreaNode() then
			slot0:getScrollAreaNode():setTouchEnabled(false)
		end

		slot1:setBackGroundColorType(0)

		slot0._scrollAreaNode = slot1

		slot0._scrollAreaNode:setTouchEnabled(true)
		slot0:getScrollAreaNode():addTouchEventListener(handler(slot0, slot0.onTouchOperation))
	end
end

CcsSliderView.onTouchOperation = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0:checkTouchBegin(DisplayUtil.ccpCopy(slot0._scrollAreaNode:getTouchBeganPosition()))
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot0:checkTouchMove(DisplayUtil.ccpCopy(slot0._scrollAreaNode:getTouchMovePosition()))
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED or slot2 == ccs.TOUCH_EVENT_ENDED then
		slot0:checkTouchEnd(DisplayUtil.ccpCopy(slot0._scrollAreaNode:getTouchEndPosition()))
	else
		return
	end
end

CcsSliderView.checkTouchMove = function (slot0, slot1)
	if slot1.x - slot0._tempTouchPos.x ~= 0 then
		slot3 = slot0._innerContainer:getPositionX()
		slot0._isScrollMoving = true
		slot0._v = (((slot2 > 0 and slot0._curPageIndex == 1) or (slot2 < 0 and slot0._curPageIndex == slot0._pageTotal)) and slot2 * slot0._bounceFactor) or slot2 * slot0._dragFactor
		slot0._v = (slot0._v * (slot0._itemRealWidth + slot0._itemGap)) / slot0:getContentSize().width

		if slot0._v > 0 or slot0._v < 0 then
			slot4, slot10 = slot0._innerContainer:getPosition()

			slot0._innerContainer:setPosition(cc.p(slot4 + slot0._v, slot5))

			slot0._tempTouchPos = slot1

			slot0:checkItemPosition()
		end

		if slot0._isPushDownNotMove then
			slot0._isPushDownNotMove = false

			for slot7, slot8 in ipairs(slot0._cacheItems) do
				slot8:setIsTouchPushDown(false, slot1)
			end
		end
	end
end

CcsSliderView.checkTouchBegin = function (slot0, slot1)
	slot0._tempTouchPos = DisplayUtil.ccpCopy(slot1)
	slot0._v = 0
	slot0._isPushDownNotMove = true

	slot0:checkScrollItemsPushDown(slot0._tempTouchPos)
end

CcsSliderView.checkTouchEnd = function (slot0, slot1)
	slot0:checkScrollItemsRelease(slot1)

	if slot0._v == 0 then
		return
	end

	slot2 = slot0._curPageIndex

	if slot0._v > 0 and slot0._curPageIndex > 1 then
		slot2 = slot0._curPageIndex - 1
	elseif slot0._v < 0 and slot0._curPageIndex < slot0._pageTotal then
		slot2 = slot0._curPageIndex + 1
	end

	slot0:jump2Page(slot2, 0.2)
end

CcsSliderView.checkScrollItemsPushDown = function (slot0, slot1)
	if slot0._isItemClickable then
		slot2 = false

		for slot6, slot7 in ipairs(slot0._cacheItems) do
			if slot2 then
				slot7:setIsTouchPushDown(false, slot1)
			else
				slot7:setIsTouchPushDown(slot7:checkTouchInMe(slot1), slot1)
			end
		end
	end
end

CcsSliderView.getCurSelectedData = function (slot0)
	return slot0._datas[slot0._curPageIndex]
end

CcsSliderView.checkScrollItemsRelease = function (slot0, slot1)
	slot2 = nil

	for slot6, slot7 in ipairs(slot0._cacheItems) do
		if slot7:getIsTouchPushDown() then
			if slot7:checkTouchInMe(slot1) then
				slot2 = slot7
			end

			slot7:setIsTouchPushDown(false, slot1)

			break
		end
	end

	if slot2 then
		slot0._itemClickSignal:emit(slot2)
		slot2:onClick(slot1)
		slot0:jump2Page(slot2:getItemIndex(), 0.2)
	end
end

return
