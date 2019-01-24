slot2 = "BaseOnlineCcsItem"
BaseOnlineCcsItem = class(slot1)

BaseOnlineCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0._items = {}
	slot1 = 1

	while true do
		if not slot0["item" .. slot1] then
			break
		else
			slot6 = slot2

			table.insert(slot4, slot0._items)
		end

		slot1 = slot1 + 1
	end
end

BaseOnlineCcsItem.updateView = function (slot0)
	if slot0._data then
		slot3 = slot0._items

		for slot4, slot5 in ipairs(slot2) do
			slot10 = true

			slot5.root.setUserData(slot7, slot5.root, slot0._data[slot4])
		end
	end
end

BaseOnlineCcsItem.getPushZoomView = function (slot0)
	return nil
end

BaseOnlineCcsItem.destroy = function (slot0)
	slot3 = slot0._items

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5.root

		slot5.root.destroy(slot7)
	end

	slot0._items = nil
end

return
