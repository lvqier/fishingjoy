slot2 = "QuickStart"
QuickStart = class(slot1)

QuickStart.quickGame = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot10 = slot3

	if not slot0.checkGameState(slot7, slot0, slot1) then
		return false
	end

	slot8 = gameMgr
	roomDic = gameMgr.getServerVosDic(slot7)[slot1] or {}
	slot6 = 0
	slot7 = 0
	slot8 = 0
	slot9 = Hero.getUserScore(slot10)
	slot12 = roomDic

	for slot13, slot14 in ipairs(Hero) do
		if slot14.dwMinEnterScore <= slot9 and slot7 <= slot14.dwMinEnterScore then
			if slot1 == GameKind_DZPK then
				if slot14.wSortID < 1000 then
					slot7 = slot14.dwMinEnterScore
					slot6 = slot13
				end
			else
				slot7 = slot14.dwMinEnterScore
				slot6 = slot13
			end
		end

		if slot14.wSortID < 100 or slot14.wKindID == GameKind_SJB then
			slot8 = slot13
		end
	end

	slot10 = nil

	if slot2 then
		if slot8 > 0 then
			slot10 = roomDic[slot8]
		elseif slot6 > 0 then
			slot10 = roomDic[slot6]
		end
	elseif slot6 == 0 and slot8 > 0 then
		slot10 = roomDic[slot8]
	end

	if ((slot9 >= 1000 or slot8 <= 0 or roomDic[slot8]) and roomDic[slot6]) == nil then
		slot14 = "匹配不到合适的房间！"

		tweenMsgMgr.showRedMsg(slot12, tweenMsgMgr)

		return false
	end

	slot14 = slot1

	print(slot12, "### 请求进入")

	slot14 = slot10.wSortID
	slot11 = gameMgr.cookRoomKindBySortID(slot12, gameMgr)
	slot16 = slot10.wSortID

	print(gameMgr, "### 快速进入房间：", slot11)

	slot15 = slot11

	gameMgr.setCurRoomKind(gameMgr, gameMgr)

	if slot11 == 1 then
		slot14 = Hero

		if Hero.tyTimeIsValid(slot13) then
			slot15 = slot10

			gameMgr.requestEnterRoom(slot13, gameMgr)
		else
			slot18 = slot5

			mainMgr.tryTimeOutShowPopup2Charge(slot14, mainMgr, slot4, limitCallback ~= nil)
		end
	else
		slot15 = slot10

		gameMgr.requestEnterRoom(slot13, gameMgr)
	end

	return true
end

QuickStart.enterLastGame = function (slot0, slot1, slot2)
	slot6 = slot1

	if not slot0.checkGameState(slot4, slot0) then
		return
	end

	slot5 = gameMgr
	roomDic = gameMgr.getServerVosDic(slot4)[slot1] or {}
	slot3 = nil
	slot6 = roomDic

	for slot7, slot8 in ipairs(slot5) do
		if slot8.wServerID == slot2 then
			slot3 = slot8
		end
	end

	if slot3 == nil then
		slot7 = "游戏房间暂未开通！"

		tweenMsgMgr.showRedMsg(slot5, tweenMsgMgr)

		return
	end

	slot8 = slot2

	print(slot5, "####  请求进入上一游戏", slot1)

	slot7 = slot3.wSortID
	slot8 = true

	gameMgr.setIsEnterLastGame(gameMgr, gameMgr)

	slot8 = gameMgr.cookRoomKindBySortID(slot5, gameMgr)

	gameMgr.setCurRoomKind(gameMgr, gameMgr)

	slot8 = slot1

	gameMgr.setCurGameKind(gameMgr, gameMgr)

	slot8 = slot3

	gameMgr.requestEnterRoom(gameMgr, gameMgr)
end

QuickStart.loginEnterGame = function (slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = nil
	slot9 = gameMgr.getServerVosDic(slot7)

	for slot10, slot11 in pairs(gameMgr) do
		slot14 = slot11

		for slot15, slot16 in ipairs(slot13) do
			if slot16.wServerID == slot1 then
				slot4 = slot10
				slot5 = slot16

				break
			end
		end
	end

	if slot5 == nil or slot4 == 0 then
		slot10 = "游戏房间暂未开通！"

		tweenMsgMgr.showRedMsg(slot8, tweenMsgMgr)

		return
	end

	slot11 = slot1

	print(slot8, "####  登陆进入上一游戏", slot4)

	slot9 = "c_gameconfig"

	if getCSVField(slot8)[slot4] then
		slot10 = slot7.moduleName

		requireModule(slot9)

		if _G[slot7.moduleProxyName] then
			slot12 = slot5.wSortID
			slot13 = gameMgr.cookRoomKindBySortID(slot10, gameMgr)

			gameMgr.setCurRoomKind(gameMgr, gameMgr)

			slot13 = slot4

			gameMgr.setCurGameKind(gameMgr, gameMgr)

			function slot10()
				slot3 = gameMgr.requestEnterRoom

				gameMgr.requestEnterRoom(slot1, gameMgr)

				if slot1 then
					slot1()
				end
			end

			if IS_GUAN_VERIFY and not GUAN_IGNORE_GAMEKINDS[slot4] then
				slot14 = slot4

				ProxyPlaza.gotoGameKindRoom(slot12, ProxyPlaza)
			end

			slot18 = true

			slot8.show(slot12, slot8, slot10, slot3, nil, nil)

			slot14 = slot9

			slot8.model.setRoomKind(slot12, slot8.model)
		end
	end
end

QuickStart.checkGameState = function (slot0, slot1, slot2)
	slot3 = false
	slot7 = slot1
	slot5 = nil

	if gameMgr.checkGamePackageState(slot5, gameMgr) == GAME_PACKAGE_STATE_NEED_DOWNLOAD then
		slot5 = "此游戏还没下载，请手动下载再进入！"
	elseif slot4 == GAME_PACKAGE_STATE_NEED_UPDATE then
		slot5 = "此游戏需要更新，请更新后再进入！"
	elseif slot4 == GAME_PACKAGE_STATE_NEED_INSTALL then
		slot5 = "此游戏还没准备好，请手动进入"
	elseif slot4 == GAME_PACKAGE_STATE_UNAVAILABLE then
		slot5 = "游戏尚未开放！"
	elseif slot4 == GAME_PACKAGE_STATE_AVAILABLE then
		slot3 = true
	end

	if not slot2 and slot5 ~= nil then
		slot9 = slot5

		tweenMsgMgr.showRedMsg(slot7, tweenMsgMgr)
	end

	return slot3
end

slot2 = QuickStart
quickStart = QuickStart.new(function (slot0, slot1, slot2)
	slot3 = false
	slot7 = slot1
	slot5 = nil

	if gameMgr.checkGamePackageState(slot5, gameMgr) == GAME_PACKAGE_STATE_NEED_DOWNLOAD then
		slot5 = "此游戏还没下载，请手动下载再进入！"
	elseif slot4 == GAME_PACKAGE_STATE_NEED_UPDATE then
		slot5 = "此游戏需要更新，请更新后再进入！"
	elseif slot4 == GAME_PACKAGE_STATE_NEED_INSTALL then
		slot5 = "此游戏还没准备好，请手动进入"
	elseif slot4 == GAME_PACKAGE_STATE_UNAVAILABLE then
		slot5 = "游戏尚未开放！"
	elseif slot4 == GAME_PACKAGE_STATE_AVAILABLE then
		slot3 = true
	end

	if not slot2 and slot5 ~= nil then
		slot9 = slot5

		tweenMsgMgr.showRedMsg(slot7, tweenMsgMgr)
	end

	return slot3
end)

return
