slot2 = "PdkResultCcsItem"
PdkResultCcsItem = class(slot1)

PdkResultCcsItem.onCreationComplete = function (slot0)
	slot9 = false
	slot13 = slot0.onDataChanged

	createSetterGetter(slot2, slot0, "data", nil, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onIsWinChanged

	createSetterGetter(slot2, slot0, "isWin", true, false, false, false, handler(slot11, slot0))

	slot3 = slot0

	slot0.onDataChanged(slot2)

	slot3 = slot0

	slot0.onIsWinChanged(slot2)
end

PdkResultCcsItem.onIsWinChanged = function (slot0)
	if slot0._isWin then
		slot3 = "#eadbc9"

		if not DisplayUtil.rgb2ccc3(slot2) then
			slot3 = "#e7e7e7"
			slot1 = DisplayUtil.rgb2ccc3(slot2)
		end
	end

	if slot0._isWin then
		slot4 = "#f2db92"

		if not DisplayUtil.rgb2ccc3(slot3) then
			slot4 = "#90cdf4"
			slot2 = DisplayUtil.rgb2ccc3(slot3)
		end
	end

	slot3 = (slot0._isWin and "#plist_pdk_font_result_2_%s.png") or "#plist_pdk_font_result_4_%s.png"
	slot4 = (slot0._isWin and "#plist_pdk_font_result_1_%s.png") or "#plist_pdk_font_result_3_%s.png"

	if slot0._isWin then
		slot7 = slot0.ni
		slot11 = "common/pdk_icon_ni2.png"

		slot0.ni.setTexture(slot6, slot0.controller.getUIPath(slot9, slot0.controller))

		slot7 = slot0.select
		slot11 = "common/pdk_pane4.png"

		slot0.select.setTexture(slot6, slot0.controller.getUIPath(slot9, slot0.controller))
	else
		slot7 = slot0.ni
		slot11 = "common/pdk_icon_ni1.png"

		slot0.ni.setTexture(slot6, slot0.controller.getUIPath(slot9, slot0.controller))

		slot7 = slot0.select
		slot11 = "common/pdk_pane3.png"

		slot0.select.setTexture(slot6, slot0.controller.getUIPath(slot9, slot0.controller))
	end

	if slot0._data then
		slot0._color = (slot0._data.viewChairId == PDK_VIEW_CHAIRID_ME and slot2) or slot1
		slot0._plistFile = (slot0._data.viewChairId == PDK_VIEW_CHAIRID_ME and slot4) or slot3
		slot8 = slot0

		slot0.onDataChanged(slot7)
	end
end

PdkResultCcsItem.onDataChanged = function (slot0)
	if slot0._data then
		slot4 = slot0._data.viewChairId == PDK_VIEW_CHAIRID_ME

		slot0.select.setVisible(slot2, slot0.select)

		slot4 = slot0._data.viewChairId == PDK_VIEW_CHAIRID_ME

		slot0.ni.setVisible(slot2, slot0.ni)

		if slot0._plistFile then
			slot3 = slot0.txtBean_tf
			slot14 = -1

			slot0.txtBean_tf.setHtmlText(slot2, HtmlUtil.createArtNumDotSign(slot5, slot0._data.score, slot0._plistFile, nil, nil, nil, nil, nil, nil))

			slot1 = ""

			if slot0._data.beiGuan then
				slot5 = "txt/pdk_txt_beiguan.png"
				slot1 = slot0.controller.getUIPath(slot3, slot0.controller)
			elseif slot0._data.fanGuan then
				slot5 = "txt/pdk_txt_fanguan.png"
				slot1 = slot0.controller.getUIPath(slot3, slot0.controller)
			elseif slot0._data.baoPei then
				slot5 = "txt/pdk_txt_baopei.png"
				slot1 = slot0.controller.getUIPath(slot3, slot0.controller)
			end

			slot5 = slot1 ~= ""

			slot0.icon.setVisible(slot3, slot0.icon)

			if slot1 ~= "" then
				slot5 = slot1

				slot0.icon.setTexture(slot3, slot0.icon)

				slot7 = slot0.txtBean_tf
				slot5 = 746 + slot0.txtBean_tf.getTextWidth(slot6) * 0.5 + 40

				slot0.icon.setPositionX(slot3, slot0.icon)
			end

			slot4 = slot0.txtCount_tf
			slot15 = -1

			slot0.txtCount_tf.setHtmlText(slot3, HtmlUtil.createArtNumDotSign(slot6, slot0._data.count, slot0._plistFile, nil, nil, nil, nil, nil, nil))

			slot4 = slot0.txtCellScore_tf
			slot8 = slot0._plistFile

			slot0.txtCellScore_tf.setHtmlText(slot3, HtmlUtil.createArtNum(slot6, slot0._data.cellScore))
		else
			slot4 = slot0._data.score

			slot0.txtBean_tf.setHtmlText(slot2, slot0.txtBean_tf)

			slot4 = slot0._data.count

			slot0.txtCount_tf.setHtmlText(slot2, slot0.txtCount_tf)

			slot4 = slot0._data.cellScore

			slot0.txtCellScore_tf.setHtmlText(slot2, slot0.txtCellScore_tf)
		end

		slot3 = slot0.txtName
		slot9 = 1.5

		slot0.txtName.setString(slot2, StringUtil.truncate(slot5, slot0._data.name, 12, nil))

		if slot0._color then
			slot4 = slot0._color

			slot0.txtName.setTextColor(slot2, slot0.txtName)
		end

		slot2 = slot0.txtCount_tf.getTextWidth(slot3)
		slot5 = slot0._data.score + (slot0._data.revenue or 0)
		slot3 = math.abs(slot0.txtCount_tf)
	end
end

return
