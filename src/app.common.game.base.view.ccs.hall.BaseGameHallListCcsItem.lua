slot2 = "BaseGameHallListCcsItem"
BaseGameHallListCcsItem = class(slot1)

BaseGameHallListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0._items = {}
	slot1 = 1

	while true do
		if slot0["item" .. slot1] then
			slot6 = slot2

			table.insert(slot4, slot0._items)
		else
			break
		end

		slot1 = slot1 + 1
	end
end

BaseGameHallListCcsItem.playClickSoundEffect = function (slot0)
	return
end

BaseGameHallListCcsItem.onBtnClick = function (slot0, slot1, slot2)
	return
end

BaseGameHallListCcsItem.onScrollViewParentChanged = function (slot0)
	if slot0._scrollViewParent then
		slot3 = slot0._items

		for slot4, slot5 in ipairs(slot2) do
			slot9 = slot0._scrollViewParent

			slot5.root.handleScrollBtns(slot7, slot5.root)
		end
	end
end

BaseGameHallListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot3 = slot0._items

		for slot4, slot5 in ipairs(slot2) do
			slot10 = slot0._data[slot4] ~= nil

			slot5.setVisible(slot8, slot5)

			slot11 = true

			slot5.root.setData(slot8, slot5.root, slot6)
		end
	end
end

BaseGameHallListCcsItem.getPushZoomView = function (slot0)
	return nil
end

BaseGameHallListCcsItem.destroy = function (slot0)
	slot3 = slot0._items

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5.root

		destroySomeObj(slot7)
	end

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
