AccountHeadCcsItem = class("AccountHeadCcsItem")

AccountHeadCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._items = {}
	slot1 = 1

	while true do
		if not slot0["iconNode" .. slot1] then
			break
		else
			table.insert(slot0._items, slot2)
		end

		slot1 = slot1 + 1
	end
end

AccountHeadCcsItem.updateView = function (slot0)
	if slot0._data then
		for slot4, slot5 in ipairs(slot0._items) do
			slot5.root:setData(slot0._data[slot4])
		end
	end
end

AccountHeadCcsItem.onClick = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._items) do
		if DisplayUtil.hitTestNode(slot6, slot1) and slot0._data[slot5] then
			slot0.model:setHeadSelectedGender(slot0._data[slot5].gender)
			slot0.model:setHeadSelectedId(slot0._data[slot5].faceId, slot0._data[slot5].gender ~= slot0.model:getHeadSelectedGender())

			break
		end
	end
end

AccountHeadCcsItem.onPushDownChanged = function (slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot0._items) do
		if slot2 and DisplayUtil.hitTestNode(slot8, slot3) then
			TweenLite.to(slot8.root, 0.2, {
				scale = 1.1
			})
		else
			TweenLite.to(slot8.root, 0.2, {
				scale = 1
			})
		end
	end
end

AccountHeadCcsItem.getPushZoomView = function (slot0)
	return nil
end

AccountHeadCcsItem.destroy = function (slot0)
	for slot4, slot5 in pairs(slot0._items) do
		slot5.root:destroy()
	end

	CcsListViewItem.destroy(slot0)
end

return
