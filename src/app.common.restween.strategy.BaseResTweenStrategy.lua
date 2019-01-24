slot2 = "BaseResTweenStrategy"
BaseResTweenStrategy = class(slot1)
slot0 = nil

BaseResTweenStrategy.ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot12 = true

	createSetterGetter(slot6, slot0, "resAddPane", nil, false, false)

	slot13 = false
	slot17 = slot0.onHoldChanged

	createSetterGetter(slot6, slot0, "isHold", false, false, false, false, handler(slot15, slot0))

	if not slot0 then
		slot0[ResType.money] = "effect/goldfly.mp3"
		slot0[ResType.food] = "effect/canfly.mp3"
		slot0[ResType.drug] = "effect/drugfly.mp3"
		slot0[ResType.knowledge] = "effect/ITfly.mp3"
		({})[ResType.steel] = "effect/steelfly.mp3"
	end

	slot0._resType = slot4
	slot0._resGetter = slot1
	slot0._resChangedSignal = slot2
	slot0._resIconNameOrSpriteFrame = slot3
	slot0._triggerPosesCache = {}
	slot0._tempResPanes = {}
	slot0._curHeroResNum = nil
	slot0._holdValue = 0
	slot0._maxIconNum = 5
end

BaseResTweenStrategy.setPaneIsHold = function (slot0, slot1, slot2)
	if slot1.setIsHoldChange then
		slot6 = slot2

		slot1.setIsHoldChange(slot4, slot1)
	end
end

BaseResTweenStrategy.removeTempResPane = function (slot0, slot1)
	slot6 = false

	slot0.setPaneIsHold(slot3, slot0, slot1)

	slot5 = slot1

	table.removebyvalue(slot3, slot0._tempResPanes)
end

BaseResTweenStrategy.pushTempResPane = function (slot0, slot1)
	slot6 = true

	TableUtil.push(slot3, slot0._tempResPanes, slot1)
end

BaseResTweenStrategy.getResIconRes = function (slot0)
	return slot0._resIconNameOrSpriteFrame
end

BaseResTweenStrategy.getHeroResChangedSignal = function (slot0)
	return slot0._resChangedSignal
end

BaseResTweenStrategy.getHeroResNum = function (slot0)
	return slot0._resGetter()
end

BaseResTweenStrategy.deploy = function (slot0)
	slot3 = slot0
	slot5 = slot0

	slot0.getHeroResChangedSignal(slot2).add(slot2, slot0.getHeroResChangedSignal(slot2), slot0.onHeroResChanged)

	slot3 = slot0

	slot0.onHeroResChanged(slot2)
end

BaseResTweenStrategy.onHeroResChanged = function (slot0)
	if not slot0._curHeroResNum then
		slot3 = slot0
		slot0._curHeroResNum = slot0.getHeroResNum(slot2)
	end

	slot3 = slot0
	slot2 = slot0.getHeroResNum(slot2) - slot0._curHeroResNum
	slot0._curHeroResNum = slot0.getHeroResNum(slot2)

	if slot0._isHold then
		slot0._holdValue = slot0._holdValue + slot2
	else
		slot6 = slot2

		slot0.showResChanged(slot4, slot0)
	end
end

BaseResTweenStrategy.onHoldChanged = function (slot0)
	if slot0._isHold then
		slot0._holdValue = 0
	else
		slot4 = slot0._holdValue

		slot0.showResChanged(slot2, slot0)

		slot0._holdValue = 0
	end

	if slot0._resAddPane then
		slot5 = slot0._isHold

		slot0.setPaneIsHold(slot2, slot0, slot0._resAddPane)
	end

	slot3 = slot0._tempResPanes

	for slot4, slot5 in ipairs(slot2) do
		slot10 = slot0._isHold

		slot0.setPaneIsHold(slot7, slot0, slot5)
	end
end

BaseResTweenStrategy.getResAddPane = function (slot0)
	slot1 = slot0._resAddPane

	if #slot0._tempResPanes > 0 then
		slot1 = slot0._tempResPanes[#slot0._tempResPanes]
	end

	return slot1
end

BaseResTweenStrategy.resetData = function (slot0)
	slot3 = slot0
	slot0._curHeroResNum = slot0.getHeroResNum(slot2)
	slot0._holdValue = 0
end

BaseResTweenStrategy.clearTriggers = function (slot0)
	slot0._triggerPosesCache = {}
end

BaseResTweenStrategy.removeTrigger = function (slot0, slot1)
	slot4 = slot0._triggerPosesCache

	for slot5, slot6 in ipairs(slot3) do
		if slot6.target == slot1 then
			slot10 = slot5

			table.remove(slot8, slot0._triggerPosesCache)

			break
		end
	end
end

BaseResTweenStrategy.pushTrigger = function (slot0, slot1)
	if slot1 then
		slot7 = slot1
		slot7 = slot1
		slot10 = 0 + slot1.getContentSize(slot1:getAnchorPoint().x).height * slot1:getAnchorPoint().y
		slot1.convertToWorldSpace(slot1.getAnchorPoint().y, cc.p(slot8, 0 + slot1.getContentSize(slot5).width * slot1.getAnchorPoint().x)).target = slot1
		slot8 = slot1.convertToWorldSpace(slot1.getAnchorPoint().y, cc.p(slot8, 0 + slot1.getContentSize(slot5).width * slot1.getAnchorPoint().x))

		table.insert(slot1, slot0._triggerPosesCache)
	end
end

BaseResTweenStrategy.resetState4Relogin = function (slot0)
	slot0._curHeroResNum = nil
	slot0._holdValue = 0
	slot4 = false

	slot0.setIsHold(slot2, slot0)

	slot0._tempResPanes = {}
end

BaseResTweenStrategy.showResChanged = function (slot0, slot1)
	slot4 = slot0

	if slot0.getResAddPane(slot3) and slot1 > 0 then
		slot9 = 0
		slot3 = slot2.zoomLayer.convertToWorldSpace(slot4, cc.p(slot7, 0))
		slot4 = math.min(slot2.zoomLayer, slot1)
		slot5 = display.newNode()
		slot8 = slot0._triggerPosesCache

		if not TableUtil.shift(slot0._maxIconNum) then
			slot10 = display.cy
			slot6 = cc.p(slot8, display.cx)
		end

		slot10 = slot6

		slot5.setPosition(slot8, slot5)

		if slot0._resType == ResType.diamond then
			slot10 = ZORDER_TWEEN_RES + 1

			slot5.setLocalZOrder(slot8, slot5)
		else
			slot10 = ZORDER_TWEEN_RES

			slot5.setLocalZOrder(slot8, slot5)
		end

		slot12 = uiMgr

		DisplayUtil.setAddOrRemoveChild(slot8, slot5, uiMgr.getTopLayerInAllScene(true))

		slot10 = slot3
		slot7 = slot5.convertToNodeSpace(slot8, slot5)
		slot11 = 0
		slot8 = cc.p(slot5, 0)

		function slot9(slot0)
			slot3 = slot0

			slot0.playResSoundEffect(slot2)

			slot3 = slot0

			slot0.removeFromParent(slot2)

			if slot0.removeFromParent.getIcon then
				slot1 = slot1.getIcon(slot2)
				slot4 = slot1

				TweenLite.killTweensOf(slot1)

				slot5 = slot1._orgScale

				slot1:setScale(slot1)

				slot6 = {
					yoyo = true,
					repeatCount = 1,
					scale = 1.3 * slot1._orgScale
				}

				TweenMax.to(slot1, slot1, 0.05)
			end
		end

		slot11 = slot4 or slot0._maxIconNum
		slot14 = {
			onComplete = function ()
				slot2 = slot0

				slot0.removeFromParent(slot1)
			end
		}
		slot12 = TimelineLite.new(slot13)
		slot13 = 1

		for slot17 = 1, slot11, 1 do
			slot22 = slot0
			slot18 = display.newSprite(slot0.getResIconRes(slot21))
			slot22 = slot8

			slot18.setPosition(slot0.getResIconRes, slot18)

			slot22 = slot18

			slot5.addChild(slot0.getResIconRes, slot5)

			slot22 = 200
			slot19 = math.random(slot0.getResIconRes, 30)

			if math.random() > 0.5 then
				slot19 = -slot19
			end

			slot24 = 0.1
			slot25 = slot19
			slot26 = 0.8

			slot18.setScale(slot7.y, slot18)

			slot26 = false

			slot18.setVisible(slot7.y, slot18)

			slot26 = 0

			slot18.setOpacity(slot7.y, slot18)

			slot23 = math.random(slot7.y, 0) / 100
			slot24 = TimelineLite.new()
			slot27 = slot24
			slot36 = 70
			slot36 = 5
			slot36 = 20

			slot24.append(50, TweenLite.to(slot29, slot18, 0.3))

			slot27 = slot24
			slot34 = 100
			slot32 = {
				orientToBezier = false,
				delay = 0.5,
				bezier = {
					{
						x = BaseResTweenStrategy.calBezier(slot8, slot8, slot20).x,
						y = BaseResTweenStrategy.calBezier(slot8, slot8, slot20).y
					},
					{
						x = slot7.x,
						y = slot7.y
					}
				},
				ease = Cubic.easeIn,
				onComplete = slot9,
				onCompleteParams = {
					slot18
				}
			}

			slot24.insert(50, TweenMax.to(slot29, slot18, math.random({
				autoAlpha = 1,
				y = math.random(slot34, 50),
				x = slot13 * math.random(slot34, 0),
				delay = math.random(slot34, 0) / 100
			}, 80) / 100))

			slot28 = slot24

			slot12.insert(50, slot12)

			slot13 = -slot13
		end
	end
end

BaseResTweenStrategy.playResSoundEffect = function (slot0)
	if slot0._resType and not isAndroid and slot0[slot0._resType] then
		slot5 = slot0._clickSoundName or SOUND_DEFINE.BTN_DEFAULT

		audioMgr.playGameEffect(slot3, audioMgr)
	end
end

BaseResTweenStrategy.calBezier = function (slot0, slot1, slot2)
	slot9 = slot1
	slot6 = slot1
	slot10 = slot2

	return cc.pAdd(slot0, cc.pMul(cc.pRotateByAngle(slot4, slot0, slot1), cc.pNormalize(cc.pSub(math.pi * 0.5, cc.pRotateByAngle(slot4, slot0, slot1)))))
end

BaseResTweenStrategy.destroy = function (slot0)
	slot3 = slot0

	if slot0.getHeroResChangedSignal(slot2) then
		slot3 = slot0
		slot5 = slot0

		slot0.getHeroResChangedSignal(slot2).remove(slot2, slot0.getHeroResChangedSignal(slot2), slot0.onHeroResChanged)
	end
end

return
