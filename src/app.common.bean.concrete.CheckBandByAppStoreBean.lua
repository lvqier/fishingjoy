slot2 = "CheckBandByAppStoreBean"
CheckBandByAppStoreBean = class(slot1)

CheckBandByAppStoreBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckBandByAppStoreBean.start = function (slot0)
	if PACKAGE_DEVICE_TYPE == 100000000 and isMobile and not isAndroid then
		slot4 = "为了让大家有更好的体验，需要更新一个版本，点确认可以下载新的游戏版本，感谢！"

		popupMgr.showAlert(slot2, popupMgr)
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

return
