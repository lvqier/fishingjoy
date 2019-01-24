ComplaintCcsItem = class("ComplaintCcsItem")

ComplaintCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)

	slot0._textWidth = slot0.opinion_tf:getContentSize().width

	slot0.opinion_tf:setVAlign(TextField.V_BOTTOM)
	slot0.opinion_tf:setIsWrapPrecise(true)
	slot0.reply_tf:setVAlign(TextField.V_BOTTOM)
	slot0.reply_tf:setIsWrapPrecise(true)
end

ComplaintCcsItem.updateView = function (slot0)
	if slot0._data then
		slot0.opinion_tf:setHtmlText(slot1)

		slot2 = ""
		slot4 = ResConfig.getUICommonPath("kpi/plaza_kefu_kpi_evaluate_pressed.png")
		slot5 = HtmlUtil.createImg(slot3)

		if slot0._data.handlestatus == "1" and slot0._data.evaluate == "0" then
			slot2 = string.format("<a href = 'event:evaluate|%s'>" .. slot5 .. "<font color = '#7a93ac' size = '20' offsetY = '3'></font></a>", slot0._data.msgid)
		end

		slot0.reply_tf:setImgSrcConfig({
			[ResConfig.getFullFile(slot3)] = {
				imgSrcPressed = slot4,
				imgSrcNormal = slot3
			}
		})
		slot0.reply_tf:setHtmlText(slot6)
		slot0.reply_tf:setPositionY(slot0.Image_1:getPositionY() + 20)
		slot0.opinion_tf:setPositionY(slot7)
		slot0:setContentSize(cc.size(slot0:getContentSize().width, slot0.Image_1.getPositionY() + 20 + slot0.reply_tf:getTextHeight() + 6 + slot0.opinion_tf:getTextHeight() + 10))
	end
end

ComplaintCcsItem.getPushZoomView = function (slot0)
	return nil
end

ComplaintCcsItem.destroy = function (slot0)
	slot0.txtPlace_tf:destroy()
	slot0.txtName_tf:destroy()
	slot0.txtID_tf:destroy()
	slot0.txtTip_tf:destroy()
	slot0._moneyFt:destroy()
	CcsListViewItem.destroy(slot0)
end

return
