slot2 = "NetworkManager"
NetworkManager = class(slot1)

NetworkManager.ctor = function (slot0)
	slot0._loadCallbackDic = {}
	slot0._roomCallbackDic = {}
	slot0._userCallbackDic = {}
	slot0._trumpCallbackDic = {}
	slot5 = 0

	createSetterGetter(slot2, slot0, "headPingTime")

	slot0._headPingTimeTemp = 0
	slot5 = false

	createSetterGetter(slot2, slot0, "isCloseRoomSocketByManual")

	slot0.m_NewheartCounter = 0
	slot5 = 0

	createSetterGetter(slot2, slot0, "trumpHeadPingTime")

	slot0._trumpHeadPingTimeTemp = 0
	slot0.m_trumpNewheartCounter = 0
	slot6 = slot0

	slot0.registerloadfunction(slot2, slot0, SUB_KN_DETECT_SOCKET, slot0.networkszCompilatioFalut)

	slot6 = slot0

	slot0.registerloadfunction(slot2, slot0, MDM_GP_USER_SERVICE, slot0.networkUserService)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GR_CONFIG, slot0.roomconfigResult)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GR_USER, slot0.networkGRUser)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GR_STATUS, slot0.networkGRStatus)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GF_FRAME, slot0.networkGRFrame)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GF_GAME, slot0.networkGRGame)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_CM_SYSTEM, slot0.networkGRSystem)

	slot6 = slot0

	slot0.registerloadfunction(slot2, slot0, MDM_MB_MATCH, slot0.onMatchHallResult)

	slot6 = slot0

	slot0.registerroomfunction(slot2, slot0, MDM_GR_MATCH, slot0.onMatchBattleResult)
end

NetworkManager.networkGRGame = function (slot0, slot1, slot2)
	slot5 = gameMgr

	if gameMgr.getNeedStoreGameStackMsg(slot4) then
		slot7 = gameMgr
		slot6 = {
			bodyStr = slot1,
			mainId = MDM_GF_GAME,
			subId = slot2
		}

		table.insert(slot4, gameMgr.getGameStackMsgs(slot6))
	end

	slot8 = slot2

	eventMgr.dispatch(slot4, eventMgr, GameEvent.ON_GAME_MESSAGE_BY_SERVER, slot1)
end

NetworkManager.registerloadfunction = function (slot0, slot1, slot2, slot3)
	if not slot0._loadCallbackDic[slot1] then
		slot0._loadCallbackDic[slot1] = SignalAs3.new()
	end

	slot9 = slot3

	slot4.add(slot6, slot4, slot2)
end

NetworkManager.registertrumpfunction = function (slot0, slot1, slot2, slot3)
	if not slot0._trumpCallbackDic[slot1] then
		slot0._trumpCallbackDic[slot1] = SignalAs3.new()
	end

	slot9 = slot3

	slot4.add(slot6, slot4, slot2)
end

NetworkManager.registerroomfunction = function (slot0, slot1, slot2, slot3)
	if not slot0._roomCallbackDic[slot1] then
		slot0._roomCallbackDic[slot1] = SignalAs3.new()
	end

	slot9 = slot3

	slot4.add(slot6, slot4, slot2)
end

NetworkManager.registeruserfunction = function (slot0, slot1, slot2, slot3)
	if not slot0._userCallbackDic[slot1] then
		slot0._userCallbackDic[slot1] = SignalAs3.new()
	end

	slot9 = slot3

	slot4.add(slot6, slot4, slot2)
end

NetworkManager.unregisterloadfunction = function (slot0, slot1, slot2, slot3)
	if slot2 and slot0._loadCallbackDic[slot1] then
		slot9 = slot3

		slot4.remove(slot6, slot4, slot2)
	end
end

NetworkManager.unregisterroomfunction = function (slot0, slot1, slot2, slot3)
	if slot2 and slot0._roomCallbackDic[slot1] then
		slot9 = slot3

		slot4.remove(slot6, slot4, slot2)
	end
end

NetworkManager.unregisteruserfunction = function (slot0, slot1, slot2, slot3)
	if slot2 and slot0._userCallbackDic[slot1] then
		slot9 = slot3

		slot4.remove(slot6, slot4, slot2)
	end
end

NetworkManager.unregisterAllLoadFunction = function (slot0, slot1)
	if slot0._loadCallbackDic[slot1] then
		slot5 = slot2

		slot2.removeAll(slot4)

		slot0._loadCallbackDic[slot1] = nil
	end
end

NetworkManager.unregisterAllRoomFunction = function (slot0, slot1)
	if slot0._roomCallbackDic[slot1] then
		slot5 = slot2

		slot2.removeAll(slot4)

		slot0._roomCallbackDic[slot1] = nil
	end
end

NetworkManager.unregisterAllUserFunction = function (slot0, slot1)
	if slot0._userCallbackDic[slot1] then
		slot5 = slot2

		slot2.removeAll(slot4)

		slot0._userCallbackDic[slot1] = nil
	end
end

NetworkManager.networkGRSystem = function (slot0, slot1, slot2)
	if slot2 == SUB_CM_SYSTEM_MESSAGE then
		slot7 = "CMD_CM_SystemMessage"
		slot7 = SMT_CLOSE_ROOM

		if bit.band(ffiMgr, ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).wType) ~= 0 then
			slot8 = slot3

			eventMgr.dispatch(slot5, eventMgr, GameEvent.ON_SYSTEM_MESSAGE_CLOSE_ROOM)
		else
			slot7 = SMT_CLOSE_GAME

			if bit.band(slot5, slot3.wType) == 0 then
				slot7 = SMT_CLOSE_LINK

				if bit.band(slot5, slot3.wType) ~= 0 then
					slot7 = slot3.szString

					mainMgr.showAlert2ExitLogin(slot5, mainMgr)
				else
					slot7 = SMT_EJECT

					if bit.band(slot5, slot3.wType) ~= 0 then
						slot7 = slot3.szString

						popupMgr.showConfirm(slot5, popupMgr)
					else
						slot7 = SMT_PROMPT

						if bit.band(slot5, slot3.wType) ~= 0 then
							slot7 = slot3.szString

							tweenMsgMgr.showMsg(slot5, tweenMsgMgr)
						else
							slot7 = SMT_TABLE_ROLL

							if bit.band(slot5, slot3.wType) ~= 0 then
							else
								slot7 = SMT_CHAT

								if bit.band(slot5, slot3.wType) ~= 0 then
								end
							end
						end
					end
				end
			end
		end

		slot8 = slot3.szString

		trace(slot5, "系统消息下发", slot2)

		slot6 = slot3

		trace_r(slot5)
	else
		slot6 = slot2

		print(slot4, "系统消息下发")
	end
end

NetworkManager.networkGRFrame = function (slot0, slot1, slot2)
	if slot2 == SUB_GF_GAME_STATUS then
		slot7 = "CMD_GF_GameStatus"

		if #slot1 == ffiMgr.sizeOf(slot5, ffiMgr) then
			slot7 = "CMD_GF_GameStatus"
			slot3 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)
			slot7 = slot3.cbGameStatus

			gameMgr.setGameStatus(ffiMgr, gameMgr)

			slot7 = slot3.cbGameStatus

			print(ffiMgr, "服务器下发游戏状态")

			slot8 = slot3

			eventMgr.dispatch(ffiMgr, eventMgr, GameEvent.ON_ENTER_BATTLE_BY_SERVER)
		end
	elseif slot2 == SUB_GF_GAME_SCENE then
		slot5 = gameMgr

		if gameMgr.getNeedStoreGameStackMsg(slot4) then
			slot7 = gameMgr
			slot6 = {
				bodyStr = slot1,
				mainId = MDM_GF_FRAME,
				subId = slot2
			}

			table.insert(slot4, gameMgr.getGameStackMsgs(slot6))
		end

		slot7 = slot1

		eventMgr.dispatch(slot4, eventMgr, GameEvent.ON_GAME_SCENE_BY_SERVER)
	elseif slot2 == SUB_GF_SYSTEM_MESSAGE then
		slot7 = "CMD_CM_SystemMessage"

		if #slot1 == ffiMgr.sizeOf(slot5, ffiMgr) then
			slot7 = "CMD_CM_SystemMessage"
			slot8 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			eventMgr.dispatch(ffiMgr, eventMgr, GameEvent.whNd_Main_Sub_CM_System)
		end
	elseif slot2 == SUB_GF_USER_CHAT then
	elseif slot2 == SUB_GF_USER_EXPRESSION then
	elseif slot2 == SUB_GF_LUCKYMONEY then
		slot7 = "CMD_GF_S_LuckyMoney"

		if #slot1 == ffiMgr.sizeOf(slot5, ffiMgr) then
			slot5 = gameMgr

			if gameMgr.getNeedStoreGameStackMsg(slot4) then
				slot7 = gameMgr
				slot6 = {
					bodyStr = slot1,
					mainId = MDM_GF_FRAME,
					subId = slot2
				}

				table.insert(slot4, gameMgr.getGameStackMsgs(slot6))
			end

			slot7 = "CMD_GF_S_LuckyMoney"
			slot8 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			eventMgr.dispatch(ffiMgr, eventMgr, GameEvent.ON_GAME_LUCKMONEY)
		end
	elseif slot2 == SUB_GF_LUCKYMONEY_ENTER then
		slot7 = "CMD_GF_S_LuckyMoney"

		if #slot1 == ffiMgr.sizeOf(slot5, ffiMgr) then
			slot5 = gameMgr

			if gameMgr.getNeedStoreGameStackMsg(slot4) then
				slot7 = gameMgr
				slot6 = {
					bodyStr = slot1,
					mainId = MDM_GF_FRAME,
					subId = slot2
				}

				table.insert(slot4, gameMgr.getGameStackMsgs(slot6))
			end

			slot7 = "CMD_GF_S_LuckyMoney"
			slot8 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			eventMgr.dispatch(ffiMgr, eventMgr, GameEvent.ON_GAME_LUCKMONEY_ENTER)
		end
	end
end

NetworkManager.networkGRStatus = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_TABLE_INFO then
		slot7 = "CMD_GR_TableInfo"

		for slot7 = 1, ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).wTableCount, 1 do
			if slot3.TableStatusArray[slot7] then
				slot14 = slot7 ~= slot3.wTableCount

				gameMgr.addTable(slot10, gameMgr, slot8, slot7 - 1)
			end
		end
	elseif slot2 == SUB_GR_TABLE_STATUS then
		slot7 = "CMD_GR_TableStatus"
		slot8 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).wTableID

		gameMgr.updateTableByStatus(ffiMgr, gameMgr, ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).TableStatus)
	end
end

NetworkManager.networkGRUser = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_USER_WAIT_DISTRIBUTE then
	elseif slot2 == SUB_GR_USER_ENTER then
		slot5 = gameMgr

		gameMgr.backupUserStates(slot4)

		slot6 = slot1

		slot0.onUserEnter(slot4, slot0)
	elseif slot2 == SUB_GR_USER_STATUS then
		slot5 = gameMgr

		gameMgr.backupUserStates(slot4)

		slot6 = slot1

		slot0.onUserStatus(slot4, slot0)
	elseif slot2 == SUB_GR_USER_SCORE then
		slot6 = slot1

		slot0.onUserScore(slot4, slot0)
	elseif slot2 == SUB_GR_PROPERTY_TRUMPET then
	elseif slot2 == SUB_GR_PROPERTY_FAILURE then
	else
		if slot2 == SUB_GR_REQUEST_FAILURE then
			slot6 = true

			popupMgr.hideActivityIndicator(slot4, popupMgr)

			function slot11()
				if slot0.cbFailureCode == 888 then
					slot1()
				end
			end

			popupMgr.showAlert("CMD_GR_RequestFailure", popupMgr, ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).szDescribeString, function ()
				if slot0.cbFailureCode == 888 then
					slot3 = GameEvent.whNd_Room_LeaveGame

					eventMgr.dispatch(slot1, eventMgr)
				end
			end)

			return
		end

		if slot2 == SUB_GR_USER_STANDUP_RETURN then
			slot7 = "CMD_GR_StandUp_Return"
			slot6 = "服务器下发强制退出的结果:"

			print(ffiMgr)

			slot6 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			print_r(ffiMgr)

			slot8 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			eventMgr.dispatch(ffiMgr, eventMgr, GameEvent.ON_FORCE_LEAVE_GAME)
		end
	end
end

NetworkManager.onUserScore = function (slot0, slot1)
	slot6 = "CMD_GR_UserScore"

	if #slot1 == ffiMgr.sizeOf(slot4, ffiMgr) then
	else
		slot6 = "CMD_GR_MobileUserScore"

		if slot2 == ffiMgr.sizeOf(slot4, ffiMgr) then
			slot7 = "CMD_GR_MobileUserScore"
			slot7 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).dwUserID

			if gameMgr.getUserData(ffiMgr, gameMgr) then
				slot4.lScore = slot3.UserScore.lScore
			end

			slot8 = Hero

			if slot3.dwUserID == Hero.getDwUserID(slot7) and slot3.UserScore.dwWinCount < 4294967294.0 then
				slot8 = slot3.UserScore.lScore

				trace(slot6, "更新用户score1:")

				slot8 = slot3.UserScore.lScore

				Hero.setUserScore(slot6, Hero)
			end

			slot9 = slot4

			eventMgr.dispatch(slot6, eventMgr, GameEvent.ON_USER_SCORE)
		end
	end
end

NetworkManager.onUserStatus = function (slot0, slot1)
	slot6 = "CMD_GR_UserStatus"

	if #slot1 ~= ffiMgr.sizeOf(slot4, ffiMgr) then
		return
	end

	slot7 = "CMD_GR_UserStatus"
	slot7 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).dwUserID

	if not gameMgr.getUserData(ffiMgr, gameMgr) then
		return
	end

	slot5 = slot3.UserStatus.wTableID
	slot6 = slot4.wTableID
	slot7 = slot3.UserStatus.wChairID
	slot8 = slot4.wChairID
	slot10 = slot4.cbUserStatus
	({
		wUserId = slot3.dwUserID,
		wFaceID = slot4.wFaceID,
		wGender = slot4.wGender,
		lExperience = slot4.lExperience,
		szNickName = slot4.szNickName,
		lScore = slot4.lScore,
		tagStatus = {}
	})["tagStatus"].cbUserStatus = slot3.UserStatus.cbUserStatus
	()["tagStatus"].wTableID = slot3.UserStatus.wTableID
	()["tagStatus"].wChairID = slot3.UserStatus.wChairID
	slot15 = 

	gameMgr.updateTableByUserInfo(slot3.UserStatus.wChairID, gameMgr)

	slot14 = slot4
	slot12 = TableUtil.copyDataDep(slot3.UserStatus.wChairID)

	if slot3.UserStatus.cbUserStatus == US_NULL then
		slot16 = slot4.dwUserID

		gameMgr.removeUser(slot14, gameMgr)

		slot18 = slot12

		eventMgr.dispatch(slot14, eventMgr, GameEvent.ON_USER_STATUS, slot4)

		return
	end

	slot4.wTableID = slot5
	slot4.wChairID = slot7
	slot4.cbUserStatus = slot9
	slot16 = Hero

	if slot3.dwUserID == Hero.getDwUserID(slot15) then
		slot16 = slot3.UserStatus.cbUserStatus

		Hero.setCbStatus(slot14, Hero)

		slot16 = slot3.UserStatus.wChairID

		Hero.setWChairID(slot14, Hero)

		slot16 = slot3.UserStatus.wTableID

		Hero.setWTableID(slot14, Hero)

		if US_FREE < slot3.UserStatus.cbUserStatus then
			slot15 = gameMgr

			if not gameMgr.getIsStartGame(slot14) then
				slot16 = slot3.UserStatus.cbUserStatus

				print(slot14, "用户状态是")

				slot15 = gameMgr

				gameMgr.sendGameOption(slot14)
			end
		end
	end

	slot18 = slot12

	eventMgr.dispatch(slot14, eventMgr, GameEvent.ON_USER_STATUS, slot4)
end

NetworkManager.onUserEnter = function (slot0, slot1)
	slot6 = "tagMobileUserInfoHead"

	if #slot1 < ffiMgr.sizeOf(slot4, ffiMgr) then
		return
	end

	slot7 = "tagMobileUserInfoHead"

	if ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1).cbUserStatus == US_LOOKON then
		return
	end

	slot4 = {
		dwUserID = slot3.dwUserID,
		dwGameID = slot3.dwGameID,
		wTableID = slot3.wTableID,
		wChairID = slot3.wChairID,
		cbUserStatus = slot3.cbUserStatus,
		wFaceID = slot3.wFaceID,
		wGender = slot3.cbGender,
		cbMemberOrder = slot3.cbMemberOrder,
		lScore = slot3.lScore,
		lWinCount = slot3.dwWinCount,
		lLostCount = slot3.dwLostCount,
		lDrawCount = slot3.dwDrawCount,
		lFleeCount = slot3.dwFleeCount,
		lExperience = slot3.dwExperience
	}
	slot8 = "tagMobileUserInfoHead"
	slot5 = ffiMgr.sizeOf(slot6, ffiMgr) + 1
	slot9 = "tagDataDescribe"
	slot6 = ffiMgr.sizeOf(ffiMgr, ffiMgr)

	while true do
		if slot2 <= (slot5 + slot6) - 1 then
			break
		end

		slot12 = slot7
		slot13 = "tagDataDescribe"

		if ffiMgr.castStruct2TableByLuaStr(slot1, ffiMgr, string.sub(slot9, slot1, slot5)).wDataDescribe == DTP_GR_NICK_NAME and slot2 >= (slot7 + 1 + slot9.wDataSize) - 1 then
			slot16 = slot11
			slot15 = string.sub(slot13, slot1, slot10)
			slot4.szNickName = StringUtil.truncateZeroTerminated(slot1)
		end

		slot5 = slot5 + slot6 + slot9.wDataSize
	end

	slot10 = slot4

	gameMgr.addOrUpdateUser(slot8, gameMgr)

	slot10 = Hero

	if slot3.dwUserID == Hero.getDwUserID(gameMgr) then
		slot10 = slot3.cbUserStatus

		print(slot8, "onUserEnter 玩家（自己）进入房间，状态")

		slot10 = slot3.cbUserStatus

		Hero.setCbStatus(slot8, Hero)

		slot10 = slot3.wChairID

		Hero.setWChairID(slot8, Hero)

		slot10 = slot3.wTableID

		Hero.setWTableID(slot8, Hero)

		slot10 = slot3.dwCustomID

		Hero.setWCustom(slot8, Hero)

		slot10 = slot3.wFaceID

		Hero.setWFaceID(slot8, Hero)

		if slot3.dwWinCount > 4294967294.0 then
			slot10 = true

			Hero.setIsInTestRoom(slot8, Hero)
		else
			slot10 = slot3.lScore

			trace(slot8, "更新用户score2：")

			slot10 = false

			Hero.setIsInTestRoom(slot8, Hero)

			slot10 = slot3.lScore

			Hero.setUserScore(slot8, Hero)
		end
	end

	({
		wUserId = slot3.dwUserID,
		wFaceID = slot3.wFaceID,
		wGender = slot3.cbGender,
		lExperience = slot3.dwExperience,
		szNickName = slot4.szNickName,
		lScore = slot3.lScore,
		tagStatus = {}
	})["tagStatus"].cbUserStatus = slot3.cbUserStatus
	()["tagStatus"].wTableID = slot3.wTableID
	()["tagStatus"].wChairID = slot3.wChairID
	slot11 = 

	gameMgr.updateTableByUserInfo(slot3.wChairID, gameMgr)

	slot12 = slot4

	eventMgr.dispatch(slot3.wChairID, eventMgr, GameEvent.ON_USER_ENTER)
end

NetworkManager.roomconfigResult = function (slot0, slot1, slot2)
	if slot2 == SUB_GR_CONFIG_SERVER then
		slot7 = "CMD_GR_ConfigServer"

		if #slot1 == ffiMgr.sizeOf(slot5, ffiMgr) then
			slot7 = "CMD_GR_ConfigServer"
			slot6 = "服务器派发房间信息"

			print(ffiMgr)

			slot6 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			print_r(ffiMgr)

			slot7 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)

			gameMgr.setRoomConfig(ffiMgr, gameMgr)
		end
	end
end

NetworkManager.networkszCompilatioFalut = function (slot0, slot1, slot2)
	slot6 = "授权码错误，请重新登录！"

	mainMgr.showAlert2ExitLogin(slot4, mainMgr)
end

NetworkManager.connectSocket = function (slot0, slot1, slot2, slot3)
	if slot3 == SOCKET_TYPE_ROOM then
		slot7 = false

		slot0.setIsCloseRoomSocketByManual(slot5, slot0)
	end

	slot9 = slot3

	socketMgr.connect(slot5, socketMgr, slot1, slot2)
end

NetworkManager.closeSocket = function (slot0, slot1)
	if slot1 ~= SOCKET_TYPE_LOAD and slot1 ~= SOCKET_TYPE_TRUMP then
		slot5 = true

		slot0.setIsCloseRoomSocketByManual(slot3, slot0)
	end

	slot5 = slot1

	socketMgr.close(slot3, socketMgr)
end

NetworkManager.networkUserService = function (slot0, slot1, slot2)
	slot9 = slot1

	slot0.applyCallback(slot4, slot0, slot0._userCallbackDic, slot2, slot2)
end

NetworkManager.applyCallback = function (slot0, slot1, slot2, slot3, slot4)
	if slot1[slot2] then
		slot10 = slot3

		slot5.emit(slot7, slot5, slot4)
	end
end

NetworkManager.sendHeart = function (slot0)
	slot4 = SOCKET_TYPE_ROOM

	if socketMgr.isConnected(slot2, socketMgr) then
		if slot0.m_NewheartCounter >= 3 then
			slot0.m_NewheartCounter = 0
			slot0._headPingTime = 0
			slot3 = slot0

			slot0.onNetworkHeardTimeOut(slot2)
		else
			slot0.m_NewheartCounter = slot0.m_NewheartCounter + 1
			slot3 = tickMgr
			slot0._headPingTimeTemp = tickMgr.getTimer(slot2)

			reqSendHeart()
		end
	end

	slot3 = slot0

	slot0.sendTrumpHeart(slot2)
end

NetworkManager.onNetworkHeardTimeOut = function (slot0)
	trace(HtmlUtil.createRedTxt(slot4))

	slot4 = SOCKET_TYPE_ALL_BUT_TRUMP

	slot0.closeSocket(slot2, slot0)

	slot3 = "心跳超时，尝试重连"
	slot7 = SOCKET_TYPE_ROOM

	print(slot2, socketMgr.isConnecting("心跳超时，准备重连", socketMgr))

	slot3 = mainMgr

	mainMgr.try2Reconnect(slot2)
end

NetworkManager.sendTrumpHeart = function (slot0)
	slot3 = gameMgr

	if gameMgr.getConnectedTrumpSocket(slot2) then
		if slot0.m_trumpNewheartCounter >= 10 then
			slot0.m_trumpNewheartCounter = 0
			slot0._trumpHeadPingTime = 0
			slot3 = slot0

			slot0.onNetworkTrumpHeardTimeOut(slot2)
		else
			slot0.m_trumpNewheartCounter = slot0.m_trumpNewheartCounter + 1
			slot3 = tickMgr
			slot0._trumpHeadPingTimeTemp = tickMgr.getTimer(slot2)

			reqSendTrumpHeart()
		end
	end
end

NetworkManager.onNetworkTrumpHeardTimeOut = function (slot0)
	if not IS_IOS_VERIFY and not IS_YYB_VERIFY and not IS_SDK_VERIFY then
		trace(HtmlUtil.createRedTxt(slot4))

		slot4 = SOCKET_TYPE_TRUMP

		slot0.closeSocket(slot2, slot0)

		slot3 = "喇叭服心跳超时，尝试重连"
		slot7 = SOCKET_TYPE_TRUMP

		print(slot2, socketMgr.isConnecting("喇叭服心跳超时，准备重连", socketMgr))

		slot3 = gameMgr

		gameMgr.connectTrumpServer(slot2)
	end
end

NetworkManager.onSocketDataReceived = function (slot0, slot1, slot2, slot3, slot4)
	if slot4 == SOCKET_TYPE_ROOM and slot1 == MDM_KN_COMMAND and slot2 == SUB_KN_DETECT_SOCKET_EX then
		slot7 = tickMgr
		slot0._headPingTime = tickMgr.getTimer(slot6) - slot0._headPingTimeTemp
		slot7 = tickMgr
		slot0._headPingTimeTemp = tickMgr.getTimer(slot0._headPingTimeTemp)
		slot0.m_NewheartCounter = 0
	elseif slot4 == SOCKET_TYPE_TRUMP and slot1 == MDM_KN_COMMAND and slot2 == SUB_KN_DETECT_SOCKET_EX then
		slot7 = tickMgr
		slot0._trumpHeadPingTime = tickMgr.getTimer(slot6) - slot0._trumpHeadPingTimeTemp
		slot7 = tickMgr
		slot0._trumpHeadPingTimeTemp = tickMgr.getTimer(slot0._trumpHeadPingTimeTemp)
		slot0.m_trumpNewheartCounter = 0
	elseif slot4 == SOCKET_TYPE_LOAD then
		slot11 = slot3

		slot0.applyCallback(slot6, slot0, slot0._loadCallbackDic, slot1, slot2)
	elseif slot4 == SOCKET_TYPE_ROOM then
		slot11 = slot3

		slot0.applyCallback(slot6, slot0, slot0._roomCallbackDic, slot1, slot2)
	elseif slot4 == SOCKET_TYPE_TRUMP then
		slot11 = slot3

		slot0.applyCallback(slot6, slot0, slot0._trumpCallbackDic, slot1, slot2)
	end
end

NetworkManager.onMatchHallResult = function (slot0, slot1, slot2)
	slot8 = slot2

	eventMgr.dispatch(slot4, eventMgr, GameEvent.ON_GAME_MATCH_HALL_MESSAGE_BY_SERVER, slot1)
end

NetworkManager.onMatchBattleResult = function (slot0, slot1, slot2)
	slot5 = gameMgr

	if gameMgr.getNeedStoreGameStackMsg(slot4) then
		slot7 = gameMgr
		slot6 = {
			bodyStr = slot1,
			mainId = MDM_GR_MATCH,
			subId = slot2
		}

		table.insert(slot4, gameMgr.getGameStackMsgs(slot6))
	end

	slot8 = slot2

	eventMgr.dispatch(slot4, eventMgr, GameEvent.ON_GAME_MATCH_BATTLE_MESSAGE_BY_SERVER, slot1)
end

networkMgr = NetworkManager.new()

return
