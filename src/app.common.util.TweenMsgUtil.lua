TweenMsgUtil = {}

TweenMsgUtil.showRedMsg = function (slot0, slot1, slot2, slot3, slot4)
	slot11 = slot4

	TweenMsgUtil.showMsg(slot6, slot0, slot1, HTML_COLOR_RED, slot3)
end

TweenMsgUtil.showGreenMsg = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot14 = slot5

	TweenMsgUtil.showMsg(slot7, slot0, slot1, HTML_COLOR_GREEN, slot2, slot3, slot4)
end

TweenMsgUtil.showMsg2 = function (slot0, slot1, slot2, slot3)
	slot9 = 500
	slot4 = TextField.new(slot5, nil, slot1, nil)
	slot8 = true

	slot4.setIsAssetVCenter(nil, slot4)

	slot8 = TextField.TYPE_CHAR_BY_CHAR

	slot4.setType(nil, slot4)

	slot8 = slot0

	slot4.setHtmlText(nil, slot4)

	slot11 = slot4

	slot4.setPosition(nil, slot4, slot2.x - slot4.getTextWidth(slot10) * 0.5)

	slot10 = uiMgr
	slot9 = true

	DisplayUtil.setAddOrRemoveChild(nil, slot4, uiMgr.getTopLayerInAllScene(slot2.y))

	slot6 = TimelineLite.new(slot4)
	slot10 = slot4.getUnits({
		onComplete = function ()
			slot2 = slot0

			slot0.destroy(slot1)
		end
	})

	for slot11, slot12 in ipairs(slot4) do
		slot16 = 0

		slot12.setOpacity(slot14, slot12)

		slot13 = TimelineLite.new()
		slot16 = slot13
		slot21 = {
			autoAlpha = 1,
			y = tostring(slot23),
			ease = Back.easeOut
		}
		slot24 = slot3

		slot13.append(slot12, TweenLite.to(slot18, slot12, 0.3))

		slot21 = {
			autoAlpha = 0,
			y = tostring(slot23),
			ease = Back.easeIn
		}
		slot24 = slot3
		slot18 = 1

		slot13.append(slot12, slot13, TweenLite.to(slot18, slot12, 0.2))

		slot18 = slot11 * 0.05

		slot6.insert(slot12, slot6, slot13)
	end
end

TweenMsgUtil.showMsg = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot5 = slot5 or 0.5
	slot14 = TextField.H_CENTER
	slot7 = TextField.new(slot8, CCSKitchen.defaultFontFamily, slot1, slot2, 500, nil)
	slot11 = slot0

	slot7.setHtmlText(CCSKitchen.defaultFontFamily, slot7)

	slot14 = slot7
	slot12 = slot3.y

	slot7.setPosition(CCSKitchen.defaultFontFamily, slot7, slot3.x - slot7.getWidth(nil) * 0.5)

	slot11 = 0

	slot7.setOpacity(CCSKitchen.defaultFontFamily, slot7)

	if slot6 then
		slot12 = true

		DisplayUtil.setAddOrRemoveChild(slot9, slot7, slot6)
	else
		slot13 = uiMgr
		slot12 = true

		DisplayUtil.setAddOrRemoveChild(slot9, slot7, uiMgr.getTopLayerInAllScene(slot12))
	end

	slot8 = TimelineLite.new()
	slot12 = slot8
	slot17 = {}

	slot8.append(slot11, TweenLite.to(slot14, slot7, slot5))

	slot12 = slot8
	slot17 = {
		alpha = 1,
		delay = 0.2
	}

	slot8.append(slot11, TweenLite.to(slot14, slot7, 0.1))

	slot12 = slot8
	slot17 = {
		alpha = 0,
		delay = 0.2,
		y = slot4,
		onComplete = function ()
			slot2 = slot0

			slot0.destroy(slot1)
		end,
		ease = Quad.easeIn
	}

	slot8.append(slot11, TweenLite.to(slot14, slot7, 1))

	return slot8
end

TweenMsgUtil.showArrMsg = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = TimelineLite.new()
	slot11 = slot1

	for slot12, slot13 in pairs(slot10) do
		slot22 = slot7
		slot18 = TweenMsgUtil.showMsg(slot15, slot13, slot2, slot3, slot4, slot5, slot6[slot12])

		slot8.insert(slot13, slot8)
	end
end

return
