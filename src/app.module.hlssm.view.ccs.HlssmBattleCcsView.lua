HlssmBattleCcsView = class("HlssmBattleCcsView")

HlssmBattleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameBattleView, true, true)
	slot0.controller:adjustSlimWidth(slot0.btnSZ, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.bgSZ, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.txtSZ_tf, UIConfig.ALIGN_RIGHT, -80)

	slot0._tabLogPane = CcsTabPane.new()

	slot0._tabLogPane:pushTabs(slot1)
	slot0.layerLog.layerList.listResult_lv:setItemResCcsFileName("module/hlssm/csb/common/HlssmLogResultItem.csb")
	slot0.layerLog.layerList.listScore_lv:setItemResCcsFileName("module/hlssm/csb/common/HlssmLogScoreItem.csb")
	slot0.layerLog.layerList.listResult_lv:setGap(-1)
	slot0.layerLog.layerList.listScore_lv:setGap(-1)
	slot0._tabLogPane.tabClickSignal:add(slot0.onLogTabSelected, slot0)
	slot0.model.isShowingMenuChangedSignal:add(slot0.onMenuShowChanged, slot0)
	slot0.model.logTabIndexChangedSignal:add(slot0.onLogTabIndex, slot0)
	slot0.model.isInBankerListChangedSignal:add(slot0.onInBankerList, slot0)
	slot0.model.freeDataChangedSignal:add(slot0.onSubGameFree, slot0)
	slot0.model.startDataChangedSignal:add(slot0.onSubGameStart, slot0)
	slot0.model.endDataChangedSignal:add(slot0.onSubGameEnd, slot0)
	slot0.model.statusDataChangedSignal:add(slot0.onGameScene, slot0)
	slot0.model.curBankerUserChangedSignal:add(slot0.onSubChangeBanker, slot0)
	slot0.model.bankerChangedSignal:add(slot0.onChangeBanker, slot0)
	slot0.model.curBankerUserChangedSignal:add(slot0.onBankerUser, slot0)
	slot0.model.placeJettonChangedSignal:add(slot0.onSubPlaceJetton, slot0)
	slot0.model.recordListChangedSignal:add(slot0.onRecordList, slot0)
	slot0.model.bankerListChangedSignal:add(slot0.onBankerList, slot0)
	slot0.model.roomKindChangedSignal:add(slot0.onRoomKindChanged, slot0)
	bindModelShowing(slot0.btnChat, slot0.model, "isShowingChat", true)
	slot0:onRoomKindChanged()
	slot0:onInBankerList()
	slot0:onRecordList()
	slot0:onMenuShowChanged()
	slot0:onLogTabIndex()
	slot0:resetGame()

	for slot5 = 1, 5, 1 do
		slot0.bet["btnMoney" .. slot5].setIsIgnoreSound(slot6, true)
		slot0.bet["btnMoney" .. slot5].getClickWhenCantTouchSignal(slot6):add(slot0.onCantClick, slot0)
	end

	slot0.layerLog.btnShowLuzi:setIsClickZoom(false)
	ClassUtil.extends(slot0, TickBase)
end

HlssmBattleCcsView.onCantClick = function (slot0)
	slot0.controller:playGameEffect("SELECTED.mp3")
end

HlssmBattleCcsView.onRoomKindChanged = function (slot0)
	if slot0.model:getRoomKind() == 1 or slot1 == 3 then
		slot0.roomInfo.roomInfo_tf:setHtmlText(string.format(({
			[1.0] = "体验场%d号房",
			[3.0] = "普通场%d号房"
		})[slot1], gameMgr:getCurRoomNum()))
	end
end

HlssmBattleCcsView.onUserDataChagned = function (slot0)
	slot0.btnOnline.online_tf:setHtmlText(HtmlUtil.createArtNum(slot2, "#hlssm_online_num_%s.png"), true)
end

HlssmBattleCcsView.resetGameData = function (slot0)
	for slot4 = 0, 7, 1 do
		slot0.center.layerHover["hover" .. slot4]:stopAllActions()
		slot0.center.layerHover["hover" .. slot4]:setVisible(false)
	end

	slot0:resetCard()
	slot0:resetCenterBet()
	Hero:setUserFakeScore(0, true)
	slot0.model:setLUserJettonScore({})
	slot0.model:setLAllJettonScore({})
end

HlssmBattleCcsView.resetGame = function (slot0)
	slot0:resetGameData()
	slot0.model:setIsBet(false)
	slot0:hideJsBack()
end

HlssmBattleCcsView.onBankerList = function (slot0)
	slot1 = nil

	for slot6, slot7 in ipairs(slot2) do
		if slot7.UserID == Hero:getDwUserID() then
			slot1 = slot6
		end
	end

	if slot1 then
		slot0.txtSZ_tf:setHtmlText(string.format("排队中:%s/%s", slot1, #slot2), true)
	else
		slot0.txtSZ_tf:setHtmlText(string.format("%s人排队", #slot2), true)
	end
end

HlssmBattleCcsView.onInBankerList = function (slot0)
	slot0.btnSZ.xz:setVisible(slot1)
	slot0.btnSZ.sz:setVisible(not slot0.model:getIsInBankerList())
end

HlssmBattleCcsView.onGameScene = function (slot0)
	slot1 = slot0.model:getStatusData()
	slot2 = slot0.model:getGameStatus()

	slot0.model:setLMeMaxScore(slot1.lPlayBetScore)
	slot0.model:setLApplyBankerCondition(slot1.lApplyBankerCondition)
	slot0.model:setLAreaLimitScore(slot1.lAreaLimitScore)
	slot0.model:setWBankerTime(slot1.wBankerTime)
	slot0.model:setLBankerWinScore(slot1.lBankerWinScore)

	slot3 = gameMgr:getUserDataByChairId(slot1.wBankerUser) or {}

	slot0.model:setCurBankerUser(slot4, true)

	if ({
		wBankerUser = slot1.wBankerUser,
		lBankerScore = slot1.lBankerScore,
		szNickName = slot3.szNickName
	})["wBankerUser"] == Hero:getWChairID() then
		slot0.model:setIsMeBank(true)
		slot0.model:setIsInBankerList(true)
	else
		slot0.model:setIsInBankerList(false)
	end

	slot0:resetGame()

	if slot2 == HLSSM_GAME_SCENE_FREE then
		slot0.countDown.state_tf:setHtmlText("空闲时间")
	elseif slot2 == HLSSM_GAME_SCENE_BET or slot2 == HLSSM_GAME_SCENE_END then
		slot5 = 0
		slot6 = {}
		slot7 = {}

		for slot11 = 0, 7, 1 do
			slot6[slot11] = slot1.lAllBet[slot11 + 1]
			slot7[slot11] = slot1.lPlayBet[slot11 + 1]
			slot5 = slot5 + slot7[slot11]
		end

		slot0.model:setLUserJettonScore(slot7)
		slot0.model:setLAllJettonScore(slot6)

		if slot5 > 0 then
			slot0.model:setIsBet(true)
		end

		for slot11 = 0, 7, 1 do
			slot0:setSigneAllBet(slot11, slot1.lAllBet[slot11 + 1])
			slot0:setSigneMyAllBet(slot11, slot1.lPlayBet[slot11 + 1])
			slot0.jetton:setTableGoldMove(slot11, slot1.lAllBet[slot11 + 1])
		end

		slot0:updataAllScore()

		if slot2 == HLSSM_GAME_SCENE_BET then
			slot0.countDown.state_tf:setHtmlText("下注时间")
			Hero:setUserFakeScore(-slot5)
		elseif slot2 == HLSSM_GAME_SCENE_END then
			slot0.countDown.state_tf:setHtmlText("开奖时间")

			if slot1.lPlayFreeSocre and slot1.lPlayAllScore then
				Hero:setUserScore(slot1.lPlayFreeSocre + slot1.lPlayAllScore)
			end

			slot0:resetSelectBet()
			slot0.model:updateEndDataByStatusData()

			slot0.model:getEndData().bankerUser = slot4
			slot0.model:getEndData().playerGold = Hero:getUserScore()

			slot0.model.endDataChangedSignal:emit(nil, true)
		end
	end

	slot0.countDown:beginCountDown(slot1.cbTimeLeave)
	slot0:updateButtonContron()
end

HlssmBattleCcsView.resetCard = function (slot0)
	slot0.sendcard:removeTimer()
end

HlssmBattleCcsView.onSubGameFree = function (slot0)
	slot0:resetGameData()
	slot0.sendcard:checkResult()
	slot0.countDown:beginCountDown(slot0.model:getFreeData().cbTimeLeave)
	slot0.countDown.state_tf:setHtmlText("空闲时间")
	slot0:updateButtonContron()
end

HlssmBattleCcsView.hideJsBack = function (slot0)
	slot0.model:setIsShowingFailed(false)
	slot0.model:setIsShowingWin(false)
end

HlssmBattleCcsView.setCardType = function (slot0, slot1, slot2)
	slot0.sendcard:setCardType(slot1, slot2)
end

HlssmBattleCcsView.setBankerInfo = function (slot0)
	if not gameMgr:getUserDataByChairId(slot0.model:getCurBankerUser().wBankerUser) or slot2.szNickName == nil or slot1.wBankerUser == INVALID_WORD then
		slot0.info.banker.txtName_tf:setHtmlText("无人坐庄")
		slot0.info.banker.txtMoney_tf:setHtmlText(0)
		slot0.info.banker.bankerTime_tf:setHtmlText("连庄：0")
	else
		slot0.controller:setHeadBg(slot0.info.banker.head, GAME_STATE.BATTLE, slot2.wGender)
		slot0.info.banker.head:setUserData(slot2)
		slot0.model:setLBankerStartScore(slot1.lBankerScore)
		slot0.info.banker.txtName_tf:setHtmlText(StringUtil.truncate(slot2.szNickName, 10, nil, 2))

		if slot1.lBankerScore == 0 then
			slot1.lBankerScore = slot2.lScore
		end

		slot3 = slot1.lBankerScore

		if IS_HL_VERSION then
			slot3 = slot3 / 100
		end

		slot0.info.banker.txtMoney_tf:setHtmlText(slot3)
		slot0.info.banker.bankerTime_tf:setHtmlText("连庄：" .. (slot0.model:getWBankerTime() or 0))
	end
end

HlssmBattleCcsView.showUserInfo = function (slot0)
	if gameMgr:getUserData(Hero:getDwUserID()) then
		slot0.controller:setHeadBg(slot0.info.mine.head, GAME_STATE.BATTLE, slot1.wGender)
		slot0.info.mine.head:setUserData(slot1)
		slot0.info.mine.txtName_tf:setHtmlText(StringUtil.truncate(slot1.szNickName, 10, nil, 2))

		slot2 = Hero:getUserScore()

		if IS_HL_VERSION then
			slot2 = slot2 / 100
		end

		slot0.info.mine.txtMoney:setStrBaseWidth((IS_HL_VERSION and 110) or 180)
		slot0.info.mine.txtMoney:setStrTxt(MathUtil.cookNumWithHansUnits(slot2))
		slot0.model:setStartTotalJetton(slot1.lScore)
		slot0:updateButtonContron()
	end
end

HlssmBattleCcsView.onSubGameStart = function (slot0)
	slot0:hideJsBack()

	slot0._xting = false

	slot0.model:setUserBetAllScore(0)
	slot0.model:setIsBet(false)

	slot0._cjUpdate = false

	slot0.model:setLMeMaxScore(slot0.model:getStartData().lPlayBetScore)

	slot2 = gameMgr:getUserDataByChairId(slot0.model.getStartData().wBankerUser) or {}

	slot0.model:setCurBankerUser(slot3)
	slot0:setBankerInfo()
	slot0.countDown:beginCountDown(slot1.cbTimeLeave)
	slot0.countDown.state_tf:setHtmlText("下注时间")
	slot0:updateButtonContron()
	slot0.controller:playGameEffect(Hlssm_sound_StartBet)
	slot0.countDown:addTitle(1)
end

HlssmBattleCcsView.onSubGameEnd = function (slot0, slot1, slot2)
	slot0.countDown:beginCountDown(slot0.model:getEndData().cbTimeLeave)
	slot0.countDown.state_tf:setHtmlText("开牌时间")
	slot0:resetSelectBet()

	if slot0.model:getTempXtVec() and #slot3 > 0 then
		slot0.model:setXtVec(slot3)
	end

	slot0.model:setTempXtVec({})

	if not slot0._cjUpdate then
		slot0._cjUpdate = true

		slot0.model:setMyGrade(slot0.model:getMyGrade() + slot1.lPlayAllScore)
	end

	slot0.model:setWBankerTime(slot1.nBankerTime)

	if slot1.cbTimeLeave > 13 then
		slot0.sendcard:sendCard(slot2)
	elseif slot1.cbTimeLeave >= 1 then
		slot0.sendcard:setCard(slot2)
	end

	slot0:updateButtonContron()
end

HlssmBattleCcsView.onChangeBanker = function (slot0)
	if not slot0.model:getIsShowingWin() and not slot0.model:getIsShowingFailed() then
		slot0.countDown:addTitle(4)
	end
end

HlssmBattleCcsView.onSubChangeBanker = function (slot0)
	slot0:updateButtonContron()
end

HlssmBattleCcsView.onBankerUser = function (slot0)
	slot0:setBankerInfo()
end

HlssmBattleCcsView.onSubPlaceJetton = function (slot0)
	if HLSSM_AREA_MAX < slot0.model:getPlaceJetton().cbBetArea then
		return
	end

	slot4[slot2] = slot0.model:getLAllJettonScore()[slot1.cbBetArea] or 0
	slot4[slot2] = slot4[slot2] + slot1.lBetScore

	slot0.model:setLAllJettonScore(slot4)
	slot0:setSigneAllBet(slot2, slot4[slot2])

	if Hero:getWChairID() == slot1.wChairID then
		slot0.model:setIsBet(true)

		slot5[slot2] = slot0.model:getLUserJettonScore()[slot2] or 0
		slot5[slot2] = slot5[slot2] + slot3

		slot0.model:setLUserJettonScore(slot5)
		slot0:setSigneMyAllBet(slot2, slot5[slot2])
		slot0.jetton:setMyGoldMove(slot2, slot3)
		Hero:addUserFakeScore(-slot3)
		table.insert(slot0.model.getLUserJettonScore()[slot2] or 0, {
			cbJettonArea = slot2,
			lJettonScore = slot3
		})
		slot0.model:setTempXtVec(slot0.model:getTempXtVec())
	else
		slot0.jetton:setTableGoldMove(slot2, slot3)
	end

	if not slot0:getIsTicking() then
		slot0:startTick()
	end
end

HlssmBattleCcsView.tick = function (slot0)
	slot0:updataAllScore()
	slot0:updateButtonContron()
	slot0:stopTick()
end

HlssmBattleCcsView.resetCenterBet = function (slot0)
	slot0.jetton:reset()

	for slot4 = 0, 7, 1 do
		slot0.betMoney["area_all_" .. slot4 .. "_tf"]:setHtmlText("")

		slot0.betMoney["area_all_" .. slot4 .. "_tf"]._cacheScore = nil

		slot0.betMoney["area_my_" .. slot4 .. "_tf"]:setHtmlText("")
	end

	slot0.betMoney.total_tf:setHtmlText(HtmlUtil.createImg(slot1) .. " " .. HtmlUtil.createArtNumDot(0, "#hlssm_all_%s.png"))
end

HlssmBattleCcsView.setSigneAllBet = function (slot0, slot1, slot2)
	if slot0.betMoney["area_all_" .. slot1 .. "_tf"]._cacheScore ~= slot2 then
		if slot2 > 0 then
			slot4 = nil

			slot3:setHtmlText((not IS_HL_VERSION or HtmlUtil.createArtNumDP(slot2 / 100, "#hlssm_all_%s.png")) and HtmlUtil.createArtNumDot(slot2, "#hlssm_all_%s.png"), true)
		else
			slot3:setHtmlText("", true)
		end

		slot3._cacheScore = slot2
	end
end

HlssmBattleCcsView.setSigneMyAllBet = function (slot0, slot1, slot2)
	if slot2 > 0 then
		if IS_HL_VERSION then
			slot0.betMoney["area_my_" .. slot1 .. "_tf"]:setHtmlText(HtmlUtil.createArtNumDP(slot2 / 100, "#hlssm_my_%s.png"), true)
		else
			slot0.betMoney["area_my_" .. slot1 .. "_tf"]:setHtmlText(HtmlUtil.createArtNumDot(slot2, "#hlssm_my_%s.png"), true)
		end
	else
		slot0.betMoney["area_my_" .. slot1 .. "_tf"]:setHtmlText("", true)
	end
end

HlssmBattleCcsView.updateUseScore = function (slot0, slot1)
	slot0.model:setUserBetAllScore(slot0.model:getUserBetAllScore() + slot1)
	slot0:showUserInfo()
end

HlssmBattleCcsView.updataAllScore = function (slot0)
	slot1 = 0

	for slot6, slot7 in pairs(slot2) do
		slot1 = slot1 + slot7
	end

	slot3 = HtmlUtil.createImg(slot0.controller:getUIPath("txt/hlssm_txt_battle_zxz.png"))

	if IS_HL_VERSION then
		slot0.betMoney.total_tf:setHtmlText(slot3 .. " " .. HtmlUtil.createArtNumDP(slot1 / 100, "#hlssm_all_%s.png"))
	else
		slot0.betMoney.total_tf:setHtmlText(slot3 .. " " .. HtmlUtil.createArtNumDot(slot1, "#hlssm_all_%s.png"))
	end
end

HlssmBattleCcsView.setWinArea = function (slot0, slot1)
	slot2 = slot0.model:getCardArray()
	slot5 = {
		[0] = slot0.center.layerHover.hover0,
		slot0.center.layerHover.hover1,
		slot0.center.layerHover.hover2,
		slot0.center.layerHover.hover3,
		slot0.center.layerHover.hover4,
		slot0.center.layerHover.hover5,
		slot0.center.layerHover.hover6,
		slot0.center.layerHover.hover7
	}
	slot6 = 8

	if slot0.controller:getCardListPip(slot2[1], #slot2[1]) == slot0.controller:getCardListPip(slot2[2], #slot2[2]) then
		slot5[1]:stopAllActions()
		slot5[1]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))
	elseif slot3 < slot4 then
		slot5[2]:stopAllActions()
		slot5[2]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))

		if slot4 == 8 or slot4 == 9 then
			slot5[4]:stopAllActions()
			slot5[4]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))
		end
	else
		slot5[0]:stopAllActions()
		slot5[0]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))

		if slot3 == 8 or slot3 == 9 then
			slot5[3]:stopAllActions()
			slot5[3]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))
		end
	end

	slot7 = false

	if gameMgr:getCardValue(slot2[1][1]) == gameMgr:getCardValue(slot2[1][2]) then
		slot7 = true

		slot5[6]:stopAllActions()
		slot5[6]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))
	end

	slot8 = false

	if gameMgr:getCardValue(slot2[2][1]) == gameMgr:getCardValue(slot2[2][2]) then
		slot8 = true

		slot5[7]:stopAllActions()
		slot5[7]:runAction(cc.Sequence:create(cc.Blink:create(slot6, 15)))
	end

	audioMgr:holdVolume(0.1)

	if (slot0.model:getEndData() or {}.lPlayAllScore or 0) >= 0 then
		slot0.controller:playGameEffect(Hlssm_sound_Win)
	elseif slot10 < 0 then
		slot0.controller:playGameEffect(Hlssm_sound_Lose)
	else
		slot0.controller:playGameEffect(Hlssm_sound_Win)
	end

	if not slot1 then
		table.insert(slot11, {
			bPlayerTwoPair = slot7,
			bBankerTwoPair = slot8,
			cbPlayerCount = slot3,
			cbBankerCount = slot4,
			index = #slot0.model:getRecordList() + 1
		})
		slot0.model.recordListChangedSignal:emit()
	end

	slot0:showJsBack(slot1)
end

HlssmBattleCcsView.showJsBack = function (slot0, slot1)
	slot3 = slot0.model:getEndData().lPlayAllScore
	slot4 = slot0.model.getEndData().bankerUser

	if not slot0.model:getIsBet() and (not slot4 or slot4.wBankerUser ~= Hero:getWChairID()) then
		slot0.model:setIsShowingWin(true)
	elseif slot3 < 0 then
		slot0.model:setIsShowingFailed(true)
	else
		slot0.model:setIsShowingWin(true)
	end

	if slot0.model:getGameStatus() == HLSSM_GAME_SCENE_END and not slot1 and slot2.playerGold == Hero:getUserScore() then
		Hero:setUserFakeScore(slot3, true)
	end

	Hero:setUserFakeScore(0, false, true)
	slot0.model:setUserBetAllScore(0)
	slot0.model:setStartTotalJetton(slot0.model:getStartTotalJetton() + slot3)
	slot0:setBankerInfo()
end

HlssmBattleCcsView.onRecordList = function (slot0)
	slot0.layerLog.layerList.listResult_lv:setDatas(slot1, true)
	slot0.layerLog.layerList.listScore_lv:setDatas(slot1, true)
	slot0.layerLog.layerList.listResult_lv:jumpToPercent(1, nil, 0)
	slot0.layerLog.layerList.listScore_lv:jumpToPercent(1, nil, 0)
end

HlssmBattleCcsView.resetSelectBet = function (slot0)
	slot0.model:setCurSelectGold(0)
	slot0.bet.hover:setVisible(false)
end

HlssmBattleCcsView.updateButtonContron = function (slot0)
	slot2 = slot0.model:getCurBankerUser()

	if slot0.model:getGameStatus() ~= HLSSM_GAME_SCENE_BET or not slot2.wBankerUser or slot2.wBankerUser == INVALID_WORD or slot2.wBankerUser == Hero:getWChairID() then
		slot0:resetSelectBet()

		for slot6 = 1, 5, 1 do
			slot0.bet["btnMoney" .. slot6]:setCanTouch(false)
		end

		slot0.bet.btnXt:setCanTouch(false)
	else
		slot3 = slot0.model:getCurSelectGold()
		slot4 = slot0.model:getLMeMaxScore() or 0

		for slot8 = 0, HLSSM_AREA_MAX - 1, 1 do
			slot4 = slot4 - (slot0.model:getLUserJettonScore()[slot8] or 0)
		end

		slot5 = {
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0
		}
		slot6 = 0

		for slot10 = 0, HLSSM_AREA_MAX - 1, 1 do
			if slot6 == 0 and slot10 == 1 then
				slot5[slot10] = slot0.controller:getUserMaxJetton(slot10)
			else
				if slot6 < slot0.controller:getUserMaxJetton(slot10) then
					slot6 = slot11
				end

				slot5[slot10] = slot11
			end
		end

		if slot6 < slot4 then
			slot4 = slot6
		end

		slot7 = 1
		slot8 = slot0.model.jettons
		slot9 = false

		for slot13 = 1, 5, 1 do
			slot14 = slot0.bet["btnMoney" .. slot13]

			if slot4 >= slot8[6 - slot13] * slot7 and slot6 >= slot15 * slot7 then
				slot14:setCanTouch(true)

				slot9 = true
			else
				slot14:setCanTouch(false)

				if slot0.model:getCurSelectGold() == slot15 then
					slot0:resetSelectBet()
				end
			end
		end

		if not slot9 then
			slot0.model:setCurSelectGold(-1)
		end

		slot0.bet.btnXt:setCanTouch(not slot0.model:getIsBet() and #(slot0.model:getXtVec() or {}) > 0 and slot0:canRepeatBet1() and slot0:canRepeatBet2(slot5))
	end
end

HlssmBattleCcsView.canRepeatBet2 = function (slot0, slot1)
	if not slot1 then
		slot1 = {
			[0] = 0,
			0,
			0,
			0,
			0,
			0,
			0,
			0
		}
		slot2 = 0

		for slot6 = 0, 7, 1 do
			if slot2 == 0 and slot6 == 1 then
				slot1[slot6] = slot0.controller:getUserMaxJetton(slot6)
			else
				if slot2 < slot0.controller:getUserMaxJetton(slot6) then
					slot2 = slot7
				end

				slot1[slot6] = slot7
			end
		end
	end

	slot2 = true
	slot3 = slot0.model:getXtVec() or {}
	slot4 = {
		[0] = 0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}

	for slot8, slot9 in ipairs(slot3) do
		slot4[slot9.cbJettonArea] = slot4[slot9.cbJettonArea] + slot9.lJettonScore
	end

	for slot8 = 0, 7, 1 do
		if slot1[slot8] < slot4[slot8] then
			slot2 = false

			break
		end
	end

	return slot2
end

HlssmBattleCcsView.canRepeatBet1 = function (slot0)
	slot2 = 0

	for slot6, slot7 in ipairs(slot1) do
		slot2 = slot2 + slot7.lJettonScore
	end

	if Hero:getUserScore() < slot2 then
		return false
	end

	return true
end

HlssmBattleCcsView.onXtClick = function (slot0)
	if not slot0:canRepeatBet1() then
		slot0.bet.btnXt:setCanTouch(false)
		tweenMsgMgr:showMsg("您已经没有足够筹码下注，无法续押！")

		return
	end

	if not slot0:canRepeatBet2() then
		slot0.bet.btnXt:setCanTouch(false)
		tweenMsgMgr:showMsg("您的下注额不符合当前下注条件，无法续押！")

		return
	end

	if #slot0.model:getXtVec() == 0 then
		slot0.bet.btnXt:setCanTouch(false)
		tweenMsgMgr:showMsg("上一局没有下注纪录！")

		return
	end

	if slot0._xting then
		return
	end

	slot0._xting = true
	slot0._xtIndex = 1

	slot0.bet.btnXt:setCanTouch(false)

	slot0._xtTimer = tickMgr:delayedCall(function ()
		slot0:xtfun()
	end, 10, #slot1)
end

HlssmBattleCcsView.xtfun = function (slot0)
	if slot0._xtIndex <= #slot0.model:getXtVec() then
		slot0.controller:requestHlssmPlaceJetton(slot1[slot0._xtIndex].cbJettonArea, slot1[slot0._xtIndex].lJettonScore, true)

		slot0._xtIndex = slot0._xtIndex + 1
	elseif slot0._xtTimer then
		slot0._xtTimer:stop()
		slot0._xtTimer:destroy()

		slot0._xtTimer = nil
	end
end

HlssmBattleCcsView.onLogTabIndex = function (slot0)
	slot0._tabLogPane:setSelectedTabIndex(slot0.model:getLogTabIndex())
	slot0.layerLog.layerList.listResult_lv:setVisible(slot0.model:getLogTabIndex() == 1)
	slot0.layerLog.layerList.listScore_lv:setVisible(slot1 == 2)
end

HlssmBattleCcsView.onLogTabSelected = function (slot0, slot1)
	slot0.model:setLogTabIndex(slot1)
end

HlssmBattleCcsView.onMenuShowChanged = function (slot0)
	slot0.btnMenu1:setVisible(not slot0.model:getIsShowingMenu())
	slot0.btnMenu2:setVisible(slot0.model.getIsShowingMenu())
end

HlssmBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnMenu1 then
		slot0.controller:onMenuBtnClick()
	elseif slot1 == slot0.btnMenu2 then
		slot0.controller:onMenuBtnClick()
	elseif slot1 == slot0.btnOnline then
		slot0.model:setIsShowingOnline(true)
	elseif slot1 == slot0.btnSZ then
		slot0.controller:requestInOutBanker()
	elseif slot1 == slot0.btnChat then
		slot0.controller:onBtnChatClick()
	elseif slot1 == slot0.bet.btnXt then
		slot0:onXtClick()
	elseif slot1 == slot0.layerLog.btnShowLuzi then
		slot0.model:setIsShowingRecord(true)
	else
		slot3 = slot0.model.jettons

		for slot7 = 1, 5, 1 do
			if slot1 == slot0.bet["btnMoney" .. slot7] then
				slot0.model:setCurSelectGold(slot3[6 - slot7])
				slot0.bet.hover:setVisible(true)

				slot9, slot10 = slot8:getPosition()

				slot0.bet.hover:setPosition(cc.p(slot9 - 0.7, 61.69))
				slot0.controller:playGameEffect(Hlssm_sound_Bet)

				break
			end
		end
	end
end

HlssmBattleCcsView.onShow = function (slot0)
	audioMgr:resetVolume()
	slot0:resetGame()
	Hero.userScoreChangedSignal:add(slot0.showUserInfo, slot0)
	slot0:showUserInfo()
	gameMgr.userDatasDicChangedSignal:add(slot0.onUserDataChagned, slot0)
	slot0:onUserDataChagned()
end

HlssmBattleCcsView.onHide = function (slot0)
	audioMgr:resetVolume()
	slot0:resetGame()
	slot0.countDown:resetTimer()
	slot0.sendcard:removeTimer()
	Hero:setUserFakeScore(0, true)
	slot0.model:setMyGrade(0)
	slot0.model:setIsInBankerList(false)
	slot0.model:setBankerList({})
	gameMgr.userDatasDicChangedSignal:remove(slot0.onUserDataChagned, slot0)
	slot0:stopTick()
	Hero.userScoreChangedSignal:remove(slot0.showUserInfo, slot0)
	slot0.model:setXtVec({})
	slot0.model:setTempXtVec({})
end

HlssmBattleCcsView.destroy = function (slot0)
	gameMgr.userDatasDicChangedSignal:remove(slot0.onUserDataChagned, slot0)
	TickBase.destroy(slot0)

	for slot4 = 1, 5, 1 do
		slot0.bet["btnMoney" .. slot4].getClickWhenCantTouchSignal(slot5):remove(slot0.onCantClick, slot0)
		slot0.bet["btnMoney" .. slot4]:destroy()
	end
end

return
