HlssmOnlineCcsItem = class("HlssmOnlineCcsItem")

HlssmOnlineCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._items = {}
	slot1 = 1

	while true do
		if not slot0["item" .. slot1] then
			break
		else
			table.insert(slot0._items, slot2)
		end

		slot1 = slot1 + 1
	end
end

HlssmOnlineCcsItem.updateView = function (slot0)
	if slot0._data then
		for slot4, slot5 in ipairs(slot0._items) do
			slot5.root:setUserData(slot0._data[slot4])
		end
	end
end

HlssmOnlineCcsItem.getPushZoomView = function (slot0)
	return nil
end

return
