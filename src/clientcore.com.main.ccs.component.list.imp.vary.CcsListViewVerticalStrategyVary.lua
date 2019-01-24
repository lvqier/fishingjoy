CcsListViewVerticalStrategyVary = class("CcsListViewVerticalStrategyVary")

CcsListViewVerticalStrategyVary.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, BaseCcsListViewStrategyVary, true, slot1)
end

CcsListViewVerticalStrategyVary.onPositionChanged = function (slot0)
	return
end

CcsListViewVerticalStrategyVary.setDatasAndcheckContentSizeAndPosition = function (slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0._items) do
		slot7:setItemIndex(slot6)

		if not slot1 then
			slot7:setData(slot0._datas[slot6], slot0._view:getForceUpdateItem())
		end

		slot2 = slot2 + slot7:getItemSize().height * slot0._itemScale + slot0._gap + slot7:getBeginGap() + slot7:getEndGap()
	end

	if #slot0._items > 0 then
		slot2 = slot2 - slot0._gap
	end

	slot4 = math.max(slot2, slot0._view:getContentSize().height)

	for slot8 = 1, #slot0._items, 1 do
		slot0._items[slot8].setPosition(slot9, slot0._items[slot8].getAnchorPoint(slot9).x * slot0._items[slot8].getItemSize(slot9).width * slot0._itemScale, slot4 - slot0._items[slot8].getItemSize(slot9).height * slot0._itemScale - slot0._items[slot8].getBeginGap(slot9) + slot0._items[slot8].getAnchorPoint(slot9).y * slot0._items[slot8]:getItemSize().height * slot0._itemScale)

		slot4 = slot4 - slot0._items[slot8].getItemSize(slot9).height * slot0._itemScale - slot0._items[slot8].getBeginGap(slot9) - slot0._gap - slot0._items[slot8]:getEndGap()
	end

	if not slot0._view:setInnerContainerSize(cc.size(slot3.width, slot2)) then
		slot0._view:checkItemsVisible()
	end
end

CcsListViewVerticalStrategyVary.jumpToItemIndex = function (slot0, slot1, slot2)
	errorMgr:throwMethodShouldBeOverwritten()
end

return
