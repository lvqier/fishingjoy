slot2 = "CheckGameVersionBean"
CheckGameVersionBean = class(slot1)

CheckGameVersionBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckGameVersionBean.onCheckError = function (slot0)
	slot4 = "检查游戏版本信息失败，请稍后再试"

	mainMgr.updateLoginLoadingInfo(slot2, mainMgr)

	slot3 = "子游戏版本文件下载io error"

	trace(slot2)

	slot8 = slot0.start
	slot5 = handler(slot6, slot0)
	slot9 = slot0.start

	popupMgr.showAlert(slot2, popupMgr, "您的网络好像不给力，请检查网络是否正常。", handler(slot0, slot0))
end

CheckGameVersionBean.start = function (slot0)
	if CHECK_CLIENT_UPDATE or IS_TEST_PACKAGE_DOWNLOAD then
		slot7 = slot0.finish
		slot4 = handler(slot5, slot0)
		slot8 = slot0.onCheckError

		gameMgr.requestCheckVersion(slot2, gameMgr, handler(slot0, slot0))
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

return
