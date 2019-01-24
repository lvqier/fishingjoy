slot2 = "JxlwController"
JxlwController = class(slot1)

JxlwController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = {
		onX = 144.15,
		offX = 83
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot8 = "jxlw_number.plist"
	slot6 = true

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(slot6, slot0))
end

JxlwController.resetBattle = function (slot0, slot1)
	slot4 = slot0

	slot0.hideAllBattleChildrenViews(slot3)
end

JxlwController.hideAllBattleChildrenViews = function (slot0, slot1)
	if not slot1 then
		slot5 = false

		slot0.model.setIsShowingBank(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingSetting(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingMenu(slot3, slot0.model)

		slot5 = false

		slot0.model.setIsShowingRule(slot3, slot0.model)
	end
end

JxlwController.onGameMessage = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getCurShowingViewType(slot4) ~= VIEW_TYPE_BATTLE then
		return
	end

	if slot2 == JXLW_SUB_S_BET then
		slot5 = slot0
		slot10 = "JXLW_CMD_S_Bet"

		slot0.onBet(slot4, ffiMgr.castStruct2TableByLuaStr(slot7, ffiMgr, slot1))
	elseif slot2 == JXLW_SUB_S_BROADCAST_JACKPOT then
		slot5 = slot0
		slot10 = "JXLW_CMD_S_BroadcastJackpot"

		slot0.onJackpotChanged(slot4, ffiMgr.castStruct2TableByLuaStr(slot7, ffiMgr, slot1))
	elseif slot2 == JXLW_SUB_S_BROADCAST_GET_JACKPOT then
		slot5 = slot0.model
		slot10 = "JXLW_CMD_S_BroadcastGetJackpot"

		slot0.model.setJackpotMessage(slot4, ffiMgr.castStruct2TableByLuaStr(slot7, ffiMgr, slot1))
	end
end

JxlwController.takeFreeTimes = function (slot0)
	slot6 = slot0.model
	slot4 = slot0.model.getFreeTimes(slot5) - 1

	slot0.model.setFreeTimes(slot2, slot0.model)
end

JxlwController.onBet = function (slot0, slot1)
	slot0.model._tempResult = slot1
	slot5 = slot1.dwMultiple

	slot0.model.setResultMultiples(slot3, slot0.model)

	slot5 = slot1.cbCardDatas

	slot0.model.setSlots(slot3, slot0.model)

	slot5 = slot1.cbLineDatas

	slot0.model.setResult(slot3, slot0.model)
end

JxlwController.applyTempResult = function (slot0)
	slot5 = slot0.model._tempResult.lToltalWinScore

	slot0.model.setTotalWin(slot3, slot0.model)

	slot8 = slot0.model
	slot5 = slot0.model._tempResult.dwFreeGames - slot0.model.getFreeTimes(slot7)

	slot0.model.setFreeTimesOffset(slot3, slot0.model)

	slot5 = slot0.model._tempResult.dwFreeGames

	slot0.model.setFreeTimes(slot3, slot0.model)

	slot5 = slot0.model._tempResult.lWinScore

	slot0.model.setCurrentWin(slot3, slot0.model)
end

JxlwController.onJackpotChanged = function (slot0, slot1)
	slot5 = slot1.lJackpot

	slot0.model.setJackpot(slot3, slot0.model)
end

JxlwController.onGameSceneByServer = function (slot0, slot1)
	slot4 = "server !!!!!!!!!!!!!!!!!!!!!"

	dump(slot3)

	slot6 = "JXLW_CMD_S_Status"
	slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
	slot6 = slot2.lCellScore

	slot0.model.setBaseBet(ffiMgr, slot0.model)

	slot6 = slot2.lJackpot

	slot0.model.setJackpot(ffiMgr, slot0.model)

	slot6 = slot2.lToltalWinScore

	slot0.model.setTotalWin(ffiMgr, slot0.model)

	slot6 = slot2.dwFreeGames

	slot0.model.setFreeTimes(ffiMgr, slot0.model)

	slot7 = true

	slot0.model.setForceUpdateState(ffiMgr, slot0.model, true)

	slot7 = true

	slot0.model.setResetSlotState(ffiMgr, slot0.model, true)
end

JxlwController.requestBet = function (slot0)
	slot7 = slot0.model
	slot4 = slot0.model.getBetMultiple(slot0.model) * slot0.model.getBaseBet(slot0.model)

	reqJxlwBet(slot2, slot0.model.getLineNumber(slot4))
end

JxlwController.addLine = function (slot0)
	slot5 = slot0.model.getLineNumber(slot2) % 9 + 1

	slot0.model.setLineNumber(slot0.model, slot0.model)
end

JxlwController.addWager = function (slot0)
	slot5 = slot0.model.getBetMultiple(slot2) % 5 + 1

	slot0.model.setBetMultiple(slot0.model, slot0.model)
end

JxlwController.fullBet = function (slot0)
	slot3 = slot0.model

	if slot0.model.getLineNumber(slot2) == 9 then
		slot3 = slot0.model

		if slot0.model.getBetMultiple(slot2) == 5 then
			slot4 = "已处于满压状态"

			tweenMsgMgr.showMsg(slot2, tweenMsgMgr)
		end
	else
		slot5 = true

		slot0.model.setLineNumber(slot2, slot0.model, 9)

		slot4 = 5

		slot0.model.setBetMultiple(slot2, slot0.model)
	end
end

JxlwController.destroy = function (slot0)
	slot0.model = nil
end

JxlwController.onReset = function (slot0)
	slot4 = 1

	slot0.model.setBetMultiple(slot2, slot0.model)

	slot4 = 1

	slot0.model.setLineNumber(slot2, slot0.model)
end

return
