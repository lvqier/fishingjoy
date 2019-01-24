slot2 = "BasePukeCcsPane"
BasePukeCcsPane = class(slot1)

BasePukeCcsPane.onCreationComplete = function (slot0)
	slot4 = BaseCcsBtn

	ClassUtil.extends(slot2, slot0)

	slot13 = slot0.onBackTypeChanged

	createSetterGetter(slot2, slot0, "backType", 2, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onDataIntChanged

	createSetterGetter(slot2, slot0, "dataInt", nil, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onIsShowingBackChanged

	createSetterGetter(slot2, slot0, "isShowingBack", false, nil, nil, nil, handler(slot11, slot0))

	slot5 = false

	createSetterGetter(slot2, slot0, "isPlayFlipAnimate")

	slot5 = nil

	createSetterGetter(slot2, slot0, "flipCardCallBack")

	if slot0.layerBack.spBgSmall then
		slot0._sizeStr = "small"
		slot0._spBg = slot0.layerBack.spBgSmall
	elseif slot0.layerBack.spBgBig then
		slot0._sizeStr = "big"
		slot0._spBg = slot0.layerBack.spBgBig
	elseif slot0.layerBack.spBgXl then
		slot0._sizeStr = "xl"
		slot0._spBg = slot0.layerBack.spBgXl
	end

	slot4 = false

	slot0.setTouchEnabled(slot2, slot0)

	slot3 = slot0

	slot0.onIsShowingBackChanged(slot2)
end

BasePukeCcsPane.onClick = function (slot0)
	slot6 = 0.6

	slot0.flipCard(slot2, slot0, nil, not slot0._isShowingBack)
end

BasePukeCcsPane.onIsShowingBackChanged = function (slot0)
	if slot0._isPlayFlipAnimate then
		slot1 = slot0._dutationTime or 0.6
		slot1 = slot1 / 2
		slot2, slot3, slot4 = nil

		if slot0._flipCardCallBack then
			slot8 = slot0._flipCardCallBack
			slot2 = cc.CallFunc.create(slot6, cc.CallFunc)
		end

		if slot0._isShowingBack then
			slot3 = slot0.layerBack
			slot4 = slot0.layerFront
		else
			slot3 = slot0.layerFront
			slot4 = slot0.layerBack
		end

		slot14 = 0
		slot11 = cc.Show
		slot10 = cc.OrbitCamera.create(slot6, cc.OrbitCamera, slot1, 1, 0, 270, 90, 0)
		slot11 = cc.Sequence.create(cc.OrbitCamera, cc.Sequence, cc.Show.create(0))
		slot11 = slot4
		slot18 = cc.Hide
		slot18 = slot2

		slot4.runAction(cc.OrbitCamera, cc.Sequence.create(0, cc.Sequence, cc.OrbitCamera.create(cc.TargetedAction, cc.OrbitCamera, slot1, 1, 0, 0, 90, 0), cc.Hide.create(0), cc.TargetedAction.create(cc.Sequence, cc.TargetedAction, slot3)))
	else
		slot4 = not slot0._isShowingBack

		slot0.layerFront.setVisible(slot2, slot0.layerFront)

		slot4 = slot0._isShowingBack

		slot0.layerBack.setVisible(slot2, slot0.layerBack)
	end
end

BasePukeCcsPane.onBackTypeChanged = function (slot0)
	if slot0._backType then
		slot4 = slot0._backType
		slot5 = string.format(slot2, "plist_puke_back_" .. slot0._sizeStr .. "_%d.png")

		slot0._spBg.setSpriteFrame("plist_puke_back_" .. slot0._sizeStr .. "_%d.png", slot0._spBg)
	end
end

BasePukeCcsPane.setBgSpriteFrame = function (slot0, slot1)
	if slot1 == nil or slot1 == "" then
		return
	end

	slot5 = slot1

	slot0._spBg.setTexture(slot3, slot0._spBg)
end

BasePukeCcsPane.onDataIntChanged = function (slot0)
	if slot0._dataInt and slot0._dataInt ~= 0 then
		if slot0._dataInt == POKER_JOKER_BIG then
			slot0._dataInt = PUKE_JOKER_BIG
		elseif slot0._dataInt == POKER_JOKER_SMALL then
			slot0._dataInt = PUKE_JOKER_SMALL
		end

		slot5 = slot0._dataInt ~= PUKE_JOKER_BIG and slot0._dataInt ~= PUKE_JOKER_SMALL

		slot0.layerFront.layerNormal.setVisible(slot3, slot0.layerFront.layerNormal)

		slot5 = not (slot0._dataInt ~= PUKE_JOKER_BIG and slot0._dataInt ~= PUKE_JOKER_SMALL)

		slot0.layerFront.spJoker.setVisible(slot3, slot0.layerFront.spJoker)

		if slot0._dataInt ~= PUKE_JOKER_BIG and slot0._dataInt ~= PUKE_JOKER_SMALL then
			slot5 = slot0._dataInt
			slot9, slot3 = gameMgr.calPukeInfo(slot3, gameMgr)
			slot5 = string.format(slot6, "plist_puke_value_%d_%d.png", slot4)
			slot9 = slot3
			slot6 = string.format("plist_puke_value_%d_%d.png", "plist_puke_color_small_%d.png")

			if slot0._sizeStr == "xl" then
				slot11 = slot2
				slot5 = string.format(slot8, "plist_puke_value_xl_%d_%d.png", slot4)
				slot10 = slot3
				slot6 = string.format(slot8, "plist_puke_color_xl_small_%d.png")
				slot10 = slot3
				slot11 = string.format(slot8, "plist_puke_color_xl_big_%d.png")

				slot0.layerFront.layerNormal.spColorBig.setSpriteFrame("plist_puke_color_xl_big_%d.png", slot0.layerFront.layerNormal.spColorBig)
			elseif slot0._sizeStr == "big" then
				slot10 = slot3
				slot11 = string.format(slot8, "plist_puke_color_big_%d.png")

				slot0.layerFront.layerNormal.spColorBig.setSpriteFrame("plist_puke_color_big_%d.png", slot0.layerFront.layerNormal.spColorBig)
			end

			slot10 = slot5

			slot0.layerFront.layerNormal.spValue.setSpriteFrame(slot8, slot0.layerFront.layerNormal.spValue)

			slot10 = slot6

			slot0.layerFront.layerNormal.spColorSmall.setSpriteFrame(slot8, slot0.layerFront.layerNormal.spColorSmall)
		else
			slot6 = slot0._sizeStr
			slot7 = (slot0._dataInt == PUKE_JOKER_BIG and 1) or 0

			slot0.layerFront.spJoker.setVisible(slot4, slot0.layerFront.spJoker)

			slot6 = string.format(slot4, "plist_puke_joker_%s_%d.png", not slot1)

			slot0.layerFront.spJoker.setSpriteFrame(slot4, slot0.layerFront.spJoker)
		end
	end
end

BasePukeCcsPane.flipCard = function (slot0, slot1, slot2, slot3)
	slot0._isPlayFlipAnimate = true
	slot0._dutationTime = slot3

	slot0._flipCardCallBack = function ()
		slot2 = applyFunction

		applyFunction(slot1)

		slot2 = slot1

		slot1:resetOrbitCamera()

		slot1._flipCardCallBack = nil
		nil._isPlayFlipAnimate = false
	end

	slot8 = true

	slot0.setIsShowingBack(slot5, slot0, (slot2 and true) or false)
end

BasePukeCcsPane.resetOrbitCamera = function (slot0)
	slot10 = 0
	slot4 = slot0.layerFront

	slot0.layerFront.stopAllActions(cc.OrbitCamera)

	slot5 = cc.OrbitCamera.create(slot2, cc.OrbitCamera, 0.0001, 1, 0, 0, 0, 0)

	slot0.layerFront.runAction(cc.OrbitCamera, slot0.layerFront)

	slot11 = 0
	slot5 = slot0.layerBack

	slot0.layerBack.stopAllActions(cc.OrbitCamera)

	slot6 = cc.OrbitCamera.create(cc.OrbitCamera, cc.OrbitCamera, 0.0001, 1, 0, 0, 0, 0)

	slot0.layerBack.runAction(cc.OrbitCamera, slot0.layerBack)
end

return
