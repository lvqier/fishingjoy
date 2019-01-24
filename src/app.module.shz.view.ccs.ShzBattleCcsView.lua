ShzBattleCcsView = class("ShzBattleCcsView")

requireLuaFromModule("shz.view.ccs.ShzRunOutLine")

ShzBattleCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameBattleView)
	slot0.controller:adjustSlimWidth(slot0.btnMenu, UIConfig.ALIGN_LEFT_UP, 80)
	slot0.controller:adjustSlimWidth(slot0.scoreInfo, UIConfig.ALIGN_RIGHT, -80)
	slot0.controller:adjustSlimWidth(slot0.Panel_Gun.spBottomBgLeft, UIConfig.ALIGN_LEFT)
	slot0.controller:adjustSlimWidth(slot0.Panel_Gun.spBottomBgRight, UIConfig.ALIGN_RIGHT)

	slot0.yaScoreIndex = 1

	slot0.Panel_Gun.btn_Start:setEnabled(true)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)

	slot0.oddsConfig = {
		{
			50,
			200,
			1000
		},
		{
			20,
			80,
			400
		},
		{
			15,
			40,
			200
		},
		{
			10,
			30,
			160
		},
		{
			7,
			20,
			100
		},
		{
			5,
			15,
			60
		},
		{
			3,
			10,
			40
		},
		{
			2,
			5,
			20
		},
		{
			0,
			0,
			2000
		}
	}
	slot0.lineZhuanTimeTab = {}
	slot0.waiterShanTimeTable = {}
	slot0.SHZGame_AllShus = {}

	for slot4 = 1, SHZ_MAX_SHU_COUNT, 1 do
		table.insert(slot0.SHZGame_AllShus, slot0.Panel_Gun.Panel_AllShu["shu_" .. slot4].root)
	end

	if not slot0.startBtnEffspine then
		slot0.startBtnEffspine = slot0.controller:createSpineWithEvent("shz_startmenu", nil, true, true)

		if slot0.startBtnEffspine then
			slot0.startBtnEffspine:setPosition(0, 0)
			slot0.Panel_Gun.btn_Start.Node_lightSpine:addChild(slot0.startBtnEffspine)
		end
	end

	if slot0.startBtnEffspine then
		slot0.startBtnEffspine:setAnimation(0, "animation", true)
	end

	slot0.scoreInfo:setStrBaseWidth(200)
	slot0.scoreInfo:setIsAutoHAlignCenter(true)
	slot0.Panel_Dice.root:setBattleView(slot0)
	slot0.Panel_Mary.root:setBattleView(slot0)
	slot0.Panel_Gun:setVisible(true)
	slot0.Panel_Dice.root:hide()
	slot0.Panel_Dice:setVisible(false)
	slot0.Panel_Mary.root:hide()
	slot0.Panel_Mary:setVisible(false)
	slot0.Panel_GetOrDice:setVisible(false)
	slot0.btn_AutoCount:setIsClickZoom(false)
	slot0.Panel_GetOrDice.Panel_Black:addTouchEventListener(handler(slot0, slot0.onTouchGetOrDic))

	slot0.machine = build_machine()

	slot0.btn_AutoCount:setVisible(false)
	slot0.Panel_Gun.btn_Auto:setCanLongClick(true)
	slot0.Panel_Gun.btn_Auto:setLongClickBeginIntervalMs(1000)
	slot0.Panel_Gun.btn_Auto:getLongClickSignal():add(slot0.onLongPressCall, slot0)
	slot0.Panel_Gun.btn_SelfDo:setCanLongClick(true)
	slot0.Panel_Gun.btn_SelfDo:setLongClickBeginIntervalMs(1000)
	slot0.Panel_Gun.btn_SelfDo:getLongClickSignal():add(slot0.onLongPressCall, slot0)
	slot0.model.selfRedPacketDataChangedSignal:add(slot0.onPacketReceived, slot0)
end

ShzBattleCcsView.onShow = function (slot0)
	slot0.model.lJettonScore = 0
	slot0.hasShowData = math.random(1, 9)

	for slot5, slot6 in ipairs(slot0.SHZGame_AllShus) do
		slot6:stopRollQuick()
	end

	for slot5, slot6 in ipairs(slot0.SHZGame_AllShus) do
		for slot10 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
			slot6._iconDatas[slot10] = slot1
		end

		slot6:appIconDatas(false)
	end

	slot0.model.bPlayingGame = false

	TweenLite.to(slot0:getParent():getParent().layerNotice, 0.2, {
		x = 175,
		y = 695
	})
	reset_machine(slot0.machine)

	slot0.model.lWinScore = 0

	slot0:resetLineIconNum()
	slot0:updateYaScore()
	slot0.model.gameEventChangedSignal:add(slot0.onGameEvent, slot0)
	Hero.userScoreChangedSignal:add(slot0.onUpdateMyScore, slot0)
	slot0:updateMyScore(Hero:getUserScore())
	slot0.model.selfRedPacketDataChangedSignal:add(slot0.onPacketReceived, slot0)

	if slot0.model:getSelfRedPacketData() then
		slot0:onPacketReceived(slot0.model:getSelfRedPacketData())
	end
end

ShzBattleCcsView.onTouchGetOrDic = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		if slot0.autoRedoTimer ~= nil then
			slot0.autoRedoTimer:stop()
			slot0.autoRedoTimer:destroy()

			slot0.autoRedoTimer = nil
		end

		if slot0.model.lWinScore <= 0 then
			return
		end

		slot0.Panel_Gun.btn_Auto:setCanTouch(true)
		slot0:doGameGetScoreAction()
	end
end

ShzBattleCcsView.setAutoModel = function (slot0, slot1)
	slot0.model.bAuto = slot1

	slot0.Panel_Gun.btn_Auto:setVisible(not slot1)
	slot0.Panel_Gun.btn_SelfDo:setVisible(slot1)
	slot0.Panel_Gun.btn_Auto:setCanTouch(true)
	slot0.Panel_Gun.btn_SelfDo:setCanTouch(true)

	if slot1 then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Stop:setEnabled(true)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(false)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	else
		slot0:setAutoCount(nil)
	end
end

ShzBattleCcsView.updateMyScore = function (slot0, slot1)
	slot0.scoreInfo:setStrTxt(HtmlUtil.createArtNumDot(slot1, "#shzNum_score_%s.png"))
end

ShzBattleCcsView.onUpdateMyScore = function (slot0)
	if slot0.model.bPlayingGame then
		return
	end

	slot0.scoreInfo:setStrTxt(HtmlUtil.createArtNumDot(Hero:getUserScore(), "#shzNum_score_%s.png"))
end

ShzBattleCcsView.updateYaScore = function (slot0)
	slot0.Panel_Gun.yaxiangNum_tf:setHtmlText(HtmlUtil.createArtNumDot(9, "#shzNum_bottom_%s.png"))
	slot0.Panel_Gun.yaFenNum_tf:setHtmlText(HtmlUtil.createArtNumDot(SHZ_YASCORETABLE[slot0.yaScoreIndex], "#shzNum_bottom_%s.png"))
	slot0.Panel_Gun.zongYaFenNum_tf:setHtmlText(HtmlUtil.createArtNumDot(9 * SHZ_YASCORETABLE[slot0.yaScoreIndex], "#shzNum_bottom_%s.png"))

	slot0.model.lJettonScore = SHZ_YASCORETABLE[slot0.yaScoreIndex]
end

ShzBattleCcsView.goToGunGame = function (slot0)
	if slot0.btn_packet then
		slot0.btn_packet:setVisible(slot0.bIsActivitingRedPacket)
	end

	if slot0.Panel_Mary:isVisible() then
		slot0.Panel_Mary.root:hide()
		slot0.Panel_Mary:setVisible(false)
	end

	if slot0.Panel_Dice:isVisible() then
		slot0.Panel_Dice.root:hide()
		slot0.Panel_Dice:setVisible(false)
	end

	if slot0.Panel_Gun:isVisible() == false then
		slot0.controller:playMusic(SHZ_SOUND_MAIN_BG)
		slot0:resetLineIconNum()
		slot0.Panel_GetOrDice:setVisible(false)
		slot0.Panel_MaryLongEff:setVisible(false)
		slot0.Panel_Gun:setVisible(true)
		slot0:getParent():getParent().layerNotice:setPosition(175, 695)
	end
end

ShzBattleCcsView.goToDiceGame = function (slot0)
	if slot0.btn_packet then
		slot0.btn_packet:setVisible(false)
	end

	if slot0.Panel_Gun:isVisible() then
		slot0:resetLineIconNum()
		slot0.Panel_GetOrDice:setVisible(false)
		slot0.Panel_MaryLongEff:setVisible(false)
		slot0.Panel_Gun:setVisible(false)
	end

	if slot0.Panel_Mary:isVisible() then
		slot0.Panel_Mary.root:hide()
		slot0.Panel_Mary:setVisible(false)
	end

	if slot0.Panel_Dice:isVisible() == false then
		slot0.Panel_Dice:setVisible(true)
		slot0.Panel_Dice.root:show()
	end
end

ShzBattleCcsView.goToMaryGame = function (slot0)
	if slot0.btn_packet then
		slot0.btn_packet:setVisible(false)
	end

	if slot0.Panel_Gun:isVisible() then
		slot0:resetLineIconNum()
		slot0.Panel_GetOrDice:setVisible(false)
		slot0.Panel_MaryLongEff:setVisible(false)
		slot0.Panel_Gun:setVisible(false)
	end

	if slot0.Panel_Dice:isVisible() then
		slot0.Panel_Dice.root:hide()
		slot0.Panel_Dice:setVisible(false)
	end

	if slot0.Panel_Mary:isVisible() == false then
		slot0.Panel_GetOrDice:setVisible(false)
		slot0.Panel_Mary:setVisible(true)
		slot0.Panel_Mary.root:show()
	end
end

ShzBattleCcsView.doGameGetScoreAction = function (slot0)
	if slot0.model.lWinScore <= 0 or slot0.Panel_GetOrDice.Panel_Black:isVisible() == false then
		return
	end

	if slot0.addEndWaitFlyTimer then
		slot0.addEndWaitFlyTimer:stop()
		slot0.addEndWaitFlyTimer:destroy()

		slot0.addEndWaitFlyTimer = nil
	end

	slot0.Panel_Gun.btn_Auto:setCanTouch(false)
	slot0.Panel_GetOrDice.Node_Result:setVisible(false)
	slot0.Panel_GetOrDice.Node_btnLay:setVisible(false)
	slot0.Panel_GetOrDice.Panel_Black:setVisible(false)
	slot0.Panel_GetOrDice.Node_getScoreSpine:setVisible(true)

	if not slot0.getScoreEffspine then
		slot0.getScoreEffspine = slot0.controller:createSpineWithEvent("defenyanshi", nil, true, true)

		if slot0.getScoreEffspine then
			slot0.getScoreEffspine:setPosition(0, 190)
			slot0.Panel_GetOrDice.Node_getScoreSpine:addChild(slot0.getScoreEffspine)
		end
	end

	if slot0.getScoreEffspine then
		slot0.getScoreEffspine:setAnimation(0, "animation", false)
	end

	slot0:addGoldEndFlyNum()
end

ShzBattleCcsView.resetFlyNumNode = function (slot0)
	slot0.Panel_GetOrDice.sprBigScore.getScoreNode:stopAllActions()
	slot0.Panel_GetOrDice.sprBigScore.getScoreNode:setScale(1)
	slot0.Panel_GetOrDice.sprBigScore.getScoreNode:setPosition(667, 226)
	slot0.Panel_GetOrDice.sprBigScore.getScoreNode:setOpacity(255)
end

ShzBattleCcsView.addGoldEndFlyNum = function (slot0)
	slot0.Panel_GetOrDice.sprBigScore.sprBg:setVisible(false)
	slot0:resetFlyNumNode()

	slot10 = slot0

	slot0.Panel_GetOrDice.sprBigScore.getScoreNode:runAction(cc.Sequence:create(slot3, slot6, cc.Spawn:create(slot7, slot8), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		slot0.Panel_GetOrDice.sprBigScore.getScoreNode:setScale(1)
		slot0.Panel_GetOrDice.sprBigScore.getScoreNode.setScale.Panel_GetOrDice.sprBigScore.getScoreNode:setPosition(667, 226)
		slot0.Panel_GetOrDice.sprBigScore.getScoreNode.setScale.Panel_GetOrDice.sprBigScore.getScoreNode.setPosition.Panel_GetOrDice.sprBigScore.sprBg:setVisible(true)
		slot0.Panel_GetOrDice.sprBigScore.getScoreNode.setScale.Panel_GetOrDice.sprBigScore.getScoreNode.setPosition.Panel_GetOrDice.sprBigScore.sprBg.setVisible.Panel_GetOrDice.sprBigScore.getScoreNode:setOpacity(255)
		slot0.Panel_GetOrDice.sprBigScore.getScoreNode.setScale.Panel_GetOrDice.sprBigScore.getScoreNode.setPosition.Panel_GetOrDice.sprBigScore.sprBg.setVisible.Panel_GetOrDice.sprBigScore.getScoreNode.setOpacity:flyNumEndDo()
	end)))
end

ShzBattleCcsView.flyNumEndDo = function (slot0)
	slot0:updateMyScore(Hero:getUserScore())
	slot0:resetLineIconNum()

	if slot0.addScoreActionTimer then
		slot0.addScoreActionTimer:stop()
		slot0.addScoreActionTimer:destroy()

		slot0.addScoreActionTimer = nil
	end

	if slot0.addEndWaitFlyTimer then
		slot0.addEndWaitFlyTimer:stop()
		slot0.addEndWaitFlyTimer:destroy()

		slot0.addEndWaitFlyTimer = nil
	end

	slot0.model.lWinScore = 0

	reqSHZGetScore()

	slot0.model.bPlayingGame = false

	slot0.Panel_GetOrDice:setVisible(false)
	slot0.Panel_GetOrDice.Node_btnLay:setVisible(true)

	if not slot0.model.bAuto then
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
	end
end

ShzBattleCcsView.doAddBigScoreAction = function (slot0, slot1)
	slot0:resetFlyNumNode()
	slot0.Panel_GetOrDice:setVisible(true)
	slot0.Panel_Gun.btn_Stop:setEnabled(false)
	slot0.Panel_Gun.btn_Start:setEnabled(false)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	slot0.Panel_Gun.btn_Auto:setCanTouch(false)
	slot0.Panel_Gun.btn_Add:setEnabled(false)
	slot0.Panel_Gun.btn_jian:setEnabled(false)
	slot0.Panel_GetOrDice.Node_getScoreSpine:setVisible(false)
	slot0.Panel_GetOrDice.Panel_Black:setVisible(true)
	slot0.Panel_GetOrDice.Node_btnLay:setVisible(not slot1)
	slot0.Panel_GetOrDice.sprBigScore:setVisible(true)

	slot0.doAddScore = slot0.model.lWinScore
	slot0.addBigScore = math.max(slot0.doAddScore - 100, 0)

	slot0.Panel_GetOrDice.sprBigScore.getScoreNode.getScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot0.addBigScore, "#shzGetScoreBigNum_%s.png"))

	if slot0.addScoreActionTimer then
		slot0.addScoreActionTimer:stop()
		slot0.addScoreActionTimer:destroy()

		slot0.addScoreActionTimer = nil
	end

	if slot0.addBigScore < slot0.doAddScore then
		slot3 = slot0
		slot0.addScoreActionTimer = tickMgr:delayedCall(function ()
			slot0:addBigScoreActionLoop(slot0)
		end, 1, -1)
	end
end

ShzBattleCcsView.addBigScoreActionLoop = function (slot0, slot1)
	if not slot0.addScoreActionTimer then
		return
	end

	slot0.addBigScore = math.min(slot0.addBigScore + 2, slot0.doAddScore)

	slot0.Panel_GetOrDice.sprBigScore.getScoreNode.getScore_tf:setHtmlText(HtmlUtil.createArtNumDotSign(slot0.addBigScore, "#shzGetScoreBigNum_%s.png"))

	if slot0.doAddScore <= slot0.addBigScore then
		if slot0.addScoreActionTimer then
			slot0.addScoreActionTimer:stop()
			slot0.addScoreActionTimer:destroy()

			slot0.addScoreActionTimer = nil
		end

		if slot0.addEndWaitFlyTimer then
			slot0.addEndWaitFlyTimer:stop()
			slot0.addEndWaitFlyTimer:destroy()

			slot0.addEndWaitFlyTimer = nil
		end

		slot3 = slot0
		slot0.addEndWaitFlyTimer = tickMgr:delayedCall(function ()
			if slot0 or slot1.model.bAuto then
				slot1:doGameGetScoreAction()
			end
		end, 500)
	end
end

ShzBattleCcsView.InGameShowAllIconByData = function (slot0)
	slot0.model.bPlayingGame = false

	slot0:updateMyScore(Hero:getUserScore())
	slot0:resetAllTimer()
	slot0.Panel_MaryLongEff:setVisible(false)
	slot0:resetLineIconNum()
	slot0.Panel_Gun.btn_Add:setEnabled(true)
	slot0.Panel_Gun.btn_jian:setEnabled(true)
	slot0.Panel_GetOrDice.Node_Result:setVisible(false)
	slot0.Panel_GetOrDice:setVisible(false)
	slot0.Panel_Gun.btn_Stop:setVisible(false)
	slot0.Panel_Gun.btn_Start:setVisible(true)
	slot0.Panel_Gun.btn_Start:setEnabled(true)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
	slot0.btn_AutoCount:setVisible(false)
	reset_machine(slot0.machine)
	slot0:setAutoModel(false)
	slot0:goToGunGame()

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		slot5:stopRollQuick()
	end

	slot0.hasShowData = slot0.hasShowData or math.random(1, 9)

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		for slot9 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
			slot5._iconDatas[slot9] = slot0.hasShowData or 0
		end

		slot5:appIconDatas(false)
		slot5:doAllGrayOrNo(false)
	end

	slot0.hasShowData = nil
end

ShzBattleCcsView.OnSubGameBet = function (slot0, slot1)
	if not ffiMgr:isSizeEqual(slot1, "SHZ_CMD_S_Bet") then
		slot0:setAutoModel(false)
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)

		return
	end

	slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "SHZ_CMD_S_Bet")
	slot0.model.cbCardArray = TableUtil.copyDataDep(slot2.cbCardArray)
	slot0.model.lWinScore = slot2.lWinScore
	slot0.model.cbFullID = slot2.cbFullID
	slot0.model.cbMaryGames = slot2.cbMaryGames
	slot0.model.cbLines = TableUtil.copyDataDep(slot2.cbLines)

	slot0:betDoGunAction()

	if not slot0.model.bAuto then
		slot0.Panel_Gun.btn_Stop:setEnabled(true)
	end

	slot0:betBackDoZhuan()
end

ShzBattleCcsView.OnSubGameGetScore = function (slot0, slot1)
	if not ffiMgr:isSizeEqual(slot1, "SHZ_CMD_S_GetScore") then
		slot0:setAutoModel(false)

		return
	end

	slot0.Panel_Gun.btn_Stop:setVisible(false)
	slot0.Panel_Gun.btn_Start:setVisible(true)
	slot0.Panel_Gun.btn_Auto:setCanTouch(true)
	slot0:resetLineIconNum()
	slot0.Panel_GetOrDice:setVisible(false)

	slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "SHZ_CMD_S_GetScore")

	slot0.scoreInfo:setStrTxt(HtmlUtil.createArtNumDot(Hero:getUserScore(), "#shzNum_score_%s.png"))

	if slot0.model.bAuto then
		slot0.Panel_Gun.btn_Start:setEnabled(false)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)

		if slot0.betAgainTimer then
			slot0.betAgainTimer:stop()
			slot0.betAgainTimer:destroy()

			slot0.betAgainTimer = nil
		end

		slot4 = slot0
		slot0.betAgainTimer = tickMgr:delayedCall(function ()
			slot0:goToGunGame()
			slot0.goToGunGame:doGameBet()
		end, 500)

		return
	end

	slot0.Panel_Gun.btn_Start:setEnabled(true)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
	slot0:goToGunGame()
end

ShzBattleCcsView.OnSubDiceGame = function (slot0, slot1)
	if not ffiMgr:isSizeEqual(slot1, "SHZ_CMD_S_BigSmall") then
		return
	end

	slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "SHZ_CMD_S_BigSmall")
	slot0.model.cbBigSmall = TableUtil.copyDataDep(slot2.cbBigSmall)
	slot0.model.lWinScore = slot2.lWinScore
	slot0.model.lDiceOneWinScore = slot2.lScore

	slot0.Panel_Dice.root:diceBackDoOpenAniByData()
end

ShzBattleCcsView.OnSubGameMary = function (slot0, slot1)
	if not ffiMgr:isSizeEqual(slot1, "SHZ_CMD_S_Mary") then
		return
	end

	slot2 = ffiMgr:castStruct2TableByLuaStr(slot1, "SHZ_CMD_S_Mary")
	slot0.model.cbInternalArray = TableUtil.copyDataDep(slot2.cbInternalArray)
	slot0.model.cbExternalData = slot2.cbExternalData
	slot0.model.lMaryOneWinScore = slot2.lMaryScore
	slot0.model.lWinScore = slot2.lWinScore
	slot0.model.cbMaryGames = slot2.cbMaryGames

	slot0:goToMaryGame()
	slot0.Panel_Mary.root:doGameRun()
end

ShzBattleCcsView.onGameEvent = function (slot0, slot1, slot2, slot3)
	if slot1 == SHZ_GAME_EVENT then
		if slot3 == SHZ_SUB_S_BET then
			slot0:OnSubGameBet(slot2)
		elseif slot3 == SHZ_SUB_S_GET_SCORE then
			slot0:OnSubGameGetScore(slot2)
		elseif slot3 == SHZ_SUB_S_BIG_SMALL then
			slot0:OnSubDiceGame(slot2)
		elseif slot3 == SHZ_SUB_S_MARY then
			slot0:OnSubGameMary(slot2)
		end
	elseif slot1 == SHZ_GAME_SCENE_EVENT and ffiMgr:isSizeEqual(slot2, "SHZ_CMD_S_Status") then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		slot0.btn_AutoCount:setVisible(false)
		reset_machine(slot0.machine)

		slot4 = ffiMgr:castStruct2TableByLuaStr(slot2, "SHZ_CMD_S_Status")
		slot0.model.lWinScore = slot4.lWinScore
		slot0.model.lJettonScore = slot4.lJettonScore

		for slot8, slot9 in ipairs(slot4.lBetScore) do
			SHZ_YASCORETABLE[slot8] = slot9
		end

		slot0.yaScoreIndex = #SHZ_YASCORETABLE

		for slot8, slot9 in ipairs(SHZ_YASCORETABLE) do
			if slot9 == slot0.model.lJettonScore and slot9 ~= 0 and slot9 then
				slot0.yaScoreIndex = slot8
			end
		end

		slot0:updateYaScore()

		slot0.model.cbCardArray = {}
		slot0.model.cbFullID = slot4.cbFullID
		slot0.model.cbMaryGames = slot4.cbMaryGames
		slot0.model.cbLines = TableUtil.copyDataDep(slot4.cbLines)
		slot0.model.cbBigSmallRecord = {}

		for slot8, slot9 in ipairs(slot4.cbBigSmallRecord) do
			if slot9 and slot9 > 0 then
				table.insert(slot0.model.cbBigSmallRecord, slot9)
			end
		end

		slot0:InGameShowAllIconByData()

		if slot0.model.cbMaryGames > 0 then
			slot0.model.cbExternalData = slot4.cbExternalData
			slot0.model.lMaryOneWinScore = slot4.lMaryScore
			slot0.model.cbInternalArray = TableUtil.copyDataDep(slot4.cbInternalArray)

			slot0:goToMaryGame()
			slot0.Panel_Mary.root:showEndAndReqdSHZMary()
			slot0:setAutoModel(false)
		end
	end
end

ShzBattleCcsView.onLongPressCall = function (slot0, slot1, slot2)
	slot0.btn_AutoCount:setVisible(true)
end

ShzBattleCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == nil or slot1:isEnabled() == false or slot1:getCanTouch() == false then
		return
	end

	if slot1 == slot0.btnMenu then
		slot0.controller:onMenuBtnClick()
	elseif slot1 == slot0.Panel_Gun.btn_Start then
		slot0:doGameBet()
	elseif slot1 == slot0.Panel_Gun.btn_Stop then
		slot0.Panel_Gun.btn_Stop:setEnabled(false)
		slot0:stopAllActToShowResult()
	elseif slot1 == slot0.Panel_Gun.btn_Auto then
		if not slot0.model.bAuto then
			slot0:setAutoModel(true)
			slot0:doGameBet()
			slot0:setAutoCount(nil)
		end
	elseif slot1 == slot0.Panel_Gun.btn_SelfDo then
		if slot0.model.bAuto then
			slot0:setAutoModel(false)
			slot0.Panel_Gun.btn_Auto:setCanTouch(false)
		end
	elseif slot1 == slot0.Panel_Gun.btn_Add then
		slot0.yaScoreIndex = (slot0.yaScoreIndex >= 5 and 1) or slot0.yaScoreIndex + 1

		slot0:updateYaScore()
	elseif slot1 == slot0.Panel_Gun.btn_jian then
		slot0.yaScoreIndex = (slot0.yaScoreIndex <= 1 and 5) or slot0.yaScoreIndex - 1

		slot0:updateYaScore()
	elseif slot1 == slot0.Panel_GetOrDice.Node_btnLay.btn_GetScore then
		if slot0.autoRedoTimer ~= nil then
			slot0.autoRedoTimer:stop()
			slot0.autoRedoTimer:destroy()

			slot0.autoRedoTimer = nil
		end

		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0:doGameGetScoreAction()
	elseif slot1 == slot0.Panel_GetOrDice.Node_btnLay.btn_GoToBigSmall then
		if slot0.autoRedoTimer ~= nil then
			slot0.autoRedoTimer:stop()
			slot0.autoRedoTimer:destroy()

			slot0.autoRedoTimer = nil
		end

		if slot0.addScoreActionTimer then
			slot0.addScoreActionTimer:stop()
			slot0.addScoreActionTimer:destroy()

			slot0.addScoreActionTimer = nil
		end

		if slot0.addEndWaitFlyTimer then
			slot0.addEndWaitFlyTimer:stop()
			slot0.addEndWaitFlyTimer:destroy()

			slot0.addEndWaitFlyTimer = nil
		end

		slot0:setAutoModel(false)
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)
		slot0:goToDiceGame()
	elseif slot1 == slot0.btn_AutoCount then
		slot0.btn_AutoCount:setVisible(false)
	elseif slot1 == slot0.btn_AutoCount.btn_25 then
		slot0:onBtnSetAutoCount(25)
	elseif slot1 == slot0.btn_AutoCount.btn_50 then
		slot0:onBtnSetAutoCount(50)
	elseif slot1 == slot0.btn_AutoCount.btn_100 then
		slot0:onBtnSetAutoCount(100)
	elseif slot1 == slot0.btn_packet then
		slot0.controller:onRedPacketBtnClick()
	end

	slot0.Panel_Mary.root:onBtnClick(slot1, slot2)
	slot0.Panel_Dice.root:onBtnClick(slot1, slot2)
end

ShzBattleCcsView.onBtnSetAutoCount = function (slot0, slot1)
	slot0:setAutoCount(slot1)
	slot0.btn_AutoCount:setVisible(false)

	if not slot0.model.bAuto then
		slot0:setAutoModel(true)
		slot0:doGameBet()
	end
end

ShzBattleCcsView.setAutoCount = function (slot0, slot1)
	slot0.doAutoCount = slot1
	slot2 = ""

	if slot0.doAutoCount then
		slot0.Panel_Gun.btn_SelfDo.leftCount_tf:setHtmlText(HtmlUtil.createArtNum(slot0.doAutoCount, "#shzAutoCountLeft_%d.png"))
	else
		slot0.Panel_Gun.btn_SelfDo.leftCount_tf:setHtmlText(HtmlUtil.createImg(slot0.controller:getUIPath("common/shzTxtSelfDo.png"), nil, 39, nil, 0))
	end
end

ShzBattleCcsView.betDoGunAction = function (slot0)
	if slot0.doAutoCount and slot0.doAutoCount > 0 then
		slot0:setAutoCount(slot0.doAutoCount - 1)
	end

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		slot5:tweenToStartRoll()
	end
end

ShzBattleCcsView.doGameBet = function (slot0)
	slot0.model.bPlayingGame = true

	if Hero:getUserScore() < 9 * SHZ_YASCORETABLE[slot0.yaScoreIndex] then
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)
		slot0.Panel_Gun.btn_Stop:setEnabled(true)
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		slot0:setAutoModel(false)

		slot0.model.bPlayingGame = false

		slot0.controller:gotoBankOrCharge("您的欢乐豆不足，无法进行本次下注。", true, true)

		return
	end

	reset_machine(slot0.machine)
	slot0.controller:playGameEffect(SHZ_SOUND_BTN_START)
	slot0.scoreInfo:setStrTxt(slot1)
	slot0.Panel_Gun.btn_Add:setEnabled(false)
	slot0.Panel_Gun.btn_jian:setEnabled(false)

	if slot0.model.bAuto then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(false)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	else
		slot0.Panel_Gun.btn_Stop:setEnabled(false)
		slot0.Panel_Gun.btn_Stop:setVisible(true)
		slot0.Panel_Gun.btn_Start:setVisible(false)
		slot0.Panel_Gun.btn_Start:setEnabled(false)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	end

	slot0.Panel_Gun.btn_Auto:setCanTouch(false)
	reqSHZBet(SHZ_YASCORETABLE[slot0.yaScoreIndex])
end

ShzBattleCcsView.betBackDoZhuan = function (slot0)
	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		for slot9 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
			slot5._iconDatas[slot9] = slot0.model.cbCardArray[slot4 + (slot9 - 1) * SHZ_MAX_SHU_COUNT] or 0
		end
	end

	for slot4, slot5 in pairs(slot0.lineZhuanTimeTab) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	slot1 = slot0
	slot2 = 0
	slot3 = 0

	for slot7 = 1, 5, 1 do
		table.insert(slot0.lineZhuanTimeTab, tickMgr:delayedCall(slot8, slot2 + 100 + 500))

		slot3 = slot3 + 1
	end

	table.insert(slot0.lineZhuanTimeTab, tickMgr:delayedCall(slot4, slot2 + 1200))
end

ShzBattleCcsView.zhuanEndShowFullScreen = function (slot0)
	for slot4, slot5 in pairs(slot0.waiterShanTimeTable) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	slot1 = slot0

	table.insert(slot0.waiterShanTimeTable, tickMgr:delayedCall(slot2, 500))
end

ShzBattleCcsView.zhuanEndShowLine = function (slot0)
	slot1 = TableUtil.copyDataDep(slot0.model.cbLines)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.waiterShanTimeTable) do
		if slot7 ~= nil then
			slot7:stop()
			slot7:destroy()

			slot7 = nil
		end
	end

	for slot6 = 1, SHZ_MAX_LINE_COUNT, 1 do
		if slot1[slot6][1] > 0 or slot1[slot6][5] > 0 then
			slot7 = slot0

			table.insert(slot0.waiterShanTimeTable, tickMgr:delayedCall(slot8, (slot2 + 1) * 500))
		end
	end

	slot3 = slot0

	table.insert(slot0.waiterShanTimeTable, tickMgr:delayedCall(slot4, (slot2 + 1) * 500))
end

ShzBattleCcsView.toSetOddStr = function (slot0)
	slot1 = TableUtil.copyDataDep(slot0.model.cbLines)
	slot2 = ""

	for slot6 = 1, SHZ_MAX_LINE_COUNT, 1 do
		if slot1[slot6][1] > 0 or slot7[5] > 0 then
			slot8 = 0
			slot9 = 0

			if slot7[1] > 0 then
				for slot13 = 1, 5, 1 do
					if slot7[slot13] > 0 then
						slot15 = slot0.model.cbCardArray[slot7[slot13]]

						if slot8 ~= 0 and slot15 ~= 9 and slot8 ~= slot15 then
							break
						end

						slot9 = slot9 + 1

						if slot8 == 0 and slot15 ~= 9 then
							slot8 = slot0.model.cbCardArray[slot14]
						end
					end
				end

				slot2 = slot2 .. HtmlUtil.createImg(slot11, nil, 53, nil, 0) .. HtmlUtil.createArtNumSign(slot0.oddsConfig[slot8][slot9 - 2], "#plist_font_shzOdd_%s.png", nil, 25, nil, 10) .. HtmlUtil.createSpacer(20, 0)
			end

			if slot7[5] > 0 and slot9 < 5 then
				slot10 = 0
				slot11 = 0

				for slot15 = 5, 1, -1 do
					if slot7[slot15] > 0 then
						slot17 = slot0.model.cbCardArray[slot7[slot15]]

						if slot10 ~= 0 and slot17 ~= 9 and slot10 ~= slot17 then
							break
						end

						slot11 = slot11 + 1

						if slot10 == 0 and slot17 ~= 9 then
							slot10 = slot0.model.cbCardArray[slot16]
						end
					end
				end

				slot2 = slot2 .. HtmlUtil.createImg(slot13, nil, 53, nil, 0) .. HtmlUtil.createArtNumSign(slot0.oddsConfig[slot10][slot11 - 2], "#plist_font_shzOdd_%s.png", nil, 25, nil, 10) .. HtmlUtil.createSpacer(20, 0)
			end
		end
	end

	if slot2 ~= "" and slot2 then
		slot0.Panel_GetOrDice.Node_Result.odd_tf:setHtmlText(slot2)
	end
end

ShzBattleCcsView.ShowOneLineByTime = function (slot0)
	if slot0.ShowOneLineTimer ~= nil then
		slot0.ShowOneLineTimer:stop()
		slot0.ShowOneLineTimer:destroy()

		slot0.ShowOneLineTimer = nil
	end

	slot1 = slot0
	slot0.ShowOneLineTimer = tickMgr:delayedCall(function ()
		slot0:showOneLineByTimeLoop()
	end, 30, -1)
end

ShzBattleCcsView.showOneLineByTimeLoop = function (slot0)
	if not slot0.ShowOneLineTimer then
		return
	end

	slot0.controller:playGameEffect(SHZ_SOUND_ONE_LINE)

	if slot0.Panel_Gun.Node_lines:getContentSize().width <= 1170 then
		slot0.Panel_Gun.Node_lines:setContentSize(cc.size(slot1 + 180, 480))
	else
		slot0.Panel_Gun.Node_lines:setContentSize(cc.size(1170, 480))

		if slot0.ShowOneLineTimer ~= nil then
			slot0.ShowOneLineTimer:stop()
			slot0.ShowOneLineTimer:destroy()

			slot0.ShowOneLineTimer = nil
		end
	end
end

ShzBattleCcsView.showLotteryLineOneByOne = function (slot0, slot1, slot2)
	for slot6 = 1, SHZ_MAX_LINE_COUNT, 1 do
		slot0.Panel_Gun.Node_lines["line_" .. tostring(slot6)]:setVisible(slot1 == slot6)
		slot0.Panel_Gun.Node_linesNum["Node_line" .. tostring(slot6)]:setVisible(slot1 == slot6)
	end

	slot0.Panel_Gun.Node_lines:setContentSize(cc.size(0, 480))
	slot0:ShowOneLineByTime()

	for slot6, slot7 in ipairs(slot0.SHZGame_AllShus) do
		for slot11 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
			if TableUtil.IsInTable((slot11 - 1) * SHZ_MAX_SHU_COUNT + slot6, slot2) then
				slot7:doGrayOrNoByIndex(slot11, false)
			else
				slot7:doGrayOrNoByIndex(slot11, true)
			end
		end
	end
end

ShzBattleCcsView.allLotteryItemsDoSpine = function (slot0)
	slot0.controller:playGameEffect(SHZ_SOUND_ALL_LINE)

	if slot0.packetReceived then
		slot0.packetReceived = false

		slot0.btn_packet.packet.root:playReceiveAnimation(cc.p(cc.Director:getInstance():getVisibleSize().width / 2, cc.Director.getInstance().getVisibleSize().height / 2 + 20), slot0.model:getSelfRedPacketData().lCount)
	end

	slot1 = false

	reset_machine(slot0.machine)

	if slot0.model.lWinScore > 0 or slot0.model.cbFullID > 0 or slot0.model.cbMaryGames > 0 then
		slot2 = {}

		for slot6, slot7 in ipairs(slot0.model.cbLines) do
			slot8 = false

			for slot12, slot13 in ipairs(slot7) do
				if slot13 > 0 then
					slot1 = true
					slot8 = true

					for slot17, slot18 in ipairs(slot0.SHZGame_AllShus) do
						for slot22 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
							if slot13 == (slot22 - 1) * SHZ_MAX_SHU_COUNT + slot17 then
								slot18:doSpineByIndex(slot22)

								if not slot2[slot18._iconDatas[slot22]] then
									slot0.controller:playGameEffect("effect/sound_water_spine" .. slot23 .. ".mp3")

									slot2[slot23] = true
								end
							end
						end
					end

					slot0.machine[slot13 - 1].LIT_UP = true
				end
			end

			if slot0.model.cbFullID <= 0 then
				slot0.Panel_Gun.Node_lines["line_" .. tostring(slot6)]:setVisible(slot8)
				slot0.Panel_Gun.Node_linesNum["Node_line" .. tostring(slot6)]:setVisible(slot8)
			end
		end
	end

	if slot1 then
		draw_outline(get_outline(slot0.machine), slot0.Panel_Gun.Node_OutLineEff)
	end

	return slot1
end

ShzBattleCcsView.showAllLotteryItems = function (slot0)
	slot0.Panel_Gun.btn_Start:setEnabled(false)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	slot0.Panel_Gun.btn_Stop:setEnabled(false)

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		slot5:doAllGrayOrNo(true)
	end

	if slot0:allLotteryItemsDoSpine() then
		slot0.Panel_Gun.Node_lines:setContentSize(cc.size(1170, 480))

		if slot0.spineEndShowLineTimer then
			slot0.spineEndShowLineTimer:stop()
			slot0.spineEndShowLineTimer:destroy()

			slot0.spineEndShowLineTimer = nil
		end

		slot2 = slot0
		slot0.spineEndShowLineTimer = tickMgr:delayedCall(function ()
			slot0:spineEndShowLotteryLine()
		end, 2834)

		return
	end

	slot0:spineEndShowLotteryLine()
end

ShzBattleCcsView.spineEndShowLotteryLine = function (slot0)
	if slot0.model.lWinScore <= 0 and slot0.model.cbMaryGames <= 0 then
		slot0.model.bPlayingGame = false
	end

	slot0.Panel_GetOrDice.Node_getScoreSpine:setVisible(false)
	slot0.Panel_GetOrDice.Panel_Black:setVisible(true)
	slot0.Panel_GetOrDice.Node_Result:setVisible(false)
	slot0.Panel_GetOrDice:setVisible(slot0.model.lWinScore > 0 and slot0.model.cbMaryGames <= 0)

	if slot0.model.lWinScore > 0 and slot0.model.cbMaryGames <= 0 then
		if slot0.model.cbFullID <= 0 then
			slot0:toSetOddStr()
			slot0.Panel_GetOrDice.Node_Result:setVisible(true)
		end

		slot0:doAddBigScoreAction(false)
	end

	slot2 = 2000

	if slot0.model.cbMaryGames > 0 then
		if not slot0.longEffspine then
			slot0.longEffspine = slot0.controller:createSpineWithEvent("xmllong_long", nil, true, false)

			if slot0.longEffspine then
				slot0.longEffspine:setPosition(667, 375)
				slot0.Panel_MaryLongEff:addChild(slot0.longEffspine)
			end
		end

		if slot0.longEffspine then
			slot0.longEffspine:setAnimation(0, "animation", false)
		end

		if not slot0._maryEffspine then
			slot0._maryEffspine = slot0.controller:createSpineWithEvent("xmllong_effect", nil, true, false)

			if slot0._maryEffspine then
				slot0._maryEffspine:setPosition(667, 375)
				slot0.Panel_MaryLongEff:addChild(slot0._maryEffspine)
			end
		end

		if slot0._maryEffspine then
			slot0._maryEffspine:setAnimation(0, "animation", false)
		end

		slot2 = 3833.3333333333335
	end

	slot0.Panel_MaryLongEff:setVisible(slot0.model.cbMaryGames > 0)

	if slot0.model.bAuto then
		slot0.Panel_Gun.btn_Auto:setCanTouch(slot0.model.lWinScore <= 0 or slot0.model.cbMaryGames > 0)
	elseif slot0.model.cbMaryGames <= 0 and slot0.model.lWinScore <= 0 then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		slot0.Panel_Gun.btn_Auto:setCanTouch(true)
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)
	end

	if slot0.model.bAuto or slot0.model.cbMaryGames > 0 then
		if slot0.doAutoCount and slot0.doAutoCount <= 0 then
			slot0:setAutoCount(nil)
			slot0:setAutoModel(false)
		end

		if slot0.autoRedoTimer ~= nil then
			slot0.autoRedoTimer:stop()
			slot0.autoRedoTimer:destroy()

			slot0.autoRedoTimer = nil
		end

		slot0.autoRedoTimer = tickMgr:delayedCall(function ()
			slot0.Panel_MaryLongEff:setVisible(false)

			if slot0.Panel_MaryLongEff.setVisible.model.cbMaryGames > 0 then
				slot0.Panel_MaryLongEff:setVisible(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop:setVisible(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start:setVisible(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine.setVisible:setAutoModel(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine.setVisible.setAutoModel:goToMaryGame()

				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine.setVisible.setAutoModel.goToMaryGame.model.cbExternalData = 0
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine.setVisible.setAutoModel.goToMaryGame.model.model.lMaryOneWinScore = 0

				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine.setVisible.setAutoModel.goToMaryGame.model.model.Panel_Mary.root:showEndAndReqdSHZMary()
			elseif slot0.model.lWinScore <= 0 then
				if slot0.model.bAuto then
					slot0:doGameBet()
				else
					slot0.Panel_Gun.btn_Add:setEnabled(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian:setEnabled(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto:setCanTouch(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto.setCanTouch.Panel_Gun.btn_Stop:setEnabled(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto.setCanTouch.Panel_Gun.btn_Stop.setEnabled.Panel_Gun.btn_Stop:setVisible(false)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto.setCanTouch.Panel_Gun.btn_Stop.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start:setVisible(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto.setCanTouch.Panel_Gun.btn_Stop.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start:setEnabled(true)
					slot0.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Auto.setCanTouch.Panel_Gun.btn_Stop.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
				end
			end

			slot0.Panel_Gun.btn_Start:setEnabled(true)
			slot0.Panel_Gun.btn_Start.setEnabled.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		end, slot2)
	end
end

ShzBattleCcsView.poupGetOrDiceDoGetAction = function (slot0, slot1)
	if slot0.model.lWinScore <= 0 then
		if slot0.waiterTime then
			slot0.waiterTime:stop()
			slot0.waiterTime:destroy()

			slot0.waiterTime = nil
		end

		slot2 = slot0

		slot0.Panel_GetOrDice.Node_btnLay:setVisible(false)

		slot0.waiterTime = tickMgr:delayedCall(function ()
			slot0.Panel_Gun.btn_Stop:setVisible(false)
			slot0.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start:setVisible(true)
			slot0.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Add:setEnabled(true)
			slot0.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian:setEnabled(true)
			slot0.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled:goToGunGame()
		end, 3000)

		return
	end

	slot0:goToGunGame()
	slot0.Panel_GetOrDice.Node_Result:setVisible(false)
	slot0.Panel_GetOrDice:setVisible(true)
	slot0.Panel_Gun.btn_Stop:setEnabled(false)
	slot0.Panel_Gun.btn_Start:setEnabled(false)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	slot0.Panel_Gun.btn_Auto:setCanTouch(false)
	slot0.Panel_Gun.btn_Add:setEnabled(false)
	slot0.Panel_Gun.btn_jian:setEnabled(false)
	slot0:doAddBigScoreAction(slot1)

	if slot1 then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
	end
end

ShzBattleCcsView.resetLineIconNum = function (slot0)
	for slot4 = 1, SHZ_MAX_LINE_COUNT, 1 do
		slot0.Panel_Gun.Node_lines["line_" .. tostring(slot4)]:setVisible(false)
		slot0.Panel_Gun.Node_linesNum["Node_line" .. tostring(slot4)]:setVisible(false)
	end
end

ShzBattleCcsView.resetAllTimer = function (slot0)
	slot0.Panel_Mary.root:resetAllTimer()
	slot0.Panel_Dice.root:resetAllTimer()

	for slot4, slot5 in pairs(slot0.lineZhuanTimeTab) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	for slot4, slot5 in pairs(slot0.waiterShanTimeTable) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	if slot0.ShowOneLineTimer ~= nil then
		slot0.ShowOneLineTimer:stop()
		slot0.ShowOneLineTimer:destroy()

		slot0.ShowOneLineTimer = nil
	end

	if slot0.spineEndShowLineTimer then
		slot0.spineEndShowLineTimer:stop()

		slot0.spineEndShowLineTimer = nil
	end

	if slot0.addScoreActionTimer then
		slot0.addScoreActionTimer:stop()
		slot0.addScoreActionTimer:destroy()

		slot0.addScoreActionTimer = nil
	end

	if slot0.addEndWaitFlyTimer then
		slot0.addEndWaitFlyTimer:stop()
		slot0.addEndWaitFlyTimer:destroy()

		slot0.addEndWaitFlyTimer = nil
	end

	if slot0.waiterTime then
		slot0.waiterTime:stop()
		slot0.waiterTime:destroy()

		slot0.waiterTime = nil
	end

	if slot0.maryLongEffTimer then
		slot0.maryLongEffTimer:stop()
		slot0.maryLongEffTimer:destroy()

		slot0.maryLongEffTimer = nil
	end

	if slot0.betAgainTimer then
		slot0.betAgainTimer:stop()
		slot0.betAgainTimer:destroy()

		slot0.betAgainTimer = nil
	end

	if slot0.toShowGetOrDicTimer ~= nil then
		slot0.toShowGetOrDicTimer:stop()
		slot0.toShowGetOrDicTimer:destroy()

		slot0.toShowGetOrDicTimer = nil
	end

	if slot0.autoRedoTimer ~= nil then
		slot0.autoRedoTimer:stop()
		slot0.autoRedoTimer:destroy()

		slot0.autoRedoTimer = nil
	end
end

ShzBattleCcsView.onHide = function (slot0)
	slot0:resetFlyNumNode()

	slot0.model.bPlayingGame = false

	slot0:resetAllTimer()
	Hero.userScoreChangedSignal:remove(slot0.onUpdateMyScore, slot0)
	slot0.model.gameEventChangedSignal:remove(slot0.onGameEvent, slot0)
	slot0.Panel_Gun.btn_SelfDo:getLongClickSignal():remove(slot0.onLongPressCall, slot0)
	slot0.model.selfRedPacketDataChangedSignal:remove(slot0.onPacketReceived, slot0)

	slot0.packetReceived = false
	slot0.bIsActivitingRedPacket = false
end

ShzBattleCcsView.onPacketReceived = function (slot0, slot1)
	slot0.bIsActivitingRedPacket = slot1.cbIsActiviting > 0

	slot0.btn_packet:setVisible(slot1.cbIsActiviting > 0)
	slot0.btn_packet:setLocalZOrder(99999)

	if slot1 and slot1.isReconnect and slot0.btn_packet then
		slot0.btn_packet.packet.root:setStorage(slot1.lCount)
	end

	if slot1 and not slot1.isReconnect and slot0.btn_packet then
		slot0.packetReceived = true
	end
end

ShzBattleCcsView.destroy = function (slot0)
	slot0.model.bPlayingGame = false

	slot0:resetAllTimer()
	spPoolMgr:put(slot0.startBtnEffspine)
	spPoolMgr:put(slot0.longEffspine)
	spPoolMgr:put(slot0._maryEffspine)
	spPoolMgr:put(slot0.getScoreEffspine)
	slot0.Panel_Gun.btn_Start:destroy()
	slot0.Panel_Gun.btn_Stop:destroy()
	slot0.Panel_Gun.btn_Auto:destroy()
	slot0.Panel_Gun.btn_SelfDo:destroy()
	slot0.Panel_Gun.btn_AutoCount.btn_25:destroy()
	slot0.Panel_Gun.btn_AutoCount.btn_50:destroy()
	slot0.Panel_Gun.btn_AutoCount.btn_100:destroy()
	slot0.Panel_Gun.btn_AutoCount:destroy()
	slot0.Panel_Gun.btn_Add:destroy()
	slot0.Panel_Gun.btn_jian:destroy()
	slot0.Panel_GetOrDice.Node_btnLay.btn_GetScore:destroy()
	slot0.Panel_GetOrDice.Node_btnLay:destroy()
	slot0.Panel_Gun.yaxiangNum_tf:destroy()
	slot0.Panel_Gun.yaFenNum_tf:destroy()
	slot0.Panel_Gun.zongYaFenNum_tf:destroy()
	slot0.Panel_Gun.btn_SelfDo.leftCount_tf:destroy()
	slot0.Panel_Mary.root:destroy()
	slot0.Panel_Dice.root:destroy()
end

ShzBattleCcsView.stopAllActToShowResult = function (slot0)
	slot0.Panel_Gun.btn_Start:setEnabled(false)
	slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
	slot0.Panel_Gun.btn_Stop:setEnabled(false)

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		for slot9 = 1, SHZ_MAX_SHU_ITEM_COUNT, 1 do
			slot5._iconDatas[slot9] = slot0.model.cbCardArray[slot4 + (slot9 - 1) * SHZ_MAX_SHU_COUNT] or 0
		end
	end

	for slot4, slot5 in pairs(slot0.lineZhuanTimeTab) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	if slot0.ShowOneLineTimer ~= nil then
		slot0.ShowOneLineTimer:stop()
		slot0.ShowOneLineTimer:destroy()

		slot0.ShowOneLineTimer = nil
	end

	for slot4, slot5 in pairs(slot0.waiterShanTimeTable) do
		if slot5 ~= nil then
			slot5:stop()
			slot5:destroy()

			slot5 = nil
		end
	end

	for slot4, slot5 in ipairs(slot0.SHZGame_AllShus) do
		slot5:stopRollQuick()
		slot5:doAllGrayOrNo(true)
	end

	if slot0.spineEndShowLineTimer then
		slot0.spineEndShowLineTimer:stop()
		slot0.spineEndShowLineTimer:destroy()

		slot0.spineEndShowLineTimer = nil
	end

	if slot0.autoRedoTimer ~= nil then
		slot0.autoRedoTimer:stop()
		slot0.autoRedoTimer:destroy()

		slot0.autoRedoTimer = nil
	end

	if slot0:allLotteryItemsDoSpine() then
		slot0.Panel_Gun.Node_lines:setContentSize(cc.size(1170, 480))
	else
		slot0.Panel_Gun.Node_lines:setContentSize(cc.size(0, 480))
	end

	if slot0.toShowGetOrDicTimer ~= nil then
		slot0.toShowGetOrDicTimer:stop()
		slot0.toShowGetOrDicTimer:destroy()

		slot0.toShowGetOrDicTimer = nil
	end

	slot2 = slot0

	function slot3()
		slot0:toShowGetOrDic()
	end

	slot4 = 1000

	if slot0.model.bAuto and slot0.model.lWinScore > 0 then
		slot4 = 2000
	end

	slot0.toShowGetOrDicTimer = tickMgr:delayedCall(slot3, slot4)
end

ShzBattleCcsView.toShowGetOrDic = function (slot0)
	if slot0.model.lWinScore <= 0 and slot0.model.cbMaryGames <= 0 then
		slot0.model.bPlayingGame = false
	end

	if slot0.toShowGetOrDicTimer ~= nil then
		slot0.toShowGetOrDicTimer:stop()
		slot0.toShowGetOrDicTimer:destroy()

		slot0.toShowGetOrDicTimer = nil
	end

	slot0.Panel_GetOrDice.Node_Result:setVisible(false)
	slot0.Panel_GetOrDice.Panel_Black:setVisible(true)
	slot0.Panel_GetOrDice:setVisible(slot0.model.lWinScore > 0 and slot0.model.cbMaryGames <= 0)

	if slot0.model.lWinScore > 0 and slot0.model.cbMaryGames <= 0 then
		slot0.Panel_GetOrDice.Node_getScoreSpine:setVisible(false)
		slot0.Panel_GetOrDice.Panel_Black:setVisible(true)
		slot0.Panel_GetOrDice:setVisible(true)

		if slot0.model.cbFullID <= 0 then
			slot0:toSetOddStr()
			slot0.Panel_GetOrDice.Node_Result:setVisible(true)
		end

		slot0.Panel_Gun.btn_Stop:setEnabled(false)
		slot0.Panel_Gun.btn_Start:setEnabled(false)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(false)
		slot0.Panel_Gun.btn_Auto:setCanTouch(false)
		slot0.Panel_Gun.btn_Add:setEnabled(false)
		slot0.Panel_Gun.btn_jian:setEnabled(false)
		slot0.Panel_GetOrDice.Node_btnLay:setVisible(not bAutoGet)
		slot0.Panel_GetOrDice.sprBigScore:setVisible(true)
		slot0:doAddBigScoreAction(false)

		if slot0.model.bAuto and slot0.doAutoCount and slot0.doAutoCount <= 0 then
			slot0:setAutoCount(nil)
			slot0:setAutoModel(false)
		end

		return
	end

	if slot0.model.cbMaryGames > 0 then
		if not slot0.longEffspine then
			slot0.longEffspine = slot0.controller:createSpineWithEvent("xmllong_long", nil, true, false)

			if slot0.longEffspine then
				slot0.longEffspine:setPosition(667, 375)
				slot0.Panel_MaryLongEff:addChild(slot0.longEffspine)
			end
		end

		if slot0.longEffspine then
			slot0.longEffspine:setAnimation(0, "animation", false)
		end

		if not slot0._maryEffspine then
			slot0._maryEffspine = slot0.controller:createSpineWithEvent("xmllong_effect", nil, true, false)

			if slot0._maryEffspine then
				slot0._maryEffspine:setPosition(667, 375)
				slot0.Panel_MaryLongEff:addChild(slot0._maryEffspine)
			end
		end

		if slot0._maryEffspine then
			slot0._maryEffspine:setAnimation(0, "animation", false)
		end
	end

	slot0.Panel_MaryLongEff:setVisible(slot0.model.cbMaryGames > 0)

	if slot0.model.bAuto then
		slot0.Panel_Gun.btn_Auto:setCanTouch(slot0.model.lWinScore <= 0 or slot0.model.cbMaryGames > 0)
	elseif slot0.model.cbMaryGames <= 0 and slot0.model.lWinScore <= 0 then
		slot0.Panel_Gun.btn_Stop:setVisible(false)
		slot0.Panel_Gun.btn_Start:setVisible(true)
		slot0.Panel_Gun.btn_Start:setEnabled(true)
		slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		slot0.Panel_Gun.btn_Auto:setCanTouch(true)
		slot0.Panel_Gun.btn_Add:setEnabled(true)
		slot0.Panel_Gun.btn_jian:setEnabled(true)
	end

	if slot0.model.bAuto or slot0.model.cbMaryGames > 0 then
		if slot0.doAutoCount and slot0.doAutoCount <= 0 then
			slot0:setAutoCount(nil)
			slot0:setAutoModel(false)
		end

		if slot0.model.cbMaryGames > 0 then
			if slot0.maryLongEffTimer then
				slot0.maryLongEffTimer:stop()
				slot0.maryLongEffTimer:destroy()

				slot0.maryLongEffTimer = nil
			end

			slot2 = slot0
			slot0.maryLongEffTimer = tickMgr:delayedCall(function ()
				slot0.Panel_MaryLongEff:setVisible(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop:setVisible(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start:setVisible(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start:setEnabled(true)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled:setAutoModel(false)
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.setAutoModel:goToMaryGame()

				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.setAutoModel.goToMaryGame.model.cbExternalData = 0
				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.setAutoModel.goToMaryGame.model.model.lMaryOneWinScore = 0

				slot0.Panel_MaryLongEff.setVisible.Panel_Gun.btn_Add.setEnabled.Panel_Gun.btn_jian.setEnabled.Panel_Gun.btn_Stop.setVisible.Panel_Gun.btn_Start.setVisible.Panel_Gun.btn_Start.setEnabled.setAutoModel.goToMaryGame.model.model.Panel_Mary.root:showEndAndReqdSHZMary()
			end, 3833.3333333333335)

			return
		end

		if slot0.model.bAuto then
			if slot0.model.lWinScore <= 0 then
				slot0:doGameBet()
			end
		else
			slot0.Panel_Gun.btn_Add:setEnabled(true)
			slot0.Panel_Gun.btn_jian:setEnabled(true)
			slot0.Panel_Gun.btn_Auto:setCanTouch(true)
			slot0.Panel_Gun.btn_Stop:setVisible(false)
			slot0.Panel_Gun.btn_Stop:setEnabled(true)
			slot0.Panel_Gun.btn_Start:setVisible(true)
			slot0.Panel_Gun.btn_Start:setEnabled(true)
			slot0.Panel_Gun.btn_Start.Node_lightSpine:setVisible(true)
		end
	end
end

return
