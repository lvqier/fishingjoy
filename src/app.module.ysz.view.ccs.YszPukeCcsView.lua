slot2 = "YszPukeCcsView"
YszPukeCcsView = class(slot1)

YszPukeCcsView.onCreationComplete = function (slot0)
	slot4 = 420
	slot0.centerPos = cc.p(slot2, 667)
	slot4 = 410
	slot0.givePos = cc.p(slot2, 640)
	slot0.showPukeSpine = nil
	slot3 = slot0

	slot0.init(slot2)

	slot3 = slot0

	slot0.reset(slot2)

	slot3 = slot0

	slot0.register(slot2)
end

YszPukeCcsView.init = function (slot0)
	slot0.m_pukeList = {
		slot0.puke1,
		slot0.puke2,
		slot0.puke3,
		slot0.puke4,
		slot0.puke5
	}
	slot0.m_timers = {}
	slot0.m_pukeStartPos = {}
	slot0.jsPukeList = {
		slot0.js1,
		slot0.js2,
		slot0.js3,
		slot0.js4,
		slot0.js5
	}
	slot0.jsPukeStartPos = {}
	slot0.mePukePos = {}
	slot0.cardList = {}

	for slot4 = 1, 5, 1 do
		slot5 = slot0.m_pukeList[slot4]
		slot0.m_pukeStartPos[slot4] = {}

		for slot9 = 1, 3, 1 do
			slot14 = true

			slot5["puke" .. slot9 .. "_0"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_0"].puke.root)

			slot14 = true

			slot5["puke" .. slot9 .. "_1"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_1"].puke.root)

			slot14 = 1

			slot5["puke" .. slot9 .. "_0"].puke.root.setBackType(slot9, slot5["puke" .. slot9 .. "_0"].puke.root)

			slot14 = 1

			slot5["puke" .. slot9 .. "_1"].puke.root.setBackType(slot9, slot5["puke" .. slot9 .. "_1"].puke.root)

			slot14 = true

			slot5["puke" .. slot9].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9].puke.root)

			slot16 = slot5["puke" .. slot9]
			slot0.m_pukeStartPos[slot4][slot9] = cc.p(slot5["puke" .. slot9].getPosition(slot15))
		end
	end

	for slot4 = 1, 5, 1 do
		slot9 = "wanjialiangpai.json"
		slot10 = "wanjialiangpai.atlas"
		slot12 = slot0.controller.getSpinePath(slot0.controller, slot0.controller)
		slot8 = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot6)
		slot14 = false

		slot8.setAnimation(sp.SkeletonAnimation, slot8, 0, "animation")

		slot12 = "spine"

		slot8.setName(sp.SkeletonAnimation, slot8)

		slot15 = slot0.jsPukeList[slot4].Image_2
		slot13 = slot0.jsPukeList[slot4].Image_2.getContentSize(slot0.jsPukeList[slot4].Image_2).height / 2

		slot8.setPosition(sp.SkeletonAnimation, slot8, slot0.jsPukeList[slot4].Image_2.getContentSize("animation").width / 2)

		slot12 = slot8

		slot0.jsPukeList[slot4].Image_2.addChild(sp.SkeletonAnimation, slot0.jsPukeList[slot4].Image_2)

		slot0.jsPukeStartPos[slot4] = {}

		for slot12 = 1, 3, 1 do
			slot17 = true

			slot5["puke" .. slot12].root.setIsShowingBack(slot15, slot5["puke" .. slot12].root)

			slot19 = slot5["puke" .. slot12]
			slot0.jsPukeStartPos[slot4][slot12] = cc.p(slot5["puke" .. slot12].getPosition(slot18))
		end
	end

	for slot4 = 1, 3, 1 do
		slot10 = slot0.puke1["puke" .. slot4]
		slot0.mePukePos[slot4] = cc.p(slot0.puke1["puke" .. slot4].getPosition("puke" .. slot4))
	end
end

YszPukeCcsView.register = function (slot0)
	slot5 = slot0

	slot0.model.nCurRoundsChangedSignal.add(slot2, slot0.model.nCurRoundsChangedSignal, slot0.onChangeDJL)

	slot5 = slot0

	slot0.model.showGameEndPukeChangedSignal.add(slot2, slot0.model.showGameEndPukeChangedSignal, slot0.onChangeShowGameEndPuke)

	slot5 = slot0

	slot0.model.canShowPukeChangedSignal.add(slot2, slot0.model.canShowPukeChangedSignal, slot0.onChangeCanShowPuke)
end

YszPukeCcsView.onChangeDJL = function (slot0)
	slot3 = slot0.model

	if slot0.model.getNCurRounds(slot2) > 1 then
		slot3 = slot0.model

		if slot0.model.getMePlaying(slot2) == true then
			slot3 = slot0.model

			if slot0.model.getBMingZhu(slot2)[1] ~= false then
				slot3 = slot0.model

				if slot0.model.getBMingZhu(slot2)[1] == nil then
					slot4 = true

					slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)
				end
			end
		end
	else
		slot4 = false

		slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)
	end
end

YszPukeCcsView.onChangeCanShowPuke = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCanShowPuke(slot2) == true then
		slot3 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot2)[1] ~= nil then
			slot4 = true

			slot0.btnShowCard.setVisible(slot2, slot0.btnShowCard)
		end
	else
		slot4 = false

		slot0.btnShowCard.setVisible(slot2, slot0.btnShowCard)
	end
end

YszPukeCcsView.onChangeShowGameEndPuke = function (slot0)
	slot3 = slot0.model

	if slot0.model.getShowGameEndPuke(slot2) then
		slot3 = slot0

		slot0.onGameEnd(slot2)
	end
end

YszPukeCcsView.onStart = function (slot0)
	slot4 = true

	slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)

	for slot4 = 1, #slot0.m_pukeList, 1 do
		slot9 = false

		slot0.m_pukeList[slot4].setVisible(slot7, slot5)

		slot8 = slot0.m_pukeList[slot4]
		slot11 = 16777215

		slot0.m_pukeList[slot4].setColor(slot7, DisplayUtil.rgb2ccc3(slot10))

		for slot9 = 1, 3, 1 do
			slot13 = slot5["puke" .. slot9 .. "_0"]

			slot5["puke" .. slot9 .. "_0"].stopAllActions(slot9)

			slot13 = slot5["puke" .. slot9 .. "_1"]

			slot5["puke" .. slot9 .. "_1"].stopAllActions(slot9)

			slot14 = true

			slot5["puke" .. slot9 .. "_0"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_0"].puke.root)

			slot14 = true

			slot5["puke" .. slot9 .. "_1"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_1"].puke.root)

			slot14 = 0.45

			slot5["puke" .. slot9 .. "_0"].setScale(slot9, slot5["puke" .. slot9 .. "_0"])

			slot14 = 0.45

			slot5["puke" .. slot9 .. "_1"].setScale(slot9, slot5["puke" .. slot9 .. "_1"])

			slot14 = 0

			slot5["puke" .. slot9 .. "_0"].setOpacity(slot9, slot5["puke" .. slot9 .. "_0"])

			slot14 = 0

			slot5["puke" .. slot9 .. "_1"].setOpacity(slot9, slot5["puke" .. slot9 .. "_1"])

			slot14 = true

			slot5["puke" .. slot9 .. "_0"].setVisible(slot9, slot5["puke" .. slot9 .. "_0"])

			slot14 = true

			slot5["puke" .. slot9 .. "_1"].setVisible(slot9, slot5["puke" .. slot9 .. "_1"])

			slot13 = slot5["puke" .. slot9]

			slot5["puke" .. slot9].stopAllActions(slot9)

			slot14 = true

			slot5["puke" .. slot9].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9].puke.root)

			slot14 = 0.45

			slot5["puke" .. slot9].setScale(slot9, slot10)

			slot14 = 255

			slot5["puke" .. slot9].setOpacity(slot9, slot10)

			slot14 = true

			slot5["puke" .. slot9].setVisible(slot9, slot10)

			slot15 = slot0.centerPos
			slot11 = DisplayUtil.getPositionFromTo(slot9, slot0, slot5)
			slot15 = slot11

			slot5["puke" .. slot9].setPosition(slot0, slot10)

			slot15 = slot11

			slot5["puke" .. slot9 .. "_0"].setPosition(slot9, slot5["puke" .. slot9 .. "_0"])

			slot15 = slot11

			slot5["puke" .. slot9 .. "_1"].setPosition(slot9, slot5["puke" .. slot9 .. "_1"])
		end
	end

	function slot4()
		slot2 = slot0

		slot0.sendCard(slot1)
	end

	slot4 = slot0
	slot11 = 0.5
	slot10 = nil

	slot0.runAction(cc.CallFunc, cc.Sequence.create(slot6, cc.Sequence, cc.DelayTime.create(slot9, cc.DelayTime), cc.CallFunc.create(slot2, cc.CallFunc)))

	slot4 = slot0

	slot0.onChangeDJL(cc.CallFunc)
end

YszPukeCcsView.onSubPlay = function (slot0)
	slot4 = false

	slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)

	slot4 = 3

	slot0.jetton.setLocalZOrder(slot2, slot0.jetton)

	slot4 = 4

	slot0.btnLookCard.setLocalZOrder(slot2, slot0.btnLookCard)

	slot4 = 5

	slot0.btnShowCard.setLocalZOrder(slot2, slot0.btnShowCard)

	slot4 = slot0.model.getMyTablePlayingUserData(slot2)

	for slot5, slot6 in pairs(slot0.model) do
		slot11 = 2

		slot0.m_pukeList[slot5].setLocalZOrder(slot9, slot7)

		slot11 = true

		slot0.m_pukeList[slot5].setVisible(slot9, slot7)

		slot10 = slot0.m_pukeList[slot5]
		slot13 = 16777215

		slot0.m_pukeList[slot5].setColor(slot9, DisplayUtil.rgb2ccc3(slot12))

		for slot11 = 1, 3, 1 do
			slot15 = slot7["puke" .. slot11 .. "_0"]

			slot7["puke" .. slot11 .. "_0"].stopAllActions(slot11)

			slot15 = slot7["puke" .. slot11 .. "_1"]

			slot7["puke" .. slot11 .. "_1"].stopAllActions(slot11)

			slot15 = slot7["puke" .. slot11]

			slot7["puke" .. slot11].stopAllActions(slot11)

			slot16 = true

			slot7["puke" .. slot11 .. "_0"].puke.root.setIsShowingBack(slot11, slot7["puke" .. slot11 .. "_0"].puke.root)

			slot16 = true

			slot7["puke" .. slot11 .. "_1"].puke.root.setIsShowingBack(slot11, slot7["puke" .. slot11 .. "_1"].puke.root)

			slot16 = true

			slot7["puke" .. slot11].puke.root.setIsShowingBack(slot11, slot7["puke" .. slot11].puke.root)

			if slot5 == 1 then
				slot16 = 0.65

				slot12.setScale(slot14, slot12)

				slot16 = 0.65

				slot7["puke" .. slot11 .. "_0"].setScale(slot11, slot7["puke" .. slot11 .. "_0"])

				slot16 = 0.65

				slot7["puke" .. slot11 .. "_1"].setScale(slot11, slot7["puke" .. slot11 .. "_1"])

				slot15 = slot0.model

				if slot0.model.getCbHandCardData(slot11) ~= nil then
					slot15 = slot0.model

					if #slot0.model.getCbHandCardData(slot14) > 0 then
						slot15 = slot0.model

						if slot0.model.getBMingZhu(slot14)[1] == true then
							slot18 = slot0.model
							slot16 = slot0.model.getCbHandCardData(slot17)[slot11]

							slot12.puke.root.setDataInt(slot14, slot12.puke.root)

							slot16 = false

							slot12.puke.root.setIsShowingBack(slot14, slot12.puke.root)

							if slot11 == 3 then
								slot16 = false

								slot0.btnLookCard.setVisible(slot14, slot0.btnLookCard)

								slot18 = slot0.controller
								slot21 = slot0.model
								slot17 = true

								slot0.model.setMeCardType(slot14, slot0.model, slot0.controller.GetCardType(slot17, slot0.model.getCbHandCardData(slot20)))
							end
						end
					end
				else
					slot16 = true

					slot0.btnLookCard.setVisible(slot14, slot0.btnLookCard)
				end
			else
				slot16 = 0.45

				slot12.setScale(slot14, slot12)

				slot16 = 0.45

				slot7["puke" .. slot11 .. "_0"].setScale(slot11, slot7["puke" .. slot11 .. "_0"])

				slot16 = 0.45

				slot7["puke" .. slot11 .. "_1"].setScale(slot11, slot7["puke" .. slot11 .. "_1"])
			end

			slot16 = 0

			slot7["puke" .. slot11 .. "_0"].setOpacity(slot11, slot7["puke" .. slot11 .. "_0"])

			slot16 = 0

			slot7["puke" .. slot11 .. "_1"].setOpacity(slot11, slot7["puke" .. slot11 .. "_1"])

			slot16 = true

			slot7["puke" .. slot11 .. "_0"].setVisible(slot11, slot7["puke" .. slot11 .. "_0"])

			slot16 = true

			slot7["puke" .. slot11 .. "_1"].setVisible(slot11, slot7["puke" .. slot11 .. "_1"])

			slot16 = 0

			slot7["puke" .. slot11 .. "_0"].setRotation(slot11, slot7["puke" .. slot11 .. "_0"])

			slot16 = 0

			slot7["puke" .. slot11 .. "_1"].setRotation(slot11, slot7["puke" .. slot11 .. "_1"])

			slot16 = slot0.m_pukeStartPos[slot5][slot11]

			slot7["puke" .. slot11 .. "_0"].setPosition(slot11, slot7["puke" .. slot11 .. "_0"])

			slot16 = slot0.m_pukeStartPos[slot5][slot11]

			slot7["puke" .. slot11 .. "_1"].setPosition(slot11, slot7["puke" .. slot11 .. "_1"])

			slot16 = 255

			slot12.setOpacity(slot11, slot12)

			slot16 = true

			slot12.setVisible(slot11, slot12)

			slot16 = 0

			slot12.setRotation(slot11, slot12)

			slot16 = slot0.m_pukeStartPos[slot5][slot11]

			slot12.setPosition(slot11, slot12)
		end
	end

	slot4 = slot0

	slot0.onChangeDJL(slot3)
end

YszPukeCcsView.sendCard = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getMyTablePlayingUserData(slot2)
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}

	for slot10 = 1, 3, 1 do
		slot13 = slot1

		for slot14, slot15 in pairs(slot12) do
			slot18 = slot0.m_pukeList[slot14]

			slot0.m_pukeList[slot14].stopAllActions(slot17)

			slot19 = 255

			slot0.m_pukeList[slot14].setOpacity(slot17, slot0.m_pukeList[slot14])

			slot19 = true

			slot0.m_pukeList[slot14].setVisible(slot17, slot0.m_pukeList[slot14])

			slot19 = slot0.m_pukeList[slot14]["puke" .. slot10]

			table.insert(slot17, slot2)

			slot19 = slot0.m_pukeList[slot14]["puke" .. slot10 .. "_0"]

			table.insert(slot17, slot5)

			slot19 = slot0.m_pukeList[slot14]["puke" .. slot10 .. "_1"]

			table.insert(slot17, slot6)

			slot19 = slot0.m_pukeStartPos[slot14][slot10]

			table.insert(slot17, slot3)

			slot19 = slot14

			table.insert(slot17, slot4)
		end
	end

	slot7 = 1

	function delayPlay()
		slot0.disPuke(slot1, slot0, slot1[slot2], slot3[slot2])

		slot5 = slot4[slot0.disPuke]

		slot0.disPuke.disPuke0(slot1, slot0.disPuke, slot5[slot2], slot3[slot2])

		slot5 = slot4[slot0.disPuke.disPuke0]

		slot0.disPuke.disPuke0.disPuke1(slot1, slot0.disPuke.disPuke0, slot6[slot2], slot3[slot2])

		if slot2 + 1 == #slot1 then
			slot3 = true

			slot0.model.setIsSendPukeFinish(slot1, slot0.model)
		end
	end

	delayPlay()

	slot10 = slot0.m_timers
	slot16 = #slot2 - 2

	table.insert(slot9, tickMgr.delayedCall(slot12, tickMgr, delayPlay, 120))
end

YszPukeCcsView.disPuke = function (slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	slot4 = nil

	function ready()
		slot3 = DISPATCH_CARD_SOUNDRES

		slot0.controller.playGameEffect(slot1, slot0.controller)

		if slot1 == 1 then
			slot13 = cc.Spawn.create
			slot10 = 1.2
			slot11 = 0
			slot7 = cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)
			slot12 = 0.65
			slot7 = 0.7
			slot4 = cc.DelayTime.create(cc.Spawn, cc.DelayTime)

			function slot8()
				return
			end

			slot2 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13)), cc.ScaleTo.create(cc.RotateTo, cc.ScaleTo, 0.13)), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		else
			slot13 = cc.Spawn.create
			slot10 = 1.2
			slot6 = cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13))
			slot11 = 0
			slot7 = 0.7
			slot4 = cc.DelayTime.create(cc.Spawn, cc.DelayTime)

			function slot8()
				return
			end

			slot2 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		end

		slot3 = slot4

		slot4.runAction(slot1, slot4)
	end

	slot9 = slot1
	slot5 = cc.p(slot1.getPosition(slot8))
	slot9 = 180

	slot1.setRotation(slot1.getPosition, slot1)

	slot12 = 0.07
	slot13 = ready
	slot11 = nil
	slot9 = cc.Sequence.create(slot1.getPosition, cc.Sequence, cc.DelayTime.create(slot10, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))

	slot1.runAction(slot1.getPosition, slot1)

	slot9 = true

	slot1.setVisible(slot1.getPosition, slot1)
end

YszPukeCcsView.disPuke0 = function (slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	slot4 = nil

	function ready()
		if slot0 == 1 then
			slot13 = cc.Sequence
			slot10 = 1.2
			slot11 = 0
			slot7 = cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)
			slot12 = 0.65
			slot8 = 0
			slot8 = 0.3
			slot5 = cc.DelayTime.create(cc.FadeTo, cc.DelayTime)

			function slot9()
				slot3 = 0

				slot0.setOpacity(slot1, slot0)
			end

			slot1 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13)), cc.ScaleTo.create(cc.RotateTo, cc.ScaleTo, 0.13)), cc.FadeTo.create(cc.Spawn, cc.FadeTo, 0.07), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		else
			slot13 = cc.Sequence
			slot10 = 1.2
			slot6 = cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13))
			slot11 = 0
			slot8 = 0
			slot8 = 0.3
			slot5 = cc.DelayTime.create(cc.FadeTo, cc.DelayTime)

			function slot9()
				slot3 = 0

				slot0.setOpacity(slot1, slot0)
			end

			slot1 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)), cc.FadeTo.create(cc.Spawn, cc.FadeTo, 0.1), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		end

		slot3 = slot1

		slot3.runAction(slot1, slot3)
	end

	slot9 = slot1
	slot9 = 180

	slot1.setRotation(slot1.getPosition, slot1)

	slot9 = 50

	slot1.setOpacity(slot1.getPosition, slot1)

	slot12 = 0.07
	slot14 = 190
	slot14 = 0.07
	slot21 = 15
	slot22 = 15
	slot18 = cc.p(slot1.getPosition(slot8)).y + math.random(-15, -15)
	slot15 = ready
	slot13 = nil
	slot9 = cc.Sequence.create(slot1.getPosition, cc.Sequence, cc.DelayTime.create(slot10, cc.DelayTime), cc.RotateTo.create(cc.DelayTime, cc.RotateTo, 0.01), cc.MoveTo.create(cc.RotateTo, cc.MoveTo, cc.p(slot16, cc.p(slot1.getPosition(slot8)).x + math.random(slot19, -15))), cc.CallFunc.create(cc.MoveTo, cc.CallFunc))

	slot1.runAction(slot1.getPosition, slot1)

	slot9 = true

	slot1.setVisible(slot1.getPosition, slot1)
end

YszPukeCcsView.disPuke1 = function (slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	slot4 = nil

	function ready()
		if slot0 == 1 then
			slot13 = cc.Sequence
			slot10 = 1.2
			slot11 = 0
			slot7 = cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)
			slot12 = 0.65
			slot8 = 0
			slot8 = 0.3
			slot5 = cc.DelayTime.create(cc.FadeTo, cc.DelayTime)

			function slot9()
				slot3 = 0

				slot0.setOpacity(slot1, slot0)
			end

			slot1 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13)), cc.ScaleTo.create(cc.RotateTo, cc.ScaleTo, 0.13)), cc.FadeTo.create(cc.Spawn, cc.FadeTo, 0.07), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		else
			slot13 = cc.Sequence
			slot10 = 1.2
			slot6 = cc.EaseOut.create(slot7, cc.EaseOut, cc.MoveTo.create(slot10, cc.MoveTo, 0.13))
			slot11 = 0
			slot8 = 0
			slot8 = 0.7
			slot5 = cc.DelayTime.create(cc.FadeTo, cc.DelayTime)

			function slot9()
				slot3 = 0

				slot0.setOpacity(slot1, slot0)
			end

			slot1 = cc.Sequence.create(slot1, cc.Sequence, cc.Spawn.create(slot4, cc.Spawn, cc.RotateTo.create(cc.EaseOut, cc.RotateTo, 0.13)), cc.FadeTo.create(cc.Spawn, cc.FadeTo, 0.07), cc.CallFunc.create(cc.DelayTime, cc.CallFunc))
		end

		slot3 = slot1

		slot3.runAction(slot1, slot3)
	end

	slot9 = slot1
	slot9 = 180

	slot1.setRotation(slot1.getPosition, slot1)

	slot9 = 30

	slot1.setRotation(slot1.getPosition, slot1)

	slot12 = 0.07
	slot14 = 170
	slot14 = 0.1
	slot21 = 15
	slot22 = 15
	slot18 = cc.p(slot1.getPosition(slot8)).y + math.random(-15, -15)
	slot15 = ready
	slot13 = nil
	slot9 = cc.Sequence.create(slot1.getPosition, cc.Sequence, cc.DelayTime.create(slot10, cc.DelayTime), cc.RotateTo.create(cc.DelayTime, cc.RotateTo, 0.01), cc.MoveTo.create(cc.RotateTo, cc.MoveTo, cc.p(slot16, cc.p(slot1.getPosition(slot8)).x + math.random(slot19, -15))), cc.CallFunc.create(cc.MoveTo, cc.CallFunc))

	slot1.runAction(slot1.getPosition, slot1)

	slot9 = true

	slot1.setVisible(slot1.getPosition, slot1)
end

YszPukeCcsView.onGiveUp = function (slot0, slot1)
	slot5 = 1

	slot0.jetton.setLocalZOrder(slot3, slot0.jetton)
	slot0.model.setIsPlayingGiveUpAction(slot3, slot0.model, true)

	slot7 = slot0.model
	slot6 = YSZ_GAME_PLAYER
	slot9 = slot0.model

	if slot1 == gameMgr.switchViewChairID(slot3, gameMgr, slot0.model.getMeWChairID(false), slot0.model.getMeWChairID(slot8)) then
		if slot0.m_pukeList[slot1] == nil then
			return
		end

		slot7 = slot0.givePos
		slot3 = DisplayUtil.getPositionFromTo(slot4, slot0, slot2)
		slot4 = 0

		if slot2 ~= nil then
			for slot8 = 1, 3, 1 do
				if slot2["puke" .. slot8] == nil then
					return
				end

				slot13 = true

				slot9.puke.root.setIsShowingBack(slot11, slot9.puke.root)
			end
		end

		function runFinish()
			slot3 = DISPATCH_CARD_SOUNDRES

			slot0.controller.playGameEffect(slot1, slot0.controller)

			if slot1 + 1 > 3 then
				slot1 = 3

				return
			end

			slot2 = "puke" .. "puke" .. "_0"["puke" .. "puke"["puke" .. "puke" .. "_0"] .. "_1"]

			if slot2["puke" .. ] == nil then
				return
			end

			slot6 = true

			slot0.puke.root.setIsShowingBack(slot4, slot0.puke.root)

			slot6 = true

			slot1.puke.root.setIsShowingBack(slot4, slot1.puke.root)

			slot6 = true

			slot2.puke.root.setIsShowingBack(slot4, slot2.puke.root)

			slot0.index = slot1
			slot6 = 80

			slot1.setOpacity(slot4, slot1)

			slot6 = 50

			slot2.setOpacity(slot4, slot2)

			slot6 = 0.15
			slot3 = cc.DelayTime.create(slot4, cc.DelayTime)
			slot7 = runFinish
			slot11 = 0.3
			slot15 = slot3.y + 150
			slot9 = 2
			slot10 = 360
			slot11 = 0
			slot12 = 0.2
			slot12 = 0.1
			slot16 = 0.3
			slot20 = slot3.y + 150
			slot14 = 2
			slot15 = 360
			slot16 = 0
			slot17 = 0.2
			slot17 = 0.1
			slot21 = 0.3
			slot25 = slot3.y + 150
			slot19 = 2
			slot20 = 360
			slot21 = 0
			slot22 = 0.2

			function slot22()
				slot3 = false

				slot0.setVisible(slot1, slot0)

				slot3 = false

				slot1:setVisible(slot1)

				slot3 = false

				slot1:setVisible(slot1)

				slot3 = 255

				slot1.setVisible.setOpacity(slot1, slot1.setVisible)

				slot3 = 0

				slot1:setOpacity(slot1)

				slot3 = 0

				slot1:setOpacity(slot1)

				if slot1.setOpacity.index == 3 then
					if slot3 == 1 then
						slot2 = slot4
						slot5 = 6710886

						slot4.setColor(slot1, DisplayUtil.rgb2ccc3(slot4))

						for slot3 = 1, 3, 1 do
							slot8 = true

							slot4["puke" .. slot3].puke.root.setIsShowingBack(slot3, slot4["puke" .. slot3].puke.root)

							slot8 = 0.65

							slot4["puke" .. slot3].setScale(slot3, slot4)

							slot8 = 0

							slot4["puke" .. slot3].setRotation(slot3, slot4)

							slot7 = slot4["puke" .. slot3].setRotation.model

							if slot4["puke" .. slot3].setRotation.model.getBMingZhu(slot3)[1] == true then
								slot10 = slot5.model
								slot8 = slot5.model.getCbHandCardData(slot9)[slot3]

								slot4.puke.root.setDataInt(slot6, slot4.puke.root)

								slot8 = false

								slot4.puke.root.setIsShowingBack(slot6, slot4.puke.root)

								slot8 = false

								slot4.puke.root.setIsShowingBack.btnLookCard.setVisible(slot6, slot4.puke.root.setIsShowingBack.btnLookCard)
							else
								slot8 = true

								slot5.btnLookCard.setVisible(slot6, slot5.btnLookCard)
							end

							slot7 = slot4

							slot4.stopAllActions(slot6)

							slot7 = slot4
							slot11 = slot5.m_pukeStartPos[slot3][slot3].y - 200

							slot4.setPosition(slot6, cc.p(slot9, slot5.m_pukeStartPos[slot3][slot3].x))

							slot7 = slot4
							slot15 = slot5.m_pukeStartPos[slot3][slot3]
							slot12 = 1

							slot4.runAction(slot6, cc.EaseOut.create(slot9, cc.EaseOut, cc.MoveTo.create(slot3, cc.MoveTo, 0.4)))

							slot8 = true

							slot4.setVisible(slot6, slot4)
						end
					end

					slot2 = slot5
					slot9 = 1

					function slot10()
						slot4 = true

						slot0.model.setIsPlayingGiveUpAction(slot1, slot0.model, false)
					end

					slot8 = nil

					slot5.runAction(slot1, cc.Sequence.create(slot4, cc.Sequence, cc.DelayTime.create(slot7, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
				end
			end

			slot22 = slot0
			slot33 = cc.ScaleTo.create(cc.FadeTo, cc.ScaleTo, 0.3)
			slot31 = nil

			slot0.runAction(cc.CallFunc, cc.Sequence.create(slot3.x + 50, cc.Sequence, slot3, slot4, cc.Spawn.create(slot29, cc.Spawn, slot5, slot6), slot7, slot19))

			slot22 = slot1
			slot32 = cc.ScaleTo.create(cc.FadeTo, cc.ScaleTo, 0.3)
			slot29 = nil

			slot1.runAction(cc.CallFunc, cc.Sequence.create(slot3.x + 50, cc.Sequence, slot9, cc.Spawn.create(cc.Spawn.create(slot29, cc.Spawn, slot5, slot6), cc.Spawn, slot10, slot11), slot12))

			slot22 = slot2
			slot32 = cc.ScaleTo.create(cc.FadeTo, cc.ScaleTo, 0.3)
			slot29 = nil

			slot2.runAction(cc.CallFunc, cc.Sequence.create(slot3.x + 50, cc.Sequence, cc.DelayTime.create(cc.ScaleTo, cc.DelayTime), cc.Spawn.create(slot12, cc.Spawn, cc.EaseOut.create(cc.DelayTime, cc.EaseOut, cc.MoveTo.create(slot3.x + 50, cc.MoveTo, cc.p(slot23, slot3.x + 50))), cc.RotateBy.create(cc.EaseOut, cc.RotateBy, 0.45)), cc.FadeTo.create(cc.RotateBy, cc.FadeTo, 0.1)))
		end

		runFinish()

		return
	end

	if slot0.m_pukeList[slot1] == nil then
		slot7 = true

		slot0.model.setIsPlayingGiveUpAction(slot4, slot0.model, false)

		return
	end

	slot7 = slot0.centerPos
	slot3 = DisplayUtil.getPositionFromTo(slot4, slot0, slot2)

	for slot7 = 1, 3, 1 do
		if slot2["puke" .. slot7] == nil then
			slot13 = true

			slot0.model.setIsPlayingGiveUpAction(slot10, slot0.model, false)

			return
		end

		slot12 = true

		slot8.puke.root.setIsShowingBack(slot10, slot8.puke.root)

		slot19 = slot3
		slot16 = 1
		slot17 = 0
		slot13 = cc.FadeTo.create(cc.EaseOut, cc.FadeTo, 0.1)

		function slot17()
			slot3 = false

			slot0.setVisible(slot1, slot0)

			slot3 = 255

			slot0.setVisible.setOpacity(slot1, slot0.setVisible)
		end

		slot12 = slot8

		slot8.stopAllActions(cc.Sequence)

		slot13 = cc.Sequence.create(slot10, cc.Sequence, cc.EaseOut.create(slot13, cc.EaseOut, cc.MoveTo.create(slot16, cc.MoveTo, 0.2)), cc.CallFunc.create(cc.FadeTo, cc.CallFunc))

		slot8.runAction(cc.Sequence, slot8)
	end

	slot8 = true

	slot0.model.setIsPlayingGiveUpAction(slot5, slot0.model, false)
end

YszPukeCcsView.compareCard = function (slot0)
	slot3 = "======YszPukeCcsView:compareCard======="

	print(slot2)

	if slot0.m_pukeList[1] == nil then
		return
	end

	slot4 = slot1
	slot7 = 6710886

	slot1.setColor(slot3, DisplayUtil.rgb2ccc3(slot6))

	slot6 = true

	slot0.model.setIsPlayingGiveUpAction(slot3, slot0.model, false)
end

YszPukeCcsView.hide = function (slot0, slot1)
	if slot0.m_pukeList[slot1] == nil then
		return
	end

	slot7 = slot0.centerPos
	slot3 = DisplayUtil.getPositionFromTo(slot4, slot0, slot2)

	for slot7 = 1, 3, 1 do
		if slot2["puke" .. slot7] == nil then
			return
		end

		slot12 = true

		slot8.puke.root.setIsShowingBack(slot10, slot8.puke.root)

		slot19 = slot3
		slot16 = 1
		slot17 = 0
		slot13 = cc.FadeTo.create(cc.EaseOut, cc.FadeTo, 0.1)

		function slot17()
			slot3 = false

			slot0.setVisible(slot1, slot0)

			slot3 = 255

			slot0.setVisible.setOpacity(slot1, slot0.setVisible)
		end

		slot12 = slot8

		slot8.stopAllActions(cc.Sequence)

		slot13 = cc.Sequence.create(slot10, cc.Sequence, cc.EaseOut.create(slot13, cc.EaseOut, cc.MoveTo.create(slot16, cc.MoveTo, 0.2)), cc.CallFunc.create(cc.FadeTo, cc.CallFunc))

		slot8.runAction(cc.Sequence, slot8)
	end
end

YszPukeCcsView.showOnTimeAction = function (slot0)
	slot4 = slot0.m_pukeList[1]
	slot12 = 1.02
	slot13 = 1
	slot14 = 1.02
	slot15 = 1
	slot12 = nil

	slot0.m_pukeList[1].runAction(slot3, cc.Sequence.create(slot6, cc.Sequence, cc.ScaleTo.create(slot9, cc.ScaleTo, 0.2), cc.ScaleTo.create(cc.ScaleTo, cc.ScaleTo, 0.2), cc.ScaleTo.create(cc.ScaleTo, cc.ScaleTo, 0.2), cc.ScaleTo.create(cc.ScaleTo, cc.ScaleTo, 0.2)))
end

YszPukeCcsView.lookCard = function (slot0, slot1, slot2, slot3)
	if slot0.looking == true then
		return
	end

	slot0.looking = true
	slot4 = {}
	slot5 = {}

	if slot1 ~= nil and slot2 == 1 then
		slot9 = false

		slot0.btnLookCard.setVisible(slot7, slot0.btnLookCard)

		slot6 = nil
		slot10 = slot1
		slot12 = true

		slot0.model.setMeCardType(slot0.controller, slot0.model, slot0.controller.GetCardType(slot0.btnLookCard, slot0.controller))

		if slot0.m_pukeList[slot2] == nil then
			return
		end

		function onFinish()
			slot3 = YSZ_GAME_KAIPAI_SOUNDRES

			slot0.controller.playGameEffect(slot1, slot0.controller)

			for slot3 = 1, 3, 1 do
				if slot1["puke" .. slot3] == nil then
					return
				end

				slot8 = false

				slot4.puke.root.setIsShowingBack(slot6, slot4.puke.root)

				if slot3 > 1 then
					slot7 = slot4
					slot17 = 0.2
					slot21 = slot0.mePukePos[slot3].y
					slot15 = 1
					slot19 = slot0.mePukePos[slot3]
					slot16 = 1

					function slot16()
						if slot0 == 3 and slot1 ~= nil then
							slot1()
						end
					end

					slot14 = nil

					slot4.runAction(slot6, cc.Sequence.create(slot9, cc.Sequence, cc.EaseOut.create(slot12, cc.EaseOut, cc.MoveTo.create(slot15, cc.MoveTo, cc.p(slot19, slot0.mePukePos[slot3].x + 4))), cc.EaseOut.create(cc.EaseOut, cc.EaseOut, cc.MoveTo.create(cc.MoveTo, cc.MoveTo, 0.1)), cc.CallFunc.create(cc.EaseOut, cc.CallFunc)))
				end
			end
		end

		for slot12 = 1, 3, 1 do
			if slot8["puke" .. slot12] == nil then
				return
			end

			slot17 = slot1[slot12]

			slot13.puke.root.setDataInt(slot15, slot13.puke.root)

			slot17 = 0.65

			slot13.setScale(slot15, slot13)

			slot16 = slot13
			slot27 = slot0.mePukePos[1]
			slot24 = 1
			slot24 = 0.05
			slot28 = slot0.mePukePos[1].y + 50
			slot29 = slot0.mePukePos[1]
			slot26 = 1

			function slot26()
				if slot0 == 3 then
					onFinish()
				end
			end

			slot24 = nil

			slot13.runAction(slot15, cc.Sequence.create(slot18, cc.Sequence, cc.EaseOut.create(slot21, cc.EaseOut, cc.MoveTo.create(slot24, cc.MoveTo, 0.2)), cc.MoveTo.create(cc.EaseOut, cc.MoveTo, cc.p(0.2, slot0.mePukePos[1].x)), cc.EaseOut.create(cc.MoveTo, cc.EaseOut, cc.MoveTo.create(0.2, cc.MoveTo, 0.2)), cc.CallFunc.create(cc.EaseOut, cc.CallFunc)))
		end
	end
end

YszPukeCcsView.showCard = function (slot0)
	return
end

YszPukeCcsView.onGameEnd = function (slot0)
	slot4 = false

	slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)

	slot3 = slot0.model

	if slot0.model.getGameEndData(slot2) == nil then
		slot5 = true

		slot0.model.setIsEndShowPuke(slot3, slot0.model)

		return
	end

	for slot5 = 2, #slot0.m_pukeList, 1 do
		slot10 = false

		slot0.m_pukeList[slot5].setVisible(slot8, slot0.m_pukeList[slot5])
	end

	slot4 = slot0.model
	slot2 = slot0.model.getMyTablePlayingUserData(slot3)

	if slot1.winerChairID == 1 then
		slot5 = slot0.model

		if slot0.model.getBMingZhu(slot4)[1] == true then
			slot5 = slot0.model

			if slot0.model.getMePlaying(slot4) then
				slot6 = true

				slot0.model.setIsEndShowPuke(slot4, slot0.model)
			end
		else
			slot5 = slot0.model
			slot0.model.getBMingZhu(slot4)[1] = true
			slot8 = slot0.model

			function slot8()
				slot3 = true

				slot0.model.setIsEndShowPuke(slot1, slot0.model)
			end

			slot0.lookCard(true, slot0, slot0.model.getCbHandCardData(slot7), 1)
		end
	else
		slot6 = YSZ_GAME_OPENCARD_SOUNDRES

		slot0.controller.playGameEffect(slot4, slot0.controller)

		slot5 = slot0.model

		if slot0.model.getMePlaying(slot4) then
			slot7 = true

			slot0.m_pukeList[1].setVisible(slot5, slot0.m_pukeList[1])
		end

		slot5 = slot0.model

		if slot0.model.getBMingZhu(slot4)[1] ~= true then
			slot5 = slot0.model

			if slot0.model.getMePlaying(slot4) then
			end
		end

		if slot1.meIsOpen then
			slot5 = slot0.model

			if not slot0.model.getMePlaying(slot4) then
				slot5 = slot0.model

				if slot0.model.getMePlaying(slot4) then
					slot5 = slot0.model

					if slot0.model.getIsTwoMan(slot4) then
						slot5 = slot0.model

						if slot0.model.getBMingZhu(slot4)[1] ~= true then
							slot8 = slot0.model
							slot7 = 1

							slot0.lookCard(slot4, slot0, slot0.model.getCbHandCardData(slot7))
						end

						slot6 = false

						slot0.btnLookCard.setVisible(slot4, slot0.btnLookCard)
					end
				end
			end
		end

		if slot2[slot1.winerChairID] ~= nil then
			slot8 = true

			slot0.showPuke(slot4, slot0, slot1.wCompareUser[slot1.winerChairID], slot1.winerChairID)
		end
	end

	slot5 = slot1.wCompareUser

	for slot6, slot7 in pairs(slot4) do
		if slot2[slot6] ~= nil and slot6 ~= slot1.winerChairID then
			slot12 = slot6

			slot0.showPuke(slot9, slot0, slot7)
		end
	end
end

YszPukeCcsView.checkST = function (slot0)
	slot3 = slot0.model

	if slot0.model.getGameEndData(slot2) == nil then
		slot5 = true

		slot0.model.setIsEndShowPuke(slot3, slot0.model)

		return
	end

	slot5 = slot1.wCompareUser[slot1.winerChairID]

	if slot0.controller.GetCardType(slot3, slot0.controller) == YszController.CT_BAO_ZI then
		slot6 = true

		slot0.model.setIsShowEffectST(slot4, slot0.model)
	else
		slot5 = slot0

		slot0.onGameEnd(slot4)
	end
end

YszPukeCcsView.updateWinerScore = function (slot0, slot1)
	return
end

YszPukeCcsView.showPuke = function (slot0, slot1, slot2, slot3, slot4)
	if (slot0.jsPukeList[slot2] == nil or slot1 == nil) and slot3 then
		function specail()
			slot4 = true

			slot0.model.setIsEndShowPuke(slot1, slot0.model, true)
		end

		slot8 = slot0.jsPukeList[1]
		slot15 = 1
		slot16 = specail
		slot14 = nil

		slot0.jsPukeList[1].runAction(slot7, cc.Sequence.create(slot10, cc.Sequence, cc.DelayTime.create(slot13, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

		return
	end

	if slot5 == nil then
		return
	end

	slot8 = slot0.model

	if slot0.model.getTableUserID(slot7)[slot2] == nil then
		slot8 = "该椅子没参加当前牌局"

		trace(slot7)

		return
	end

	slot8 = slot5

	if slot5.isVisible(slot7) == true and slot4 then
		return
	end

	if slot2 == 1 then
		slot10 = false

		slot0.m_pukeList[1].setVisible(slot8, slot0.m_pukeList[1])
	end

	slot9 = "spine"
	slot9 = false

	slot5.Image_2.getChildByName(slot7, slot5.Image_2).setVisible(slot7, slot5.Image_2.getChildByName(slot7, slot5.Image_2))

	slot9 = false

	slot5.Image_1.setVisible(slot7, slot5.Image_1)

	slot9 = ""

	slot5.txtScore.setString(slot7, slot5.txtScore)

	if slot3 then
		slot9 = "spine"
		slot9 = true

		slot5.Image_2.getChildByName(slot7, slot5.Image_2).setVisible(slot7, slot5.Image_2.getChildByName(slot7, slot5.Image_2))

		slot9 = true

		slot5.Image_1.setVisible(slot7, slot5.Image_1)

		slot9 = "spine"
		slot11 = false

		slot5.Image_2.getChildByName(slot7, slot5.Image_2).setAnimation(slot7, slot5.Image_2.getChildByName(slot7, slot5.Image_2), 0, "animation")

		slot12 = slot1
		slot12 = slot0.model
		slot12, slot8 = slot0.controller.getIScore("common/Ysz_Win_%d.png", slot0.controller)

		slot5.txtScore.setString(slot0.model.getMyTablePlayingUserData(slot0.controller)[slot2].lScore, slot5.txtScore)

		slot11 = slot5.Image_1
		slot15 = string.format(slot7, slot0.controller.GetCardType("animation", slot0.controller))

		slot5.Image_1.loadTexture(slot0.model.getMyTablePlayingUserData(slot0.controller)[slot2].lScore, slot0.controller.getUIPath(slot13, slot0.controller))

		slot11 = slot5.Image_2
		slot15 = "common/Ysz_lp.png"

		slot5.Image_2.loadTexture(slot0.model.getMyTablePlayingUserData(slot0.controller)[slot2].lScore, slot0.controller.getUIPath(slot13, slot0.controller))
	else
		slot8 = slot5.Image_2
		slot12 = "common/Ysz_lp2.png"

		slot5.Image_2.loadTexture(slot7, slot0.controller.getUIPath(slot10, slot0.controller))
	end

	slot9 = true

	slot5.setVisible(slot7, slot5)

	for slot9 = 1, 3, 1 do
		slot14 = slot1[slot9]

		slot5["puke" .. slot9].root.setDataInt(slot12, slot5["puke" .. slot9].root)

		slot14 = false

		slot5["puke" .. slot9].root.setIsShowingBack(slot12, slot5["puke" .. slot9].root)

		slot14 = true

		slot5["puke" .. slot9].setVisible(slot12, slot10)

		slot14 = slot0.jsPukeStartPos[slot2][1]

		slot5["puke" .. slot9].setPosition(slot12, slot10)

		function moveFinish()
			if slot0 == 3 and slot1 and (slot2 == nil or slot2 == false) then
				slot4 = true

				slot3.model.setIsEndShowPuke(slot1, slot3.model, true)
			end
		end

		slot13 = slot5["puke" .. slot9]
		slot20 = 0.05
		slot24 = slot0.jsPukeStartPos[slot2][1].y + 50
		slot25 = slot0.jsPukeStartPos[slot2][1]
		slot22 = 1
		slot25 = 0.2
		slot29 = slot0.jsPukeStartPos[slot2][slot9].y
		slot23 = 1
		slot27 = slot0.jsPukeStartPos[slot2][slot9]
		slot24 = 1
		slot24 = 0.5
		slot25 = moveFinish
		slot23 = nil

		slot5["puke" .. slot9].runAction(slot12, cc.Sequence.create(slot15, cc.Sequence, cc.MoveTo.create(slot18, cc.MoveTo, cc.p(slot22, slot0.jsPukeStartPos[slot2][1].x)), cc.EaseOut.create(cc.MoveTo, cc.EaseOut, cc.MoveTo.create(slot22, cc.MoveTo, 0.2)), cc.EaseOut.create(cc.EaseOut, cc.EaseOut, cc.MoveTo.create(cc.MoveTo, cc.MoveTo, cc.p(slot27, slot0.jsPukeStartPos[slot2][slot9].x + 4))), cc.EaseOut.create(cc.EaseOut, cc.EaseOut, cc.MoveTo.create(cc.MoveTo, cc.MoveTo, 0.1)), cc.DelayTime.create(cc.EaseOut, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end
end

YszPukeCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getIsPlayingAction(slot4) then
		return
	end

	if slot1 == slot0.btnLookCard then
		slot5 = slot0.model

		if slot0.model.getCbHandCardData(slot4) ~= nil then
			slot5 = slot0.model

			if #slot0.model.getCbHandCardData(slot4) > 0 then
				slot8 = slot0.model
				slot7 = 1

				slot0.lookCard(slot4, slot0, slot0.model.getCbHandCardData(slot7))

				slot5 = slot0.model
				slot0.model.getBMingZhu(slot4)[1] = true
			end
		else
			slot5 = slot0.controller

			slot0.controller.reqLookCard(slot4)
		end
	elseif slot1 == slot0.btnShowCard then
		slot6 = false

		slot0.btnShowCard.setVisible(slot4, slot0.btnShowCard)

		slot5 = slot0.controller

		slot0.controller.reqShowCard(slot4)
	end
end

YszPukeCcsView.reset = function (slot0)
	slot3 = "===========YszPukeCcsView:reset=============="

	print(slot2)

	slot3 = slot0.m_pukeList

	for slot4, slot5 in ipairs(slot2) do
		for slot9 = 1, 3, 1 do
			slot14 = true

			slot5["puke" .. slot9 .. "_0"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_0"].puke.root)

			slot14 = true

			slot5["puke" .. slot9 .. "_1"].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9 .. "_1"].puke.root)

			slot14 = 1

			slot5["puke" .. slot9 .. "_0"].puke.root.setBackType(slot9, slot5["puke" .. slot9 .. "_0"].puke.root)

			slot14 = 1

			slot5["puke" .. slot9 .. "_1"].puke.root.setBackType(slot9, slot5["puke" .. slot9 .. "_1"].puke.root)

			slot14 = true

			slot5["puke" .. slot9].puke.root.setIsShowingBack(slot9, slot5["puke" .. slot9].puke.root)

			slot14 = 1

			slot5["puke" .. slot9].puke.root.setBackType(slot9, slot5["puke" .. slot9].puke.root)

			slot13 = slot5["puke" .. slot9]

			slot5["puke" .. slot9].stopAllActions(slot9)

			slot13 = slot5["puke" .. slot9 .. "_0"]

			slot5["puke" .. slot9 .. "_0"].stopAllActions(slot9)

			slot13 = slot5["puke" .. slot9 .. "_1"]

			slot5["puke" .. slot9 .. "_1"].stopAllActions(slot9)

			slot14 = false

			slot5["puke" .. slot9 .. "_0"].setVisible(slot9, slot5["puke" .. slot9 .. "_0"])

			slot14 = false

			slot5["puke" .. slot9 .. "_1"].setVisible(slot9, slot5["puke" .. slot9 .. "_1"])

			slot14 = false

			slot5["puke" .. slot9].setVisible(slot9, slot5["puke" .. slot9])
		end

		slot9 = 2

		slot5.setLocalZOrder(slot7, slot5)
	end

	slot4 = 1

	slot0.jetton.setLocalZOrder(slot2, slot0.jetton)

	slot4 = 4

	slot0.btnLookCard.setLocalZOrder(slot2, slot0.btnLookCard)

	slot4 = 5

	slot0.btnShowCard.setLocalZOrder(slot2, slot0.btnShowCard)

	slot3 = slot0.jsPukeList

	for slot4, slot5 in ipairs(slot2) do
		slot9 = false

		slot5.setVisible(slot7, slot5)

		for slot9 = 1, 3, 1 do
			slot14 = true

			slot5["puke" .. slot9].root.setIsShowingBack(slot12, slot5["puke" .. slot9].root)

			slot14 = 1

			slot5["puke" .. slot9].root.setBackType(slot12, slot5["puke" .. slot9].root)

			slot13 = slot5["puke" .. slot9]

			slot5["puke" .. slot9].stopAllActions(slot12)
		end
	end

	slot3 = slot0.m_timers

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.stop(slot7)

		slot8 = slot5

		slot5.destroy(slot7)

		slot5 = nil
	end

	slot3 = slot0

	slot0.stopAllActions(slot2)

	slot4 = false

	slot0.btnLookCard.setVisible(slot2, slot0.btnLookCard)

	slot4 = false

	slot0.btnShowCard.setVisible(slot2, slot0.btnShowCard)

	slot0.m_timers = {}
	slot0.looking = false
end

return
