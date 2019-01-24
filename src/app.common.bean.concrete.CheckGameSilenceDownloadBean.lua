slot2 = "CheckGameSilenceDownloadBean"
CheckGameSilenceDownloadBean = class(slot1)

CheckGameSilenceDownloadBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckGameSilenceDownloadBean.start = function (slot0)
	if IS_TEST_PACKAGE_DOWNLOAD then
		slot3 = slot0

		slot0.finish(slot2)
	else
		slot3 = gameMgr

		gameMgr.checkPackageSilenceQueue(slot2)
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
