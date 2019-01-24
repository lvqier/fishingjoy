slot2 = "CheckIosVerifyBean"
CheckIosVerifyBean = class(slot1)

CheckIosVerifyBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)

	slot0._curErrorTime = 0
end

CheckIosVerifyBean.start = function (slot0)
	if IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_ALL_NO_BANK then
		slot3 = "c_gameconfig"
		slot1 = getCSVField(slot2)
		slot2 = MAIN_GAME_KIND or 0

		if slot1[slot2] then
			slot4 = slot0

			slot0.checkGameState4IosVerify(slot3)
		end
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

CheckIosVerifyBean.onDownloadBegin = function (slot0)
	return
end

CheckIosVerifyBean.onDownloadProgress = function (slot0)
	slot3 = gameMgr
	slot7 = (gameMgr.getCurInstallerVo(slot2).curSize / gameMgr.getCurInstallerVo(slot2).totalSize * 30 + 65) / 100

	mainMgr.updateLoginLoadingInfo(slot4, mainMgr, "正在加载游戏，请耐心等待...")
end

CheckIosVerifyBean.onDownloadError = function (slot0)
	slot0._curErrorTime = slot0._curErrorTime + 1

	if slot0._curErrorTime < 3 then
		slot3 = slot0

		slot0.checkGameState4IosVerify(slot2)
	else
		slot4 = "游戏加载失败，请检查网络是否畅通！"

		mainMgr.updateLoginLoadingInfo(slot2, mainMgr)
	end
end

CheckIosVerifyBean.onDownloadFinish = function (slot0)
	return
end

CheckIosVerifyBean.onInstallBegin = function (slot0)
	slot8 = 5

	mainMgr.updateLoginLoadingInfo(slot3, mainMgr, "正在部署游戏，请耐心等待...", 1, nil)
end

CheckIosVerifyBean.onInstallFinish = function (slot0)
	slot5 = 1

	mainMgr.updateLoginLoadingInfo(slot2, mainMgr, "游戏安装成功，正在进入游戏")

	slot3 = slot0

	slot0.finish(slot2)
end

CheckIosVerifyBean.checkGameState4IosVerify = function (slot0)
	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_BEGIN, slot0.onDownloadBegin)

	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_PROGRESS, slot0.onDownloadProgress)

	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_ERROR, slot0.onDownloadError)

	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_FINISH, slot0.onDownloadFinish)

	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_BEGIN, slot0.onInstallBegin)

	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_FINISH, slot0.onInstallFinish)

	slot5 = true

	if gameMgr.checkGamePackageState(slot2, gameMgr, MAIN_GAME_KIND) == GAME_PACKAGE_STATE_NEED_DOWNLOAD or slot1 == GAME_PACKAGE_STATE_NEED_UPDATE then
		slot5 = MAIN_GAME_KIND

		gameMgr.downloadGame(slot3, gameMgr)
	elseif slot1 == GAME_PACKAGE_STATE_NEED_INSTALL then
		slot5 = MAIN_GAME_KIND

		gameMgr.installGame(slot3, gameMgr)
	elseif slot1 == GAME_PACKAGE_STATE_AVAILABLE then
		slot4 = slot0

		slot0.finish(slot3)
	else
		slot4 = slot0

		slot0.finish(slot3)
	end
end

CheckIosVerifyBean.finish = function (slot0)
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_BEGIN, slot0.onDownloadBegin)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_PROGRESS, slot0.onDownloadProgress)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_ERROR, slot0.onDownloadError)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_DOWNLOAD_FINISH, slot0.onDownloadFinish)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_BEGIN, slot0.onInstallBegin)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_FINISH, slot0.onInstallFinish)

	slot3 = slot0

	AbstractBean.finish(slot2)
end

return
