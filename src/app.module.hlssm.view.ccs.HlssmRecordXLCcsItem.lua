HlssmRecordXLCcsItem = class("HlssmRecordXLCcsItem")

HlssmRecordXLCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
end

HlssmRecordXLCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.bg_0:setVisible(slot0._itemIndex == 1)

		for slot4 = 1, 6, 1 do
			slot5 = slot0["item" .. slot4]

			if slot0._data[slot4] then
				slot5:setVisible(true)
				slot5:setSpriteFrame(slot0.controller:getTextureName(HlssmRecordCcsView.VIEW_TYPE_XIAO_LU, slot6))
			else
				slot5:setVisible(false)
			end
		end
	end
end

HlssmRecordXLCcsItem.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
