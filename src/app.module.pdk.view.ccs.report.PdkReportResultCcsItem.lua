slot2 = "PdkReportResultCcsItem"
PdkReportResultCcsItem = class(slot1)

PdkReportResultCcsItem.onCreationComplete = function (slot0)
	slot9 = false
	slot13 = slot0.onDataChanged

	createSetterGetter(slot2, slot0, "data", nil, false, false, false, handler(slot11, slot0))

	slot5 = false

	createSetterGetter(slot2, slot0, "isWin")
end

PdkReportResultCcsItem.updateColorAndPlistInfo = function (slot0)
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

	if slot0._data then
		slot0._color = (slot0._data.chairid == PDK_VIEW_CHAIRID_ME and slot2) or slot1
		slot0._plistFile = (slot0._data.chairid == PDK_VIEW_CHAIRID_ME and slot4) or slot3
	end
end

PdkReportResultCcsItem.onDataChanged = function (slot0)
	if slot0._data then
		slot0._viewChairId = slot0.model._chairIdDic[slot0._data.chairid]
		slot5 = slot0.model
		slot1 = tonumber(slot0._data.chairid)
		slot2 = tonumber(slot0.model.getReportRawData(slot4).basescore)
		slot3 = slot0.model.getReportUsersInfoDic(slot0._data.winscore)[slot0._viewChairId]
		slot7 = slot0._viewChairId == PDK_VIEW_CHAIRID_ME

		slot0.select.setVisible(slot0.model, slot0.select)

		slot10 = slot0.model
		slot7 = slot0._viewChairId == slot0.model.getBankerViewChairId(slot9)

		slot0.icon.setVisible(slot0.model, slot0.icon)

		if slot0._plistFile then
			slot6 = slot0.txtBean_tf
			slot17 = -1

			slot0.txtBean_tf.setHtmlText(slot5, HtmlUtil.createArtNumSign(slot8, slot2, slot0._plistFile, nil, nil, nil, nil, nil, nil))

			slot6 = slot0.txtMultiple_tf
			slot11 = {
				"x"
			}

			slot0.txtMultiple_tf.setHtmlText(slot5, HtmlUtil.createArtNumWithCustomFormat(slot8, slot0._data.addtimes, slot0._plistFile))

			slot6 = slot0.txtCellScore_tf
			slot10 = slot0._plistFile

			slot0.txtCellScore_tf.setHtmlText(slot5, HtmlUtil.createArtNumSign(slot8, slot1))
		else
			if slot2 > 0 then
				slot7 = "+" .. slot2

				slot0.txtBean_tf.setHtmlText(slot5, slot0.txtBean_tf)
			else
				slot7 = slot2

				slot0.txtBean_tf.setHtmlText(slot5, slot0.txtBean_tf)
			end

			slot7 = slot1

			slot0.txtCellScore_tf.setHtmlText(slot5, slot0.txtCellScore_tf)

			slot7 = slot0._data.addtimes

			slot0.txtMultiple_tf.setHtmlText(slot5, slot0.txtMultiple_tf)
		end

		slot4 = slot3.name

		if slot0.model._reportIncludeMySelf and slot0._viewChairId == PDK_VIEW_CHAIRID_ME then
			slot7 = Hero
			slot4 = Hero.getPNickName(slot6)
		end

		slot7 = slot0.txtName
		slot13 = 1.5

		slot0.txtName.setString(slot6, StringUtil.truncate(slot9, slot4, 12, nil))

		if slot0._color then
			slot8 = slot0._color

			slot0.txtName.setTextColor(slot6, slot0.txtName)
		end
	end
end

return
