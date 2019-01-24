slot2 = "CheckInstallGamesBean"
CheckInstallGamesBean = class(slot1)

CheckInstallGamesBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)

	slot0._installList = {}
	slot0._curInstallIndex = 1
end

CheckInstallGamesBean.start = function (slot0)
	if (not IS_IOS_VERIFY or IS_IOS_VERIFY_ALL or not not IS_IOS_VERIFY_ALL_NO_BANK) and (CHECK_CLIENT_UPDATE or IS_TEST_PACKAGE_DOWNLOAD) then
		slot5 = "c_gameconfig"

		for slot4, slot5 in pairs(getCSVField(slot4)) do
			slot9 = slot4

			if gameMgr.checkGamePackageState(slot7, gameMgr) == GAME_PACKAGE_STATE_NEED_INSTALL then
				slot10 = slot5

				table.insert(slot8, slot0._installList)
			end
		end

		slot6 = slot0

		eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_BEGIN, slot0.onInstallBegin)

		slot6 = slot0

		eventMgr.add(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_FINISH, slot0.onInstallFinish)

		slot3 = slot0

		slot0.installGame(slot2)
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

CheckInstallGamesBean.installGame = function (slot0)
	if slot0._curInstallIndex <= #slot0._installList and #slot0._installList < 5 then
		slot5 = slot0._installList[slot0._curInstallIndex].kind

		gameMgr.installGame(slot3, gameMgr)
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

CheckInstallGamesBean.onInstallBegin = function (slot0)
	trace(slot3)

	slot9 = 2

	mainMgr.updateLoginLoadingInfo("正在安装游戏：" .. slot0._installList[slot0._curInstallIndex].name, mainMgr, "正在安装游戏：" .. slot0._installList[slot0._curInstallIndex].name, (slot0._curInstallIndex / #slot0._installList * 30 + 65) / 100, nil)
end

CheckInstallGamesBean.onInstallFinish = function (slot0)
	trace(slot3)

	slot9 = 0.2

	mainMgr.updateLoginLoadingInfo("成功安装游戏：" .. slot0._installList[slot0._curInstallIndex].name, mainMgr, "成功安装游戏：" .. slot0._installList[slot0._curInstallIndex].name, (slot0._curInstallIndex / #slot0._installList * 30 + 65) / 100, nil)

	slot0._curInstallIndex = slot0._curInstallIndex + 1
	slot5 = slot0

	slot0.installGame("成功安装游戏：" .. slot0._installList[slot0._curInstallIndex].name)
end

CheckInstallGamesBean.finish = function (slot0)
	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_BEGIN, slot0.onInstallBegin)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.GAME_PACKAGE_INSTALL_FINISH, slot0.onInstallFinish)

	slot3 = slot0

	AbstractBean.finish(slot2)
end

return
