ShzDiceGameCcsView = class("ShzDiceGameCcsView")

ShzDiceGameCcsView.onCreationComplete = function (slot0)
	slot0.waiterTime = nil
	waiterReqTime = nil
	slot0._bStopRandomIdleAni = false

	slot0.controller:adjustSlimWidth(slot0.Node_Record, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.spBottomBgLeft, UIConfig.ALIGN_LEFT)
	slot0.controller:adjustSlimWidth(slot0.spBottomBgRight, UIConfig.ALIGN_RIGHT)
	slot0.controller:adjustSlimWidth(slot0.bgDeFen, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.allWinScore_tf, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.bgZongDeFen, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.lastYaScore_tf, UIConfig.ALIGN_LEFT, 80)
	slot0.controller:adjustSlimWidth(slot0.btnGetScore, UIConfig.ALIGN_RIGHT, -80)
	slot0:initDealerDiceSpine()
end

ShzDiceGameCcsView.setBattleView = function (slot0, slot1)
	slot0.battleView = slot1
end

ShzDiceGameCcsView.getAniRandomIndex = function (slot0)
	if math.random(1, 5) <= 1 then
		return 3
	else
		return math.random(1, 2)
	end
end

ShzDiceGameCcsView.initDealerDiceSpine = function (slot0)
	if slot0.spineDealer then
		return
	end

	slot0.spineDealer = slot0.controller:createSpineWithEvent("shz_shiqian", nil, false, true)

	slot0.Node_Dealer:setPositionY(0)
	slot0.Node_Dealer:addChild(slot0.spineDealer)
	slot0.spineDealer:registerSpineEventHandler(function (slot0)
		if slot0.eventData.name == "shz_shiqian_lose" or slot0.eventData.name == "shz_shiqian_win" then
			slot0:betBackUpdateViewByData()
			slot0.Node_EndShaizi:setVisible(true)
		elseif slot0.eventData.name == "shz_shiqian_gai" then
			slot0.Node_EndShaizi:setVisible(false)
		end
	end, sp.EventType.ANIMATION_EVENT)
end

ShzDiceGameCcsView.addTwoMenAni = function (slot0)
	if slot0.menSpine then
		return
	end

	slot0.menSpine = slot0.controller:createSpineWithEvent("shz_twomenani", nil, false, true)

	if slot0.menSpine then
		slot0.Node_TwoMenAni:addChild(slot0.menSpine)
	end
end

ShzDiceGameCcsView.showArrowAni = function (slot0, slot1)
	if slot1 and slot0.spineArrow == nil then
		slot0.spineArrow = slot0.controller:createSpineWithEvent("shz_bidaxiao", nil, false, true)

		slot0.Node_Arrow:addChild(slot0.spineArrow)
	end

	if slot0.Node_Arrow then
		slot0.Node_Arrow:setVisible(slot1)
	end
end

ShzDiceGameCcsView.setBetBtnCanClick = function (slot0, slot1)
	slot0.btnSmall:setEnabled(slot1)
	slot0.btnEqual:setEnabled(slot1)
	slot0.btnBig:setEnabled(slot1)
end

ShzDiceGameCcsView.setBetBtnYuanBaoShow = function (slot0, slot1)
	slot0.btnBig.yuanBaoSprZhong:setVisible(slot1)
	slot0.btnSmall.yuanBaoSprZhong:setVisible(slot1)
	slot0.btnEqual.yuanBaoSprZhong:setVisible(slot1)
	slot0.btnBig.yuanBaoSprYa:setVisible(slot1)
	slot0.btnSmall.yuanBaoSprYa:setVisible(slot1)
	slot0.btnEqual.yuanBaoSprYa:setVisible(slot1)
end

ShzDiceGameCcsView.playRandomIdleAni = function (slot0)
	slot1 = nil

	slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)
	slot0.spineDealer:registerSpineEventHandler(slot3, sp.EventType.ANIMATION_COMPLETE)
	slot0.spineDealer:setAnimation(0, "shz_shiqian_idle_" .. slot1, false)
end

ShzDiceGameCcsView.playYaoShaiziAct = function (slot0)
	slot0.controller:playGameEffect(SHZ_SOUND_COMPARE_ROCK)
	slot0.spineDealer:setAnimation(0, "shz_shiqian_yaosaizi", false)

	slot1 = slot0

	slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)
	slot0.spineDealer:registerSpineEventHandler(function (slot0)
		if slot0.animation == "shz_shiqian_yaosaizi" then
			slot0:playRandomIdleAni()

			slot1 = math.random(1, 5)

			slot1.controller:playGameEffect(string.format(SHZ_SOUND_COMPARE_WAIT_S, slot1))

			if slot1.idleTimer then
				slot1.idleTimer:stop()
				slot1.idleTimer:destroy()

				slot1.idleTimer = nil
			end

			slot2 = slot1
			slot1.idleTimer = tickMgr:delayedCall(function ()
				slot0.controller:playGameEffect(string.format(SHZ_SOUND_COMPARE_WAIT_S, math.random(1, 5)))
			end, 5000)

			slot1:showArrowAni(true)
			slot1:setBetBtnCanClick(true)
		end
	end, sp.EventType.ANIMATION_COMPLETE)
end

ShzDiceGameCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnSmall then
		slot0:onBtnClickDoBet(SHZ_GUESS_SMALL, slot1)
	elseif slot1 == slot0.btnEqual then
		slot0:onBtnClickDoBet(SHZ_GUESS_MID, slot1)
	elseif slot1 == slot0.btnBig then
		slot0:onBtnClickDoBet(SHZ_GUESS_BIG, slot1)
	elseif slot1 == slot0.btnGetScore then
		slot0:showArrowAni(false)
		slot0:setBetBtnCanClick(false)
		slot0.battleView:poupGetOrDiceDoGetAction(true)
	elseif slot1 == slot0.btnGoOn then
		slot0.btnGoOn:setEnabled(false)
		slot0.btnGetScore:setEnabled(false)
		slot0:setBetBtnYuanBaoShow(false)
		slot0.Panel_Result:setVisible(false)
		slot0:playGaiAct()
	end
end

ShzDiceGameCcsView.doGoOn = function (slot0)
	slot0.btnGoOn:setVisible(false)
	slot0.btnGoOn:setEnabled(false)
	slot0:setBetBtnYuanBaoShow(false)
	slot0.Panel_Result:setVisible(false)
	slot0:playGaiAct()
end

ShzDiceGameCcsView.playGaiAct = function (slot0)
	slot0.spineDealer:registerSpineEventHandler(slot1, sp.EventType.ANIMATION_COMPLETE)
	slot0.spineDealer:setAnimation(0, "shz_shiqian_gai", false)
end

ShzDiceGameCcsView.onBtnClickDoBet = function (slot0, slot1, slot2)
	slot0.btnGetScore:setEnabled(false)
	slot0.controller:playGameEffect(SHZ_SOUND_COMPARE_BTN)

	slot0.lastYaFen = slot0.model.lWinScore

	slot0.lastYaScore_tf:setHtmlText(slot3)
	slot0:showArrowAni(false)
	slot0:setBetBtnCanClick(false)
	slot2.yuanBaoSprYa:setVisible(true)

	if slot0.idleTimer then
		slot0.idleTimer:stop()
		slot0.idleTimer:destroy()

		slot0.idleTimer = nil
	end

	if slot0.waiterReqTime then
		slot0.waiterReqTime:stop()
		slot0.waiterReqTime:destroy()

		slot0.waiterReqTime = nil
	end

	slot4 = slot0
	slot0.waiterReqTime = tickMgr:delayedCall(function ()
		reqSHZDoBigSmall(reqSHZDoBigSmall)
	end, 1000)
end

ShzDiceGameCcsView.updateShaiziByData = function (slot0)
	if slot0.model.cbBigSmall[1] and slot0.model.cbBigSmall[2] then
		slot0.Node_EndShaizi.Node_shaiziBig.shaizi_1:setSpriteFrame(slot1)
		slot0.Node_EndShaizi.Node_shaiziBig.shaizi_2:setSpriteFrame(slot1)
		slot0.Node_EndShaizi.shaiziSmall_1:setSpriteFrame(slot1)
		slot0.Node_EndShaizi.shaiziSmall_2:setSpriteFrame(string.format("shzDiceSmall_%d_" .. slot2 .. ".png", slot0.model.cbBigSmall[2]))
	end
end

ShzDiceGameCcsView.updateRecordByData = function (slot0, slot1)
	slot2 = 0

	for slot6 = 1, 10, 1 do
		slot0.Node_Record["record_" .. slot6]:setVisible(slot0.model.cbBigSmallRecord[slot6] ~= nil and slot7 >= 2)

		if slot7 and slot7 >= 2 then
			slot8 = 0

			if slot7 > 7 then
				slot8 = 2
			elseif slot7 == 7 then
				slot8 = 1
			end

			slot0.Node_Record["record_" .. slot6]:setTexture(slot0.controller:getUIPath("txt/shzDiceRecord" .. slot8 .. ".png"))

			slot2 = slot6
		end
	end

	if slot1 and slot2 ~= 0 then
		slot3 = cc.ScaleBy:create(0.2, 0.5)

		slot0.Node_Record["record_" .. slot2]:runAction(cc.Repeat:create(cc.Sequence:create(slot3, slot3:reverse()), 3))
	end
end

ShzDiceGameCcsView.checkLoseWaitGotoGunGame = function (slot0)
	if slot0.model.lWinScore > 0 then
		return
	end

	if slot0.waiterTime then
		slot0.waiterTime:stop()
		slot0.waiterTime:destroy()

		slot0.waiterTime = nil
	end

	slot1 = slot0
	slot0.waiterTime = tickMgr:delayedCall(function ()
		slot0.battleView:goToGunGame()
	end, 5000)
end

ShzDiceGameCcsView.diceBackDoOpenAniByData = function (slot0)
	if slot0.model.lDiceOneWinScore > 0 then
		slot0.spineDealer:setAnimation(0, "shz_shiqian_lose", false)
	else
		slot0.spineDealer:setAnimation(0, "shz_shiqian_win", false)
		slot0:checkLoseWaitGotoGunGame()
	end

	slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)
	slot0.spineDealer:registerSpineEventHandler(function (slot0)
		slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)

		if slot0.animation == "shz_shiqian_lose" or slot0.animation == "shz_shiqian_win" then
			if slot0.animation == "shz_shiqian_lose" then
				slot0.spineDealer:setAnimation(0, "shz_shiqian_lose_daiji", true)
			else
				slot0.spineDealer:setAnimation(0, "shz_shiqian_win_daiji", true)
			end
		end
	end, sp.EventType.ANIMATION_COMPLETE)

	if slot0.model.lDiceOneWinScore > 0 then
		if slot0.goOnTimer then
			slot0.goOnTimer:stop()
			slot0.goOnTimer:destroy()

			slot0.goOnTimer = nil
		end

		slot0.goOnTimer = tickMgr:delayedCall(function ()
			slot0:doGoOn()
		end, 4000)
	end
end

ShzDiceGameCcsView.betBackUpdateViewByData = function (slot0)
	slot0:updateShaiziByData()
	slot0:setBetBtnCanClick(false)
	slot0.controller:playGameEffect(string.format(SHZ_SOUND_COMPARE_POINT_S, slot0.model.cbBigSmall[1] + slot0.model.cbBigSmall[2]))

	slot2 = slot0.model.lDiceOneWinScore > 0

	if slot0.model.cbBigSmall[1] + slot0.model.cbBigSmall[2] > 7 then
		slot0.btnBig.yuanBaoSprZhong:setVisible(slot2)
		slot0.btnBig.yuanBaoSprYa:setVisible(false)
		slot0.Node_EndShaizi.Node_shaiziBig:setPositionX(600)
	elseif slot0.model.cbBigSmall[1] + slot0.model.cbBigSmall[2] == 7 then
		slot0.btnEqual.yuanBaoSprZhong:setVisible(slot2)
		slot0.btnEqual.yuanBaoSprYa:setVisible(false)
		slot0.Node_EndShaizi.Node_shaiziBig:setPositionX(300)
	else
		slot0.btnSmall.yuanBaoSprZhong:setVisible(slot2)
		slot0.btnSmall.yuanBaoSprYa:setVisible(false)
		slot0.Node_EndShaizi.Node_shaiziBig:setPositionX(0)
	end

	slot3 = ""

	if slot0.model.lDiceOneWinScore > 0 then
		slot3 = HtmlUtil.createImg(slot4, nil, nil, 0, -22) .. HtmlUtil.createArtNumSign(slot0.model.lDiceOneWinScore + slot0.lastYaFen, "#shzDicWinNum_%s.png")

		slot0.controller:playGameEffect(SHZ_SOUND_COMPARE_WIN)
	else
		slot3 = HtmlUtil.createImg(slot4, nil, nil, 0, -22) .. HtmlUtil.createArtNumSign(slot0.model.lDiceOneWinScore, "#shzDicLoseNum_%s.png")

		slot0.controller:playGameEffect(SHZ_SOUND_COMPARE_LOSE)
	end

	slot0.Panel_Result.oneWinScore_tf:setHtmlText(slot3)
	slot0.Panel_Result:setVisible(true)
	slot0.allWinScore_tf:setHtmlText(slot4)
	slot0.btnGetScore:setEnabled(slot0.model.lDiceOneWinScore > 0)
	slot0.btnGoOn:setEnabled(slot0.model.lDiceOneWinScore >= 0)
	table.insert(slot0.model.cbBigSmallRecord, slot1)

	if #slot0.model.cbBigSmallRecord > 10 then
		table.remove(slot0.model.cbBigSmallRecord, 1)
	end

	slot0:updateRecordByData(true)

	slot0.model.lDiceOneWinScore = 0
	slot0.model.cbBigSmall = {}
end

ShzDiceGameCcsView.show = function (slot0)
	slot0.btnGoOn:setVisible(false)
	slot0.btnGoOn:setEnabled(false)
	slot0:showArrowAni(false)
	slot0.controller:hideBattlePopups()
	slot0.battleView:getParent():getParent().layerNotice:setPosition(700, 695)
	slot0.controller:playMusic(SHZ_SOUND_DICE_BG)

	slot0.model.lDiceOneWinScore = 0
	slot0._bStopRandomIdleAni = false

	slot0:addTwoMenAni()
	slot0:setBetBtnCanClick(false)
	slot0:setBetBtnYuanBaoShow(false)
	slot0.btnGoOn:setEnabled(false)
	slot0.btnGetScore:setEnabled(true)
	slot0.lastYaScore_tf:setHtmlText(slot1)
	slot0.allWinScore_tf:setHtmlText(slot2)
	slot0.Node_EndShaizi:setVisible(false)
	slot0.Panel_Result:setVisible(false)
	slot0:updateRecordByData()
	slot0:playYaoShaiziAct()
end

ShzDiceGameCcsView.hide = function (slot0)
	slot0:showArrowAni(false)

	slot0.model.bPlayingGame = false

	slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)

	slot0._bStopRandomIdleAni = true

	slot0:resetAllTimer()
end

ShzDiceGameCcsView.resetAllTimer = function (slot0)
	if slot0.waiterTime then
		slot0.waiterTime:stop()
		slot0.waiterTime:destroy()

		slot0.waiterTime = nil
	end

	if slot0.idleTimer then
		slot0.idleTimer:stop()
		slot0.idleTimer:destroy()

		slot0.idleTimer = nil
	end

	if slot0.goOnTimer then
		slot0.goOnTimer:stop()
		slot0.goOnTimer:destroy()

		slot0.goOnTimer = nil
	end

	if slot0.waiterReqTime then
		slot0.waiterReqTime:stop()
		slot0.waiterReqTime:destroy()

		slot0.waiterReqTime = nil
	end
end

ShzDiceGameCcsView.destroy = function (slot0)
	slot0.spineDealer:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)
	slot0:resetAllTimer()
	spPoolMgr:put(slot0.spineDealer)
	spPoolMgr:put(slot0.spineArrow)
	spPoolMgr:put(slot0.menSpine)
	slot0.allWinScore_tf:destroy()
	slot0.Panel_Result.oneWinScore_tf:destroy()
	slot0.lastYaScore_tf:destroy()
	slot0.btnSmall:destroy()
	slot0.btnEqual:destroy()
	slot0.btnBig:destroy()
	slot0.btnGetScore:destroy()
end

return
