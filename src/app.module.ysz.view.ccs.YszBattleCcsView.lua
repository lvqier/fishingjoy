slot2 = "YszBattleCcsView"
YszBattleCcsView = class(slot1)
slot5 = 192
slot5 = 201
slot5 = 432
slot5 = 432
slot5 = 201
YszBattleCcsView.zjpos = {
	cc.p(slot3, 431),
	cc.p(slot3, 259),
	cc.p(slot3, 259),
	cc.p(slot3, 1089),
	cc.p(slot3, 1089)
}

YszBattleCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameBattleView

	ClassUtil.extends(slot2, slot0)
	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.btnXX2, UIConfig.ALIGN_LEFT)

	slot3 = slot0

	slot0.onIsShowingMenuChanged(slot2)

	slot3 = slot0

	slot0.init(slot2)

	slot1 = {
		{
			fromAlpha = 0,
			node = slot0.btnXX2,
			fromPos = cc.p(slot0.btnXX2, slot0.btnXX2.getPositionX(80)),
			fadeInEase = Sine.easeOut
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.btnMenu1,
			fromPos = cc.p(slot0.btnXX2, slot0.btnMenu1.getPositionX(-400)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			fromAlpha = 0,
			showDuration = 0.5,
			fadeInDuration = 0.2,
			showDelay = 0.1,
			node = slot0.bg,
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.layerPlayerInfo.playerInfo1,
			fromPos = cc.p(slot0.btnXX2, slot0.layerPlayerInfo.playerInfo1.getPositionX(1500)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.layerPlayerInfo.playerInfo2,
			fromPos = cc.p(slot0.btnXX2, slot0.layerPlayerInfo.playerInfo2.getPositionY(slot0.layerPlayerInfo.playerInfo1)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.layerPlayerInfo.playerInfo3,
			fromPos = cc.p(slot0.btnXX2, slot0.layerPlayerInfo.playerInfo3.getPositionY(slot0.layerPlayerInfo.playerInfo1)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.layerPlayerInfo.playerInfo4,
			fromPos = cc.p(slot0.btnXX2, slot0.layerPlayerInfo.playerInfo4.getPositionY(slot0.layerPlayerInfo.playerInfo1)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		},
		{
			hideDuration = 0.3,
			showDuration = 0.5,
			fromAlpha = 0,
			showDelay = 0,
			fadeInDuration = 0.2,
			node = slot0.layerPlayerInfo.playerInfo5,
			fromPos = cc.p(slot0.btnXX2, slot0.layerPlayerInfo.playerInfo5.getPositionY(slot0.layerPlayerInfo.playerInfo1)),
			fadeInEase = Sine.easeOut,
			showEase = svEase
		}
	}
	slot7 = slot0.btnXX2
	slot7 = slot0.btnMenu1
	slot6 = -500
	slot5 = -500
	slot8 = slot0.layerPlayerInfo.playerInfo2
	slot5 = -500
	slot8 = slot0.layerPlayerInfo.playerInfo3
	slot5 = 1500
	slot8 = slot0.layerPlayerInfo.playerInfo4
	slot5 = 1500
	slot8 = slot0.layerPlayerInfo.playerInfo5

	if IS_IOS_VERIFY and not IS_IOS_VERIFY_BANK and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_ALL_NO_BANK then
		slot4 = slot0.btnXX2

		slot0.btnXX2.retain(slot3)

		slot4 = slot0.btnXX2

		slot0.btnXX2.removeFromParent(slot3)
	end

	slot7 = slot1

	ClassUtil.extends(slot3, slot0, BaseGameAniamtionView, true)
end

YszBattleCcsView.init = function (slot0)
	slot0.m_timers = {}
	slot5 = slot0

	slot0.model.isShowingMenuChangedSignal.add(slot2, slot0.model.isShowingMenuChangedSignal, slot0.onIsShowingMenuChanged)

	slot5 = slot0

	slot0.model.isShowMenuChangedSignal.add(slot2, slot0.model.isShowMenuChangedSignal, slot0.onIsShowMenuChanged)

	slot5 = slot0

	slot0.model.myTableUserDataChangedSignal.add(slot2, slot0.model.myTableUserDataChangedSignal, slot0.onMyTableUserData)

	slot5 = slot0

	slot0.model.gameStateChangedSignal.add(slot2, slot0.model.gameStateChangedSignal, slot0.onChangeGameState)

	slot5 = slot0

	slot0.model.isShowEffectPKChangedSignal.add(slot2, slot0.model.isShowEffectPKChangedSignal, slot0.onShowPK)

	slot5 = slot0

	slot0.model.isSendPukeFinishChangedSignal.add(slot2, slot0.model.isSendPukeFinishChangedSignal, slot0.onSendPukeFinish)

	slot5 = slot0

	slot0.model.isEndShowPukeChangedSignal.add(slot2, slot0.model.isEndShowPukeChangedSignal, slot0.onShowEndPuKe)

	slot5 = slot0

	slot0.model.isShowJettonEndResultChangedSignal.add(slot2, slot0.model.isShowJettonEndResultChangedSignal, slot0.onShowEndJetton)

	slot5 = slot0

	slot0.model.isPlayingGiveUpActionChangedSignal.add(slot2, slot0.model.isPlayingGiveUpActionChangedSignal, slot0.onFinishGiveUP)

	slot5 = slot0

	slot0.model.nCurRoundsChangedSignal.add(slot2, slot0.model.nCurRoundsChangedSignal, slot0.onChangeDJL)

	slot5 = slot0

	slot0.model.gameEventChangedSignal.add(slot2, slot0.model.gameEventChangedSignal, slot0.onGameEvent)

	slot6 = true

	bindModelShowing(slot2, slot0.btnXX2, slot0.model, "isShowingChat")

	slot4 = "npc"
	slot0.npcSpine = slot0.controller.createSpineByPool(slot2, slot0.controller)
	slot4 = slot0.npcSpine

	slot0.npc.addChild(slot2, slot0.npc)
end

YszBattleCcsView.onShow = function (slot0)
	slot3 = "==========YszBattleCcsView:onShow============"

	print(slot2)

	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

	slot5 = {
		autoAlpha = 1
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot5 = slot0
	slot5 = slot0.getParent(0.05)
	slot5 = {
		x = 132,
		y = 678
	}

	TweenLite.to(slot2, slot0.getParent(0.05).getParent(0.05).layerNotice, 0.4)

	slot3 = slot0

	slot0.resetGame(slot2)

	slot4 = 5

	slot0.controller.startTick(slot2, slot0.controller)

	slot3 = slot0

	slot0.updateRoomTableName(slot2)
end

YszBattleCcsView.onHide = function (slot0)
	slot5 = true

	Hero.setUserFakeScore(slot2, Hero, 0)

	slot5 = {
		autoAlpha = 0
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)

	slot3 = slot0.controller

	slot0.controller.clearCd(slot2)

	slot3 = slot0.controller

	slot0.controller.stopTick(slot2)
end

YszBattleCcsView.onChangeDJL = function (slot0)
	slot4 = slot0.model

	if slot0.model.getNMaxRounds(slot0.model) < slot0.model.getNCurRounds(slot2) then
		slot3 = slot0.nodeOp

		slot0.nodeOp.reset(slot2)

		slot3 = slot0

		slot0.stopAllTime(slot2)

		slot3 = slot0.controller

		slot0.controller.clearCd(slot2)
	end
end

YszBattleCcsView.onChangeGameState = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameState(slot2) == GAME_STATUS_FREE then
		slot4 = "=========YszBattleCcsView:onChangeGameState---GAME_STATUS_FREE=============="

		print(slot3)

		slot4 = slot0

		slot0.resetGame(slot3)

		slot4 = slot0

		slot0.stopAllTime(slot3)

		slot4 = slot0

		slot0.onMyTableUserData(slot3)

		slot4 = slot0.layerBet

		slot0.layerBet.showWait(slot3)
	elseif slot1 == GAME_STATUS_PLAY then
	elseif slot1 == YSZ_GAME_SCENE_END then
	end
end

YszBattleCcsView.onGameEvent = function (slot0, slot1, ...)
	if slot1 == YSZ_EVENT_GAME_FREE then
		slot4 = slot0

		slot0.onSubGameFree(slot3, ...)
	elseif slot1 == YSZ_EVENT_GAME_START then
		slot4 = slot0

		slot0.onSubGameStart(slot3, ...)
	elseif slot1 == YSZ_EVENT_ADDSCORE then
		slot4 = slot0

		slot0.onSubAddScore(slot3, ...)

		slot5 = false

		slot0.model.setDoAction(slot3, slot0.model)
	elseif slot1 == YSZ_EVENT_GIVEUP then
		slot4 = slot0

		slot0.onSubGiveUp(slot3, ...)
	elseif slot1 == YSZ_EVENT_COMPARE then
		slot4 = slot0

		slot0.onSubCompareCard(slot3, ...)
	elseif slot1 == YSZ_EVENT_LOOKCARD then
		slot4 = slot0

		slot0.onSubLookCard(slot3, ...)
	elseif slot1 == YSZ_EVENT_PLAYEREXIT then
		slot4 = slot0

		slot0.onSubPlayerExit(slot3, ...)
	elseif slot1 == YSZ_EVENT_GAME_END then
		slot4 = slot0

		slot0.onSubGameEnd(slot3, ...)
	elseif slot1 == YSZ_EVENT_WAITCOMPARE then
		slot4 = slot0

		slot0.onWaitCompare(slot3, ...)

		slot5 = false

		slot0.model.setDoAction(slot3, slot0.model)
	elseif slot1 == YSZ_EVENT_PLAY then
		slot4 = slot0

		slot0.onSubGamePlay(slot3, ...)
	elseif slot1 == YSZ_EVENT_GAME_RESET then
		slot4 = slot0

		slot0.resetGame(slot3)
	elseif slot1 == YSZ_EVENT_GAME_TIME then
		slot4 = slot0.layerPKP

		slot0.layerPKP.showOnTimeAction(slot3)
	elseif slot1 == YSZ_EVENT_COMPARE_NOMONEY then
		slot4 = slot0

		slot0.onSubCompareCardNoMoney(slot3, ...)
	elseif slot1 == YSZ_EVENT_SHOW_CARD then
		slot4 = slot0

		slot0.onSubShowCard(slot3, ...)
	elseif slot1 == YSZ_EVENT_DS then
		slot4 = slot0

		slot0.onSubDaS(slot3, ...)
	end
end

YszBattleCcsView.onSubGameStart = function (slot0)
	slot4 = INVALID_CHAIR

	slot0.model.setWWaitUserChoice(slot2, slot0.model)

	slot4 = INVALID_CHAIR

	slot0.model.setWWinnerUser(slot2, slot0.model)

	slot4 = {}

	slot0.model.setMyTablePlayingUserData(slot2, slot0.model)

	slot5 = true

	slot0.model.setTableChair(slot2, slot0.model, {})
	slot0.model.setTableUserID(slot2, slot0.model, {})

	slot3 = slot0.layerPKP

	slot0.layerPKP.reset(slot2)

	slot1 = 0
	slot6 = slot0.model

	for slot5, slot6 in pairs(slot0.model.getMyTableUserData(true)) do
		if slot6 ~= nil and slot6.cbUserStatus == US_PLAYING then
			slot9 = slot0.model
			slot0.model.getMyTablePlayingUserData(slot8)[slot5] = {}
			slot9 = slot6

			for slot10, slot11 in pairs() do
				slot14 = slot0.model
				slot0.model.getMyTablePlayingUserData(slot13)[slot5][slot10] = slot11

				if slot10 == "lScore" then
					slot14 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot13)[slot5].startScore = slot11
				end
			end

			slot9 = slot0.model
			slot0.model.getTableChair(slot8)[slot6.wChairID] = slot5
			slot9 = slot0.model
			slot0.model.getTableUserID(slot6.wChairID)[slot5] = slot6.dwUserID
			slot12 = slot0.model
			slot11 = YSZ_GAME_PLAYER
			slot14 = slot0.model

			if slot5 == gameMgr.switchViewChairID(slot6.dwUserID, gameMgr, slot0.model.getMeWChairID(slot11), slot0.model.getMeWChairID(slot13)) then
				slot10 = true

				slot0.model.setMePlaying(slot8, slot0.model)
			end

			slot1 = slot1 + 1
		end
	end

	slot5 = slot1

	slot0.model.setMyTablePlayingUserNum(slot3, slot0.model)

	slot4 = slot0.layerBet

	slot0.layerBet.hideWait(slot3)

	slot4 = slot0.nodeOp

	slot0.nodeOp.reset(slot3)

	slot4 = slot0
	slot10 = slot0.model
	slot9 = YSZ_GAME_PLAYER
	slot12 = slot0.model

	slot0.onZJTip(slot3, gameMgr.switchViewChairID(slot6, gameMgr, slot0.model.getWBankerUser(slot9), slot0.model.getMeWChairID(slot11)))
end

YszBattleCcsView.onZJTip = function (slot0, slot1, slot2)
	if YszBattleCcsView.zjpos[slot1] == nil then
		return
	end

	if slot2 ~= nil then
		slot6 = YszBattleCcsView.zjpos[slot1]

		slot0.layerPlayerInfo.Ysz_Battle_tb1.setPosition(slot4, slot0.layerPlayerInfo.Ysz_Battle_tb1)
	else
		slot5 = slot0.layerPlayerInfo.Ysz_Battle_tb1
		slot9 = 450

		slot0.layerPlayerInfo.Ysz_Battle_tb1.setPosition(slot4, cc.p(slot7, 667))

		slot5 = slot0.layerPlayerInfo.Ysz_Battle_tb1

		slot0.layerPlayerInfo.Ysz_Battle_tb1.stopAllActions(slot4)

		slot5 = slot0.layerPlayerInfo.Ysz_Battle_tb1
		slot16 = YszBattleCcsView.zjpos[slot1]
		slot13 = 1
		slot12 = cc.CallFunc
		slot16 = slot0.onFinishZJTip
		slot11 = nil

		slot0.layerPlayerInfo.Ysz_Battle_tb1.runAction(slot4, cc.Sequence.create(slot7, cc.Sequence, cc.EaseOut.create(slot10, cc.EaseOut, cc.MoveTo.create(slot13, cc.MoveTo, 0.2)), cc.CallFunc.create(cc.EaseOut, handler(cc.MoveTo, slot0))))
	end

	slot6 = true

	slot0.layerPlayerInfo.Ysz_Battle_tb1.setVisible(slot4, slot0.layerPlayerInfo.Ysz_Battle_tb1)
end

YszBattleCcsView.onFinishZJTip = function (slot0)
	slot1 = 0
	slot2 = 1

	slot3()

	slot6 = slot0.m_timers
	slot12 = 3

	table.insert(slot5, tickMgr.delayedCall(slot8, tickMgr, function ()
		slot4 = YSZ_GAME_PLAYER
		slot7 = slot1.model
		slot4 = slot1.model
		slot2 = slot1.model.getLTablePlayerScore(slot1.model)

		if slot1.model.getMyTablePlayingUserData(gameMgr)[gameMgr.switchViewChairID(slot1, gameMgr, slot0 - 1, slot1.model.getMeWChairID(slot6))] ~= nil and slot1.cbUserStatus == US_PLAYING then
			slot5 = slot1.model
			slot1.model.getCbPlayStatus(slot4)[slot0] = 1
			slot10 = slot1.model

			slot1.layerPKP.jetton.playUserJetton(1, slot1.layerPKP.jetton, slot0, slot1.model.getLCurrentTimes(slot1.model))

			slot6 = slot1.model
			slot9 = slot1.model
			slot6 = slot1.model.getXzTotalScore(slot1.model.getLCellScore(slot8)) + slot1.model.getLCellScore(slot1.model)

			slot1.model.setXzTotalScore(slot1.model.getLCellScore(slot1.layerPKP.jetton), slot1.model)

			slot6 = slot1.model
			slot1.lScore = slot1.lScore - slot1.model.getLCellScore(slot1.model)

			if slot2 + slot1.model.getLCellScore(slot1.layerPKP.jetton)[slot0] == nil then
				slot2[slot0] = 0
			end

			slot6 = slot1.model
			slot2[slot0] = slot2[slot0] + slot1.model.getLCellScore(slot5)
		end

		if slot0 < YSZ_GAME_PLAYER then
			slot0 = slot0 + 1
		else
			slot1.model.setLTablePlayerScore(slot4, slot1.model, slot2)

			slot5 = slot1

			slot1.onMyTableUserData(slot4)

			slot5 = slot1.layerBet

			slot1.layerBet.onChangeZXZ(slot4)

			slot5 = slot1.layerPKP
			slot12 = 0.4

			function slot13()
				slot2 = slot0.layerPKP

				slot0.layerPKP.onStart(slot1)
			end

			slot11 = nil

			slot1.layerPKP.runAction(slot4, cc.Sequence.create(true, cc.Sequence, cc.DelayTime.create(slot10, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
		end
	end, 40))

	slot9 = slot0.model
	slot6 = "======开始游戏扣地注=======" .. slot0.model.getLCellScore(slot8)

	print(slot5)

	slot9 = slot0.model
	slot7 = -slot0.model.getLCellScore(slot8)

	Hero.addUserFakeScore(slot5, Hero)
end

YszBattleCcsView.onSendPukeFinish = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsSendPukeFinish(slot2) then
		slot4 = slot0.m_timers
		slot10 = 0

		table.insert(slot3, tickMgr.delayedCall(slot6, tickMgr, function ()
			slot3 = slot0.model

			if slot0.model.getWCurrentUser(slot1) == slot0.model.getMeWChairID(slot0.model) then
				slot4 = true

				slot0.model.setIsShowMenu(slot1, slot0.model, true)

				slot3 = YSZ_HANDLE_TIME

				slot0.model.setIsShowMenu.model.setPlayerCd(slot1, slot0.model.setIsShowMenu.model)

				slot2 = slot0.model.setIsShowMenu.model.setPlayerCd.model.playerCdChangedSignal

				slot0.model.setIsShowMenu.model.setPlayerCd.model.playerCdChangedSignal.emit(slot1)
			else
				slot4 = true

				slot0.model.setIsShowMenu(slot1, slot0.model, false)
			end

			slot2 = slot0.model

			if slot0.model.getWCurrentUser(slot1) ~= nil then
				slot2 = slot0
				slot8 = slot0.model
				slot7 = YSZ_GAME_PLAYER
				slot10 = slot0.model

				slot0.startPlayerTime(slot1, gameMgr.switchViewChairID(slot4, gameMgr, slot0.model.getWCurrentUser(slot7), slot0.model.getMeWChairID(slot9)))
			end
		end, 600))

		slot4 = slot0.model

		if slot0.model.getGiveUpData(slot3) ~= nil then
			slot4 = slot0

			slot0.onSubGiveUp(slot3)
		end
	end
end

YszBattleCcsView.onSubGamePlay = function (slot0)
	slot3 = slot0

	slot0.resetGame(slot2)

	for slot4 = 1, YSZ_GAME_PLAYER, 1 do
		slot10 = true

		slot0.layerPlayerInfo["playerInfo" .. slot4].setData(slot4, slot0.layerPlayerInfo["playerInfo" .. slot4], nil)
	end

	slot3 = slot0

	slot0.updateRoomTableName(slot2)

	slot4 = INVALID_CHAIR

	slot0.model.setWWaitUserChoice(slot2, slot0.model)

	slot4 = INVALID_CHAIR

	slot0.model.setWWinnerUser(slot2, slot0.model)

	slot4 = false

	slot0.model.setMePlaying(slot2, slot0.model)

	slot5 = true

	slot0.model.setTableChair(slot2, slot0.model, {})

	slot4 = nil

	slot0.model.setCompareCardNoMoneyData(slot2, slot0.model)

	slot4 = 0

	slot0.model.setCompareCardNoMoneyIndex(slot2, slot0.model)

	slot1 = 0
	slot5 = slot0.model.getCbPlayStatus(slot0.model)

	for slot6, slot7 in pairs(slot0.model) do
		if slot7 == 1 then
			slot11 = slot0.model

			if slot0.model.getMyTableUserData(slot10)[slot6] ~= nil then
				slot11 = slot0.model
				slot0.model.getMyTablePlayingUserData(slot10)[slot8] = {}
				slot13 = slot0.model
				slot11 = slot0.model.getMyTableUserData(slot12)[slot8]

				for slot12, slot13 in pairs() do
					slot16 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot15)[slot8][slot12] = slot13

					if slot12 == "lScore" then
						slot16 = slot0.model
						slot0.model.getMyTablePlayingUserData(slot15)[slot6].startScore = slot13
					end
				end

				slot12 = slot0.model
				slot0.model.getTableChair(slot10)[slot0.model.getMyTableUserData(slot0.model)[slot8].wChairID] = slot8
				slot12 = slot0.model
				slot0.model.getTableUserID(slot0.model.getMyTableUserData(slot0.model)[slot8].wChairID)[slot8] = slot0.model.getMyTableUserData(slot0.model)[slot8].dwUserID
				slot12 = 255

				slot0.layerPlayerInfo["playerInfo" .. slot8].setOpacity("playerInfo" .. slot8, slot0.layerPlayerInfo["playerInfo" .. slot8])

				slot12 = false

				slot0.layerPlayerInfo["playerInfo" .. slot8].setVisible("playerInfo" .. slot8, slot0.layerPlayerInfo["playerInfo" .. slot8])
			end

			if slot6 == 1 then
				slot12 = true

				slot0.model.setMePlaying(slot10, slot0.model)
			end

			slot11 = slot0.model

			if slot0.model.getBMingZhu(slot10)[slot8] and slot8 ~= 1 then
				slot12 = 1

				slot0.layerPlayerInfo["playerInfo" .. slot8].onChangeState("playerInfo" .. slot8, slot0.layerPlayerInfo["playerInfo" .. slot8])
			end

			slot1 = slot1 + 1
		end
	end

	slot6 = slot1

	slot0.model.setMyTablePlayingUserNum(slot4, slot0.model)

	slot3 = 0
	slot4 = slot0.model.getMyTablePlayingUserData(slot0.model)
	slot7 = slot0.model
	slot5 = slot0.model.getLTablePlayerScore(slot0.model)
	slot9 = slot0.model

	for slot9 = 1, #slot0.model.getLTableScore(slot8), 1 do
		slot12 = slot0.model
		slot3 = slot3 + slot0.model.getLTableScore(slot11)[slot9]
		slot14 = YSZ_GAME_PLAYER
		slot17 = slot0.model

		if slot5[gameMgr.switchViewChairID(slot11, gameMgr, slot9 - 1, slot0.model.getMeWChairID(slot16))] == nil then
			slot5[slot10] = 0
		end

		slot13 = slot0.model

		if slot0.model.getLTableScore(slot12)[slot9] > 0 and slot4[slot10] ~= nil then
			slot13 = slot0.model
			slot5[slot10] = slot0.model.getLTableScore(slot12)[slot9]
			slot15 = slot0.model
			slot4[slot10].lScore = slot4[slot10].lScore - slot0.model.getLTableScore(slot14)[slot9]

			if slot10 == 1 then
				slot13 = "======场景扣分======="

				print(slot12)

				slot16 = slot0.model
				slot14 = -slot0.model.getLTableScore(slot15)[slot9]

				Hero.addUserFakeScore(slot12, Hero)
			end
		end
	end

	slot10 = true

	slot0.model.setLTablePlayerScore(slot7, slot0.model, slot5)

	for slot9 = 1, YSZ_GAME_PLAYER, 1 do
		slot13 = slot0.model

		for slot13 = 1, slot0.model.getNCurRounds(slot12) + 1, 1 do
			slot16 = slot0.model

			if slot0.model.getLUserJetton(slot15)[slot9][slot13] ~= nil then
				slot16 = slot0.model

				if slot0.model.getLUserJetton(slot15)[slot9][slot13] > 0 then
					slot20 = slot0.model
					slot18 = slot0.model.getLUserJettonTimes(slot0.model)[slot9][slot13]

					slot0.layerPKP.jetton.setPlayingJetton(slot15, slot0.layerPKP.jetton, slot0.model.getLUserJetton(slot18)[slot9][slot13])
				end
			end
		end
	end

	slot9 = slot3

	slot0.model.setXzTotalScore(slot7, slot0.model)

	slot10 = true

	slot0.model.setMyTablePlayingUserData(slot7, slot0.model, slot4)

	slot8 = slot0

	slot0.onMyTableUserData(slot7)

	slot8 = slot2

	for slot9, slot10 in pairs(slot7) do
		if slot10 == 1 then
			slot14 = slot0.model

			if slot0.model.getBMingZhu(slot13)[slot9] and slot11 ~= 1 then
				slot15 = 1

				slot0.layerPlayerInfo["playerInfo" .. slot11].onChangeState("playerInfo" .. slot11, slot0.layerPlayerInfo["playerInfo" .. slot11])
			end
		end
	end

	slot14 = slot0.model
	slot13 = YSZ_GAME_PLAYER
	slot16 = slot0.model
	slot10 = true

	slot0.onZJTip(slot7, slot0, gameMgr.switchViewChairID(slot10, gameMgr, slot0.model.getWBankerUser(slot13), slot0.model.getMeWChairID(slot15)))

	slot8 = slot0.layerBet

	slot0.layerBet.onChangeZXZ(slot7)

	slot11 = true

	slot0.model.setIsSendPukeFinish(slot7, slot0.model, true, nil)

	slot8 = slot0.layerPKP

	slot0.layerPKP.onSubPlay(slot7)

	slot8 = slot0.model

	if slot0.model.getMePlaying(slot7) and slot2[1] == 1 then
		slot9 = slot0.model

		if slot0.model.getWCurrentUser(slot7) == slot0.model.getMeWChairID(slot0.model) then
			slot8 = slot0.model

			if slot0.model.getBMeCompare(slot7) == true then
				slot9 = {
					wCompareUser = slot0.model.getMeWChairID(slot11)
				}
				slot12 = slot0.model

				slot0.model.setWaitCompareData(slot7, slot0.model)
				slot0.model.setIsShowMenu(slot7, slot0.model, false)

				slot8 = slot0

				slot0.onWaitCompare(slot7)

				slot11 = gameMgr
				slot14 = slot0.model
				slot10 = 2

				slot0.controller.PlaySound(slot7, slot0.controller, gameMgr.switchViewChairID(true, slot0.model.getWCurrentUser(slot13)))
			else
				slot10 = true

				slot0.model.setIsShowMenu(slot7, slot0.model, true)
			end

			slot8 = slot0.model
			slot11 = slot0.model

			slot0.model.setPlayerCd(slot7, slot0.model.getNLastSeconds(slot10))

			slot8 = slot0.model.playerCdChangedSignal

			slot0.model.playerCdChangedSignal.emit(slot7)
		else
			slot10 = true

			slot0.model.setIsShowMenu(slot7, slot0.model, false)
		end

		slot8 = slot0.layerBet

		slot0.layerBet.hideWait(slot7)

		slot8 = slot0.nodeOp

		slot0.nodeOp.onChangeCompareScore(slot7)
	else
		slot8 = slot0.layerBet

		slot0.layerBet.showWait(slot7)
	end

	slot8 = slot0.model

	if slot0.model.getIsAllIn(slot7) then
		slot8 = slot0.model

		if slot0.model.getMePlaying(slot7) and slot2[1] == 1 then
			slot9 = slot0.model

			if slot0.model.getWCurrentUser(slot7) == slot0.model.getMeWChairID(slot0.model) then
				slot10 = slot0.model

				for slot9, slot10 in pairs(slot0.model.getMyTablePlayingUserData(slot9)) do
					if slot9 ~= 1 then
						slot13 = slot0.model

						if slot0.model.getTableUserID(slot12)[key] == slot10.dwUserID then
							slot14 = 5

							slot0.layerPlayerInfo["playerInfo" .. slot9].onChangeState("playerInfo" .. slot9, slot0.layerPlayerInfo["playerInfo" .. slot9])
						end
					end
				end
			else
				slot9 = 5

				slot0.layerPlayerInfo["playerInfo" .. 1].onChangeState("playerInfo" .. 1, slot0.layerPlayerInfo["playerInfo" .. 1])

				slot9 = 4

				slot0.nodeOp.setModel("playerInfo" .. 1, slot0.nodeOp)
			end
		else
			slot10 = slot0.model

			for slot9, slot10 in pairs(slot0.model.getMyTablePlayingUserData(slot9)) do
				slot14 = slot0.model

				if slot10.wChairID ~= slot0.model.getWCurrentUser(slot13) then
					slot13 = slot0.model

					if slot0.model.getTableUserID(slot12)[key] == slot10.dwUserID then
						slot14 = 5

						slot0.layerPlayerInfo["playerInfo" .. slot9].onChangeState("playerInfo" .. slot9, slot0.layerPlayerInfo["playerInfo" .. slot9])
					end
				end
			end
		end
	end

	slot8 = slot0
	slot14 = slot0.model
	slot13 = YSZ_GAME_PLAYER
	slot16 = slot0.model

	slot0.startPlayerTime(slot7, gameMgr.switchViewChairID(slot10, gameMgr, slot0.model.getWCurrentUser(slot13), slot0.model.getMeWChairID(slot15)))

	slot8 = slot0.model.lTablePlayerScoreChangedSignal

	slot0.model.lTablePlayerScoreChangedSignal.emit(slot7)

	slot9 = false

	slot0.model.setDoAction(slot7, slot0.model)

	slot9 = 5

	slot0.controller.startTick(slot7, slot0.controller)
end

YszBattleCcsView.onSubAddScore = function (slot0)
	slot3 = slot0.model

	if slot0.model.getAddScoreData(slot2) == nil then
		return
	end

	slot5 = slot1.nCurRounds

	slot0.model.setNCurRounds(slot3, slot0.model)

	slot7 = YSZ_GAME_PLAYER
	slot10 = slot0.model
	slot6 = slot0.model

	if slot0.model.getMyTablePlayingUserData(gameMgr)[gameMgr.switchViewChairID(slot0.model, gameMgr, slot2, slot0.model.getMeWChairID(slot9))] ~= nil then
		slot4[slot3].lScore = slot4[slot3].lScore - slot1.lAddScoreCount
	end

	slot7 = slot0.model

	if slot0.model.getLTablePlayerScore(slot6)[slot3] == nil then
		slot5[slot3] = 0
	end

	slot5[slot3] = slot5[slot3] + slot1.lAddScoreCount
	slot10 = true

	slot0.model.setLTablePlayerScore(slot1.lAddScoreCount, slot0.model, slot5)

	slot10 = true

	slot0.model.setMyTablePlayingUserData(slot1.lAddScoreCount, slot0.model, slot4)

	slot8 = slot0

	slot0.onMyTableUserData(slot1.lAddScoreCount)

	slot11 = (slot1.bIsAllIn == 2 and 255) or slot1.lCurrentTimes

	slot0.layerPKP.jetton.playUserJetton(slot7, slot0.layerPKP.jetton, slot3, slot1.lAddScoreCount)

	slot9 = slot1.lCurrentTimes

	slot0.model.setLCurrentTimes(slot7, slot0.model)

	slot6 = slot1.wCurrentUser

	if slot1.bIsAllIn == 2 then
		slot9 = slot0.model

		if not slot0.model.getIsAllIn(slot8) then
			slot10 = slot0.model

			if slot0.model.getTableUserID(slot8)[slot3] == slot0.model.getMyTablePlayingUserData(slot0.model)[slot3].dwUserID then
				slot11 = 5

				slot0.layerPlayerInfo["playerInfo" .. slot3].onChangeState(slot3, slot0.layerPlayerInfo["playerInfo" .. slot3])
			end
		end

		slot11 = true

		slot0.model.setAllInScore(slot8, slot0.model, slot1.lAddScoreCount)

		slot11 = true

		slot0.model.setIsShowEffectXP(slot8, slot0.model, true)

		slot11 = true

		slot0.model.setIsAllIn(slot8, slot0.model, true)
	end

	if slot1.wCompareState ~= 1 then
		slot9 = slot0.model

		if slot6 == slot0.model.getMeWChairID(slot8) then
			slot10 = YSZ_HANDLE_TIME

			slot0.model.setPlayerCd(slot8, slot0.model)

			slot9 = slot0.model.playerCdChangedSignal

			slot0.model.playerCdChangedSignal.emit(slot8)

			slot11 = true

			slot0.model.setIsShowMenu(slot8, slot0.model, true)
		else
			slot9 = slot0.model

			if slot0.model.getCbPlayStatus(slot8) ~= nil then
				slot9 = slot0.model

				if slot0.model.getCbPlayStatus(slot8)[1] == 0 then
					slot9 = slot0.nodeOp

					slot0.nodeOp.reset(slot8)

					slot10 = false

					slot0.model.setIsShowBetMenu(slot8, slot0.model)
				end
			end
		end

		slot9 = slot0.model

		if slot2 == slot0.model.getMeWChairID(slot8) then
			slot9 = slot0.controller

			slot0.controller.clearCd(slot8)
		end

		slot10 = slot3

		slot0.stopPlayerTime(slot8, slot0)

		slot9 = slot0
		slot14 = YSZ_GAME_PLAYER
		slot17 = slot0.model

		slot0.startPlayerTime(slot8, gameMgr.switchViewChairID(slot11, gameMgr, slot6, slot0.model.getMeWChairID(slot16)))
	end
end

YszBattleCcsView.onSubGiveUp = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGiveUpData(slot2) == nil then
		return
	end

	slot3 = "======YszBattleCcsView:onSubGiveUp======"

	print(slot2)

	slot6 = slot0.model
	slot5 = YSZ_GAME_PLAYER
	slot8 = slot0.model
	slot5 = gameMgr.switchViewChairID(slot2, gameMgr, slot0.model.getGiveUpData(slot5).wGiveUpUser, slot0.model.getMeWChairID(slot7))

	slot0.stopPlayerTime(gameMgr, slot0)

	slot5 = slot0.model

	if slot0.model.getGiveUpData(gameMgr).wGiveUpUser == slot0.model.getMeWChairID(slot0.model) then
		slot4 = slot0.controller

		slot0.controller.clearCd(slot3)
	end

	slot5 = slot1

	slot0.layerPKP.onGiveUp(slot3, slot0.layerPKP)

	if slot1 == 1 then
		slot4 = slot0.nodeOp

		slot0.nodeOp.reset(slot3)

		slot5 = false

		slot0.model.setIsShowBetMenu(slot3, slot0.model)

		slot4 = slot0.layerCompare

		slot0.layerCompare.reset(slot3)

		slot5 = false

		slot0.layerPKP.btnLookCard.setVisible(slot3, slot0.layerPKP.btnLookCard)
	end

	slot4 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot3)[slot1] ~= nil then
		slot5 = slot0.model

		if slot0.model.getTableUserID(slot3)[slot1] == slot0.model.getMyTablePlayingUserData(slot0.model)[slot1].dwUserID then
			slot6 = 3

			slot0.layerPlayerInfo["playerInfo" .. slot1].onChangeState(slot1, slot0.layerPlayerInfo["playerInfo" .. slot1])
		end
	end
end

YszBattleCcsView.onSubLookCard = function (slot0)
	slot3 = slot0.model

	if slot0.model.getLookCardData(slot2) == nil then
		return
	end

	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		slot11 = slot0.model

		for slot10, slot11 in pairs(slot0.model.getMyTablePlayingUserData(slot10)) do
			if slot5 == slot10 then
				if slot10 == 1 then
					slot16 = 1

					slot0.layerPKP.lookCard(slot13, slot0.layerPKP, slot6)

					slot14 = slot0.nodeOp

					slot0.nodeOp.onChangeCompareScore(slot13)

					slot14 = slot0.nodeBetMenu

					slot0.nodeBetMenu.onChangeState(slot13)

					slot14 = slot0.nodeBetMenu

					slot0.nodeBetMenu.onChangeJZScore(slot13)
				end

				slot15 = slot0.model

				if slot0.model.getTableUserID(slot13)[slot5] == slot0.model.getMyTablePlayingUserData(slot0.model)[slot5].dwUserID then
					slot16 = 1

					slot0.layerPlayerInfo["playerInfo" .. slot5].onChangeState(slot5, slot0.layerPlayerInfo["playerInfo" .. slot5])
				end
			end
		end
	end
end

YszBattleCcsView.onSubShowCard = function (slot0)
	slot3 = "=======YszBattleCcsView:onSubShowCard========="

	print(slot2)

	slot3 = slot0.model

	if slot0.model.getShowCardData(slot2) ~= nil then
		slot10 = YSZ_GAME_PLAYER
		slot13 = slot0.model
		slot8 = true

		slot0.layerPKP.showPuke(slot3, slot0.layerPKP, slot1.cbCardData, gameMgr.switchViewChairID(slot7, gameMgr, slot1.wShowUser, slot0.model.getMeWChairID(slot12)), false)
	end
end

YszBattleCcsView.onSubDaS = function (slot0)
	slot3 = "=======YszBattleCcsView:onSubDaS========="

	print(slot2)

	if slot0.npcSpine ~= nil then
		slot6 = false

		slot0.npcSpine.setAnimation(slot2, slot0.npcSpine, 0, "animation")
	end
end

YszBattleCcsView.onSubCompareCardNoMoney = function (slot0)
	slot5 = slot0.model.getCompareCardNoMoneyIndex(slot2) + 1

	slot0.model.setCompareCardNoMoneyIndex(slot0.model, slot0.model)

	slot5 = slot0.model

	if slot0.model.getCompareCardNoMoneyData(slot0.model).compareCard[slot0.model.getCompareCardNoMoneyIndex(slot0.model)].wCompareUser[1] == slot0.model.getCompareCardNoMoneyData(slot0.model).compareCard[slot0.model.getCompareCardNoMoneyIndex(slot0.model)].wCompareUser[2] or slot2 == nil then
		slot8 = true

		slot0.model.setCompareStart(slot4, slot0.model, false, true)

		slot5 = slot0.model.compareStartChangedSignal

		slot0.model.compareStartChangedSignal.emit(slot4)

		slot6 = false

		slot0.model.setDoAction(slot4, slot0.model)

		return
	end

	slot6 = slot0.model

	if slot2.wLostUser == slot0.model.getMeWChairID(slot5) and slot2.cbCardData ~= nil then
		slot8 = true

		Hero.setUserFakeScore(slot4, Hero, 0, true)

		slot7 = true

		slot0.model.setCbHandCardData(slot4, slot0.model, nil)

		slot7 = true

		slot0.model.setCbHandCardData(slot4, slot0.model, slot2.cbCardData)
	end

	slot3 = 0

	for slot7 = 1, YSZ_GAME_PLAYER, 1 do
		slot10 = slot0.model

		if slot0.model.getCbPlayStatus(slot9)[slot7] == 1 then
			slot3 = slot3 + 1
		end
	end

	if slot3 <= 2 then
		slot8 = true

		slot0.model.setIsTwoMan(slot5, slot0.model, true)
	end

	slot9 = YSZ_GAME_PLAYER
	slot12 = slot0.model
	slot5 = gameMgr.switchViewChairID(slot0.model, gameMgr, slot2.wLostUser, slot0.model.getMeWChairID(slot11))
	slot0.model.getCbPlayStatus(slot5)[slot5] = 0
	slot7 = slot2

	slot0.model.setCompareCardData(slot5, slot0.model)

	slot6 = slot0.model

	if slot0.model.getIsShowEffectGZYZ(slot5) then
		slot7 = true

		slot0.model.setIsShowEffectPK(slot5, slot0.model)
	else
		slot8 = true

		slot0.model.setIsShowEffectGZYZ(slot5, slot0.model, true)

		slot6 = slot0

		slot0.onSubCompareCard(slot5)
	end
end

YszBattleCcsView.onWaitCompare = function (slot0)
	slot5 = true

	slot0.model.setIsShowMenu(slot2, slot0.model, false)

	slot3 = slot0.layerCompare

	slot0.layerCompare.showCompareBtnEffect(slot2)

	slot4 = 4

	slot0.nodeOp.setModel(slot2, slot0.nodeOp)
end

YszBattleCcsView.onSubCompareCard = function (slot0)
	slot3 = "=============YszBattleCcsView:onSubCompareCard===================="

	print(slot2)

	slot4 = true

	slot0.model.setIsPlayingAction(slot2, slot0.model)

	slot3 = slot0.layerCompare

	slot0.layerCompare.reset(slot2)

	slot3 = slot0.model

	if not slot0.model.getIsShowEffectGZYZ(slot2) then
		slot4 = true

		slot0.model.setIsShowEffectPK(slot2, slot0.model)
	end
end

YszBattleCcsView.onShowPK = function (slot0)
	slot1 = slot0.model.getIsShowEffectPK(slot2)
	slot4 = slot0.model

	if slot0.model.getIsTwoMan(slot0.model) then
		slot4 = slot0.nodeOp

		slot0.nodeOp.reset(slot3)
	end

	if slot1 then
		slot5 = true

		slot0.model.setCompareStart(slot3, slot0.model)

		slot5 = slot0.model

		if slot0.model.getWCurrentUser(slot3) == slot0.model.getMeWChairID(slot0.model) then
			slot4 = slot0.controller

			slot0.controller.clearCd(slot3)
		end

		slot4 = slot0.model

		if slot0.model.getWCurrentUser(slot3) ~= nil then
			slot4 = slot0
			slot10 = slot0.model
			slot9 = YSZ_GAME_PLAYER
			slot12 = slot0.model

			slot0.stopPlayerTime(slot3, gameMgr.switchViewChairID(slot6, gameMgr, slot0.model.getWCurrentUser(slot9), slot0.model.getMeWChairID(slot11)))
		end

		slot5 = nil

		slot0.model.setWCurrentUser(slot3, slot0.model)

		slot4 = slot0

		slot0.doPKAction(slot3)
	else
		slot4 = slot0.model

		if slot0.model.getCompareCardData(slot3) == nil then
			return
		end

		slot7 = YSZ_GAME_PLAYER
		slot8 = YSZ_GAME_PLAYER
		slot9 = YSZ_GAME_PLAYER
		slot12 = slot0.model
		slot9 = true

		slot0.layerPlayerInfo["playerInfo" .. slot4].setVisible("playerInfo" .. slot4, slot0.layerPlayerInfo["playerInfo" .. slot4])

		slot9 = true

		slot0.layerPlayerInfo["playerInfo" .. slot5].setVisible("playerInfo" .. slot5, slot0.layerPlayerInfo["playerInfo" .. slot5])

		slot8 = slot0.model

		if slot0.model.getMyTablePlayingUserData("playerInfo" .. slot5)[gameMgr.switchViewChairID(slot4, gameMgr, slot2.wLostUser, slot0.model.getMeWChairID(slot9))] ~= nil then
			slot9 = slot0.model

			if slot0.model.getTableUserID(slot7)[slot3] == slot0.model.getMyTablePlayingUserData(slot0.model)[slot3].dwUserID then
				slot9 = 2

				slot0.layerPlayerInfo["playerInfo" .. slot3].onChangeState("playerInfo" .. slot3, slot0.layerPlayerInfo["playerInfo" .. slot3])
			end
		end

		slot8 = slot0.model

		if slot0.model.getCompareCardNoMoneyData(slot7) ~= nil then
			slot8 = slot0.model

			if slot0.model.getCompareCardNoMoneyData(slot7) ~= nil then
				slot9 = slot0.model

				if slot0.model.getCompareCardNoMoneyData(slot7).wCount == slot0.model.getCompareCardNoMoneyIndex(slot0.model) then
					slot11 = true

					slot0.model.setCompareStart(slot7, slot0.model, false, true)

					slot8 = slot0.model.compareStartChangedSignal

					slot0.model.compareStartChangedSignal.emit(slot7)
				end
			end
		end

		slot9 = slot0.model

		if slot2.wCompareUser[1] ~= slot0.model.getMeWChairID(slot8) then
			slot9 = slot0.model

			if slot2.wCompareUser[2] == slot0.model.getMeWChairID(slot8) then
				slot8 = slot0.model

				if slot0.model.getIsTwoMan(slot7) then
					slot8 = slot0.controller

					slot0.controller.reqFinishFlash(slot7)
				end
			end
		end

		slot8 = slot0.model

		if slot0.model.getCompareCardNoMoneyData(slot7) ~= nil then
			slot8 = slot0.model

			if slot0.model.getCompareCardNoMoneyData(slot7) ~= nil then
				slot9 = slot0.model

				if slot0.model.getCompareCardNoMoneyData(slot7).wCount == slot0.model.getCompareCardNoMoneyIndex(slot0.model) then
					slot6 = slot2.wCurrentUser
					slot9 = slot0.model

					if slot0.model.getWCurrentUser(slot8) == nil then
						slot10 = slot6

						slot0.model.setWCurrentUser(slot8, slot0.model)
					end

					slot11 = slot0.model
					slot10 = 65535

					if not numberEqual(slot8, slot0.model.getWCurrentUser(slot10)) then
						slot9 = slot0.model

						if slot0.model.getCbPlayStatus(slot8)[1] == 1 then
							slot9 = slot0.model

							if slot0.model.getBAllFollow(slot8) then
								slot10 = 3

								slot0.nodeOp.setModel(slot8, slot0.nodeOp)
							else
								slot10 = 2

								slot0.nodeOp.setModel(slot8, slot0.nodeOp)
							end
						end

						slot10 = slot0.model

						if slot0.model.getWCurrentUser(slot8) == slot0.model.getMeWChairID(slot0.model) then
							slot10 = YSZ_HANDLE_TIME

							slot0.model.setPlayerCd(slot8, slot0.model)

							slot9 = slot0.model.playerCdChangedSignal

							slot0.model.playerCdChangedSignal.emit(slot8)

							slot11 = true

							slot0.model.setIsShowMenu(slot8, slot0.model, true)
						end

						slot9 = slot0
						slot15 = slot0.model
						slot14 = YSZ_GAME_PLAYER
						slot17 = slot0.model

						slot0.startPlayerTime(slot8, gameMgr.switchViewChairID(slot11, gameMgr, slot0.model.getWCurrentUser(slot14), slot0.model.getMeWChairID(slot16)))
					end

					slot9 = slot0.model

					if slot0.model.getCompareCardNoMoneyData(slot8) ~= nil then
						slot10 = nil

						slot0.model.setCompareCardNoMoneyData(slot8, slot0.model)

						slot10 = 0

						slot0.model.setCompareCardNoMoneyIndex(slot8, slot0.model)
					end

					slot10 = false

					slot0.model.setIsPlayingAction(slot8, slot0.model)
				end
			end
		end

		if slot3 == 1 then
			slot8 = slot0.nodeOp

			slot0.nodeOp.reset(slot7)

			slot8 = slot0.layerPKP

			slot0.layerPKP.compareCard(slot7)
		else
			slot9 = slot3

			slot0.layerPKP.onGiveUp(slot7, slot0.layerPKP)
		end
	end
end

YszBattleCcsView.doPKAction = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCompareCardData(slot2) == nil then
		return
	end

	slot5 = slot0.model
	slot3 = slot0.model.getTableChair(slot0.model)[slot1.wCompareUser[2]]

	if slot0.model.getTableChair(slot3)[slot1.wCompareUser[1]] == nil or slot3 == nil then
		return
	end

	slot8 = slot0.layerPlayerInfo["playerInfo" .. slot2]
	slot9 = slot0.layerPlayerInfo["playerInfo" .. slot3]
	slot9 = slot0.model
	slot11 = false

	slot0.layerPlayerInfo["playerInfo" .. slot2].setVisible("playerInfo" .. slot2, slot0.layerPlayerInfo["playerInfo" .. slot2])

	slot11 = false

	slot0.layerPlayerInfo["playerInfo" .. slot3].setVisible("playerInfo" .. slot3, slot0.layerPlayerInfo["playerInfo" .. slot3])

	slot16 = slot3

	slot0.layerEffect.doPKAction("playerInfo" .. slot3, slot0.layerEffect, slot0.model.getMyTablePlayingUserData(slot0.layerPlayerInfo["playerInfo" .. slot3].getPosition)[slot2], slot0.model.getMyTablePlayingUserData(slot0.model)[slot3], cc.p(slot0.layerPlayerInfo["playerInfo" .. slot2].getPosition("playerInfo" .. slot2)), cc.p(slot0.layerPlayerInfo["playerInfo" .. slot3].getPosition("playerInfo" .. slot3)), slot2)
end

YszBattleCcsView.onSubPlayerExit = function (slot0)
	return
end

YszBattleCcsView.onSubOpenCard = function (slot0)
	return
end

YszBattleCcsView.onSubGameEnd = function (slot0)
	slot3 = "===============YszBattleCcsView:onSubGameEnd================="

	print(slot2)

	slot1 = slot0.model.getGameEndData(slot2)
	slot4 = slot0

	slot0.stopAllTime(slot0.model)

	slot4 = slot0.controller

	slot0.controller.clearCd(slot0.model)

	slot4 = slot0.nodeOp

	slot0.nodeOp.reset(slot0.model)

	slot4 = slot0.nodeBetMenu

	slot0.nodeBetMenu.reset(slot0.model)

	slot4 = slot0.layerBet

	slot0.layerBet.reset(slot0.model)

	slot4 = slot0.layerPKP

	slot0.layerPKP.checkST(slot0.model)

	slot6 = true

	slot0.model.setIsShowEffectXP(slot0.model, slot0.model, false)
end

YszBattleCcsView.onFinishGiveUP = function (slot0)
	slot3 = "==========YszBattleCcsView:onFinishGiveUP================"

	print(slot2)

	slot3 = slot0.model

	if slot0.model.getIsPlayingGiveUpAction(slot2) then
		return
	end

	slot3 = slot0.model

	if slot0.model.getCompareCardNoMoneyData(slot2) ~= nil then
		slot4 = slot0.model

		if slot0.model.getCompareCardNoMoneyIndex(slot0.model) < slot0.model.getCompareCardNoMoneyData(slot2).wCount then
			slot3 = slot0

			slot0.onSubCompareCardNoMoney(slot2)
		end
	else
		slot3 = "========弃牌的动作做完了============"

		print(slot2)

		slot3 = slot0.model

		if not slot0.model.getCompareStart(slot2) then
			slot4 = false

			slot0.model.setDoAction(slot2, slot0.model)
		end
	end
end

YszBattleCcsView.onShowEndPuKe = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsEndShowPuke(slot2) then
		slot3 = "==========YszBattleCcsView:onShowEndPuKe================"

		print(slot2)

		slot3 = slot0.model

		if slot0.model.getGameEndData(slot2) == nil then
			return
		end

		if slot1.winerChairID ~= 1 then
			slot6 = true

			slot0.model.setCanShowPuke(slot3, slot0.model, true)
		else
			slot6 = true

			slot0.model.setCanShowPuke(slot3, slot0.model, false)
		end

		slot5 = 0.1

		audioMgr.holdVolume(slot3, audioMgr)

		slot8 = slot0.model
		slot7 = YSZ_GAME_PLAYER
		slot10 = slot0.model

		if slot1.winerChairID == gameMgr.switchViewChairID(audioMgr, gameMgr, slot0.model.getMeWChairID(slot7), slot0.model.getMeWChairID(slot9)) then
			slot6 = slot0.model
			slot5 = 65535

			if not numberEqual(slot3, slot0.model.getMeWChairID(slot5)) then
				slot5 = true

				slot0.model.setIsShowEffectWin(slot3, slot0.model)
			end
		else
			slot5 = true

			slot0.model.setIsShowJettonEndResult(slot3, slot0.model)
		end
	end
end

YszBattleCcsView.onShowEndJetton = function (slot0)
	slot3 = slot0.model

	if slot0.model.getIsShowJettonEndResult(slot2) then
		slot3 = "==========YszBattleCcsView:onShowEndJetton================"

		print(slot2)

		slot3 = slot0.model

		if slot0.model.getGameEndData(slot2) == nil then
			return
		end

		slot8 = slot0.model
		slot6 = slot0.model.getXzTotalScore(slot7) - slot1.lGameTax

		slot0.layerPKP.jetton.playGameEndJetton(slot3, slot0.layerPKP.jetton, slot1.winerChairID)

		slot4 = slot0.model

		if slot0.model.getBankContentTxt(slot3) ~= nil then
			slot5 = nil

			slot0.model.setGameEndData(slot3, slot0.model)

			slot5 = slot0.model.getBankContentTxt(slot6)
			slot8 = slot0.model

			slot0.controller.gotoBankOrChargeA(slot3, slot0.controller, slot0.model.getBankNeedReqStandUp(slot0.model))
		end
	end
end

YszBattleCcsView.onSubGameFree = function (slot0)
	slot3 = "==========YszBattleCcsView:onSubGameFree============"

	print(slot2)

	slot3 = slot0

	slot0.resetGame(slot2)

	slot3 = slot0.layerBet

	slot0.layerBet.showWait(slot2)

	slot3 = slot0

	slot0.updateRoomTableName(slot2)
end

YszBattleCcsView.onIsShowingMenuChanged = function (slot0)
	slot5 = not slot0.model.getIsShowingMenu(slot2)

	slot0.btnMenu1.setVisible(slot0.model, slot0.btnMenu1)

	slot5 = slot0.model.getIsShowingMenu(slot2)

	slot0.btnMenu2.setVisible(slot0.model, slot0.btnMenu2)
end

YszBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 or slot1 == slot0.btnMenu2 then
		slot5 = slot0.controller

		slot0.controller.onMenuBtnClick(slot4)
	elseif slot1 == slot0.btnXX1 then
	elseif slot1 == slot0.btnXX2 then
		slot5 = slot0.controller

		slot0.controller.onBtnChatClick(slot4)
	elseif slot1 == slot0.btnDS then
		slot5 = slot0.controller

		slot0.controller.reqDas(slot4)
	end
end

YszBattleCcsView.onIsShowMenuChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMePlaying(slot2) == false then
		return
	end

	slot3 = "======onIsShowMenuChanged========"

	print(slot2)

	slot3 = slot0.nodeOp

	slot0.nodeOp.changeState(slot2)
end

YszBattleCcsView.onChangePlayerInfo = function (slot0)
	slot3 = slot0.nodeInfo

	slot0.nodeInfo.onChangePlayerInfo(slot2)
end

YszBattleCcsView.onMyTableUserData = function (slot0, slot1)
	slot4 = slot0.model
	slot2 = slot0.model.getMyTableUserData(slot3)

	for slot6 = 1, YSZ_GAME_PLAYER, 1 do
		slot14 = slot6

		slot0.updatePlayerState(slot6, slot0, slot2[slot6], slot0.layerPlayerInfo["playerInfo" .. slot6])
	end
end

YszBattleCcsView.onMyUserData = function (slot0, slot1, slot2)
	slot8 = 1

	slot0.updatePlayerState(slot4, slot0, slot1, slot0.layerPlayerInfo.playerInfo1)
end

YszBattleCcsView.updatePlayerState = function (slot0, slot1, slot2, slot3)
	function slot4()
		slot3 = 255

		slot0.setOpacity(slot1, slot0)
	end

	if slot1 ~= nil then
		slot5 = false
		slot10 = slot0.model

		for slot9, slot10 in pairs(slot0.model.getMyTablePlayingUserData(slot9)) do
			if slot10.dwUserID == slot1.dwUserID then
				slot13 = slot2

				if slot2.getData(slot12) ~= nil then
					slot13 = slot2

					if slot2.getData(slot12) ~= nil then
						slot13 = slot2

						if slot2.getData(slot12).dwUserID ~= slot10.dwUserID then
							if slot3 == 2 or slot3 == 3 then
								slot14 = -500

								slot2.setPositionX(slot12, slot2)

								slot15 = {
									x = 100.5,
									autoAlpha = 1,
									onComplete = slot4
								}

								TweenLite.to(slot12, slot2, 0.5)
							elseif slot3 == 4 or slot3 == 5 then
								slot14 = 1500

								slot2.setPositionX(slot12, slot2)

								slot15 = {
									x = 1114.79,
									autoAlpha = 1,
									onComplete = slot4
								}

								TweenLite.to(slot12, slot2, 0.5)
							end
						end
					end
				end

				slot5 = true
				slot15 = true

				slot2.setData(slot12, slot2, slot10)

				return
			end
		end
	end

	if slot1 == nil then
		function slot5()
			slot4 = true

			slot0.setData(slot1, slot0, slot1)
		end

		if slot3 == 2 or slot3 == 3 then
			slot10 = {
				x = -500,
				autoAlpha = 0,
				onComplete = slot5
			}

			TweenLite.to(slot7, slot2, 0.5)
		elseif slot3 == 4 or slot3 == 5 then
			slot10 = {
				x = 1500,
				autoAlpha = 0,
				onComplete = slot5
			}

			TweenLite.to(slot7, slot2, 0.5)
		end

		slot9 = slot3

		slot0.layerPKP.hide(slot7, slot0.layerPKP)
	else
		slot7 = slot2

		if slot2.getData(slot6) ~= nil then
			slot7 = slot2

			if slot2.getData(slot6) ~= nil then
				slot7 = slot2

				if slot2.getData(slot6).dwUserID ~= slot1.dwUserID then
					if slot3 == 2 or slot3 == 3 then
						slot8 = -500

						slot2.setPositionX(slot6, slot2)

						slot9 = {
							x = 100.5,
							autoAlpha = 1,
							onComplete = slot4
						}

						TweenLite.to(slot6, slot2, 0.5)
					elseif slot3 == 4 or slot3 == 5 then
						slot8 = 1500

						slot2.setPositionX(slot6, slot2)

						slot9 = {
							x = 1114.79,
							autoAlpha = 1,
							onComplete = slot4
						}

						TweenLite.to(slot6, slot2, 0.5)
					end
				end
			end
		end

		slot9 = true

		slot2.setData(slot6, slot2, slot1)
	end
end

YszBattleCcsView.updateRoomTableName = function (slot0)
	slot3 = gameMgr
	slot2 = ""
	slot5 = gameMgr.getCurRoomVo(slot2).wSortID / 100 + 1
	slot8 = ({
		"体验场",
		"初级场",
		"普通场",
		"中级场",
		"高级场"
	})[math.floor(slot4)]

	slot0.layerBet.setRoomName(slot6, slot0.layerBet)
end

YszBattleCcsView.stopAllTime = function (slot0)
	for slot4 = 1, YSZ_GAME_PLAYER, 1 do
		slot9 = false

		slot0.layerPlayerInfo["playerInfo" .. slot4].setProgressPlaying(slot4, slot5)

		slot8 = slot0.layerPlayerInfo["playerInfo" .. slot4]

		slot0.layerPlayerInfo["playerInfo" .. slot4].reset(slot4)
	end
end

YszBattleCcsView.stopPlayerTime = function (slot0, slot1)
	slot6 = false

	slot0.layerPlayerInfo["playerInfo" .. slot1].setProgressPlaying(slot1, slot0.layerPlayerInfo["playerInfo" .. slot1])
end

YszBattleCcsView.startPlayerTime = function (slot0, slot1, slot2)
	if slot1 == 1 then
		slot6 = 14

		slot0.controller.reqClientError(slot4, slot0.controller)

		slot5 = slot0.layerEffect

		slot0.layerEffect.reset(slot4)
	end

	slot6 = slot0.model

	if slot0.model.getNMaxRounds(slot0.model) < slot0.model.getNCurRounds(slot4) then
		slot5 = slot0

		slot0.stopAllTime(slot4)

		slot5 = slot0.controller

		slot0.controller.clearCd(slot4)

		return
	end

	slot5 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot4)[slot1] ~= nil then
		slot6 = slot0.model

		if slot0.model.getTableUserID(slot4)[slot1] == slot0.model.getMyTablePlayingUserData(slot0.model)[slot1].dwUserID then
			slot7 = 255

			slot0.layerPlayerInfo["playerInfo" .. slot1].setOpacity(slot1, slot3)

			slot7 = true

			slot0.layerPlayerInfo["playerInfo" .. slot1].setVisible(slot1, slot3)

			slot6 = slot0.layerPlayerInfo["playerInfo" .. slot1]
			slot4 = slot0.layerPlayerInfo["playerInfo" .. slot1].setProgressPlaying
			slot7 = true

			if slot1 == 1 then
				slot10 = slot0.model
				slot8 = slot0.model.getPlayerCd(slot9) or 30

				slot4(slot5, slot6, slot7)
			end
		end
	end
end

YszBattleCcsView.resetGame = function (slot0)
	slot3 = slot0.layerBet

	slot0.layerBet.reset(slot2)

	slot3 = slot0.layerPKP

	slot0.layerPKP.reset(slot2)

	slot3 = slot0.layerPKP.jetton

	slot0.layerPKP.jetton.reset(slot2)

	slot3 = slot0.nodeOp

	slot0.nodeOp.reset(slot2)

	slot3 = slot0.nodeBetMenu

	slot0.nodeBetMenu.reset(slot2)

	slot3 = slot0.layerCompare

	slot0.layerCompare.reset(slot2)

	slot3 = slot0.layerEffect

	slot0.layerEffect.reset(slot2)

	slot6 = true

	slot0.model.setCompareStart(slot2, slot0.model, false, true)

	slot3 = slot0.model.compareStartChangedSignal

	slot0.model.compareStartChangedSignal.emit(slot2)

	slot3 = audioMgr

	audioMgr.resetVolume(slot2)

	slot4 = false

	slot0.layerPlayerInfo.Ysz_Battle_tb1.setVisible(slot2, slot0.layerPlayerInfo.Ysz_Battle_tb1)

	for slot4 = 1, YSZ_GAME_PLAYER, 1 do
		slot8 = slot0.layerPlayerInfo["playerInfo" .. slot4]

		slot0.layerPlayerInfo["playerInfo" .. slot4].reset(slot4)
	end

	slot3 = slot0.m_timers

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot0.m_timers = {}
end

YszBattleCcsView.destroy = function (slot0)
	slot3 = "============YszBattleCcsView:destroy=============="

	print(slot2)

	if slot0.npcSpine ~= nil then
		slot4 = slot0.npcSpine

		spPoolMgr.put(slot2, spPoolMgr)
	end
end

return
