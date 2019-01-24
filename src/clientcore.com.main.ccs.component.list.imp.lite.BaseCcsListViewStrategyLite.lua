BaseCcsListViewStrategyLite = class("BaseCcsListViewStrategyLite")

BaseCcsListViewStrategyLite.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, AbstractCcsListViewStrategy, true, slot1)

	slot1._isAutoCheckItemVisible = false
	slot0._curScrollItemIndex = 0
	slot0._needUpdateAll = true
	slot0._cacheItems = {}
	slot0._cacheItemsNumInNeed = 0
	slot0._itemHeight = 0
	slot0._itemWidth = 0
	slot0._itemRealHeight = 0
	slot0._itemRealWidth = 0
end

BaseCcsListViewStrategyLite.calCurShowingItemIndex = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

BaseCcsListViewStrategyLite.checkContentSizeAndPosition = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()
end

BaseCcsListViewStrategyLite.calCacheItemNum = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

BaseCcsListViewStrategyLite.onScale = function (slot0)
	slot0._itemRealWidth = slot0._itemWidth * slot0._itemScale
	slot0._itemRealHeight = slot0._itemHeight * slot0._itemScale

	slot0:checkContentSizeAndPosition()
end

BaseCcsListViewStrategyLite.onData = function (slot0)
	if slot0._dataLen > 0 then
		slot0._needUpdateAll = true

		slot0:checkItems()
		slot0:checkContentSizeAndPosition()
	else
		slot0:setAllItemDatasFrom(1)
	end
end

BaseCcsListViewStrategyLite.setItem2ThisIndex = function (slot0, slot1, slot2)
	slot1:setItemIndex(slot2)
	slot1:setData(slot0._datas[slot2], slot0._needUpdateAll or not slot0._view:getIsItemUpdateSpeedMode())

	if not slot3 then
		slot0._view:removeContentChild(slot1)
	elseif not slot1:getParent() then
		slot0._view:addContentChild(slot1)
	end
end

BaseCcsListViewStrategyLite.setAllItemDatasFrom = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._cacheItems) do
		slot0:setItem2ThisIndex(slot6, (slot1 + slot5) - 1)
	end
end

BaseCcsListViewStrategyLite.checkItems = function (slot0)
	slot1 = math.min(slot0._cacheItemsNumInNeed, slot0._dataLen)
	slot2 = false

	while slot0._cacheItemsNumInNeed == 0 or #slot0._cacheItems < slot1 do
		slot2 = true
		slot3 = slot0:createItem()
		slot3._itemScale = slot0._itemScale

		slot3:setScale(slot0._itemScale)
		slot0._view:addContentChild(slot3)

		if slot3.onCreateAndAddChild then
			slot3:onCreateAndAddChild()
		end

		if slot0._itemHeight == 0 then
			slot0._itemHeight = slot3:getItemSize().height
			slot0._itemWidth = slot3:getItemSize().width
			slot0._itemRealWidth = slot0._itemWidth * slot0._itemScale
			slot0._itemRealHeight = slot0._itemHeight * slot0._itemScale
			slot0._cacheItemsNumInNeed = slot0:calCacheItemNum()
			slot1 = math.min(slot0._cacheItemsNumInNeed, slot0._dataLen)
		end

		TableUtil.push(slot0._cacheItems, slot3)
	end

	if slot2 then
		DisplayUtil.setAllCascadeOpacityEnabled(slot0._view)
	end
end

BaseCcsListViewStrategyLite.onPositionChanged = function (slot0)
	slot2 = (slot0:calCurShowingItemIndex() + slot0._cacheItemsNumInNeed) - 1

	if slot0:calCurShowingItemIndex() ~= slot0._curScrollItemIndex or slot0._needUpdateAll then
		slot3 = slot0._curScrollItemIndex
		slot0._curScrollItemIndex = slot1

		if slot0._needUpdateAll then
			slot0:setAllItemDatasFrom(slot1)

			slot0._needUpdateAll = false
		else
			if slot1 < slot3 then
				TableUtil.unshift(slot0._cacheItems, TableUtil.pop(slot0._cacheItems))
			else
				TableUtil.push(slot0._cacheItems, TableUtil.shift(slot0._cacheItems))
			end

			slot0:setAllItemDatasFrom(slot1)
		end
	end
end

BaseCcsListViewStrategyLite.destroy = function (slot0)
	slot0:setDatas(nil)

	for slot4, slot5 in ipairs(slot0._cacheItems) do
		slot5:destroy()
	end

	slot0._curScrollItemIndex = nil
	slot0._needUpdateAll = nil
	slot0._cacheItems = nil
	slot0._cacheItemsNumInNeed = nil
	slot0._itemWidth = nil
	slot0._itemHeight = nil
	slot0._itemRealWidth = nil
	slot0._itemRealHeight = nil

	AbstractCcsListViewStrategy.destroy(slot0)
end

return
