device = device or {}
device.isMobile = device.platform == "android" or device.platform == "ios"

device.getAlertButtonIndex = function (slot0)
	slot1 = slot0.buttonIndex

	if device.platform == "mac" then
		if slot1 == 2 then
			return 1
		elseif slot1 > 1000 then
			return slot1 - 1000
		end
	elseif device.platform == "ios" then
		return slot1
	else
		return slot1
	end
end

device.isIphoneX = function ()
	if __isIphoneX == nil then
		__isIphoneX = not isAndroid and (bridgeMgr:getPhoneModel() == "iPhone10,3" or bridgeMgr.getPhoneModel() == "iPhone10,6")
	end

	return __isIphoneX
end

return
