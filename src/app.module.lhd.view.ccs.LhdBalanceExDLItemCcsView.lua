LhdBalanceExDLItemCcsView = class("LhdBalanceExDLItemCcsView")

LhdBalanceExDLItemCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.bg:setSpriteFrame("lhd_balance2_small_solid.png")
end

LhdBalanceExDLItemCcsView.updateView = function (slot0)
	if slot0._data then
		for slot4 = 1, 6, 1 do
			slot5 = slot0["item" .. slot4]

			if slot0._data[slot4] and slot5 and slot0._data[slot4] ~= 0 then
				slot5:setVisible(true)
				slot5:setSpriteFrame(slot0.controller:getBalancePointTextureDL(slot0._data[slot4].result))
				slot5.num:setColor(DisplayUtil.rgb2ccc3((slot0._data[slot4].result == LHD_BALANCE_TIGER and 14895697) or 5799407))
				slot5.num:setString((slot0._data[slot4].drawCount and slot0._data[slot4].drawCount > 0 and slot0._data[slot4].drawCount) or "")
			else
				slot5:setVisible(false)
			end
		end
	end
end

LhdBalanceExDLItemCcsView.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
