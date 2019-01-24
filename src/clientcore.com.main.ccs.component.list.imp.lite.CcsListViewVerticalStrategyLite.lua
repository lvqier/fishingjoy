CcsListViewVerticalStrategyLite = class("CcsListViewVerticalStrategyLite")

CcsListViewVerticalStrategyLite.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, BaseCcsListViewStrategyLite, true, slot1)
end

CcsListViewVerticalStrategyLite.jumpToItemIndex = function (slot0, slot1, slot2)
	slot0._view:jumpTo(nil, -(slot0._view:getInnerContainerSize().height - (MathUtil.getValueBetween(slot1, 1, slot0._dataLen) - 1) * (slot0._itemRealHeight + slot0._gap) - slot0._view:getContentSize().height), slot2)
end

CcsListViewVerticalStrategyLite.calCurShowingItemIndex = function (slot0)
	return math.floor(math.max(0, (slot0._view:getInnerContainerSize().height + MathUtil.getValueBetween(slot0._view._innerContainer:getPositionY(), slot0._view._bottomY, slot0._view._topY)) - slot0._view:getContentSize().height) / (slot0._itemRealHeight + slot0._gap)) + 1
end

CcsListViewVerticalStrategyLite.setItem2ThisIndex = function (slot0, slot1, slot2)
	slot1:setPosition(cc.p(slot1:getPositionX(), slot0._view:getInnerContainerSize().height - slot2 * (slot0._itemRealHeight + slot0._gap) + slot0._gap + slot0._itemRealHeight * slot1:getAnchorPoint().y))
	BaseCcsListViewStrategyLite.setItem2ThisIndex(slot0, slot1, slot2)
end

CcsListViewVerticalStrategyLite.calCacheItemNum = function (slot0)
	return math.ceil(slot0._view:getContentSize().height / (slot0._itemRealHeight + slot0._gap)) + 1
end

CcsListViewVerticalStrategyLite.checkContentSizeAndPosition = function (slot0)
	slot1 = 0

	if slot0._dataLen > 0 then
		slot1 = (slot0._itemRealHeight + slot0._gap) * slot0._dataLen - slot0._gap
	end

	slot3 = DisplayUtil.ccpCopy(slot0._view._innerContainer:getPosition())
	slot4 = cc.size(slot0._view:getInnerContainerSize().width, slot0._view.getInnerContainerSize().height)

	if slot0._view:setInnerContainerSize(cc.size(slot0._itemWidth, slot1)) then
		slot0._view:jumpTo(nil, -(slot2.height - (slot4.height - slot0._view:getContentSize().height + slot3.y) - slot0._view:getContentSize().height), 0)
	else
		slot0:onPositionChanged()
	end
end

return
