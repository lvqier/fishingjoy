DdzController.initViewSiganl = function (slot0)
	slot5 = slot0

	slot0.model.gameStateChangedSignal.add(slot2, slot0.model.gameStateChangedSignal, slot0.onGameStateChanged)

	slot5 = slot0

	slot0.model.currentUserChangedSignal.add(slot2, slot0.model.currentUserChangedSignal, slot0.onCurrentUserChanged)

	slot5 = slot0

	slot0.model.usersIsOutCardDicChangedSignal.add(slot2, slot0.model.usersIsOutCardDicChangedSignal, slot0.onUsersIsOutCardDicChanged)

	slot5 = slot0

	slot0.model.callRobDicChangedSignal.add(slot2, slot0.model.callRobDicChangedSignal, slot0.onCallRobDicChanged)

	slot5 = slot0

	slot0.model.myTableUserDatasDicChangedSignal.add(slot2, slot0.model.myTableUserDatasDicChangedSignal, slot0.onMyTableUserDatasDicChanged)

	slot5 = slot0

	slot0.model.addTimesInfoDicChangedSignal.add(slot2, slot0.model.addTimesInfoDicChangedSignal, slot0.onAddTimesInfoDicChanged)

	slot5 = slot0

	slot0.model.canOutDataDicChangedSignal.add(slot2, slot0.model.canOutDataDicChangedSignal, slot0.onCanOutDataDicChanged)

	slot5 = slot0

	slot0.model.autoDicChangedSignal.add(slot2, slot0.model.autoDicChangedSignal, slot0.onAutoDicChanged)

	slot5 = slot0

	slot0.model.myCardsChangedSignal.add(slot2, slot0.model.myCardsChangedSignal, slot0.onMyCardsChanged)

	slot5 = slot0

	slot0.model.leaveCardsCountDicChangedSignal.add(slot2, slot0.model.leaveCardsCountDicChangedSignal, slot0.onLeaveCardsCountDicChanged)

	slot5 = slot0

	slot0.model.openUserChangedSignal.add(slot2, slot0.model.openUserChangedSignal, slot0.onOpenUserChanged)

	slot5 = slot0

	slot0.model.startCallUserChangedSignal.add(slot2, slot0.model.startCallUserChangedSignal, slot0.onStartCallUserChanged)

	slot5 = slot0

	slot0.model.diPaiInfoChangedSignal.add(slot2, slot0.model.diPaiInfoChangedSignal, slot0.onDiPaiInfoChanged)

	slot5 = slot0

	slot0.model.bankerUserChangedSignal.add(slot2, slot0.model.bankerUserChangedSignal, slot0.onBankerUserChanged)

	slot5 = slot0

	slot0.model.jiPaiDicChangedSignal.add(slot2, slot0.model.jiPaiDicChangedSignal, slot0.onJiPaiDicChanged)

	slot5 = slot0

	slot0.model.curShowingViewTypeChangedSignal.add(slot2, slot0.model.curShowingViewTypeChangedSignal, slot0.onCurShowingViewTypeChanged)

	slot5 = slot0

	slot0.model.realGameKindChangedSignal.add(slot2, slot0.model.realGameKindChangedSignal, slot0.onRealGameKindChanged)

	slot5 = slot0

	slot0.model.isHoldBtnStartAtBeginChangedSignal.add(slot2, slot0.model.isHoldBtnStartAtBeginChangedSignal, slot0.onIsHoldBtnStartAtBeginChanged)

	slot5 = slot0

	slot0.model.isHoldBtnStartAtResultChangedSignal.add(slot2, slot0.model.isHoldBtnStartAtResultChangedSignal, slot0.onIsHoldBtnStartAtResultChanged)

	slot5 = slot0

	slot0.model.canOutCardChangedSignal.add(slot2, slot0.model.canOutCardChangedSignal, slot0.onCanOutCardChanged)

	slot5 = slot0

	slot0.model.isShowingMatchFloatChangedSignal.add(slot2, slot0.model.isShowingMatchFloatChangedSignal, slot0.onIsShowingMatchFloatChanged)

	slot5 = slot0

	slot0.model.isShowingFailedChangedSignal.add(slot2, slot0.model.isShowingFailedChangedSignal, slot0.onIsShowingFailedChanged)

	slot5 = slot0

	slot0.model.isShowingWinChangedSignal.add(slot2, slot0.model.isShowingWinChangedSignal, slot0.onIsShowingWinChanged)
end

DdzController.onGameStateChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowAutoIcon(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateIsShowDdnmjbTxt(slot2)

	slot3 = slot0

	slot0.updateCanOutCard(slot2)

	slot3 = slot0

	slot0.updateIsShowJiPaiUi(slot2)

	slot3 = slot0

	slot0.updateIsShowLeaveUi(slot2)

	slot3 = slot0

	slot0.updateFigureState(slot2)

	slot3 = slot0

	slot0.updateIsShowDiPaiUi(slot2)

	slot3 = slot0

	slot0.updateIsShowHandCard(slot2)

	slot3 = slot0

	slot0.updateIsShowWarningSpine(slot2)

	slot3 = slot0

	slot0.updateIsShowOpenSheet(slot2)

	slot3 = slot0

	slot0.updateIsShowZdcpzTxt(slot2)
end

DdzController.onCurrentUserChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateCanOutCard(slot2)

	slot3 = slot0.model
	slot3 = slot0.model.getCountDownSignal(slot2)

	slot0.model.getCountDownSignal(slot2).emit(slot2)
end

DdzController.onUsersIsOutCardDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onCallRobDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onMyTableUserDatasDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

DdzController.onAddTimesInfoDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onCanOutDataDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateCanOutCard(slot2)
end

DdzController.onAutoDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)

	slot3 = slot0

	slot0.updateIsShowAutoIcon(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)

	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateIsShowDdnmjbTxt(slot2)

	slot3 = slot0

	slot0.updateIsShowZdcpzTxt(slot2)
end

DdzController.onLeaveCardsCountDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowWarningSpine(slot2)

	slot3 = slot0

	slot0.updateIsShowZdcpzTxt(slot2)
end

DdzController.onCanOutCardChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowCantOutTxt(slot2)

	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onMyCardsChanged = function (slot0)
	slot3 = slot0

	slot0.updateCanOnceOutAllCards(slot2)
end

DdzController.onOpenUserChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowOpenSheet(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onIsHoldBtnStartAtBeginChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

DdzController.onIsHoldBtnStartAtResultChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

DdzController.onIsShowingMatchFloatChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)

	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onIsShowingWinChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

DdzController.onIsShowingFailedChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowBtnStart(slot2)
end

DdzController.onStartCallUserChanged = function (slot0)
	slot3 = slot0

	slot0.updateStateViewDic(slot2)
end

DdzController.onDiPaiInfoChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowDiPaiUi(slot2)
end

DdzController.onBankerUserChanged = function (slot0)
	slot3 = slot0

	slot0.updateFigureState(slot2)

	slot3 = slot0

	slot0.updateIsShowDdnmjbTxt(slot2)
end

DdzController.onJiPaiDicChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowJiPaiUi(slot2)
end

DdzController.onCurShowingViewTypeChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurShowingViewType(slot2) == VIEW_TYPE_ROOM then
		slot6 = true

		slot0.model.setIsShowingMatchFloat(slot3, slot0.model, false)
	end
end

DdzController.onRealGameKindChanged = function (slot0)
	slot3 = slot0

	slot0.updateIsShowDdnmjbTxt(slot2)
end

DdzController.updateIsShowAutoIcon = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getAutoDic(slot2) or {}
	slot4 = slot0.model
	slot4 = {}

	if slot0.model.getGameState(slot3) == DDZ_GAMESTATE_PLAY or slot2 == DDZ_GAMESTATE_CALL or slot2 == DDZ_GAMESTATE_ADDTIMES or slot2 == DDZ_GAMESTATE_ROB then
		slot4[DDZ_VIEW_CHAIRID_ME] = slot1[DDZ_VIEW_CHAIRID_ME]
		slot4[DDZ_VIEW_CHAIRID_RIGHT] = slot1[DDZ_VIEW_CHAIRID_RIGHT]
		slot4[DDZ_VIEW_CHAIRID_LEFT] = slot1[DDZ_VIEW_CHAIRID_LEFT]
		slot4.isShowBtnAuto = not slot1[DDZ_VIEW_CHAIRID_ME]
	else
		slot4[DDZ_VIEW_CHAIRID_ME] = nil
		slot4[DDZ_VIEW_CHAIRID_RIGHT] = nil
		slot4[DDZ_VIEW_CHAIRID_LEFT] = nil
	end

	slot9 = true

	slot0.model.setIsShowAutoIconDic(slot6, slot0.model, slot4)
end

DdzController.updateIsShowCantOutTxt = function (slot0)
	slot1 = false
	slot4 = slot0.model

	if slot0.model.getGameState(slot3) == DDZ_GAMESTATE_PLAY then
		slot4 = slot0.model

		if slot0.model.getCurrentUser(slot3) == DDZ_VIEW_CHAIRID_ME then
			slot4 = slot0.model

			if not slot0.model.getAutoDic(slot3) or not slot2[DDZ_VIEW_CHAIRID_ME] then
				slot5 = slot0.model
				slot1 = not slot0.model.getCanOutCard(slot4)
			end
		end
	end

	slot6 = true

	slot0.model.setIsShowCantOutTxt(slot3, slot0.model, slot1)
end

DdzController.updateIsShowDdnmjbTxt = function (slot0)
	slot1 = false
	slot4 = slot0.model

	if slot0.model.getRealGameKind(slot3) == GameKind_DDZ_JD then
		slot4 = slot0.model

		if slot0.model.getGameState(slot3) == DDZ_GAMESTATE_ADDTIMES then
			slot4 = slot0.model

			if slot0.model.getBankerUser(slot3) == DDZ_VIEW_CHAIRID_ME then
				slot4 = slot0.model

				if not slot0.model.getAutoDic(slot3) or not slot2[DDZ_VIEW_CHAIRID_ME] then
					slot1 = true
				end
			end
		end
	end

	slot6 = true

	slot0.model.setIsShowDdnmjbTxt(slot3, slot0.model, slot1)
end

DdzController.updateIsShowZdcpzTxt = function (slot0)
	slot1 = false
	slot4 = slot0.model

	if slot0.model.getGameState(slot3) == DDZ_GAMESTATE_PLAY then
		slot4 = slot0.model

		if slot0.model.getLeaveCardsCountDic(slot3) and slot2[DDZ_VIEW_CHAIRID_ME] == 1 then
			slot5 = slot0.model

			if slot0.model.getAutoDic(slot4) and slot3[DDZ_VIEW_CHAIRID_ME] then
				slot1 = true
			end
		end
	end

	slot6 = true

	slot0.model.setIsShowZdcpzTxt(slot3, slot0.model, slot1)
end

DdzController.updateStateViewDic = function (slot0)
	slot4 = slot0.model
	slot2 = slot0.model.getGameState(slot0.model)

	if not slot0.model.getCurrentUser(slot2) and slot2 ~= DDZ_GAMESTATE_READY then
		return
	end

	slot3 = {}

	if slot2 == DDZ_GAMESTATE_ADDTIMES then
		slot6 = slot0.model

		if slot0.model.getAddTimesInfoDic(slot5) then
			for slot8 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
				if slot4[slot8] == 255 then
					slot3[slot8] = "buJia"
				elseif slot4[slot8] == 2 then
					slot3[slot8] = "jiaBei"
				elseif slot8 == DDZ_VIEW_CHAIRID_ME then
					slot12 = slot8

					if not slot0.isAutoState(slot10, slot0) then
						slot3[slot8] = "addTimesMenu"
					end
				end
			end
		else
			slot8 = DDZ_VIEW_CHAIRID_ME

			if not slot0.isAutoState(slot6, slot0) then
				slot3[DDZ_VIEW_CHAIRID_ME] = "addTimesMenu"
			end
		end
	elseif slot2 == DDZ_GAMESTATE_CALL or slot2 == DDZ_GAMESTATE_ROB then
		slot4 = slot0.model.getCallRobDic(slot5)
		slot7 = slot0.model

		if slot0.model.getRealGameKind(slot0.model) == GameKind_DDZ_JD then
			if slot1 == DDZ_VIEW_CHAIRID_ME then
				slot8 = slot1

				if not slot0.isAutoState(slot6, slot0) then
					if slot4 then
						if (not slot4[DDZ_VIEW_CHAIRID_LEFT] or slot5 == 0 or slot5 == 255) and (slot4[DDZ_VIEW_CHAIRID_RIGHT] == 1 or slot6 == 2 or slot6 == 3) then
							slot5 = slot6
						end

						if slot5 == 1 then
							slot3[slot1] = "callMenu1"
						elseif slot5 == 2 then
							slot3[slot1] = "callMenu2"
						elseif slot5 == 3 then
							slot3[slot1] = "callMenu3"
						else
							slot3[slot1] = "callMenu0"
						end
					else
						slot3[slot1] = "callMenu0"
					end
				end
			else
				slot3[slot1] = "turnView"
			end

			if slot4 then
				for slot8 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
					if slot8 ~= slot1 then
						if slot4[slot8] == 1 then
							slot3[slot8] = "jiao1fen"
						elseif slot4[slot8] == 2 then
							slot3[slot8] = "jiao2fen"
						elseif slot4[slot8] == 3 then
							slot3[slot8] = "jiao3fen"
						elseif slot4[slot8] == 255 then
							slot3[slot8] = "buJiao"
						end
					end
				end
			end
		elseif slot2 == DDZ_GAMESTATE_CALL then
			if slot1 == DDZ_VIEW_CHAIRID_ME then
				slot8 = slot1

				if not slot0.isAutoState(slot6, slot0) then
					slot3[slot1] = "callMenu"
				end
			else
				slot3[slot1] = "turnView"
			end

			if slot4 then
				for slot8 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
					if slot8 ~= slot1 then
						if slot4[slot8] == 1 then
							slot3[slot8] = "jiaoDiZhu"
						elseif slot4[slot8] == 255 then
							slot3[slot8] = "buJiao"
						end
					end
				end
			end
		else
			if slot1 == DDZ_VIEW_CHAIRID_ME then
				slot8 = slot1

				if not slot0.isAutoState(slot6, slot0) then
					slot3[slot1] = "robMenu"
				end
			elseif slot1 ~= INVALID_WORD then
				slot3[slot1] = "turnView"
			end

			slot7 = slot0
			slot10 = slot0.model
			slot5 = slot0.findCallStateDic(slot6, slot0.model.getStartCallUser(slot9))
			slot6 = slot0.model._firstCallUser

			if slot1 == INVALID_WORD then
			end

			for slot10 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
				if slot1 == INVALID_WORD or slot1 ~= slot10 then
					if slot5 and slot5[slot10] then
						if slot5[slot10] == 1 then
							slot3[slot10] = "jiaoDiZhu"
						elseif slot5[slot10] == 255 then
							slot3[slot10] = "buJiao"
						end

						if slot1 == INVALID_WORD and slot6 == slot0.model._lastCallRobUser then
							if slot5[slot10] == 1 then
								slot3[slot6] = "qiangDiZhu"
							elseif slot5[slot10] == 255 then
								slot3[slot6] = "buQiang"
							end
						end
					elseif slot4 and slot4[slot10] then
						if slot4[slot10] == 1 then
							slot3[slot10] = "qiangDiZhu"
						elseif slot4[slot10] == 255 then
							slot3[slot10] = "buQiang"
						end
					end
				end
			end

			if slot1 == INVALID_WORD then
			end
		end
	elseif slot2 == DDZ_GAMESTATE_PLAY then
		if slot1 == DDZ_VIEW_CHAIRID_ME then
			slot7 = slot1

			if not slot0.isAutoState(slot5, slot0) then
				slot6 = slot0

				if slot0.isFirstHand(slot5) then
					slot6 = slot0.model

					if slot0.model.getOpenUser(slot5) then
						slot6 = slot0.model

						if slot0.model.getOpenUser(slot5) ~= INVALID_WORD then
							slot3[slot1] = "onlyOutMenu"
						end
					else
						slot3[slot1] = "openMenu"
					end
				else
					slot6 = slot0.model

					if slot0.model.getCanOutCard(slot5) then
						slot6 = slot0

						if slot0.isTurnWinner(slot5) then
							slot3[slot1] = "onlyOutMenu"
						else
							slot3[slot1] = "normalMenu"
						end
					else
						slot3[slot1] = "onlyPassMenu"
					end
				end
			end
		else
			slot3[slot1] = "turnView"
		end

		slot6 = slot0.model

		if slot0.model.getUsersIsOutCardDic(slot5) then
			for slot8 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
				if slot8 ~= slot1 then
					if slot4[slot8] == -1 then
						slot3[slot8] = "buChu"
					elseif slot4[slot8] == 1 then
						slot3[slot8] = "outPukeSheet"
					end
				end
			end
		end
	elseif slot2 == DDZ_GAMESTATE_END then
		slot6 = slot0

		if slot0.isRoundWinner(slot5) then
			slot3[DDZ_VIEW_CHAIRID_ME] = "outPukeSheet"
		end

		slot3[DDZ_VIEW_CHAIRID_LEFT] = "outPukeSheet"
		slot3[DDZ_VIEW_CHAIRID_RIGHT] = "outPukeSheet"
	elseif slot2 == DDZ_GAMESTATE_READY then
		slot4 = slot0.model.getMyTableUserDatasDic(slot5)
		slot7 = slot0.model
		slot5 = slot0.model.getIsShowingMatchFloat(slot0.model)

		for slot9 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
			if slot4 and slot4[slot9] and slot4[slot9].cbUserStatus == US_READY and not slot5 then
				slot3[slot9] = "ok"
			end
		end
	end

	slot7 = slot3

	slot0.model.setStateViewDic(slot5, slot0.model)
end

DdzController.updateIsShowBtnStart = function (slot0)
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

DdzController.updateIsShowHandCard = function (slot0)
	slot6 = true

	slot0.model.setIsShowHandCard(slot0.model, slot0.model, slot0.model.getGameState(slot0.model.setIsShowHandCard) ~= nil and slot1 ~= DDZ_GAMESTATE_READY)
end

DdzController.updateIsShowWarningSpine = function (slot0)
	slot3 = slot0.model
	slot2 = {}

	if slot0.model.getLeaveCardsCountDic(slot2) then
		slot5 = slot0.model

		if slot0.model.getGameState(slot4) == DDZ_GAMESTATE_PLAY then
			for slot6 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
				if slot1[slot6] == 1 or slot1[slot6] == 2 then
					slot2[slot6] = true
				end
			end
		end
	end

	slot5 = slot0.model
	slot9 = slot2

	slot0.model.setIsShowWarningSpineDic(slot4, slot0.model.nilEmptyTable(slot7, slot0.model))
end

DdzController.updateIsShowDiPaiUi = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = slot0.model
	slot4 = slot0.model
	slot2 = slot0.model.setIsShowDiPaiUi
	slot7 = slot0.model
	slot5 = slot0.model.getDiPaiInfo(slot6) ~= nil

	slot2(slot3, slot4)
end

DdzController.updateFigureState = function (slot0)
	slot1 = slot0.model.getGameState(slot2)
	slot4 = slot0.model

	if slot0.model.getBankerUser(slot0.model) then
		if slot1 == DDZ_GAMESTATE_ADDTIMES or slot1 == DDZ_GAMESTATE_PLAY then
			slot5 = "normal"

			slot0.model.setFigureState(slot3, slot0.model)
		elseif slot1 == DDZ_GAMESTATE_END then
			slot5 = "result"

			slot0.model.setFigureState(slot3, slot0.model)
		else
			slot5 = nil

			slot0.model.setFigureState(slot3, slot0.model)
		end
	else
		slot5 = nil

		slot0.model.setFigureState(slot3, slot0.model)
	end
end

DdzController.updateIsShowLeaveUi = function (slot0)
	slot5 = slot0.model.getGameState(slot0.model.setIsShowLeaveUi) ~= DDZ_GAMESTATE_READY and slot1 ~= DDZ_GAMESTATE_END

	slot0.model.setIsShowLeaveUi(slot0.model, slot0.model)
end

DdzController.updateIsShowOpenSheet = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = slot0.model
	slot4 = slot0.model
	slot2 = slot0.model.setIsShowOpenSheet
	slot7 = slot0.model
	slot5 = slot0.model.getOpenUser(slot6) ~= nil

	slot2(slot3, slot4)
end

DdzController.updateIsShowJiPaiUi = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = slot0.model
	slot4 = slot0.model
	slot2 = slot0.model.setIsShowJiPaiUi
	slot7 = slot0.model
	slot5 = slot0.model.getJiPaiDic(slot6) ~= nil

	slot2(slot3, slot4)
end

DdzController.updateCanOutCard = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameState(slot2) == DDZ_GAMESTATE_PLAY then
		slot3 = slot0.model

		if slot0.model.getCurrentUser(slot2) ~= DDZ_VIEW_CHAIRID_ME then
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
		else
			slot5 = slot0.model.getCanOutDataDic(slot0.model.setCanOutCard) ~= nil and (slot1.ctDic ~= nil or slot1.boomDic ~= nil or slot1.rocketDic ~= nil)

			slot0.model.setCanOutCard(slot0.model, slot0.model)
		end
	end
end

DdzController.updateCanOnceOutAllCards = function (slot0)
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

	if slot0.isAutoState(slot1) or slot3 == nil or slot3 ~= DDZ_CT_SINGLE then
		slot7 = false

		slot0.model.setCanOnceOutAllCards(slot5, slot0.model)

		return
	end

	slot7 = true

	slot0.model.setCanOnceOutAllCards(slot5, slot0.model)
end

DdzController.lockStateView = function (slot0)
	slot3 = slot0.model
	slot0.model.getLockViewDic(slot2) or {}.stateViewDic = {}

	for slot5 = DDZ_VIEW_CHAIRID_ME, DDZ_VIEW_CHAIRID_LEFT, 1 do
		slot1.stateViewDic[slot5] = true
	end

	slot6 = true

	slot0.model.setLockViewDic(slot3, slot0.model, slot1)
end

DdzController.unLockStateView = function (slot0)
	slot3 = slot0.model

	if slot0.model.getLockViewDic(slot2) then
		slot1.stateViewDic = nil
	end

	slot6 = true

	slot0.model.setLockViewDic(slot3, slot0.model, slot1)
end

DdzController.lockCountDown = function (slot0)
	slot0.model.getLockViewDic(slot2) or {}.countDown = true
	slot6 = true

	slot0.model.setLockViewDic(slot0.model, slot0.model, slot0.model.getLockViewDic(slot2) or )
end

DdzController.lockFigureState = function (slot0)
	slot0.model.getLockViewDic(slot2) or {}.figureState = true
	slot6 = true

	slot0.model.setLockViewDic(slot0.model, slot0.model, slot0.model.getLockViewDic(slot2) or )
end

DdzController.unLockFigureState = function (slot0)
	slot3 = slot0.model

	if slot0.model.getLockViewDic(slot2) then
		slot1.figureState = nil
	end

	slot6 = true

	slot0.model.setLockViewDic(slot3, slot0.model, slot1)
end

return
