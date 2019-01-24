FishTdExitListRow = class("FishTdExitListRow")

FishTdExitListRow.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._items = {}
	slot1 = 1

	while true do
		if slot0["item" .. slot1] then
			table.insert(slot0._items, slot2)
		else
			break
		end

		slot1 = slot1 + 1
	end
end

FishTdExitListRow.onBtnClick = function (slot0, slot1, slot2)
	return
end

FishTdExitListRow.onScrollViewParentChanged = function (slot0)
	if slot0._scrollViewParent then
		for slot4, slot5 in ipairs(slot0._items) do
			slot5.root:handleScrollBtns(slot0._scrollViewParent)
		end
	end
end

FishTdExitListRow.updateView = function (slot0)
	if slot0._data then
		for slot4, slot5 in ipairs(slot0._items) do
			slot5:setVisible(slot0._data[slot4] ~= nil)
			slot5.root:setData(slot6, true)
		end
	end
end

FishTdExitListRow.getPushZoomView = function (slot0)
	return nil
end

FishTdExitListRow.destroy = function (slot0)
	for slot4, slot5 in ipairs(slot0._items) do
		destroySomeObj(slot5.root)
	end

	CcsListViewItem.destroy(slot0)
end

return FishTdExitListRow
