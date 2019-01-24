slot2 = "DdzReportListCcsItem"
DdzReportListCcsItem = class(slot1)

DdzReportListCcsItem.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

DdzReportListCcsItem.updateView = function (slot0)
	if slot0._data then
		slot5 = parseInt(slot2) > 0

		slot0.iconWin.setVisible(slot0._data.Score, slot0.iconWin)

		slot5 = not (parseInt(slot2) > 0)

		slot0.iconLose.setVisible(slot0._data.Score, slot0.iconLose)

		slot2 = nil
		slot5 = slot0.txtMark_tf
		slot10 = slot0._data.Score
		slot16 = -1

		slot0.txtMark_tf.setHtmlText(slot4, HtmlUtil.createArtNumDotSign(slot7, parseInt(slot9), (parseInt(slot2) > 0 and "#plist_ddz_font_result_1_%s.png") or "#plist_ddz_font_result_3_%s.png", nil, nil, nil, nil, nil, nil))

		slot8 = true
		slot7 = DateUtil.getDateString(slot0._data.InsertTime, DateUtil.getSecondByString(slot4), 5)

		slot0.txtDate_tf.setHtmlText(slot0._data.InsertTime, slot0.txtDate_tf)

		slot7 = "战报码:" .. slot0._data.PlayInfo

		slot0.txtCode_tf.setHtmlText(slot0._data.InsertTime, slot0.txtCode_tf)

		slot8 = slot0._itemIndex ~= #(slot0.model.getReportDatas(slot0._data.InsertTime) or {})

		slot0.line.setVisible(slot0.model, slot0.line)
	end
end

DdzReportListCcsItem.getPushZoomView = function (slot0)
	return nil
end

DdzReportListCcsItem.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.btnLuXiang then
		slot5 = slot0._data

		slot0.controller.try2LoadReport(slot3, slot0.controller)
	elseif slot1 == slot0.btnXiangQing then
		slot5 = slot0._data

		slot0.controller.try2ShowReportResultDirectly(slot3, slot0.controller)
	elseif slot1 == slot0.btnReportCode then
		slot5 = slot0._data

		slot0.controller.copyReportCode(slot3, slot0.controller)
	end
end

DdzReportListCcsItem.handleScrollBtns = function (slot0, slot1)
	slot5 = slot0.btnLuXiang

	slot1.addBtn2HandleTouchOperate(slot3, slot1)

	slot5 = slot0.btnXiangQing

	slot1.addBtn2HandleTouchOperate(slot3, slot1)

	slot5 = slot0.btnReportCode

	slot1.addBtn2HandleTouchOperate(slot3, slot1)
end

DdzReportListCcsItem.destroy = function (slot0)
	slot3 = slot0.txtDate_tf

	destroySomeObj(slot2)

	slot3 = slot0.txtCode_tf

	destroySomeObj(slot2)

	slot3 = slot0.txtMark_tf

	destroySomeObj(slot2)

	slot3 = slot0.btnLuXiang

	destroySomeObj(slot2)

	slot3 = slot0.btnXiangQing

	destroySomeObj(slot2)

	slot3 = slot0.btnReportCode

	destroySomeObj(slot2)

	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
