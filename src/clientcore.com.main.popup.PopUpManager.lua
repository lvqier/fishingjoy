PopUpManager = class("PopUpManager")
slot0 = I18n.get("c667")

PopUpManager.showAlert = function (slot0, slot1)
	slot0:showConfirm(slot1)
end

PopUpManager.showConfirm = function (slot0, slot1, slot2, slot3)
	device.showAlert(slot0, slot1, {
		I18n.get("c669"),
		I18n.get("c670")
	}, function (slot0)
		if device.getAlertButtonIndex(slot0) == 1 then
			if slot0 then
				slot0()
			end
		elseif slot1 then
			slot1()
		end
	end)
end

PopUpManager.showActivityIndicator = function (slot0)
	device.showActivityIndicator()
end

PopUpManager.hideActivityIndicator = function (slot0)
	device.hideActivityIndicator()
end

popupMgr = PopUpManager.new()

return
