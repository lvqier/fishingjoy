ResFontTxt = ClassUtil.class("ResFontTxt")

ResFontTxt.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	assert(slot1 ~= nil, "resFontKey must not be nil !!")

	slot0.resFontKey = slot1
	slot0.alignMode = slot2 or 1
	slot0.hGap = slot3 or 3
	slot0.fScale = slot4 or 1
	slot0.opacity = slot5 or 255
	slot0.isVisible = true
	slot0.fontDic = {}
	slot0.otherFontDic = {}
	slot0.charsPosition = {}
	slot0.chars = {}
	slot0.txt = ""
	slot0.positionX = 0
	slot0.positionY = 0
	slot0.parent = nil
	slot0.resExtention = ""
	slot0.digitZorder = 0
	slot0._textWidth = 0

	createSetterGetter(slot0, "extentionStr", "")
	slot0:pushFontResWithChar("0", "0")
	slot0:pushFontResWithChar("1", "1")
	slot0:pushFontResWithChar("2", "2")
	slot0:pushFontResWithChar("3", "3")
	slot0:pushFontResWithChar("4", "4")
	slot0:pushFontResWithChar("5", "5")
	slot0:pushFontResWithChar("6", "6")
	slot0:pushFontResWithChar("7", "7")
	slot0:pushFontResWithChar("8", "8")
	slot0:pushFontResWithChar("9", "9")
end

ResFontTxt.pushFontResWithChar = function (slot0, slot1, slot2)
	slot0.fontDic[slot1] = slot2
end

ResFontTxt.pushOtherFontResWithChar = function (slot0, slot1, slot2)
	slot0.otherFontDic[slot1] = slot2
end

ResFontTxt.setTxt = function (slot0, slot1, slot2)
	if slot0.txt ~= slot1 or slot2 then
		slot0.txt = slot1

		slot0:updateView()
	end
end

ResFontTxt.setParent = function (slot0, slot1)
	if slot1 ~= slot0.parent then
		slot0.parent = slot1

		for slot6 = 1, #slot0.chars, 1 do
			slot0.chars[slot6].removeFromParent(slot7)
			slot0.parent:addChild(slot0.chars[slot6])
		end
	end
end

ResFontTxt.setIsVisible = function (slot0, slot1)
	if slot0.isVisible ~= slot1 then
		slot0.isVisible = slot1

		for slot5 = 1, #slot0.chars, 1 do
			slot0.chars[slot5]:setVisible(slot1)
		end
	end
end

ResFontTxt.setOpacity = function (slot0, slot1)
	if slot0.getOpacity() ~= slot1 then
		slot0:setOpacity(slot1)

		for slot5 = 1, #slot0.chars, 1 do
			slot0.chars[slot5]:setOpacity(slot1)
		end
	end
end

ResFontTxt.setAlignMode = function (slot0, slot1)
	if slot0.alignMode ~= slot1 then
		slot0.alignMode = slot1

		slot0:updatePosition()
	end
end

ResFontTxt.setPositionXY = function (slot0, slot1, slot2)
	if slot0.positionX ~= slot1 or slot0.positionY ~= slot2 then
		slot0.positionX = slot1
		slot0.positionY = slot2

		slot0:updatePosition()
	end
end

ResFontTxt.setHGap = function (slot0, slot1)
	if slot0.hGap ~= slot1 then
		slot0.hGap = slot1

		slot0:updatePosition()
	end
end

ResFontTxt.setScale = function (slot0, slot1)
	if slot0.fScale ~= slot1 then
		slot0.fScale = slot1

		slot0:updatePosition()
	end
end

ResFontTxt.updateView = function (slot0)
	slot2 = 0
	slot3 = 0

	if #slot0.txt > 0 then
		for slot7 = 1, slot1, 1 do
			assert((slot0.fontDic[string.sub(slot0.txt, slot7, slot7)] and slot0.resFontKey .. slot9) or slot0.otherFontDic[slot8], "total string is:" .. tostring(slot0.txt) .. ",you must make config in font dic first! The char is: " .. tostring(slot8))

			slot10 = (slot0.fontDic[string.sub(slot0.txt, slot7, slot7)] and slot0.resFontKey .. slot9) or slot0.otherFontDic[slot8]
			slot11 = slot0._extentionStr or ""
			slot10 = nil
			slot11 = resMgr:getTpFrame(slot9 .. slot0.resExtention)

			if slot7 <= #slot0.chars then
				slot0.chars[slot7]:setSpriteFrame(slot11)
			else
				display.newSprite(slot11).retain(slot10)
				table.insert(slot0.chars, display.newSprite(slot11))
			end

			slot10:setLocalZOrder(slot0.digitZorder)
			slot10:setVisible(slot0.isVisible)
			slot10:setScale(slot0.fScale)

			slot12 = slot10:getContentSize().width

			if slot7 ~= 1 then
				slot2 = slot2 + slot12 * 0.5
				slot3 = slot3 + slot12
			end

			slot10:setPosition(slot0.positionX + slot2, slot0.positionY)

			slot2 = slot2 + slot12 * 0.5 + slot0.hGap
		end

		slot4 = 0
		slot4 = (slot0.alignMode == 1 and (slot3 + slot0.hGap * (slot1 - 1)) * 0.5) or (slot0.alignMode == 0 and 0) or slot3 + slot0.hGap * (slot1 - 1)
		slot0.charsPosition = {}
		slot6 = 1

		for slot10 = 1, #slot0.chars, 1 do
			slot11 = slot0.chars[slot6]

			if slot6 <= slot1 then
				slot11:setPositionX(slot11:getPositionX() - slot4)
				table.insert(slot0.charsPosition, slot11:getPosition())

				if not slot11:getParent() and slot0.parent then
					slot0.parent:addChild(slot11)
				end
			else
				slot11:removeFromParent()
				slot11:release()
				table.remove(slot0.chars, slot6)

				slot6 = slot6 - 1
			end

			slot6 = slot6 + 1
		end
	else
		slot0:clearTxt()
	end

	slot0._textWidth = slot3
end

ResFontTxt.updatePosition = function (slot0)
	slot0.charsPosition = {}
	slot2 = 0
	slot3 = 0

	for slot7 = 1, #slot0.chars, 1 do
		slot0.chars[slot7].removeFromParent(slot8)
		slot0.parent:addChild(slot8)
		slot0.chars[slot7].setScale(slot8, slot0.fScale)

		slot9 = slot0.chars[slot7].getContentSize(slot8).width * slot0.fScale

		if slot7 ~= 0 then
			slot2 = slot2 + slot9 * 0.5
			slot3 = slot3 + slot9
		end

		slot8:setPosition(cc.p(slot0.positionX + slot2, slot0.positionY))

		slot2 = slot2 + slot9 * 0.5 + slot0.hGap
	end

	slot4 = 0
	slot4 = (slot0.alignMode == 1 and (slot3 + slot0.hGap * (slot1 - 1)) * 0.5) or (slot0.alignMode == 0 and 0) or slot3 + slot0.hGap * (slot1 - 1)

	for slot8 = 1, slot1, 1 do
		slot0.chars[slot8].setPositionX(slot9, slot0.chars[slot8].getPositionX(slot9) - slot4)
		table.insert(slot0.charsPosition, slot0.chars[slot8]:getPosition())
	end

	slot0._textWidth = slot3
end

ResFontTxt.getTextWidth = function (slot0)
	return slot0._textWidth
end

ResFontTxt.clearTxt = function (slot0)
	slot0.txt = ""

	for slot4, slot5 in ipairs(slot0.chars) do
		slot5:removeFromParent()
		slot5:release()
	end

	slot0.charsPosition = {}
	slot0.chars = {}
end

ResFontTxt.destroy = function (slot0)
	slot0:clearTxt()
end

return
