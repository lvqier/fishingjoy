CcsListViewHorizontalStrategyLite = class("CcsListViewHorizontalStrategyLite")

CcsListViewHorizontalStrategyLite.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, BaseCcsListViewStrategyLite, true, slot1)
end

CcsListViewHorizontalStrategyLite.jumpToItemIndex = function (slot0, slot1, slot2)
	slot0._view:jumpTo(-(MathUtil.getValueBetween(slot1, 1, slot0._dataLen) - 1) * (slot0._itemRealWidth + slot0._gap), nil, slot2)
end

CcsListViewHorizontalStrategyLite.setItem2ThisIndex = function (slot0, slot1, slot2)
	slot4, slot10 = slot1:getPosition()

	slot1:setPosition(cc.p(slot3, slot5))
	BaseCcsListViewStrategyLite.setItem2ThisIndex(slot0, slot1, slot2)
end

CcsListViewHorizontalStrategyLite.calCurShowingItemIndex = function (slot0)
	slot2 = 0

	return (MathUtil.getValueBetween(slot0._view._innerContainer:getPositionX(), slot0._view._leftX, slot0._view._rightX) > 0 and 1) or math.floor(math.abs(slot1) / (slot0._itemRealWidth + slot0._gap)) + 1
end

CcsListViewHorizontalStrategyLite.calCacheItemNum = function (slot0)
	return math.ceil(slot0._view:getContentSize().width / (slot0._itemRealWidth + slot0._gap)) + 1
end

CcsListViewHorizontalStrategyLite.checkContentSizeAndPosition = function (slot0)
	slot1 = 0

	if slot0._dataLen > 0 then
		slot1 = (slot0._itemRealWidth + slot0._gap) * slot0._dataLen - slot0._gap
	end

	slot3 = DisplayUtil.ccpCopy(slot0._view._innerContainer:getPosition())

	if slot0._view:setInnerContainerSize(cc.size(slot1, slot0._itemRealHeight)) then
		slot0._view:jumpTo(slot3.x, nil, 0)
	else
		slot0:onPositionChanged()
	end

	slot5 = slot0._view:getContentSize()

	if slot0._view:getIsCenterWhileNeed() and slot1 < slot5.width then
		slot6 = (slot5.width - slot1) * 0.5

		for slot10, slot11 in ipairs(slot0._cacheItems) do
			slot12, slot18 = slot11:getPosition()

			slot11:setPosition(cc.p(slot12 + slot6, slot13))
		end
	end
end

return
