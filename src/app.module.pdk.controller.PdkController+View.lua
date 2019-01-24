PdkController.initViewSiganl = function (slot0)
	slot5 = slot0

	slot0.model.currentUserChangedSignal.add(slot2, slot0.model.currentUserChangedSignal, slot0.onCurrentUserChanged)

	slot5 = slot0

	slot0.model.autoDicChangedSignal.add(slot2, slot0.model.autoDicChangedSignal, slot0.onAutoDicChanged)

	slot5 = slot0

	slot0.model.gameStateChangedSignal.add(slot2, slot0.model.gameStateChangedSignal, slot0.onGameStateChanged)

	slot5 = slot0

	slot0.model.canOutCardChangedSignal.add(slot2, slot0.model.canOutCardChangedSignal, slot0.onCanOutCardChanged)

	slot5 = slot0

	slot0.model.usersIsOutCardDicChangedSignal.add(slot2, slot0.model.usersIsOutCardDicChangedSignal, slot0.onUsersIsOutCardDicChanged)

	slot5 = slot0

	slot0.model.myTableUserDatasDicChangedSignal.add(slot2, slot0.model.myTableUserDatasDicChangedSignal, slot0.onMyTableUserDatasDicChanged)

	slot5 = slot0

	slot0.model.canOutDataDicValueChangedSignal.add(slot2, slot0.model.canOutDataDicValueChangedSignal, slot0.onCanOutDataDicValueChanged)

	slot5 = slot0

	slot0.model.winnerViewIdChangedSignal.add(slot2, slot0.model.winnerViewIdChangedSignal, slot0.onWinnerViewIdChanged)

	slot5 = slot0

	slot0.model.outCardInfoChangedSignal.add(slot2, slot0.model.outCardInfoChangedSignal, slot0.onOutCardInfoChanged)

	slot5 = slot0

	slot0.model.myCardsChangedSignal.add(slot2, slot0.model.myCardsChangedSignal, slot0.onMyCardsChanged)

	slot5 = slot0

	slot0.model.canOnceOutAllCardsChangedSignal.add(slot2, slot0.model.canOnceOutAllCardsChangedSignal, slot0.onCanOnceOutAllCardsChanged)

	slot5 = slot0

	slot0.model.leaveCardsCountDicChangedSignal.add(slot2, slot0.model.leaveCardsCountDicChangedSignal, slot0.onLeaveCardsCountDicChanged)

	slot5 = slot0

	slot0.model.isHoldBtnStartAtBeginChangedSignal.add(slot2, slot0.model.isHoldBtnStartAtBeginChangedSignal, slot0.onIsHoldBtnStartAtBeginChanged)

	slot5 = slot0

	slot0.model.isHoldBtnStartAtResultChangedSignal.add(slot2, slot0.model.isHoldBtnStartAtResultChangedSignal, slot0.onIsHoldBtnStartAtResultChanged)

	slot5 = slot0

	slot0.model.isShowingMatchFloatChangedSignal.add(slot2, slot0.model.isShowingMatchFloatChangedSignal, slot0.onIsShowingMatchFloatChanged)

	slot5 = slot0

	slot0.model.isShowingFailedChangedSignal.add(slot2, slot0.model.isShowingFailedChangedSignal, slot0.onIsShowingFailedChanged)

	slot5 = slot0

	slot0.model.isShowingWinChangedSignal.add(slot2, slot0.model.isShowingWinChangedSignal, slot0.onIsShowingWinChanged)
end

PdkController.onGameStateChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowAutoIcon(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateCanOutCard(slot2)

	slot3 = slot0

	slot0.updateIsShowHandCard(slot2)

	slot3 = slot0

	slot0.updateIsShowWarningSpine(slot2)
end

PdkController.onCurrentUserChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowAutoIcon(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateCanOutCard(slot2)
end

PdkController.onAutoDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowAutoIcon(slot2)

	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)
end

PdkController.onCanOutCardChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)
end

PdkController.onUsersIsOutCardDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

PdkController.onMyTableUserDatasDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onCanOutDataDicValueChanged = function (slot0)
	return
end

PdkController.onWinnerViewIdChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

PdkController.onOutCardInfoChanged = function (slot0)
	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)
end

PdkController.onMyCardsChanged = function (slot0)
	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)
end

PdkController.onIsHoldBtnStartAtBeginChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onIsHoldBtnStartAtResultChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onIsShowingMatchFloatChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onIsShowingWinChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onIsShowingFailedChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

PdkController.onCanOnceOutAllCardsChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

PdkController.onLeaveCardsCountDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowWarningSpine(slot2)
end

PdkController.updateIsShowAutoIcon = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getAutoDic(slot2) or {}
	slot4 = slot0.model
	slot4 = {}

	if slot0.model.getGameState(slot3) == PDK_GAMESTATE_PLAY then
		slot4[PDK_VIEW_CHAIRID_ME] = slot1[PDK_VIEW_CHAIRID_ME]
		slot4[PDK_VIEW_CHAIRID_RIGHT] = slot1[PDK_VIEW_CHAIRID_RIGHT]
		slot4[PDK_VIEW_CHAIRID_LEFT] = slot1[PDK_VIEW_CHAIRID_LEFT]
		slot4.isShowBtnAuto = not slot1[PDK_VIEW_CHAIRID_ME]
	end

	slot9 = true

	slot0.model.setIsShowAutoIconDic(slot6, slot0.model, slot4)
end

PdkController.updateIsShowCantOutTxt = function (slot0)
	slot1 = nil
	slot4 = slot0.model

	if slot0.model.getGameState(slot3) == PDK_GAMESTATE_PLAY then
		slot4 = slot0.model

		if slot0.model.getCurrentUser(slot3) == PDK_VIEW_CHAIRID_ME then
			slot4 = slot0.model
			slot1 = not slot0.model.getCanOutCard(slot3)
		end
	else
		slot1 = false
	end

	slot6 = true

	slot0.model.setIsShowCantOutTxt(slot3, slot0.model, slot1)
end

PdkController.updateStateViewDic = function (slot0)
	slot1 = {}
	slot2 = {}
	slot5 = slot0.model

	if slot0.model.getGameState(slot4) == PDK_GAMESTATE_PLAY then
		slot6 = slot0.model

		if slot0.model.getCurrentUser(slot5) == PDK_VIEW_CHAIRID_ME then
			slot8 = slot4

			if not slot0.isAutoState(slot6, slot0) then
				slot7 = slot0.model

				if slot0.model.getCanOutCard(slot6) then
					slot7 = slot0.model

					if not slot0.model.getCanOnceOutAllCards(slot6) then
						slot1[slot4] = "turnView"
					end
				end
			end
		else
			slot1[slot4] = "turnView"
		end

		slot7 = slot0.model

		if slot0.model.getUsersIsOutCardDic(slot6) then
			for slot9 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
				if slot4 ~= slot9 then
					if slot5[slot9] == -1 then
						slot1[slot9] = "yaoBuQi"
					elseif slot5[slot9] == 1 then
						slot1[slot9] = "outPukeSheet"
					end
				end
			end
		end
	elseif slot3 == PDK_GAMESTATE_END then
		slot6 = slot0

		if slot0.isRoundWinner(slot5) then
			slot1[PDK_VIEW_CHAIRID_ME] = "outPukeSheet"
		end

		slot1[PDK_VIEW_CHAIRID_LEFT] = "outPukeSheet"
		slot1[PDK_VIEW_CHAIRID_RIGHT] = "outPukeSheet"
	elseif slot3 == PDK_GAMESTATE_READY then
		slot6 = slot0.model

		if slot0.model.getMyTableUserDatasDic(slot5) then
			for slot8 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
				if slot4[slot8] and slot4[slot8].cbUserStatus == US_READY then
					slot1[slot8] = "ok"
				end
			end
		end
	end

	slot7 = slot1

	slot0.model.setStateViewDic(slot5, slot0.model)
end

PdkController.updateIsShowBtnStart = function (slot0)
	slot6 = Hero
	slot2 = slot0.model.getIsShowingWin(gameMgr)
	slot3 = slot0.model.getIsShowingFailed(slot0.model)
	slot4 = slot0.model.getIsShowingMatchFloat(slot0.model)
	slot5 = slot0.model.getIsHoldBtnStartAtResult(slot0.model)
	slot8 = slot0.model
	slot6 = slot0.model.getIsHoldBtnStartAtBegin(slot0.model)
	slot7 = false

	if gameMgr.getUserData(slot2, Hero.getDwUserID(slot5)) ~= nil and slot1.cbUserStatus ~= US_PLAYING and slot8 ~= US_READY and not slot2 and not slot3 and not slot4 and not slot5 and not slot6 then
		slot7 = true
	end

	slot12 = true

	slot0.model.setIsShowBtnStart(slot9, slot0.model, slot7)
end

PdkController.updateIsShowHandCard = function (slot0)
	slot6 = true

	slot0.model.setIsShowHandCard(slot0.model, slot0.model, slot0.model.getGameState(slot0.model.setIsShowHandCard) == PDK_GAMESTATE_PLAY or slot1 == PDK_GAMESTATE_END)
end

PdkController.updateIsShowWarningSpine = function (slot0)
	slot3 = slot0.model
	slot2 = {}

	if slot0.model.getLeaveCardsCountDic(slot2) then
		slot5 = slot0.model

		if slot0.model.getGameState(slot4) == PDK_GAMESTATE_PLAY then
			for slot6 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
				if slot1[slot6] == 1 then
					slot2[slot6] = true
				end
			end
		end
	end

	slot5 = slot0.model
	slot9 = slot2

	slot0.model.setIsShowWarningSpineDic(slot4, slot0.model.nilEmptyTable(slot7, slot0.model))
end

PdkController.updateCanOutCard = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameState(slot2) == PDK_GAMESTATE_PLAY then
		slot3 = slot0.model

		if slot0.model.getCurrentUser(slot2) ~= PDK_VIEW_CHAIRID_ME then
			slot4 = false

			slot0.model.setCanOutCard(slot2, slot0.model)

			return
		end
	end

	slot3 = slot0

	if not slot0.isTurnWinner(slot2) then
		slot3 = slot0

		if slot0.isFirstHand(slot2) then
			slot4 = true

			slot0.model.setCanOutCard(slot2, slot0.model)
		elseif slot0.model._serverCanOut == 1 then
			slot4 = true

			slot0.model.setCanOutCard(slot2, slot0.model)
		else
			slot4 = false

			slot0.model.setCanOutCard(slot2, slot0.model)
		end
	end
end

PdkController.updateCanOnceOutAllCards = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMyCards(slot2) then
		slot4 = slot0.model

		if not slot0.model.getCanOutCard(slot3) then
			slot5 = false

			slot0.model.setCanOnceOutAllCards(slot3, slot0.model)

			return
		end
	end

	slot3 = slot0.analyzeCardInfo(slot3, slot0).ct
	slot6 = slot0

	if slot0.isAutoState(slot1) or slot3 == nil or slot3 == PDK_CT_ERROR then
		slot7 = false

		slot0.model.setCanOnceOutAllCards(slot5, slot0.model)

		return
	end

	slot8 = {
		dot = 0,
		ct = PDK_CT_BOMB_CARD
	}
	slot4 = slot0.findCanFollowCard(slot5, slot0, slot1)

	if slot3 ~= PDK_CT_BOMB_CARD and slot4 and slot4.boomDic then
		slot8 = false

		slot0.model.setCanOnceOutAllCards(slot6, slot0.model)

		return
	end

	slot5 = false
	slot8 = slot0

	if not slot0.isTurnWinner(slot7) then
		slot8 = slot0

		if slot0.isFirstHand(slot7) then
			slot5 = true
		else
			slot8 = slot0.model

			if slot0.model.getOutCardInfo(slot7).ct == slot2.ct then
				if slot6.dot < slot2.dot then
					slot5 = true
				end
			elseif slot6.ct ~= PDK_CT_BOMB_CARD and slot2.ct == PDK_CT_BOMB_CARD then
				slot5 = true
			end
		end
	end

	slot9 = slot5

	slot0.model.setCanOnceOutAllCards(slot7, slot0.model)
end

PdkController.lockUpViewDic = function (slot0)
	slot1 = {
		stateViewDic = {}
	}

	for slot5 = PDK_VIEW_CHAIRID_ME, PDK_VIEW_CHAIRID_LEFT, 1 do
		slot1.stateViewDic[slot5] = true
	end

	slot6 = true

	slot0.model.setLockViewDic(slot3, slot0.model, slot1)
end

return
