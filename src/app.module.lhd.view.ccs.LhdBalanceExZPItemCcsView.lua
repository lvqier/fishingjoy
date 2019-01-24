LhdBalanceExZPItemCcsView = class("LhdBalanceExZPItemCcsView")

LhdBalanceExZPItemCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.bg:setSpriteFrame("lhd_balance2_big_solid.png")
end

LhdBalanceExZPItemCcsView.updateView = function (slot0)
	if slot0._data then
		for slot4 = 1, 6, 1 do
			slot5 = slot0["item" .. slot4]

			if slot0._data[slot4] and slot0._data[slot4] ~= 0 then
				slot5:setVisible(true)
				slot5:setSpriteFrame(slot0.controller:getBalancePointTextureZP(slot0._data[slot4]))
			else
				slot5:setVisible(false)
			end
		end
	end
end

LhdBalanceExZPItemCcsView.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
