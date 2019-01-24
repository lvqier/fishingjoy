BaseCcsListViewStrategyVary = class("BaseCcsListViewStrategyVary")

BaseCcsListViewStrategyVary.ctor = function (slot0, slot1)
	ClassUtil.extends(slot0, AbstractCcsListViewStrategy, true, slot1)

	slot1._isAutoCheckItemVisible = true
	slot0._items = {}
	slot0._itemPools = {}
end

BaseCcsListViewStrategyVary.onData = function (slot0)
	slot0:checkItems()
	slot0:sortItems()
	slot0:setDatasAndcheckContentSizeAndPosition()
end

BaseCcsListViewStrategyVary.setDatasAndcheckContentSizeAndPosition = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()
end

BaseCcsListViewStrategyVary.checkItems = function (slot0)
	slot3 = false

	if #slot0._items < #slot0._datas then
		for slot7 = slot1 + 1, slot2, 1 do
			if not TableUtil.pop(slot0._itemPools) then
				slot8 = slot0:createItem()
				slot3 = true
			end

			TableUtil.push(slot0._items, slot8)
			slot0._view:addContentChild(slot8)

			if slot8.onCreateAndAddChild then
				slot8:onCreateAndAddChild()
			end
		end
	elseif slot2 < slot1 then
		slot4 = slot2 + 1

		while slot2 < slot1 do
			table.remove(slot0._items, slot4)
			slot0._view:removeContentChild(slot5)
			TableUtil.push(slot0._itemPools, slot5)
			slot0._items[slot4]:setData(nil)

			slot1 = slot1 - 1
		end
	end

	if slot3 then
		DisplayUtil.setAllCascadeOpacityEnabled(slot0._view)
	end
end

BaseCcsListViewStrategyVary.sortItems = function (slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0._items) do
		slot7:setScale(slot0._itemScale)

		slot8 = slot7:getData()
		slot9 = false

		for slot13, slot14 in ipairs(slot0._datas) do
			if slot14 == slot8 and not slot1[slot13] then
				slot1[slot13] = slot7
				slot9 = true

				break
			end
		end

		if not slot9 then
			TableUtil.push(slot2, slot7)
		end
	end

	for slot6 = 1, slot0._dataLen, 1 do
		if slot1[slot6] or TableUtil.shift(slot2) then
			slot0._items[slot6] = slot7
		else
			errorMgr:throw("why?")
		end
	end
end

BaseCcsListViewStrategyVary.onScale = function (slot0)
	slot0:setDatasAndcheckContentSizeAndPosition()
end

BaseCcsListViewStrategyVary.destroy = function (slot0)
	for slot4, slot5 in ipairs(slot0._items) do
		slot5:destroy()
	end

	for slot4, slot5 in ipairs(slot0._itemPools) do
		slot5:destroy()
	end

	slot0._items = nil
	slot0._itemPools = nil

	AbstractCcsListViewStrategy.destroy(slot0)
end

return
