PlazaEMailCcsItem = class("PlazaEMailCcsItem")

PlazaEMailCcsItem.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, CcsListViewItem)
	slot0.spOpen:setVisible(true)
	slot0.txtContent:setVisible(true)
	slot0.txtDate:setVisible(true)
end

PlazaEMailCcsItem.updateView = function (slot0)
	if slot0._data then
		if slot0._data.isread == 0 then
			slot0.spOpen:setOpacity(255)
			slot0.txtContent:setOpacity(255)
			slot0.txtDate:setOpacity(255)
			slot0.spOpen:setTexture(slot1)
			slot0.checkBoxDelete:setVisible(false)
		else
			slot0.spOpen:setTexture(slot1)
			slot0.spOpen:setOpacity(102)
			slot0.txtContent:setOpacity(102)
			slot0.txtDate:setOpacity(102)
			slot0.checkBoxDelete:setVisible(true)
			slot0.checkBoxDelete:bindBoolPropertyByName(slot0._data, "isDelete")
		end

		slot0.txtContent:setText(slot2)
		slot0.txtAddressee:setText("发件人：" .. slot0._data.msgtypename)
		slot0.txtDate:setString(slot0._data.date .. "  " .. slot0._data.time)
	end
end

PlazaEMailCcsItem.onClick = function (slot0)
	slot0.model:setCurEMailDetail(slot0._data.msgcontent)
	slot0.model:setCurEMailMsgId(slot0._data.msgid)
	slot0.model:setIsShowingEMailDetail(true)

	function slot1()
		if not slot0._data then
			return
		end

		slot0._data.isread = 1

		slot0._data:updateView()

		if slot0._data.updateView.model:getHasNewEMailCount() > 0 then
			slot0.model:setHasNewEMailCount(slot0 - 1)
		end
	end

	if slot0._data.isread == 0 then
		slot0.controller:requestReadMailData(slot0._data.msgid, slot1)
	end
end

PlazaEMailCcsItem.getPushZoomView = function (slot0)
	return nil
end

PlazaEMailCcsItem.destroy = function (slot0)
	CcsListViewItem.destroy(slot0)
end

return
