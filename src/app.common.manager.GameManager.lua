slot2 = "GameManager"
GameManager = class(slot1)

GameManager.ctor = function (slot0)
	slot4 = TickBase

	ClassUtil.extends(slot2, slot0)

	slot7 = true

	createSetterGetter(slot2, slot0, "typeVosDic", {}, nil)

	slot7 = true

	createSetterGetter(slot2, slot0, "kindVosDic", {}, nil)

	slot7 = true

	createSetterGetter(slot2, slot0, "serverVosDic", {}, nil)

	slot7 = true

	createSetterGetter(slot2, slot0, "serverVosDicEx", {}, nil)

	slot7 = true

	createSetterGetter(slot2, slot0, "gameConfigsDic", {}, nil)

	slot8 = true

	createSetterGetter(slot2, slot0, "sortedUsers", {}, true, false)

	slot6 = true

	createSetterGetter(slot2, slot0, "userDatasDic", {})

	slot5 = false

	createSetterGetter(slot2, slot0, "isInTestRoom")

	slot5 = false

	createSetterGetter(slot2, slot0, "isStartGame")

	slot5 = IS_IOS_VERIFY or false

	createSetterGetter(slot2, slot0, "isLoginBank")

	slot13 = slot0.onTablesDicChanged

	createSetterGetter(slot2, slot0, "tablesDic", {}, true, nil, nil, handler(slot11, slot0))

	slot6 = true

	createSetterGetter(slot2, slot0, "roomConfig", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "realGameKind", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curGameKind", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curRoomKind", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "curRoomVo", nil)

	slot6 = true

	createSetterGetter(slot2, slot0, "gameStatus", GAME_STATUS_FREE)

	slot5 = false

	createSetterGetter(slot2, slot0, "needStoreGameStackMsg")

	slot5 = {}

	createSetterGetter(slot2, slot0, "gameStackMsgs")

	slot6 = false

	createSetterGetter(slot2, slot0, "isEnterLastGame", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "isLoginEnterGame", false)

	slot6 = false

	createSetterGetter(slot2, slot0, "lastLockServer", nil)

	slot0.buyMonthCardChangedSignal = SignalAs3.new()
	slot0._canUpdateTableData = false
	slot0.tableViewChangedSignal = SignalAs3.new()
	slot0.backupsChangedSignal = SignalAs3.new()
	slot0._userSitDic = {}
	slot0._rawServerVos = {}
	slot0._rawServerVosDicByServerId = {}
	slot0._curTry2EnterRoomVos = nil
	slot0._updateRoomListOnlineCallback = nil
	slot0._isUsersChanged = false
	slot6 = slot0

	networkMgr.registerloadfunction(slot2, networkMgr, MDM_GP_SERVER_LIST, slot0.onRoomOnlinesUpdate)

	slot6 = slot0

	networkMgr.registerloadfunction(slot2, networkMgr, MDM_MB_SERVER_LIST, slot0.roomlistResult)

	slot6 = slot0

	networkMgr.registeruserfunction(slot2, networkMgr, SUB_S_GP_TOPRUNMSG, slot0.userinfoResult)

	slot6 = slot0

	networkMgr.registerroomfunction(slot2, networkMgr, MDM_GR_LOGON, slot0.onRoomloginResult)

	slot4 = 45

	slot0.startTick(slot2, slot0)

	slot3 = "socket"
	slot0._timerSocket = require(slot2)
end

GameManager.onTablesDicChanged = function (slot0)
	slot0._canUpdateTableData = true
end

GameManager.clearCache = function (slot0)
	slot0._isLoginBank = IS_IOS_VERIFY or false
end

GameManager.getGameKindIdByServerId = function (slot0, slot1)
	slot4 = slot0
	slot3 = nil

	if slot0.getServerVosDic(slot3) then
		slot6 = slot2

		for slot7, slot8 in pairs(slot5) do
			slot11 = slot8

			for slot12, slot13 in ipairs(slot10) do
				if slot13.wServerID == slot1 then
					slot3 = slot7

					break
				end
			end
		end
	end

	return slot3
end

GameManager.onRoomOnlinesUpdate = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_SERVER_ONLINE then
		slot7 = "CMD_GP_ServerOnline"
		slot4 = false

		for slot8 = 1, ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).wServerCount, 1 do
			if slot0._rawServerVosDicByServerId[slot3.OnLineInfoServer[slot8].wServerID] and slot10.dwOnLineCount ~= slot9.dwOnLineCount then
				slot10.dwOnLineCount = slot9.dwOnLineCount
				slot4 = true
			end
		end

		if slot4 then
			slot8 = slot0._rawServerVos

			slot0.cookServerVos(slot6, slot0)
		end

		slot8 = SOCKET_TYPE_LOAD

		networkMgr.closeSocket(slot6, networkMgr)

		slot7 = slot0._updateRoomListOnlineCallback

		applyFunction(slot6)

		slot0._updateRoomListOnlineCallback = nil
	end
end

GameManager.userinfoResult = function (slot0, slot1, slot2)
	slot7 = "CMD_S_GP_TopMsgInfo"

	if ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1) and slot3.szTopMsg then
	end
end

GameManager.roomlistResult = function (slot0, slot1, slot2)
	if slot2 == SUB_MB_LIST_KIND then
		slot7 = "tagGameServerType"
		slot7 = ffiMgr.castStructArray2TableByLuaStr(slot4, ffiMgr, slot1)

		slot0.cookTypeVos(ffiMgr, slot0)
	elseif slot2 == SUB_MB_LIST_SERVER then
		slot7 = "tagGameKind"
		slot7 = ffiMgr.castStructArray2TableByLuaStr(slot4, ffiMgr, slot1)

		slot0.cookKindVos(ffiMgr, slot0)
	elseif slot2 == SUB_GP_LIST_SERVER then
		slot7 = "tagGameServer"
		slot0._rawServerVos = ffiMgr.castStructArray2TableByLuaStr(slot4, ffiMgr, slot1)
		slot0._rawServerVosDicByServerId = {}
		slot6 = ffiMgr.castStructArray2TableByLuaStr(slot4, ffiMgr, slot1)

		for slot7, slot8 in ipairs(ffiMgr) do
			slot0._rawServerVosDicByServerId[slot8.wServerID] = slot8
		end

		if RoomResultFromClientGet then
			RoomResultFromClientGet()

			RoomResultFromClientGet = nil
		end

		slot7 = slot3

		slot0.cookServerVos(slot5, slot0)
	elseif slot2 == SUB_MB_LIST_FINISH then
		slot6 = #slot1

		trace(slot4, "列表完成咯")
	end
end

GameManager.onRoomloginResult = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_LOGON_SUCCESS then
		slot6 = #slot1

		print(slot4, "登陆房间成功")

		slot8 = slot0._timerSocket
		slot7 = 1

		requestGatherInfoHttp(slot4, GATHER_INTOROOM_URL, slot0._timerSocket.gettime(slot7) - mainMgr._intoRoomOsTime)
	else
		if slot2 == SUB_GR_LOGON_FAILURE then
			slot8 = slot0._timerSocket
			slot7 = 0

			requestGatherInfoHttp(slot4, GATHER_INTOROOM_URL, slot0._timerSocket.gettime(slot7) - mainMgr._intoRoomOsTime)

			slot6 = true

			popupMgr.hideActivityIndicator(slot4, popupMgr)

			slot8 = "登陆房间失败，详情如下："

			trace(HtmlUtil.createRedTxt("CMD_GR_LogonFailure"))

			slot6 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			trace_r(ffiMgr)

			slot7 = GameEvent.ON_ROOM_LOGIN_FAILED

			eventMgr.dispatch(ffiMgr, eventMgr)

			if ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).lErrorCode == 1 then
				slot7 = slot3.szDescribeString

				mainMgr.showAlert2ExitLogin(slot5, mainMgr)
			else
				slot7 = SOCKET_TYPE_ALL_BUT_TRUMP

				networkMgr.closeSocket(slot5, networkMgr)

				slot4 = nil

				if slot3.lErrorCode > 65535 then
					function slot4()
						slot3 = 16
						slot4 = 65535
						slot6 = bit.band(slot0.lErrorCode, slot0.lErrorCode)

						quickStart.enterLastGame(slot0.lErrorCode, quickStart, bit.rshift(slot1, slot0.lErrorCode))
					end
				elseif slot3.lErrorCode == 0 then
					slot8 = "满"

					if string.find(slot6, slot3.szDescribeString) then
						slot7 = slot0

						slot0.requestUpdateCurRoomsOnlines(slot6)

						function slot4()
							slot3 = GameEvent.ON_GAME_FULL_LOGIN_FAILED

							eventMgr.dispatch(slot1, eventMgr)
						end
					else
						slot8 = "最低进入"

						if string.find(slot6, slot3.szDescribeString) then
							slot8 = GameEvent.ON_GAME_NOT_ENOUGH_SCORE_LOGIN_FAILED

							eventMgr.dispatch(slot6, eventMgr)
						end
					end
				end

				slot9 = slot4

				popupMgr.showAlert(slot6, popupMgr, slot3.szDescribeString)
			end

			slot7 = POPUP_ID_WORLD_CUP

			popupMgr.pop(slot5, popupMgr)

			return
		end

		if slot2 == SUB_GR_LOGON_FINISH then
			slot8 = slot0._timerSocket
			slot7 = 1

			requestGatherInfoHttp(slot4, GATHER_INTOROOM_URL, slot0._timerSocket.gettime(slot7) - mainMgr._intoRoomOsTime)

			slot6 = true

			popupMgr.hideActivityIndicator(slot4, popupMgr)

			slot3 = Hero.getCbStatus(slot4)
			slot8 = GameEvent.ON_ROOM_LOGIN_FINISH

			eventMgr.dispatch(slot0, eventMgr)

			if slot0.getIsStartGame(Hero) then
				if slot3 == US_FREE or slot3 == US_NULL then
					slot7 = "本局已经结束1？"
					slot10 = slot3

					trace(slot6, tostring(slot9))

					slot8 = GameEvent.ON_GAME_FINISH_ALREADY

					eventMgr.dispatch(slot6, eventMgr)
				elseif slot3 == US_SIT or slot3 == US_READY or slot3 == US_PLAYING or slot3 == US_OFFLINE then
					slot7 = slot0

					slot0.sendGameOption(slot6)
				end
			else
				slot8 = #slot1

				print(slot6, "### dispatch ON_ENTER_ROOM_BY_SERVER")

				slot8 = GameEvent.ON_ENTER_ROOM_BY_SERVER

				eventMgr.dispatch(slot6, eventMgr)
			end
		elseif slot2 == SUB_GR_UPDATE_NOTIFY then
			slot8 = slot0._timerSocket
			slot7 = 0

			requestGatherInfoHttp(slot4, GATHER_INTOROOM_URL, slot0._timerSocket.gettime(slot7) - mainMgr._intoRoomOsTime)

			slot6 = "当前版本不是最新版本，请升级到最新版本"

			tweenMsgMgr.showRedMsg(slot4, tweenMsgMgr)
		end
	end
end

GameManager.requestEnterRandomRoom = function (slot0, slot1)
	if slot1 then
		slot0._curTry2EnterRoomVos = slot1
		slot2 = true
		slot3 = 0
		slot6 = slot1

		for slot7, slot8 in ipairs(slot5) do
			if slot8.wSortID and slot8.wSortID < 1000 then
				slot3 = slot3 + 1
			end
		end

		if slot3 <= 1 then
			slot2 = false
		end

		if not slot2 and slot0._curGameKind == GameKind_DZPK then
			slot6 = slot1

			for slot7, slot8 in ipairs(slot5) do
				if slot8.wSortID < 1000 and slot8.wSortID % 2 == 1 then
					slot2 = true

					break
				end
			end
		end

		if slot2 then
			slot7 = slot1
			slot11 = slot0.requestEnterRoom

			popupMgr.showCommonRoomList(slot5, popupMgr, handler(slot9, slot0))
		else
			slot1[1].dwCellScore = slot1._dwCellScore
			slot6 = slot1

			function slot9(slot0, slot1)
				return slot0.dwOnLineCount < slot1.dwOnLineCount
			end

			table.sort(slot7, TableUtil.concat(slot1._dwCellScore))

			slot10 = TableUtil.concat(slot1._dwCellScore)[1]

			slot0.requestEnterRoom(TableUtil.concat(slot1._dwCellScore), slot0)
		end
	end
end

GameManager.requestEnterRoom = function (slot0, slot1)
	if slot1 then
		slot5 = SOCKET_TYPE_ROOM

		networkMgr.closeSocket(slot3, networkMgr)

		slot5 = slot1

		slot0.setCurRoomVo(slot3, slot0)

		slot2 = slot1.szServerAddr

		if IS_IOS_VERIFY and isMobile and not isAndroid then
			slot7 = #SOCKET_IP_ARR
			slot2 = SOCKET_IP_ARR[math.random(slot5, 1)]
		end

		slot7 = slot1.wServerPort

		mainMgr.requestLoginRoom(slot4, mainMgr, slot2)
	end
end

GameManager.sendGameOption = function (slot0)
	slot3 = true

	reqGameOption(slot2)
end

GameManager.getCurGameConfig = function (slot0)
	slot1 = nil

	if slot0._curGameKind then
		slot1 = slot0._gameConfigsDic[slot0._curGameKind]
	end

	return slot1
end

GameManager.getGameConfig = function (slot0, slot1)
	return slot0._gameConfigsDic[slot1]
end

GameManager.getGameConfigsByGameType = function (slot0, slot1)
	slot2 = {}
	slot5 = slot0._gameConfigsDic

	for slot6, slot7 in pairs(slot4) do
		if slot7.gameType == slot1 then
			slot11 = slot7

			table.insert(slot9, slot2)
		end
	end

	return slot2
end

GameManager.resetTables = function (slot0)
	slot4 = {}

	slot0.setGameStackMsgs(slot2, slot0)

	slot4 = {}

	slot0.setTablesDic(slot2, slot0)

	slot4 = {}

	slot0.setUserDatasDic(slot2, slot0)

	slot0._userSitDic = {}
	slot4 = {}

	slot0.setSortedUsers(slot2, slot0)

	slot0._isUsersChanged = false
end

GameManager.addTable = function (slot0, slot1, slot2, slot3)
	if not slot0._tablesDic[slot2] then
		({
			wTableId = slot2,
			tagStatus = {},
			tableUsers = {}
		})["tagStatus"].cbPlayStatus = slot1.cbPlayStatus
		()["tagStatus"].cbTableLock = slot1.cbTableLock
		slot0._tablesDic[slot2] = 

		if not slot3 then
			slot9 = true

			slot0.setTablesDic(slot6, slot0, slot0._tablesDic)
		end
	end
end

GameManager.updateTableByStatus = function (slot0, slot1, slot2)
	if slot0._tablesDic[slot2] then
		slot3.wTableId = slot2
		slot3.tagStatus.cbPlayStatus = slot1.cbPlayStatus
		slot3.tagStatus.cbTableLock = slot1.cbTableLock
		slot0._canUpdateTableData = true
		slot6 = slot0.tablesDicChangedSignal

		slot0.tablesDicChangedSignal.emit(slot1.cbTableLock)
	end
end

GameManager.updateTableByUserInfo = function (slot0, slot1)
	if not slot0._userSitDic[slot1.wUserId] then
		if slot0._tablesDic[slot1.tagStatus.wTableID] then
			slot3.tableUsers[slot1.tagStatus.wChairID] = slot1
			slot0._userSitDic[slot1.wUserId] = slot1
			slot8 = true

			slot0.setTablesDic(slot1.wUserId, slot0, slot0._tablesDic)
		end
	else
		slot5 = slot1.tagStatus.wTableID
		slot6 = slot1.tagStatus.wChairID
		({
			wUserId = slot1.wUserId,
			tagStatus = {}
		})["tagStatus"].wTableID = slot2.tagStatus.wTableID
		()["tagStatus"].wChairID = slot2.tagStatus.wChairID
		()["tagStatus"].cbUserStatus = slot1.tagStatus.cbUserStatus

		if slot0._tablesDic[slot2.tagStatus.wTableID] then
			if slot3 == slot5 then
				slot11 = slot0

				if slot0.getCurGameConfig(slot10) and slot1.tagStatus.wChairID <= slot9.player then
					if slot4 == slot6 then
						slot8.tableUsers[slot4] = slot1
					else
						slot8.tableUsers[slot4] = nil
						slot8.tableUsers[slot6] = tagInfo
					end
				end
			else
				slot8.tableUsers[slot4] = nil
				slot0._userSitDic[slot1.wUserId] = nil

				if slot0._tablesDic[slot5] then
					slot8.tableUsers[slot6] = slot1
					slot0._userSitDic[slot1.wUserId] = slot1
				end
			end

			slot13 = true

			slot0.setTablesDic(slot10, slot0, slot0._tablesDic)
		end
	end
end

GameManager.getUserData = function (slot0, slot1)
	return slot0._userDatasDic[slot1]
end

GameManager.switchViewChairID = function (slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot0._roomConfig.wChairCount

	if not slot3 then
		slot6 = Hero
		slot3 = Hero.getWChairID(slot5)
	end

	return ((slot2 + slot1) - slot3) % slot2 + 1
end

GameManager.getUserDatasByTableId = function (slot0, slot1, slot2)
	slot3 = {}

	if not slot1 then
		slot6 = Hero
		slot1 = Hero.getWTableID(slot5)
	end

	slot6 = slot0._userDatasDic

	for slot7, slot8 in pairs(slot5) do
		if slot7 ~= slot2 and slot8.wTableID == slot1 then
			slot12 = slot8

			table.insert(slot10, slot3)
		end
	end

	return slot3
end

GameManager.getUserDataBy = function (slot0, slot1, slot2)
	if not slot2 and not slot1 then
		return nil
	end

	if not slot1 then
		slot5 = Hero
		slot1 = Hero.getWTableID(slot4)
	end

	slot5 = slot0._userDatasDic

	for slot6, slot7 in pairs(slot4) do
		if slot7.wTableID == slot1 and slot7.wChairID == slot2 then
			return slot7
		end
	end

	return nil
end

GameManager.getUserDataByChairId = function (slot0, slot1)
	slot6 = slot1

	return slot0.getUserDataBy(slot3, slot0, nil)
end

GameManager.getSortedUsers = function (slot0, slot1, slot2)
	slot7 = 1
	slot3 = TableUtil.array2Dic(slot4, slot1, true)
	slot4 = {}
	slot7 = slot0._sortedUsers

	for slot8, slot9 in ipairs(true) do
		if not slot3[slot9.dwUserID] then
			slot13 = slot9

			table.insert(slot11, slot4)

			if slot2 and slot2 <= #slot4 then
				break
			end
		end
	end

	return slot4
end

GameManager.backupUserStates = function (slot0)
	slot3 = slot0._userDatasDic

	for slot4, slot5 in pairs(slot2) do
		if slot5.__oldStatus == nil then
			slot5.__oldStatus = slot5.cbUserStatus
		end
	end
end

GameManager.recoverUserStates = function (slot0)
	slot3 = slot0._userDatasDic

	for slot4, slot5 in pairs(slot2) do
		slot5.__oldStatus = nil
	end
end

GameManager.tick = function (slot0)
	if slot0._isUsersChanged then
		slot3 = slot0._userDatasDic

		function slot6(slot0, slot1)
			return slot1.lScore < slot0.lScore
		end

		table.sort(slot4, slot1)

		slot6 = TableUtil.toArray(slot2)

		slot0.setSortedUsers(slot4, slot0)

		slot0._isUsersChanged = false
	end

	if slot0._canUpdateTableData then
		slot0._canUpdateTableData = false
		slot3 = slot0.tableViewChangedSignal

		slot0.tableViewChangedSignal.emit(slot2)

		slot3 = slot0

		slot0.recoverUserStates(slot2)
	end
end

GameManager.removeUser = function (slot0, slot1)
	slot0._userDatasDic[slot1] = nil
	slot0._isUsersChanged = true
	slot4 = slot0.userDatasDicChangedSignal

	slot0.userDatasDicChangedSignal.emit(nil)
end

GameManager.addOrUpdateUser = function (slot0, slot1)
	if not slot0._userDatasDic[slot1.dwUserID] then
		slot0._userDatasDic[slot1.dwUserID] = slot1
	else
		slot6 = slot2

		TableUtil.copyPropertyTo(slot4, slot1)
	end

	slot0._isUsersChanged = true
	slot5 = slot0.userDatasDicChangedSignal

	slot0.userDatasDicChangedSignal.emit(slot4)
end

GameManager.requestUpdateCurRoomsOnlines = function (slot0, slot1)
	if slot0._curTry2EnterRoomVos and #slot0._curTry2EnterRoomVos > 0 then
		slot2 = {}
		slot5 = slot0._curTry2EnterRoomVos

		for slot6, slot7 in ipairs(slot4) do
			slot11 = slot7.wServerID

			table.insert(slot9, slot2)
		end

		slot7 = slot1

		slot0.reqestUpdateRoomsOnlines(slot4, slot0, slot2)
	else
		slot4 = slot1

		applyFunction(slot3)
	end
end

GameManager.reqestUpdateRoomsOnlines = function (slot0, slot1, slot2)
	if #slot1 > 0 then
		slot5 = slot1

		reqGetServerOnline(slot4)

		slot0._updateRoomListOnlineCallback = slot2
	else
		slot5 = slot2

		applyFunction(slot4)
	end
end

GameManager.cookServerVos = function (slot0, slot1)
	slot0._serverVosDic = {}
	slot0._serverVosDicEx = {}
	slot4 = slot1

	for slot5, slot6 in ipairs(slot3) do
		slot7 = false

		if IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL then
			slot11 = slot6.wSortID

			if slot0.cookRoomKindBySortID(slot9, slot0) == 1 then
			end
		end

		if not slot7 then
			if not slot0._serverVosDic[slot6.wKindID] then
				slot0._serverVosDic[slot6.wKindID] = {}
			end

			slot12 = slot6

			table.insert(slot10, slot8)
		end
	end

	function slot2(slot0, slot1)
		return (slot0.wSortID or 0) < (slot1.wSortID or 0)
	end

	slot5 = slot0._serverVosDic

	for slot6, slot7 in pairs(slot4) do
		slot8 = {}
		slot12 = slot2

		table.sort(slot10, slot7)

		slot11 = slot7

		for slot12, slot13 in ipairs(slot10) do
			slot17 = slot13.wSortID
			slot14 = slot0.cookRoomKindBySortID(slot15, slot0)

			if not slot0._serverVosDicEx[slot6] then
				slot0._serverVosDicEx[slot6] = {}
			end

			if not slot15[slot14] then
				slot15[slot14] = {
					_totalOnline = 0,
					_dwCellScore = 0,
					_miniNeed = nil
				}
			end

			slot13.roomNumIndex = #slot16 + 1
			slot20 = slot13

			table.insert(slot18, slot16)

			slot16._totalOnline = slot16._totalOnline + slot13.dwOnLineCount
			slot16._dwCellScore = slot13.dwFullCount or 0

			if not slot16._miniNeed then
				slot16._miniNeed = slot13.dwMinEnterScore
			else
				slot20 = slot13.dwMinEnterScore
				slot16._miniNeed = math.max(slot18, slot16._miniNeed)
			end
		end
	end

	slot0._serverVosDicEx[GameKind_DDZ_VIRTUAL] = {}

	if slot0._serverVosDicEx[GameKind_DDZ_JD] then
		slot5 = slot0._serverVosDicEx[GameKind_DDZ_JD]
		slot0._serverVosDicEx[GameKind_DDZ_VIRTUAL][GameKind_DDZ_JD] = TableUtil.copyDataDep(slot4)
		slot0._serverVosDicEx[GameKind_DDZ_JD] = nil
	end

	if slot0._serverVosDicEx[GameKind_DDZ_BXP] then
		slot5 = slot0._serverVosDicEx[GameKind_DDZ_BXP]
		slot0._serverVosDicEx[GameKind_DDZ_VIRTUAL][GameKind_DDZ_BXP] = TableUtil.copyDataDep(slot4)
		slot0._serverVosDicEx[GameKind_DDZ_BXP] = nil
	end

	slot6 = GameEvent.ON_ROOM_SERVER_LIST_CHANGED

	eventMgr.dispatch(slot4, eventMgr)
end

GameManager.cookKindVos = function (slot0, slot1)
	slot0._kindVosDic = {}
	slot4 = slot1

	for slot5, slot6 in ipairs(slot3) do
		slot0._kindVosDic[slot6.wKindID] = slot6
	end
end

GameManager.cookTypeVos = function (slot0, slot1)
	slot0._typeVosDic = {}
	slot4 = slot1

	for slot5, slot6 in ipairs(slot3) do
		slot0._typeVosDic[slot6.wTypeID] = slot6
	end
end

GameManager.cookRoomKindBySortID = function (slot0, slot1)
	slot4 = slot1 / 100

	return math.floor(slot3) + 1
end

GameManager.checkLoadingSentences = function (slot0)
	slot4 = {
		"晚一步不如早一步，问题您来了！",
		"玩是高尚娱乐，博是低级趣味",
		"世界上最美的湖，是碰碰湖",
		"现在的一切美好事物,无一不是创新的结果",
		"敢于下注，赢家永远属于您！",
		"打鱼靠技术，心态不能急，手不能抖！",
		"世界上最漂亮的花，是杠上开花",
		"永不言败，推倒再来",
		"输了不投降，竞争意识强",
		"输赢都不走，能做一把手",
		"游戏开始后的感觉就像回家一样，so  sweet",
		"人生如麻将，一见钟情叫天胡",
		"一样的游戏，不一样的体验",
		"只要思想不滑坡，办法总比困难多！",
		"搏一搏，单车变摩托，再博一博，路虎变航母",
		"拼一拼 草房变洋房。 再拼一拼，夏利变宾利",
		"哪家小孩天天哭，哪个牌友天天输？",
		"爱拼才会赢,敢下就会红!要想富,下重注!",
		"你还记得大明湖畔的夏雨荷吗",
		"岁月是把杀猪刀，紫了葡萄，黑了木耳，软了香蕉",
		"打多打少全凭一个缘字，打多打少别声张",
		"人生只有走出来的精彩，没有等出来的辉煌。",
		"人生在世无非是让别人笑笑，偶尔笑笑别人",
		"只有一条路不能选择——那就是放弃的路",
		"下次对决时，我也不会是今天的我",
		"错不了，就是你，你就是我一辈子的劲敌！",
		"需要两个实力相当的凑在一起，才能够达到神乎其技！",
		"胜者才有资格往上爬！",
		"一想到有你这样的牌友，就觉得不枉选了这条路",
		"尊重对手的加注，尤其是反加",
		"针对不同的对手要有不同的打法",
		"不是无路可走的时候，最好不要起手就全压",
		"冲动是魔鬼，心态好，运气自然来",
		"冲动是魔鬼，心态好，运气自然来",
		"虽然保守不是最好的策略，但是冲动只会让你结束的更快。",
		"每个牌局好似人生，该出手时就出手，不因为错过而后悔",
		"中国的老话，软的怕硬的，硬的怕不要命的",
		"唯一比凶猛的对手更可怕的是你的错误打法",
		"弃牌是最常见的策略，牌不好就等下一次机会",
		"大牌要你命，小牌能救命",
		"只要你活的比对手时间长你就赢了",
		"只要你不是最大的牌，你就要想对手下重注的理由",
		"尊重对手就是尊重自己的钱包",
		"小输十把没关系，大赢一把就OK"
	}

	TableUtil.randomSort(slot3)

	if not LOADING_SENTENCES_ARR then
		LOADING_SENTENCES_ARR = slot1
		LOADING_SENTENCES_ARR.__intervalS = 10
	else
		slot5 = #slot1

		for slot6 = 1, math.max(slot3, #LOADING_SENTENCES_ARR), 1 do
			LOADING_SENTENCES_ARR[slot6] = slot1[slot6]
		end
	end
end

GameManager.loadGameConfig = function (slot0)
	slot3 = "c_gameconfig"
	slot0._gameConfigsDic = getCSVField(slot2)
end

GameManager.fixGameState = function (slot0)
	if shengsPhone then
		slot0._gameConfigsDic[GameKind_DNTGLK].showEntrance = 1
		slot0._gameConfigsDic[GameKind_DNTGLK].isOpen = 1
	end

	if isOutServer and isOutServerTest then
		slot0._gameConfigsDic[GameKind_FISHTD].showEntrance = 1
		slot0._gameConfigsDic[GameKind_FISHTD].isOpen = 1
		slot0._gameConfigsDic[GameKind_SGJ].showEntrance = 1
		slot0._gameConfigsDic[GameKind_SGJ].isOpen = 1
		slot0._gameConfigsDic[GameKind_QZNN].showEntrance = 1
		slot0._gameConfigsDic[GameKind_QZNN].isOpen = 1
		slot0._gameConfigsDic[GameKind_JDNN].showEntrance = 1
		slot0._gameConfigsDic[GameKind_JDNN].isOpen = 1
		slot0._gameConfigsDic[GameKind_ERMJex].showEntrance = 1
		slot0._gameConfigsDic[GameKind_ERMJex].isOpen = 1
	elseif isOutServer and not isOutServerTest then
		slot0._gameConfigsDic[GameKind_FISHTD].isOpen = 0
		slot0._gameConfigsDic[GameKind_SGJ].showEntrance = 0
		slot0._gameConfigsDic[GameKind_SGJ].isOpen = 0
		slot0._gameConfigsDic[GameKind_QZNN].showEntrance = 0
		slot0._gameConfigsDic[GameKind_QZNN].isOpen = 0
		slot0._gameConfigsDic[GameKind_JDNN].showEntrance = 0
		slot0._gameConfigsDic[GameKind_JDNN].isOpen = 0

		if PACKAGE_DEVICE_TYPE == 109 or PACKAGE_DEVICE_TYPE == 215 then
			slot0._gameConfigsDic[GameKind_DDZ_VIRTUAL].showEntrance = 1
			slot0._gameConfigsDic[GameKind_DDZ_VIRTUAL].isOpen = 0
		end
	end

	if IS_IOS_VERIFY and (IS_IOS_VERIFY_ALL or IS_IOS_VERIFY_ALL_NO_BANK) then
		function slot1(slot0, slot1)
			if slot0._gameConfigsDic[slot0] then
				if slot1 then
					slot2.showEntrance = 1
					slot2.isOpen = 1
				else
					slot2.showEntrance = 0
					slot2.isOpen = 0
				end
			end
		end

		slot2 = {}

		if IS_IOS_VERIFY and PACKAGE_DEVICE_TYPE == 500 then
			slot2[GameKind_DDZ_VIRTUAL] = true
			slot2[GameKind_ERMJ] = true
		elseif PACKAGE_DEVICE_TYPE == 109 then
			slot2[GameKind_DNTGTEST] = true
			slot2[GameKind_HLZZ] = true
			slot2[GameKind_HHSW] = true
			slot2[GameKind_DDZ_VIRTUAL] = true
		elseif PACKAGE_DEVICE_TYPE == 111 then
			slot2[GameKind_QBSK] = true
		elseif PACKAGE_DEVICE_TYPE == 113 then
			slot2[GameKind_FQZS] = true
		elseif PACKAGE_DEVICE_TYPE == 121 then
			slot2[GameKind_YSZ] = true
			slot2[GameKind_FISHTD] = true
			slot2[GameKind_HHSW] = true
			slot2[GameKind_HLSSM] = true
		elseif PACKAGE_DEVICE_TYPE == 122 then
			slot2[GameKind_HLWZ] = true
		elseif PACKAGE_DEVICE_TYPE == 124 then
			slot2[GameKind_BCBM] = true
		elseif PACKAGE_DEVICE_TYPE == 132 or PACKAGE_DEVICE_TYPE == 106 then
			slot2[GameKind_LRNN] = true
			slot2[GameKind_ERNN] = true
			slot2[GameKind_SRNN] = true
			slot2[GameKind_HLWZ] = true
			slot2[GameKind_BRNN] = true
			slot2[GameKind_BCBM] = true
			slot2[GameKind_HHSW] = true
			slot2[GameKind_SDB] = true
			slot2[GameKind_HLSSM] = true
			slot2[GameKind_QBSK] = true
			slot2[GameKind_HLZZ] = true
			slot2[GameKind_ERMJ] = true
			slot2[GameKind_YSZ] = true
			slot2[GameKind_DNTG] = true
			slot2[GameKind_DDZ_VIRTUAL] = true
			slot2[GameKind_DNTGTEST] = true
		elseif PACKAGE_DEVICE_TYPE == 125 then
			slot2[GameKind_LRNN] = true
		elseif PACKAGE_DEVICE_TYPE == 126 then
			slot2[GameKind_DDZ_VIRTUAL] = true
		elseif PACKAGE_DEVICE_TYPE == 128 then
			slot2[GameKind_LRNN] = true
		elseif PACKAGE_DEVICE_TYPE == 129 then
			slot2[GameKind_DDZ_VIRTUAL] = true
		elseif PACKAGE_DEVICE_TYPE == 131 then
			slot2[GameKind_DNTGTEST] = true
			slot2[GameKind_HLWZ] = true
			slot2[GameKind_HHSW] = true
			slot2[GameKind_BRNN] = true
		elseif PACKAGE_DEVICE_TYPE == 141 then
			slot2[GameKind_BCBM] = true
		end

		slot5 = slot0._gameConfigsDic

		for slot6, slot7 in pairs(slot4) do
			slot11 = slot2[slot6] ~= nil

			slot1(slot9, slot6)
		end
	end
end

GameManager.calPukeInfo = function (slot0, slot1)
	slot7 = LOGIC_MASK_COLOR
	slot5 = 4
	slot6 = LOGIC_MASK_VALUE

	return bit.band(bit.band(slot5, slot1), slot1), bit.rshift(slot3, bit.band(slot5, slot1))
end

GameManager.getCurRoomKindName = function (slot0)
	slot3 = slot0

	return ({
		"体验场",
		"初级场",
		"普通场",
		"中级场",
		"高级场"
	})[slot0.getCurRoomKind(slot2)] or ""
end

GameManager.getCurRoomNum = function (slot0)
	slot1 = 1
	slot4 = slot0

	if slot0.getCurRoomVo(slot3) then
		return slot2.roomNumIndex
	end

	return slot1
end

GameManager.getRoomTypeBySortID = function (slot0, slot1)
	return (slot1 - slot1 % 100) / 100 + 1
end

GameManager.checkGameKindId = function (slot0, slot1)
	slot2 = nil

	return ((slot1 ~= GameKind_DDZ_JD and slot1 ~= GameKind_DDZ_BXP) or GameKind_DDZ_VIRTUAL) and slot1
end

GameManager.checkRealGameKindId = function (slot0, slot1)
	slot2 = nil

	if slot1 == GameKind_DDZ_VIRTUAL then
		slot5 = Hero
		slot2 = Hero.getRealGameKind(slot4)
	else
		slot2 = slot1
	end

	return slot2
end

GameManager.checkDdzRoomCanEnter = function (slot0)
	slot3 = gameMgr
	roomDic = gameMgr.getServerVosDic(slot2)[GameKind_DDZ_BXP]

	if not roomDic then
		roomDic = slot1[GameKind_DDZ_JD]
	end

	if not roomDic then
		slot2 = nil
	end

	slot3 = 0
	slot4 = 0
	slot5 = Hero.getUserScore(slot6)
	slot8 = roomDic

	for slot9, slot10 in ipairs(Hero) do
		if slot10.dwMinEnterScore <= slot5 and slot3 <= slot10.dwMinEnterScore then
			slot3 = slot10.dwMinEnterScore
			minIndex = slot9
		end
	end

	return slot2, slot4
end

gameMgr = GameManager.new()

return
