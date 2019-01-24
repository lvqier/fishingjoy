slot2 = "DzpkSlider"
DzpkSlider = class(slot1)

DzpkSlider.onCreationComplete = function (slot0)
	slot13 = slot0.onPercentFloatChanged

	createSetterGetter(slot2, slot0, "percentFloat", 0, true, nil, nil, handler(slot11, slot0))

	slot0.direction = 2
	slot3 = slot0.jettonLayer
	slot0._barSize = slot0.jettonLayer.getContentSize(slot2)
	slot0._barSize.height = 370
	slot0.min = 0
	slot0.minValue = 0
	slot0.currentScore = 0
	slot3 = slot0

	slot0.init(370)

	if slot0.jettonLayer.addTouchEventListener then
		slot3 = slot0.jettonLayer
		slot7 = slot0.onBtntouchSignal

		slot0.jettonLayer.addTouchEventListener(slot2, handler(slot5, slot0))
	end

	slot3 = slot0

	slot0.onChangeDirection(slot2)

	slot3 = slot0

	slot0.onPercentFloatChanged(slot2)
end

DzpkSlider.init = function (slot0)
	slot0.jettonList = {}
	slot0.jettonPos = {}

	for slot4 = 1, 34, 1 do
		slot8 = slot0.jettonLayer["j" .. slot4]

		table.insert(slot6, slot0.jettonList)

		slot7 = slot0.jettonPos
		slot12 = slot0.jettonLayer["j" .. slot4]
		slot10 = slot0.jettonLayer["j" .. slot4].getPositionX("j" .. slot4)
		slot13 = slot0.jettonLayer["j" .. slot4]

		table.insert(slot6, cc.p("j" .. slot4, slot0.jettonLayer["j" .. slot4].getPositionY("j" .. slot4)))

		slot8 = false

		slot0.jettonLayer["j" .. slot4].setVisible("j" .. slot4, slot0.jettonLayer["j" .. slot4])
	end

	slot0.jettonLen = #slot0.jettonList

	if slot0.allinSpine == nil then
		slot4 = "dzpk_allinfirebox/dzpk_allinfirebox.json"
		slot5 = "dzpk_allinfirebox/dzpk_allinfirebox.atlas"
		slot0.allinSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot1)
		slot9 = slot0.topEffectLayer
		slot7 = slot0.topEffectLayer.getContentSize(slot0.topEffectLayer).height / 2 + 20

		slot0.allinSpine.setPosition(slot0.controller, slot0.allinSpine, slot0.topEffectLayer.getContentSize(slot2).width / 2)

		slot6 = slot0.allinSpine

		slot0.topEffectLayer.addChild(slot0.controller, slot0.topEffectLayer)
	end

	slot6 = true

	slot0.allinSpine.setAnimation(slot2, slot0.allinSpine, 0, "animation")

	slot4 = false

	slot0.allinSpine.setVisible(slot2, slot0.allinSpine)

	if slot0.bgSpine == nil then
		slot4 = "dzpk_allinjt/dzpk_allinjt.json"
		slot5 = "dzpk_allinjt/dzpk_allinjt.atlas"
		slot0.bgSpine = sp.SkeletonAnimation.create(slot0.controller, sp.SkeletonAnimation, slot1)
		slot9 = slot0.bottomEffectLayer
		slot7 = slot0.bottomEffectLayer.getContentSize(slot0.bottomEffectLayer).height / 2

		slot0.bgSpine.setPosition(slot0.controller, slot0.bgSpine, slot0.bottomEffectLayer.getContentSize(slot2).width / 2)

		slot6 = slot0.bgSpine

		slot0.bottomEffectLayer.addChild(slot0.controller, slot0.bottomEffectLayer)
	end

	slot6 = true

	slot0.bgSpine.setAnimation(slot2, slot0.bgSpine, 0, "animation")

	slot4 = false

	slot0.bgSpine.setVisible(slot2, slot0.bgSpine)
end

DzpkSlider.onChangeDirection = function (slot0)
	if slot0.direction == 1 then
		slot5 = slot0.jettonLayer
		slot0.startPos = cc.p(slot0.jettonLayer.getPosition(slot4))
		slot3 = slot0.jettonLayer.getPositionX(slot4) + slot0._barSize.width
		slot6 = slot0.jettonLayer
		slot0.endPos = cc.p(slot2, slot0.jettonLayer.getPositionY(slot0.jettonLayer))
	elseif slot0.direction == 2 then
		slot5 = slot0.jettonLayer
		slot0.startPos = cc.p(slot0.jettonLayer.getPosition(slot4))
		slot6 = slot0.jettonLayer
		slot4 = slot0.jettonLayer.getPositionY(slot0.jettonLayer) + slot0._barSize.height
		slot0.endPos = cc.p(slot2, slot0.jettonLayer.getPositionX(slot4))
	end
end

DzpkSlider.setDirection = function (slot0, slot1)
	if slot0.direction == slot1 then
		return
	end

	if slot1 ~= 1 and slot1 ~= 2 then
		slot0.direction = 1
	else
		slot0.direction = slot1
	end

	slot4 = slot0

	slot0.onChangeDirection(slot3)

	slot4 = slot0

	slot0.onPercentFloatChanged(slot3)
end

DzpkSlider.onBtntouchSignal = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchBeganPosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchMovePosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchEndPosition(slot7))
	elseif slot2 == ccs.TOUCH_EVENT_CANCELED then
		slot5 = slot0
		slot8 = slot1

		slot0.updatePercentByBtnPos(slot4, slot1.getTouchEndPosition(slot7))
	end
end

DzpkSlider.updatePercentByBtnPos = function (slot0, slot1)
	slot5 = slot1
	slot2 = slot0.convertToNodeSpace(slot3, slot0)
	slot3 = 0

	if slot0.direction == 1 then
		slot8 = slot0._barSize.width
		slot3 = MathUtil.getValueBetween(slot5, slot2.x - slot0.startPos.x, slot0.min) / slot0._barSize.width
	elseif slot0.direction == 2 then
		slot8 = slot0._barSize.height
		slot3 = MathUtil.getValueBetween(slot5, slot2.y - slot0.startPos.y, slot0.min) / slot0._barSize.height
	end

	slot7 = slot3

	slot0.setPercentFloat(slot5, slot0)
end

DzpkSlider.onPercentFloatChanged = function (slot0)
	slot1 = 0
	slot4 = 34 * slot0._percentFloat

	if math.floor(slot3) - 1 < 1 then
		slot1 = 1
	end

	if slot1 > 34 then
		slot1 = 34
	end

	for slot5 = slot1, 34, 1 do
		slot8 = slot0.jettonLayer["j" .. slot5]

		slot0.jettonLayer["j" .. slot5].stopAllActions("j" .. slot5)

		slot9 = slot0.jettonPos[slot5]

		slot0.jettonLayer["j" .. slot5].setPosition("j" .. slot5, slot0.jettonLayer["j" .. slot5])

		slot9 = false

		slot0.jettonLayer["j" .. slot5].setVisible("j" .. slot5, slot0.jettonLayer["j" .. slot5])
	end

	for slot5 = 1, slot1, 1 do
		slot8 = slot0.jettonLayer["j" .. slot5]

		slot0.jettonLayer["j" .. slot5].stopAllActions("j" .. slot5)

		slot9 = slot0.jettonPos[slot5]

		slot0.jettonLayer["j" .. slot5].setPosition("j" .. slot5, slot0.jettonLayer["j" .. slot5])

		slot9 = 255

		slot0.jettonLayer["j" .. slot5].setOpacity("j" .. slot5, slot0.jettonLayer["j" .. slot5])

		slot9 = 0

		slot0.jettonLayer["j" .. slot5].setRotation("j" .. slot5, slot0.jettonLayer["j" .. slot5])

		slot9 = true

		slot0.jettonLayer["j" .. slot5].setVisible("j" .. slot5, slot0.jettonLayer["j" .. slot5])
	end

	slot5 = slot1 + 1

	slot0.doLastJettonAction(slot3, slot0)

	slot8 = slot0.toolLayer.addTip
	slot5 = (slot0.startPos.y + slot0._barSize.height * slot0._percentFloat) - slot0.toolLayer.addTip.getContentSize(slot0._percentFloat).height / 2

	slot0.toolLayer.addTip.setPositionY(slot3, slot0.toolLayer.addTip)

	if slot0._percentFloat >= 1 then
		slot7 = sp.EventType.ANIMATION_COMPLETE

		slot0.allinSpine.registerSpineEventHandler(slot4, slot0.allinSpine, slot2)

		slot8 = false

		slot0.allinSpine.setAnimation(slot4, slot0.allinSpine, 0, "start")

		slot6 = true

		slot0.allinSpine.setVisible(slot4, slot0.allinSpine)
	else
		slot5 = false

		slot0.allinSpine.setVisible(slot3, slot0.allinSpine)
	end

	if slot0.callBack ~= nil then
		slot0.callBack()
	end
end

DzpkSlider.doLastJettonAction = function (slot0, slot1)
	if slot1 > 34 then
		return
	end

	if slot0.jettonLayer["j" .. slot1] ~= nil then
		slot5 = slot2

		slot2.stopAllActions(slot4)

		slot6 = slot0.jettonPos[slot1].y + 50

		slot2.setPositionY(slot4, slot2)

		slot6 = 0

		slot2.setOpacity(slot4, slot2)

		slot6 = true

		slot2.setVisible(slot4, slot2)

		slot6 = 60

		slot2.setRotation(slot4, slot2)

		slot7 = 255
		slot7 = 0.1
		slot11 = slot0.jettonPos[slot1].y + 10
		slot9 = cc.MoveTo.create(cc.FadeTo, cc.MoveTo, cc.p(slot9, slot0.jettonPos[slot1].x))
		slot10 = -20
		slot10 = 0.05
		slot14 = slot0.jettonPos[slot1].y + 20
		slot11 = 0.05
		slot13 = 10
		slot13 = 0.05
		slot15 = 0
		slot15 = 0.05
		slot19 = slot0.jettonPos[slot1].y
		slot17 = cc.MoveTo.create(cc.RotateTo, cc.MoveTo, cc.p(slot0.jettonPos[slot1].y + 5, slot0.jettonPos[slot1].x))
		slot16 = slot2
		slot27 = nil

		slot2.runAction(cc.Spawn, cc.Sequence.create(slot0.jettonPos[slot1].x, cc.Sequence, cc.Spawn.create(cc.MoveTo, cc.Spawn, slot3), cc.RotateTo.create(cc.Spawn, cc.RotateTo, 0.05), cc.MoveTo.create(cc.RotateTo, cc.MoveTo, cc.p(slot12, slot0.jettonPos[slot1].x)), cc.MoveTo.create(cc.MoveTo, cc.MoveTo, cc.p(slot0.jettonPos[slot1].x, slot0.jettonPos[slot1].x)), cc.RotateTo.create(cc.MoveTo, cc.RotateTo, 0.05), cc.MoveTo.create(cc.RotateTo, cc.MoveTo, cc.p(slot0.jettonPos[slot1].y, slot0.jettonPos[slot1].x)), cc.Spawn.create(cc.MoveTo, cc.Spawn, slot11)))
	end
end

DzpkSlider.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.toolLayer.addTip.btn1 then
		slot5 = 1

		slot0.updateAfterClick(slot3, slot0)
	elseif slot1 == slot0.toolLayer.addTip.btn2 then
		slot5 = -1

		slot0.updateAfterClick(slot3, slot0)
	end
end

DzpkSlider.updateAfterClick = function (slot0, slot1)
	if slot0.currentScore == nil or slot0.unScore == nil or slot0.totalScore == nil or slot0.totalScore == 0 then
		return
	end

	slot0.currentScore = slot0.currentScore + slot1 * slot0.unScore

	if slot0.totalScore < slot0.currentScore then
		slot0.currentScore = slot0.totalScore
	elseif slot0.currentScore < slot0.minValue then
		slot0.currentScore = slot0.minValue
	end

	slot5 = slot0.currentScore / slot0.totalScore

	slot0.setPercentFloat(slot3, slot0)
end

DzpkSlider.resetMin = function (slot0)
	if slot0.direction == 1 then
		slot0.min = slot0._barSize.width * slot0._percentFloat
	elseif slot0.direction == 2 then
		slot0.min = slot0._barSize.height * slot0._percentFloat
	end

	slot0.minValue = slot0._percentFloat * slot0.totalScore
	slot0.currentScore = slot0.minValue

	if slot0.bgSpine ~= nil then
		slot6 = true

		slot0.bgSpine.setAnimation(slot2, slot0.bgSpine, 0, "animation")

		slot4 = true

		slot0.bgSpine.setVisible(slot2, slot0.bgSpine)
	end
end

DzpkSlider.setUnScore = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if tonumber(slot3) == nil then
			return
		end
	end

	slot0.unScore = slot1
end

DzpkSlider.setTotalScore = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if tonumber(slot3) == nil then
			return
		end
	end

	slot0.totalScore = slot1
end

DzpkSlider.updateTip = function (slot0, slot1)
	if slot1 ~= nil then
		slot4 = slot1

		if tonumber(slot3) == nil then
			return
		end
	end

	slot0.currentScore = slot1
	slot5 = slot1

	slot0.toolLayer.addTip.jettonTxt.setString(slot3, slot0.toolLayer.addTip.jettonTxt)
end

DzpkSlider.setCallBack = function (slot0, slot1)
	slot0.callBack = slot1
end

DzpkSlider.reset = function (slot0)
	slot0._percentFloat = 0
	slot3 = slot0

	slot0.onPercentFloatChanged(slot2)

	for slot4 = 1, 34, 1 do
		slot7 = slot0.jettonLayer["j" .. slot4]

		slot0.jettonLayer["j" .. slot4].stopAllActions("j" .. slot4)

		slot8 = false

		slot0.jettonLayer["j" .. slot4].setVisible("j" .. slot4, slot0.jettonLayer["j" .. slot4])

		slot8 = slot0.jettonPos[slot4]

		slot0.jettonLayer["j" .. slot4].setPosition("j" .. slot4, slot0.jettonLayer["j" .. slot4])
	end
end

DzpkSlider.destroy = function (slot0)
	slot3 = slot0.btn

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.btn

	slot0.btn.destroy(slot2)
end

return
