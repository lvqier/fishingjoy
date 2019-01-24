slot2 = "YszJettonCcsView"
YszJettonCcsView = class(slot1)

YszJettonCcsView.onCreationComplete = function (slot0)
	slot0._spRes = {
		"common/Ysz_jetton_1.png",
		nil,
		"common/Ysz_jetton_1.png",
		nil,
		"common/Ysz_jetton_2.png",
		nil,
		nil,
		"common/Ysz_jetton_3.png",
		nil,
		"common/Ysz_jetton_4.png",
		[255.0] = "common/Ysz_Battle_XPcm.png"
	}
	slot5 = 220
	slot5 = 300
	slot5 = 520
	slot5 = 520
	slot5 = 300
	slot0._startPos = {
		cc.p(slot3, 500),
		cc.p(slot3, 150),
		cc.p(slot3, 150),
		cc.p(slot3, 1180),
		cc.p(slot3, 1180)
	}
	slot4 = 420
	slot0._endPos = cc.p(cc.p(slot3, 1180), 667)
	slot0._jettonShowActionNum = 0
	slot0.jettonTable = {}
end

YszJettonCcsView.reset = function (slot0)
	for slot4 = 1, #slot0.jettonTable, 1 do
		if slot0.jettonTable[slot4] ~= nil then
			slot7 = slot0.jettonTable[slot4]

			slot0.jettonTable[slot4].stopAllActions(slot6)
		end
	end

	slot0.spine = nil
	slot0.jettonTable = {}
	slot3 = slot0

	slot0.removeAllChildren(slot2)

	slot3 = slot0

	slot0.stopAllActions(slot2)
end

YszJettonCcsView.playUserJetton = function (slot0, slot1, slot2, slot3)
	if slot2 < 1 then
		return
	end

	slot6 = slot0.model

	if slot0.model.getIsSendPukeFinish(slot5) then
		slot7 = 3

		slot0.setLocalZOrder(slot5, slot0)
	end

	slot7 = slot0._spRes[slot3] or slot0._spRes[1]
	slot13 = TextField.H_CENTER
	slot6 = TextField.new(slot0.controller.getUIPath(display.newSprite(slot0.controller), slot0.controller), nil, 22, "#00ff00", 200, nil)

	if slot3 == 255 then
		slot9 = slot6

		slot6.setHtmlText(slot8, HtmlUtil.createArtNumDotSignString(slot11, slot2))

		slot9 = slot6
		slot15 = slot5
		slot13 = slot5:getContentSize().height / 2 - 26

		slot6.setPosition(slot8, cc.p(slot11, slot5.getContentSize("#ysz_orange_%s.png").width / 2 - 112))
	else
		slot9 = slot6

		slot6.setHtmlText(slot8, HtmlUtil.createArtNumDotSignString(slot11, slot2))

		slot9 = slot6
		slot15 = slot5
		slot13 = slot5:getContentSize().height / 2 - 8

		slot6.setPosition(slot8, cc.p(slot11, slot5.getContentSize("#ysz_black_%s.png").width / 2 - 100))
	end

	slot10 = slot6

	slot5.addChild(slot8, slot5)

	slot10 = YSZ_ADD_GOLD_SOUNDRES

	slot0.controller.playGameEffect(slot8, slot0.controller)

	slot10 = slot0._startPos[slot1]

	slot5.setPosition(slot8, slot5)

	slot10 = slot5

	slot0.addChild(slot8, slot0)

	slot10 = slot5

	table.insert(slot8, slot0.jettonTable)

	slot10 = 200
	slot11 = 20
	slot12 = slot0._endPos.y + math.random(-200, -20)
	slot17 = cc.p(-20, slot0._endPos.x + math.random(slot8, -200))
	slot14 = 2
	slot14 = 0.1
	slot18 = 30
	slot16 = cc.RotateTo.create(cc.EaseOut, cc.RotateTo, math.random(0.3, -30))
	slot16 = cc.Spawn.create(cc.RotateTo, cc.Spawn, slot10)

	slot5.runAction(cc.Spawn, slot5)
end

YszJettonCcsView.setPlayingJetton = function (slot0, slot1, slot2)
	if slot1 < 1 then
		return
	end

	slot6 = slot0._spRes[slot2] or slot0._spRes[1]
	slot12 = TextField.H_CENTER
	slot5 = TextField.new(slot0.controller.getUIPath(display.newSprite(slot0.controller), slot0.controller), nil, 22, "#00ff00", 200, nil)

	if slot2 == 255 then
		slot8 = slot5

		slot5.setHtmlText(slot7, HtmlUtil.createArtNumDotSignString(slot10, slot1))

		slot8 = slot5
		slot14 = slot4
		slot12 = slot4:getContentSize().height / 2 - 26

		slot5.setPosition(slot7, cc.p(slot10, slot4.getContentSize("#ysz_orange_%s.png").width / 2 - 112))
	else
		slot8 = slot5

		slot5.setHtmlText(slot7, HtmlUtil.createArtNumDotSignString(slot10, slot1))

		slot8 = slot5
		slot14 = slot4
		slot12 = slot4:getContentSize().height / 2 - 8

		slot5.setPosition(slot7, cc.p(slot10, slot4.getContentSize("#ysz_black_%s.png").width / 2 - 100))
	end

	slot9 = slot5

	slot4.addChild(slot7, slot4)

	slot9 = 200
	slot10 = 20
	slot11 = slot0._endPos.y + math.random(-200, -20)
	slot12 = cc.p(-20, slot0._endPos.x + math.random(slot7, -200))

	slot4.setPosition(slot0._endPos.x + math.random(slot7, -200), slot4)

	slot12 = slot4

	slot0.addChild(slot0._endPos.x + math.random(slot7, -200), slot0)

	slot12 = slot4

	table.insert(slot0._endPos.x + math.random(slot7, -200), slot0.jettonTable)
end

YszJettonCcsView.playGameEndJetton = function (slot0, slot1, slot2)
	slot3 = 0.2
	slot4 = 1
	slot5 = {}
	slot6 = nil
	slot7 = #slot0.jettonTable

	if #slot0.jettonTable > 50 then
		slot3 = slot3 / 2
	end

	function moveFinish()
		slot3 = YSZ_GET_GOLD_SOUNDRES

		slot0.controller.playGameEffect(slot1, slot0.controller)

		if slot0.controller <= slot1 and slot3 == nil then
			slot1 = slot0._startPos[slot4].y
			slot2 = slot0._startPos[slot4].y + 125

			if slot4 == 2 or slot4 == 3 then
				slot10 = TextField.H_LEFT
				slot5 = TextField.new(slot4, nil, 22, "#00ff00", 200, nil)
				slot9 = 0.5

				TextField.new(slot4, nil, 22, "#00ff00", 200, nil).setAnchorPoint(slot4, cc.p("#00ff00", 0))

				slot1 = slot0._startPos[slot4].y
			elseif slot4 == 4 or slot4 == 5 then
				slot10 = TextField.H_RIGHT
				slot5 = TextField.new(slot4, nil, 22, "#00ff00", 200, nil)
				slot9 = 0.5

				TextField.new(slot4, nil, 22, "#00ff00", 200, nil).setAnchorPoint(slot4, cc.p("#00ff00", 1))

				slot1 = slot0._startPos[slot4].y
			else
				slot10 = TextField.H_CENTER
				slot3 = TextField.new(slot4, nil, 22, "#00ff00", 200, nil)
				slot1 = slot0._startPos[slot4].y
			end

			slot6 = slot3
			slot10 = "#Ysz_p_%s.png"

			slot3.setHtmlText(slot5, HtmlUtil.createArtNumWithSignString(slot8, slot5))

			slot7 = slot0

			slot0.addChild(slot5, slot0)

			slot6 = slot3
			slot10 = slot1

			slot3.setPosition(slot5, cc.p(slot8, slot0))

			slot6 = slot3
			slot13 = 0.2
			slot17 = slot2

			function slot14()
				slot3 = YSZ_GAME_PIAOZI_SOUNDRES

				slot0.controller.playGameEffect(slot1, slot0.controller)

				if slot0.controller.playGameEffect.spine == nil then
					slot3 = "duorenjsshanguang.json"
					slot0 = slot0.controller.getSpinePath(slot1, slot0.controller)
					slot7 = slot0.controller.getSpinePath(slot0.controller, slot0.controller)
					slot0.spine = sp.SkeletonAnimation.create("duorenjsshanguang.atlas", sp.SkeletonAnimation, slot0)
					slot5 = slot0.spine

					slot0.addChild(sp.SkeletonAnimation.create("duorenjsshanguang.atlas", sp.SkeletonAnimation, slot0), slot0)
				end

				slot3 = 0.5

				slot0.spine.setTimeScale(slot1, slot0.spine)

				slot3 = 1.5

				slot0.spine.setTimeScale.spine.setScale(slot1, slot0.spine.setTimeScale.spine)

				slot2 = slot0.spine.setTimeScale.spine.setScale.spine
				slot6 = slot0._startPos[slot1].y + 125

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition(slot1, cc.p(slot4, slot0._startPos[slot1].x - 10))

				slot5 = false

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation(slot1, slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine, 0, "animation")

				slot2 = slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation
				slot3 = slot1

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore(slot1, slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1))

				slot3 = {}

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model.setMyTablePlayingUserData(slot1, slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model)

				slot3 = nil

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model.setMyTablePlayingUserData.model.setGameEndData(slot1, slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model.setMyTablePlayingUserData.model)

				slot2 = slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model.setMyTablePlayingUserData.model.setGameEndData.model.myTableUserDataChangedSignal

				slot0.spine.setTimeScale.spine.setScale.spine.setPosition.spine.setAnimation.getParent(slot1).updateWinerScore.model.setMyTablePlayingUserData.model.setGameEndData.model.myTableUserDataChangedSignal.emit(slot1)
			end

			slot15 = 0.5

			function slot16()
				slot2 = slot0

				slot0.removeSelf(slot1)
			end

			slot14 = nil

			slot3.runAction(slot5, cc.Sequence.create(slot8, cc.Sequence, cc.MoveTo.create(slot11, cc.MoveTo, cc.p(slot15, slot3)), cc.CallFunc.create(cc.MoveTo, cc.CallFunc), cc.DelayTime.create(cc.CallFunc, cc.DelayTime), cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

			return
		else
			slot1 = slot1 + 1
		end

		slot6 = slot6
		slot10 = slot0._startPos[slot4].y
		slot4 = 0.2
		slot4 = 0.02
		slot5 = moveFinish
		slot2 = cc.CallFunc.create(cc.DelayTime, cc.CallFunc)
		slot7 = 0
		slot3 = cc.FadeTo.create(cc.CallFunc, cc.FadeTo, 0.05)

		if slot0.jettonTable[cc.DelayTime.create(cc.EaseOut, cc.DelayTime)] ~= nil then
			slot7 = slot0.jettonTable[slot1]

			table.insert(slot5, slot7)

			slot6 = slot0.jettonTable[slot1]

			function slot17()
				slot6 = "duorenshourulizi.plist"
				slot0 = cc.ParticleSystemQuad.create(slot1, slot0.controller.getParticlePath(slot4, slot0.controller))
				slot4 = 0.15

				slot0.setScale(cc.ParticleSystemQuad, slot0)

				slot4 = true

				slot0.setAutoRemoveOnFinish(cc.ParticleSystemQuad, slot0)

				slot4 = slot0

				slot0.addChild(cc.ParticleSystemQuad, slot0)

				slot3 = slot0
				slot7 = slot0._startPos[slot0.setPosition].y

				slot0.setPosition(cc.ParticleSystemQuad, cc.p(slot0.controller, slot0._startPos[slot1].x))

				if slot2[1] ~= nil then
					slot4 = false

					slot2[1].setVisible(slot2, slot2[1])

					slot4 = 1

					table.remove(slot2, slot2)
				end
			end

			slot15 = nil

			slot0.jettonTable[slot1].runAction(slot1, cc.Sequence.create(slot1, cc.Sequence, slot1, slot2, slot0, slot3, cc.CallFunc.create(slot15, cc.CallFunc)))
		end
	end

	slot14 = slot3
	slot18 = slot0._startPos[slot1].y
	slot12 = 0.2
	slot8 = cc.EaseOut.create(slot9, cc.EaseOut, cc.MoveTo.create(slot12, cc.MoveTo, cc.p(slot16, slot0._startPos[slot1].x)))
	slot12 = 0.02
	slot9 = cc.DelayTime.create(cc.EaseOut, cc.DelayTime)
	slot13 = moveFinish
	slot10 = cc.CallFunc.create(cc.DelayTime, cc.CallFunc)
	slot15 = 0
	slot11 = cc.FadeTo.create(cc.CallFunc, cc.FadeTo, 0.05)

	if slot0.jettonTable[slot4] ~= nil then
		slot15 = slot0.jettonTable[slot4]

		table.insert(slot13, slot5)

		slot14 = slot0.jettonTable[slot4]

		function slot25()
			slot6 = "duorenshourulizi.plist"
			slot0 = cc.ParticleSystemQuad.create(slot1, slot0.controller.getParticlePath(slot4, slot0.controller))
			slot4 = 0.15

			slot0.setScale(cc.ParticleSystemQuad, slot0)

			slot4 = true

			slot0.setAutoRemoveOnFinish(cc.ParticleSystemQuad, slot0)

			slot4 = slot0

			slot0.addChild(cc.ParticleSystemQuad, slot0)

			slot3 = slot0
			slot7 = slot0._startPos[slot0.setPosition].y

			slot0.setPosition(cc.ParticleSystemQuad, cc.p(slot0.controller, slot0._startPos[slot1].x))

			if slot2[1] ~= nil then
				slot4 = false

				slot2[1].setVisible(slot2, slot2[1])

				slot4 = 1

				table.remove(slot2, slot2)
			end
		end

		slot23 = nil

		slot0.jettonTable[slot4].runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, slot9, slot10, slot8, slot11, cc.CallFunc.create(slot23, cc.CallFunc)))
	end

	slot14 = slot0
	slot20 = cc.DelayTime
	slot21 = (slot7 > 50 and 4) or 2.5

	function slot22()
		slot4 = true

		slot0.model.setGameState(slot1, slot0.model, GAME_STATUS_FREE)
	end

	slot0.runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, cc.DelayTime.create(slot19, nil), cc.CallFunc.create(nil, cc.CallFunc)))
end

return
