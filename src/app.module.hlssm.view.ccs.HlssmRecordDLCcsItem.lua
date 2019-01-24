HlssmRecordDLCcsItem = class("HlssmRecordDLCcsItem")

HlssmRecordDLCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
end

HlssmRecordDLCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.bg_0:setVisible(slot0._itemIndex == 1)

		for slot4 = 1, 6, 1 do
			slot5 = slot0["item" .. slot4]

			if slot0._data[slot4] then
				slot5:setVisible(true)
				slot5.root.sp:setSpriteFrame(slot8)
				slot5.root.flag1:setVisible(slot6.bBankerTwoPair)
				slot5.root.flag2:setVisible(slot6.bPlayerTwoPair)

				slot9 = false

				if slot6.cbKingWinner == HLSSM_AREA_XIAN_TIAN_WANG and slot6.cbPlayerCount > 7 then
					slot9 = true
				elseif slot6.cbKingWinner == HLSSM_AREA_ZHUANG_TIAN_WANG and slot6.cbBankerCount > 7 then
					slot9 = true
				end

				slot5.root.king:setVisible(slot9)
				slot5.root.num:setColor(DisplayUtil.rgb2ccc3((slot7 == HLSSM_RESULT_ZHUANG and 14895697) or 5799407))
				slot5.root.num:setString((slot6.pingCount and slot6.pingCount > 0 and slot6.pingCount) or "")
			else
				slot5:setVisible(false)
			end
		end
	end
end

HlssmRecordDLCcsItem.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
