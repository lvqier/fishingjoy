slot2 = "DdzResultCcsItem"
DdzResultCcsItem = class(slot1)

DdzResultCcsItem.onCreationComplete = function (slot0)
	slot9 = false
	slot13 = slot0.onDataChanged

	createSetterGetter(slot2, slot0, "data", nil, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onIsWinChanged

	createSetterGetter(slot2, slot0, "isWin", true, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onIsShowLimitTipsChanged

	createSetterGetter(slot2, slot0, "isShowLimitTips", false, false, false, false, handler(slot11, slot0))

	slot3 = slot0

	slot0.onDataChanged(slot2)

	slot3 = slot0

	slot0.onIsWinChanged(slot2)
end

DdzResultCcsItem.onIsShowLimitTipsChanged = function (slot0)
	if slot0._isShowLimitTips then
		if slot0._data.score >= 0 then
			slot6 = {
				"dou"
			}
			slot5 = HtmlUtil.createArtNumWithCustomFormat(slot2, slot0._data.score, "#plist_ddz_font_beishu_3_%s.png", {
				"most"
			})

			slot0.limitTips.txt_tf.setHtmlText(slot0._data.score, slot0.limitTips.txt_tf)
		end

		slot4 = slot0._data.score >= 0

		slot0.limitTips.txt_tf.setVisible(slot2, slot0.limitTips.txt_tf)

		slot4 = slot0._data.score < 0

		slot0.limitTips.txt.setVisible(slot2, slot0.limitTips.txt)

		slot3 = slot0.limitTips

		slot0.limitTips.stopAllActions(slot2)

		slot4 = true

		slot0.limitTips.setVisible(slot2, slot0.limitTips)

		slot3 = slot0.limitTips
		slot11 = 1

		slot0.limitTips.runAction(slot2, cc.EaseElasticOut.create(slot5, cc.EaseElasticOut, cc.ScaleTo.create(0.7, cc.ScaleTo, 0.5)))
	else
		slot4 = 0

		slot0.limitTips.setScale(slot2, slot0.limitTips)

		slot4 = false

		slot0.limitTips.setVisible(slot2, slot0.limitTips)
	end
end

DdzResultCcsItem.onIsWinChanged = function (slot0)
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

	slot3 = (slot0._isWin and "#plist_ddz_font_result_2_%s.png") or "#plist_ddz_font_result_4_%s.png"
	slot4 = (slot0._isWin and "#plist_ddz_font_result_1_%s.png") or "#plist_ddz_font_result_3_%s.png"

	if slot0._data then
		slot0._color = (slot0._data.chairId == DDZ_VIEW_CHAIRID_ME and slot2) or slot1
		slot0._plistFile = (slot0._data.chairId == DDZ_VIEW_CHAIRID_ME and slot4) or slot3
		slot8 = slot0

		slot0.onDataChanged(slot7)
	end
end

DdzResultCcsItem.onDataChanged = function (slot0)
	if slot0._data then

		-- Decompilation error in this vicinity:
		slot5 = true

		slot0.setIsShowLimitTips(slot2, slot0, false)

		slot4 = slot0._data.chairId == DDZ_VIEW_CHAIRID_ME

		slot0.select.setVisible(slot2, slot0.select)

		slot7 = slot0.model
		slot4 = slot0._data.chairId == slot0.model.getBankerUser(slot6)

		slot0.icon.setVisible(slot2, slot0.icon)

		if slot0._plistFile then
			slot3 = slot0.txtBean_tf
			slot14 = -1

			slot0.txtBean_tf.setHtmlText(slot2, HtmlUtil.createArtNumDotSign(slot5, slot0._data.score, slot0._plistFile, nil, nil, nil, nil, nil, nil))

			slot3 = slot0.txtMultiple_tf
			slot8 = {
				"x"
			}

			slot0.txtMultiple_tf.setHtmlText(slot2, HtmlUtil.createArtNumWithCustomFormat(slot5, slot0._data.multiple, slot0._plistFile))

			slot3 = slot0.txtCellScore_tf
			slot7 = slot0._plistFile

			slot0.txtCellScore_tf.setHtmlText(slot2, HtmlUtil.createArtNum(slot5, slot0._data.cellScore))
		else
			slot4 = slot0._data.score

			slot0.txtBean_tf.setHtmlText(slot2, slot0.txtBean_tf)

			slot4 = slot0._data.multiple

			slot0.txtMultiple_tf.setHtmlText(slot2, slot0.txtMultiple_tf)

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

		slot4 = slot0._data.chairId == DDZ_VIEW_CHAIRID_ME

		slot0.btnBeiShu.setVisible(slot2, slot0.btnBeiShu)

		slot5 = 590 + slot0.txtMultiple_tf.getTextWidth(slot2) / 2

		slot0.btnBeiShu.setPositionX(slot0.txtMultiple_tf, slot0.btnBeiShu)

		slot4 = slot0._data.score + slot0._data.revenue
		slot2 = math.abs(slot0.txtMultiple_tf)
		slot6 = slot2
		slot3 = math.round(slot4) ~= math.round(slot0._data.multiple * slot0._data.cellScore)
		slot7 = slot2
		slot8 = slot3

		slot0.btnWinLimit.setVisible(slot6, slot0.btnWinLimit)

		slot8 = math.round(slot5) ~= math.round(slot0._data.multiple * slot0._data.cellScore) and slot0._data.lScore <= 0

		slot0.btnLoseLimit.setVisible(slot6, slot0.btnLoseLimit)
	end
end

DdzResultCcsItem.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.btnBeiShu then
		slot6 = true

		slot0.model.setIsShowResultBeiShuTips(slot3, slot0.model, true)
	elseif slot1 == slot0.btnWinLimit or slot1 == slot0.btnLoseLimit then
		slot5 = not slot0._isShowLimitTips

		slot0.setIsShowLimitTips(slot3, slot0)
	end
end

DdzResultCcsItem.destroy = function (slot0)
	slot3 = slot0.txtBean_tf

	slot0.txtBean_tf.destroy(slot2)

	slot3 = slot0.txtMultiple_tf

	slot0.txtMultiple_tf.destroy(slot2)

	slot3 = slot0.txtCellScore_tf

	slot0.txtCellScore_tf.destroy(slot2)

	slot3 = slot0.btnBeiShu

	slot0.btnBeiShu.destroy(slot2)

	slot3 = slot0.btnWinLimit

	destroySomeObj(slot2)

	slot3 = slot0.btnLoseLimit

	destroySomeObj(slot2)
end

return
