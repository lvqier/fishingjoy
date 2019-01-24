slot2 = "CommonRoomListCcsItem"
CommonRoomListCcsItem = class(slot1)

CommonRoomListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot4 = slot0

	slot0.item1.root.setParentItem(slot2, slot0.item1.root)

	slot4 = slot0

	slot0.item2.root.setParentItem(slot2, slot0.item2.root)
end

CommonRoomListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot4 = slot0._data[1]

		slot0.item1.root.setData(slot2, slot0.item1.root)

		slot4 = slot0._data[2]

		slot0.item2.root.setData(slot2, slot0.item2.root)
	else
		slot4 = nil

		slot0.item1.root.setData(slot2, slot0.item1.root)

		slot4 = nil

		slot0.item2.root.setData(slot2, slot0.item2.root)
	end
end

CommonRoomListCcsItem.getPushZoomView = function (slot0)
	return nil
end

return
