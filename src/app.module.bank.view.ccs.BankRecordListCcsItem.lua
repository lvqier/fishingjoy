slot2 = "BankRecordListCcsItem"
BankRecordListCcsItem = class(slot1)

BankRecordListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

BankRecordListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot4 = slot0._data.CollectDate

		slot0.txtDate.setString(slot2, slot0.txtDate)

		slot4 = true

		slot0.txtMoney_tf.setIsAssetVCenter(slot2, slot0.txtMoney_tf)

		slot4 = Hero

		if slot0._data.TargetGameID == Hero.getDwGameID(slot0.txtMoney_tf) then
			slot4 = "[受赠]" .. slot0._data.SourceNickName .. "（id:" .. slot0._data.SourceGameID .. "）"

			slot0.txtName.setString(slot2, slot0.txtName)

			slot3 = slot0.txtMoney_tf
			slot7 = "#plist_font_yellow_4_%s.png"

			slot0.txtMoney_tf.setHtmlText(slot2, HtmlUtil.createArtNumDotSign(slot0._data.SourceNickName, slot0._data.SwapScore))
		else
			slot4 = Hero

			if slot0._data.SourceGameID == Hero.getDwGameID(slot3) then
				slot4 = "[赠予]" .. slot0._data.TargetNickName .. "（id:" .. slot0._data.TargetGameID .. "）"

				slot0.txtName.setString(slot2, slot0.txtName)

				slot3 = slot0.txtMoney_tf
				slot7 = "#plist_font_blue_5_%s.png"

				slot0.txtMoney_tf.setHtmlText(slot2, HtmlUtil.createArtNumDotSign(slot0._data.TargetNickName, slot0._data.SwapScore * -1))
			end
		end
	end
end

BankRecordListCcsItem.destroy = function (slot0)
	slot3 = slot0.txtMoney_tf

	slot0.txtMoney_tf.destroy(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
