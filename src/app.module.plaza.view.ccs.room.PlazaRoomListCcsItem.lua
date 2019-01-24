PlazaRoomListCcsItem = class("PlazaRoomListCcsItem")

PlazaRoomListCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.item1.root:setParentItem(slot0)
	slot0.item2.root:setParentItem(slot0)
end

PlazaRoomListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.item1.root:setData(slot0._data[1])
		slot0.item2.root:setData(slot0._data[2])
	else
		slot0.item1.root:setData(nil)
		slot0.item2.root:setData(nil)
	end
end

PlazaRoomListCcsItem.getPushZoomView = function (slot0)
	return nil
end

return
