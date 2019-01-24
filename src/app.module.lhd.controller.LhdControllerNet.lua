LhdController.initProtoFunc = function (slot0)
	if slot0.netProtoFunc == nil then
		slot0.netProtoFunc = {
			[LHD_SUB_S_GAME_FREE] = {
				bodyStr = "LHD_CMD_S_GameFree",
				func = slot0.protoTransferGamingFree
			},
			[LHD_SUB_S_GAME_START] = {
				bodyStr = "LHD_CMD_S_GameStart",
				func = slot0.protoTransferGamingBet
			},
			[LHD_SUB_S_GAME_END] = {
				bodyStr = "LHD_CMD_S_GameEnd",
				func = slot0.protoTransferGamingEnd
			},
			[LHD_SUB_S_JETTON] = {
				bodyStr = "LHD_CMD_S_PlaceBet",
				func = slot0.protoTransferGamingJetton
			},
			[LHD_SUB_S_JETTON_EX] = {
				bodyStr = "LHD_CMD_S_PlaceBetEx",
				func = slot0.protoTransferGamingRemandJetton
			}
		}
	end
end

LhdController.reqBet2Server = function (slot0, slot1, slot2)
	doReqServerViaStruct("请求下注", {
		cbBetArea = slot1,
		lBetScore = slot2
	}, "LHD_CMD_C_PlaceBet", MDM_GF_GAME, LHD_SUB_C_JETTON, "true")
end

LhdController.reqRemandBet2Server = function (slot0, slot1, slot2, slot3)
	slot4 = {
		cbBetArea = slot1,
		lBetScore = slot2,
		lBetNumber = slot3
	}

	for slot8 = 1, 10, 1 do
		if slot4.lBetScore[slot8] == nil then
			slot4.lBetScore[slot8] = 0
			slot4.lBetNumber[slot8] = 0
		end
	end

	doReqServerViaStruct("请求批量下注", slot4, "LHD_CMD_C_PlaceBetEx", MDM_GF_GAME, LHD_SUB_C_JETTON_EX, "true")
end

LhdController.onGameMessage = function (slot0, slot1, slot2)
	if slot0.model:getCurShowingViewType() ~= VIEW_TYPE_BATTLE then
		return
	end

	if slot0:getProtoFuncById(slot2) == nil then
		return
	end

	if ffiMgr:isSizeEqual(slot1, slot3.bodyStr) then
		slot3.func(slot0, ffiMgr:castStruct2TableByLuaStr(slot1, slot3.bodyStr))
	end
end

LhdController.onGameSceneByServer = function (slot0, slot1)
	if ffiMgr:isSizeEqual(slot1, "LHD_CMD_S_Status") then
		slot0:protoTransferRecoverGameScene(ffiMgr:castStruct2TableByLuaStr(slot1, "LHD_CMD_S_Status"))
	end
end

LhdController.protoTransferGamingFree = function (slot0, slot1)
	slot0:protoGamingFree({
		leftTimer = slot1.cbTimeLeave
	})
end

LhdController.protoTransferGamingBet = function (slot0, slot1)
	slot0:protoGamingBet({
		leftTimer = slot1.cbTimeLeave,
		selfCanBetMaxScore = slot1.lPlayBetScore,
		areaSelfLimitBetScore = slot1.lUserLimitScore,
		areaAllLimitBetScore = slot1.lAreaLimitScore
	})
end

LhdController.protoTransferGamingEnd = function (slot0, slot1)
	LhdPrintAndPrintTable("protoTransferGamingEnd", slot1)
	slot0:protoGamingEnd({
		leftTimer = slot1.cbTimeLeave,
		winner = slot1.cbWinner,
		selfWinScore = slot1.lPlayAllScore,
		areaAllScore = slot1.lAllPlayScore,
		areaSelfScore = slot1.lPlayScore,
		pokerData = slot1.cbTableCardArray,
		balanceHisCount = slot1.dwResultIndex
	})
end

LhdController.protoTransferGamingJetton = function (slot0, slot1)
	slot0:protoGamingJetton({
		betAreaIdx = slot1.cbBetArea,
		betScore = slot1.lBetScore,
		chairId = slot1.wChairID
	})
end

LhdController.protoTransferGamingRemandJetton = function (slot0, slot1)
	if slot1.bSucees == true then
		slot0:protoGamingRemandJetton({
			chairId = slot1.wChairID,
			betAreaIdx = slot1.cbBetArea,
			betScore = slot1.lBetScore,
			betNumber = slot1.lBetNumber,
			succeed = slot1.bSucees
		})
	end
end

LhdController.protoTransferRecoverGameScene = function (slot0, slot1)
	LhdPrintAndPrintTable("protoTransferRecoverGameScene", slot1)
	slot0:protoRecoverGameScene({
		gameStatus = slot1.cbGameStatus,
		leftTimer = slot1.cbTimeLeave,
		selfCanBetMaxScore = slot1.lPlayBetScore,
		areaAllLimitBetScore = slot1.lAreaLimitScore,
		areaSelfLimitBetScore = slot1.lUserLimitScore,
		balanceHistoryData = slot1.dwResultHistory,
		balanceHisCount = slot1.dwResultIndex,
		areaAllBet = slot1.lAllBet,
		areaSelfBet = slot1.lPlayBet,
		balanceData = {
			winner = slot1.cbWinner,
			selfWinScore = slot1.lPlayAllScore,
			areaAllScore = slot1.lAllPlayScore,
			areaSelfScore = slot1.lPlayScore,
			pokerData = slot1.cbTableCardArray,
			balanceHisCount = slot1.dwResultIndex
		}
	})
end

return
