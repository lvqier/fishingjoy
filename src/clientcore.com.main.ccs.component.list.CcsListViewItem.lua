CcsListViewItem = class("CcsListViewItem")

CcsListViewItem.ctor = function (slot0)
	ClassUtil.extends(slot0, CcsScrollViewItem)

	slot0._itemScale = 1

	createSetterGetter(slot0, "data", nil, false, false, false, false, handler(slot0, slot0.updateView))
	createSetterGetter(slot0, "itemIndex", nil, false, false, false, false, handler(slot0, slot0.onItemIndexChanged))
end

CcsListViewItem.onItemIndexChanged = function (slot0)
	return
end

CcsListViewItem.onCreateAndAddChild = function (slot0)
	return
end

CcsListViewItem.onPushDownChanged = function (slot0, slot1, slot2, slot3)
	if slot1 then
		slot4 = 1

		if slot1 == slot0 then
			slot4 = slot0._itemScale
		end

		if slot2 then
			TweenLite.to(slot1, 0.1, {
				scale = 0.98 * slot4
			})
		else
			TweenLite.to(slot1, 0.1, {
				scale = 1 * slot4
			})
		end
	end
end

CcsListViewItem.updateView = function (slot0)
	return
end

CcsListViewItem.destroy = function (slot0)
	slot0._data = nil
	slot0._itemIndex = nil

	CcsScrollViewItem.destroy(slot0)
end

return
