ShzMaryGameCcsView = class("ShzMaryGameCcsView")

ShzMaryGameCcsView.onCreationComplete = function (slot0)
	slot0.waiterTime = nil
	slot0.oneGridDoTimeTable = {}
	slot0.waiterMidTime = nil
	slot0.curIndex = 1
	slot0.midItemsTable = {}

	for slot4 = 1, SHZ_MAX_MARY_MID_ITEM_COUNT, 1 do
		table.insert(slot0.midItemsTable, slot0.Node_midItems["listNode_" .. tostring(slot4)].root)
	end

	slot0.waiData = {
		0,
		3,
		5,
		8,
		6,
		4,
		0,
		2,
		8,
		7,
		5,
		3,
		0,
		6,
		8,
		1,
		7,
		5,
		0,
		2,
		6,
		8,
		7,
		4
	}
	slot0.waiItemsTable = {}

	for slot4 = 1, SHZ_MAX_MARY_WAI_ITEM_COUNT, 1 do
		table.insert(slot0.waiItemsTable, slot0.Node_waiItems["waiItem_" .. tostring(slot4)].root)
	end
end

ShzMaryGameCcsView.setSpineBy = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.controller:createSpineWithEvent(slot2, nil, true, true) then
		slot5:setPositionX(slot3)
		slot5:setPositionY(slot4)
		slot1:addChild(slot5)
	end

	return slot5
end

ShzMaryGameCcsView.updateTimeAndScoreByData = function (slot0)
	slot1 = (slot0.model.cbMaryGames >= 0 and slot0.model.cbMaryGames) or 0

	slot0.leftTime_tf:setHtmlText(slot2)
	slot0.winScore_tf:setHtmlText(HtmlUtil.createArtNumDot(slot0.model.lWinScore, "#shzMaryScoreNum_%s.png"))

	if slot0.model.lMaryOneWinScore > 0 then
	end

	slot0.timeWinScore_tf:setHtmlText(HtmlUtil.createArtNumDot(slot0.model.lMaryOneWinScore, "#shzMaryScoreNum_%s.png"))
end

ShzMaryGameCcsView.showEndAndReqdSHZMary = function (slot0)
	slot0:updateTimeAndScoreByData()
	slot0.Node_midItems.Node_KuangSpine4:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3L:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3R:setVisible(false)

	for slot4, slot5 in ipairs(slot0.midItemsTable) do
		slot5._iconData = slot0.model.cbInternalArray[slot4]

		slot5:stopRollQuick()
	end

	if slot0.curIndex > 0 then
		slot0.waiItemsTable[slot0.curIndex]:endStopSetSel(false)
		slot0.waiItemsTable[slot0.curIndex]:setBSel(false)
	end

	slot0.curIndex = (slot0.model.cbExternalData == 0 and 1) or slot0.model.cbExternalData

	slot0:showLotteryMidIcon()
	slot0:showLotteryMidIconKuang()

	for slot4, slot5 in ipairs(slot0.waiItemsTable) do
		if slot4 == slot0.curIndex then
			slot0.waiItemsTable[slot0.curIndex]:setBSel(true)
			slot0.waiItemsTable[slot4]:endStopSetSel(true)
		end
	end

	slot0:showLotterySmallIcon()

	if slot0.waiterTime then
		slot0.waiterTime:stop()
		slot0.waiterTime:destroy()

		slot0.waiterTime = nil
	end

	slot0.waiterTime = tickMgr:delayedCall(function ()
		if slot0.model.cbMaryGames > 0 then
			reqdSHZMary()
		else
			slot0.battleView:poupGetOrDiceDoGetAction(false)
		end
	end, 2834)
end

ShzMaryGameCcsView.doMidRun = function (slot0)
	slot0.controller:playGameEffect("effect/sound_water_mary_roll_inner.mp3")
	slot0.Node_midItems.Node_KuangSpine4:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3L:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3R:setVisible(false)

	if slot0.waiterMidTime then
		slot0.waiterMidTime:stop()
		slot0.waiterMidTime:destroy()

		slot0.waiterMidTime = nil
	end

	for slot4, slot5 in ipairs(slot0.midItemsTable) do
		slot5._iconData = slot0.model.cbInternalArray[slot4]

		slot5:tweenToStartRoll()
	end

	slot1 = slot0
	slot0.waiterMidTime = tickMgr:delayedCall(function ()
		for slot3, slot4 in ipairs(slot0.midItemsTable) do
			slot4:stopRoll()
		end

		slot0:showLotteryMidIconKuang()
	end, 5000)
end

ShzMaryGameCcsView.doGameRun = function (slot0)
	slot0:doMidRun()

	slot0.curIndex = slot0.curIndex or 1
	slot0.endIndex = slot0.model.cbExternalData
	slot0.allSize = 2 * SHZ_MAX_MARY_WAI_ITEM_COUNT

	if slot0.endIndex < slot0.curIndex then
		slot0.allSize = slot0.allSize - (slot0.curIndex - slot0.endIndex)
	else
		slot0.allSize = (slot0.allSize + slot0.endIndex) - slot0.curIndex
	end

	slot0.curSize = 0

	slot0.waiItemsTable[slot0.curIndex]:endStopSetSel(false)
	slot0:waiterToPos()

	for slot4 = 1, 8, 1 do
		slot0.Node_zhongIcon["icon_" .. tostring(slot4)]:setVisible(false)
	end
end

ShzMaryGameCcsView.waiterToPos = function (slot0)
	for slot4, slot5 in pairs(slot0.oneGridDoTimeTable) do
		slot5:stop()
		slot5:destroy()

		slot5 = nil
	end

	slot0.controller:playGameEffect("effect/sound_water_mary_roll_out.mp3")

	slot1 = 0

	for slot5 = 1, slot0.allSize, 1 do
		if (slot0.curIndex + slot5) % SHZ_MAX_MARY_WAI_ITEM_COUNT == 0 then
			slot6 = SHZ_MAX_MARY_WAI_ITEM_COUNT or slot6
			slot1 = slot1 + 80
		end

		if slot5 <= 8 then
			slot1 = (slot1 + 400) - slot5 * 50
		elseif slot0.allSize - slot5 <= 8 then
			slot1 = (slot1 + 400) - (slot0.allSize - slot5) * 50
		end

		slot7 = slot0
		slot0.oneGridDoTimeTable[slot5] = tickMgr:delayedCall(function ()
			slot0:doWaiGridSelAction(slot0, )
		end, slot1)
	end
end

ShzMaryGameCcsView.doWaiGridSelAction = function (slot0, slot1, slot2)
	slot0.controller:playGameEffect("effect/sound_water_mary_roll_out.mp3")
	slot0.waiItemsTable[slot0.curIndex]:setBSel(false)
	slot0.waiItemsTable[slot1]:setBSel(true)

	slot0.curIndex = slot1

	if slot0.allSize <= slot2 then
		for slot6, slot7 in pairs(slot0.oneGridDoTimeTable) do
			slot7:stop()
			slot7:destroy()

			slot7 = nil
		end

		slot0:showLotteryMidIcon()
		slot0:showLotterySmallIcon()
		slot0.waiItemsTable[slot1]:endStopSetSel(true)
		slot0:updateTimeAndScoreByData()

		if slot0.model.cbMaryGames <= 0 then
			slot0.controller:playGameEffect("effect/sound_water_mary_icon_exit.mp3")
		end

		if slot0.waiterTime then
			slot0.waiterTime:stop()
			slot0.waiterTime:destroy()

			slot0.waiterTime = nil
		end

		slot0.waiterTime = tickMgr:delayedCall(function ()
			if slot0.model.cbMaryGames > 0 then
				reqdSHZMary()
			else
				slot0.battleView:poupGetOrDiceDoGetAction(false)
			end
		end, 2834)
	end
end

ShzMaryGameCcsView.showLotteryMidIconKuang = function (slot0)
	slot0.Node_midItems.Node_KuangSpine4:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3L:setVisible(false)
	slot0.Node_midItems.Node_KuangSpine3R:setVisible(false)

	if slot0.model.cbInternalArray[1] == slot0.model.cbInternalArray[2] and slot0.model.cbInternalArray[2] == slot0.model.cbInternalArray[3] then
		if slot0.model.cbInternalArray[3] == slot0.model.cbInternalArray[4] then
			if not slot0.SpineFile4 then
				slot0.SpineFile4 = slot0:setSpineBy(slot0.Node_midItems.Node_KuangSpine4, "shz_mlkuangfire4", 0, 0)
			end

			slot0.SpineFile4:setAnimation(0, "start", false)
			slot0.SpineFile4:addAnimation(0, "idle", true)
			slot0.Node_midItems.Node_KuangSpine4:setVisible(true)
		else
			if not slot0.SpineFile3L then
				slot0.SpineFile3L = slot0:setSpineBy(slot0.Node_midItems.Node_KuangSpine3L, "shz_mlkuangfire3", 0, 0)
			end

			slot0.SpineFile3L:setAnimation(0, "start", false)
			slot0.SpineFile3L:addAnimation(0, "idle", true)
			slot0.Node_midItems.Node_KuangSpine3L:setVisible(true)
		end

		return
	end

	if slot0.model.cbInternalArray[2] == slot0.model.cbInternalArray[3] and slot0.model.cbInternalArray[3] == slot0.model.cbInternalArray[4] then
		if not slot0.SpineFile3R then
			slot0.SpineFile3R = slot0:setSpineBy(slot0.Node_midItems.Node_KuangSpine3R, "shz_mlkuangfire3", 0, 0)
		end

		slot0.SpineFile3R:setAnimation(0, "start", false)
		slot0.SpineFile3R:addAnimation(0, "idle", true)
		slot0.Node_midItems.Node_KuangSpine3R:setVisible(true)
	end
end

ShzMaryGameCcsView.showLotteryMidIcon = function (slot0)
	slot1 = false
	slot3 = slot0.waiData[(slot0.model.cbExternalData == 0 and 1) or slot0.model.cbExternalData]

	for slot7 = 1, SHZ_MAX_MARY_MID_ITEM_COUNT, 1 do
		slot0.midItemsTable[slot7]:stopRollQuick()

		if slot0.midItemsTable[slot7]._iconData == slot3 then
			slot0.midItemsTable[slot7]:doSpine()

			if not slot1 and slot0.midItemsTable[slot7]._iconData > 0 then
				slot0.controller:playGameEffect("effect/sound_water_spine" .. slot9 .. ".mp3")

				slot1 = true
			end
		else
			slot0.midItemsTable[slot7]:doGrayOrNo(true)
		end
	end
end

ShzMaryGameCcsView.showLotterySmallIcon = function (slot0)
	slot2 = slot0.waiData[(slot0.model.cbExternalData == 0 and 1) or slot0.model.cbExternalData]

	for slot6 = 1, 8, 1 do
		slot0.Node_zhongIcon["icon_" .. tostring(slot6)]:setVisible(slot6 == slot2)
	end
end

ShzMaryGameCcsView.setBattleView = function (slot0, slot1)
	slot0.battleView = slot1
end

ShzMaryGameCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

ShzMaryGameCcsView.show = function (slot0)
	slot0.controller:hideBattlePopups()
	slot0.controller:playMusic(SHZ_SOUND_MARY_BG)
	slot0.yaScore_tf:setHtmlText(HtmlUtil.createArtNumDot(9 * slot0.model.lJettonScore, "#shzMaryScoreNum_%s.png"))
end

ShzMaryGameCcsView.hide = function (slot0)
	slot0:resetAllTimer()
end

ShzMaryGameCcsView.resetAllTimer = function (slot0)
	if slot0.waiterTime then
		slot0.waiterTime:stop()
		slot0.waiterTime:destroy()

		slot0.waiterTime = nil
	end

	if slot0.waiterMidTime then
		slot0.waiterMidTime:stop()
		slot0.waiterMidTime:destroy()

		slot0.waiterMidTime = nil
	end

	for slot4, slot5 in pairs(slot0.oneGridDoTimeTable) do
		slot5:stop()
		slot5:destroy()

		slot5 = nil
	end
end

ShzMaryGameCcsView.destroy = function (slot0)
	slot0:resetAllTimer()
	spPoolMgr:put(slot0.SpineFile4)
	spPoolMgr:put(slot0.SpineFile3L)
	spPoolMgr:put(slot0.SpineFile3R)
	slot0.leftTime_tf:destroy()
	slot0.winScore_tf:destroy()
	slot0.yaScore_tf:destroy()
	slot0.timeWinScore_tf:destroy()
end

return
