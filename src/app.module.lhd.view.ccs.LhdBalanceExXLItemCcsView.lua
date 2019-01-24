LhdBalanceExXLItemCcsView = class("LhdBalanceExXLItemCcsView")

LhdBalanceExXLItemCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.bg:setSpriteFrame("lhd_balance2_middle_solid.png")
end

LhdBalanceExXLItemCcsView.updateView = function (slot0)
	if slot0._data then
		for slot4 = 1, 12, 1 do
			slot5 = slot0["item" .. slot4]
			slot6 = (slot4 >= 7 and 2) or 1

			if math.mod(slot4, 6) == 0 then
				slot7 = 6
			end

			if slot0._data[slot6] ~= nil and slot0._data[slot6][slot7] and slot0._data[slot6][slot7] ~= 0 then
				slot5:setVisible(true)
				slot5:setSpriteFrame(slot0.controller:getBalancePointTextureXL(slot0._data[slot6][slot7]))
			else
				slot5:setVisible(false)
			end
		end
	end
end

LhdBalanceExXLItemCcsView.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
