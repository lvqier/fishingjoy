function slot3()
	slot2 = cc.Node

	return cc.Node.create(slot1)
end

slot0 = class(slot1, "TexturedNumber")
slot0.TEMPLATE_POS = 1

slot0.ctor = function (slot0)
	slot4 = true

	slot0.setCascadeOpacityEnabled(slot2, slot0)

	slot0.__textureSet = {}
	slot0.__currentNumber = 0
	slot0.__workingSprites = {
		size = 0
	}
	slot0.__usedSize = 0
	slot0.__hasTexture = false
	slot0.__willSeperate = true
	slot0.__limitTrigger = 0
	slot3 = cc.Node
	slot0.__spriteContainer = cc.Node.create(slot2)
	slot4 = true

	slot0.__spriteContainer.setCascadeOpacityEnabled(slot2, slot0.__spriteContainer)

	slot4 = slot0.__spriteContainer

	slot0.addChild(slot2, slot0)

	slot0.defaultSizeFix = {
		0,
		0
	}
	slot0.defaultPositionFix = {
		0,
		0
	}
	slot0._splited = {}
end

slot0.setTextureSet = function (slot0, slot1)
	slot0.__textureSet = slot1
	slot4 = slot0

	slot0.doLayout(slot3)
end

slot0.setLimitTrigger = function (slot0, slot1)
	slot0.__limitTrigger = slot1
end

slot0.ensureWorkingCapacity = function (slot0, slot1)
	if slot0.__workingSprites.size < slot1 then
		for slot5 = slot0.__workingSprites.size + 1, slot1, 1 do
			if slot0.__textureSet.textureType == 1 then
				slot9 = cc.Sprite
				slot0.__workingSprites[slot5] = cc.Sprite.create(slot8)

				if cc.Node.setCullFace then
					slot9 = true

					slot0.__workingSprites[slot5].setCullFace(slot7, slot0.__workingSprites[slot5])
				end
			elseif slot0.__textureSet.textureType == 2 then
				slot11 = slot0.__textureSet.atlasFileName
				slot0.__workingSprites[slot5] = sp.SkeletonAnimation.create(slot8, sp.SkeletonAnimation, slot0.__textureSet.jsonFileName)
			else
				slot8 = false

				assert(slot7)
			end

			slot9 = false

			slot0.__workingSprites[slot5].setVisible(slot7, slot0.__workingSprites[slot5])

			slot9 = true

			slot0.__workingSprites[slot5].setCascadeOpacityEnabled(slot7, slot0.__workingSprites[slot5])

			slot9 = slot0.__workingSprites[slot5]

			slot0.__spriteContainer.addChild(slot7, slot0.__spriteContainer)
		end

		slot0.__workingSprites.size = slot1
	end
end

slot0.setNumber = function (slot0, slot1)
	slot0.__currentNumber = slot1
	slot4 = slot0

	slot0.doLayout(slot3)
end

slot0.split = function (slot0, slot1)
	slot4 = slot1
	slot5 = (tonumber(slot3) and slot1) or 0

	return slot0.splitNumber(slot3, slot0)
end

slot0.setUseDecimalInBillion = function (slot0, slot1)
	slot0._useDecimalInBillion = slot1
end

slot0.splitNumber = function (slot0, slot1)
	slot2 = 1
	splited = slot0._splited

	if slot0.__useUnit and slot0.__limitTrigger <= slot1 then
		slot5 = slot1 / 100000000

		if math.floor(slot4) > 0 then
			splited[slot2] = "y"
			slot2 = slot2 + 1

			if slot0._useDecimalInBillion then
				slot3 = slot1 % 100000000
				splited[slot2] = math.floor(slot7)
				slot9 = (slot1 / 1000000 / 10) % 10
				splited[slot2 + 1] = math.floor((slot1 / 1000000) % 10)
				splited[slot2 + 2] = "."
				slot2 = slot2 + 3
			end

			slot1 = slot1 / 100000000
		end

		slot5 = slot1 / 10000

		if math.floor(slot4) > 0 then
			splited[slot2] = "w"
			slot2 = slot2 + 1
			slot1 = slot1 / 10000
		end
	end

	slot6 = slot1 % 10
	splited[slot2] = math.floor(slot5)
	slot2 = slot2 + 1
	slot5 = slot1 / 10
	slot1 = math.floor(math.floor(slot5))

	while slot1 > 0 do
		if slot0.__willSeperate then
			slot5 = slot2 % 4

			if math.floor(slot4) == 0 then
				splited[slot2] = ","
				slot2 = slot2 + 1
			end
		end

		slot6 = slot1 % 10
		splited[slot2] = math.floor(slot5)
		slot2 = slot2 + 1
		slot5 = slot1 / 10
		slot1 = math.floor(math.floor(slot5))
	end

	splited.size = slot2 - 1

	return splited
end

slot0.doLayout = function (slot0)
	slot4 = slot0.__currentNumber
	slot5 = slot0.split(slot2, slot0).size

	slot0:ensureWorkingCapacity(slot0)

	for slot5 = 1, slot0.__workingSprites.size, 1 do
		slot9 = false

		slot0.__workingSprites[slot5].setVisible(slot7, slot0.__workingSprites[slot5])
	end

	slot2 = 0
	slot3 = 0

	for slot7 = slot1.size, 1, -1 do
		if not slot0.__textureSet[slot1[slot7]] then
			slot10 = "Error Occured While Parsing!"

			print(slot9)

			slot10 = slot1[slot7]

			print(slot9)

			slot1[slot7] = ","
		end

		slot8 = slot0.__textureSet[slot1[slot7]].texture or ""
		slot9 = slot0.__textureSet[slot1[slot7]].sizeFix or slot0.defaultSizeFix
		slot10 = slot0.__textureSet[slot1[slot7]].positionFix or slot0.defaultPositionFix
		slot12 = slot0.__workingSprites[slot7].getContentSize(slot13)
		slot16 = true

		slot0.__workingSprites[slot7]:setVisible(slot0.__workingSprites[slot7])

		if slot0.__textureSet.textureType == 1 then
			slot16 = slot8

			slot11.setTexture(slot14, slot11)

			slot15 = slot11
			slot12 = slot11.getContentSize(slot14)
		elseif slot0.__textureSet.textureType == 2 then
			slot16 = slot0.__textureSet.textureHeight
			slot12 = cc.size(slot14, slot0.__textureSet.textureWidth)
			slot16 = slot8

			slot11.setSkin(slot14, slot11)
		else
			slot15 = false

			assert(slot14)
		end

		slot12.width = slot12.width + slot9[1]
		slot12.height = slot12.height + slot9[2]

		if slot2 < slot12.height then
			slot2 = slot12.height
		end

		slot17 = slot2 / 2 + slot10[2]

		slot11.setPosition(slot14, slot11, slot3 + slot12.width / 2 + slot10[1])

		slot3 = slot3 + slot12.width
	end

	slot6 = slot0
	slot10 = slot2

	slot0.setContentSize(slot5, cc.size(slot8, slot3))

	slot0.__usedSize = slot1.size
end

slot0.enableSeperator = function (slot0)
	slot0.__willSeperate = true
end

slot0.disableSeperator = function (slot0)
	slot0.__willSeperate = false
end

slot0.enableUnit = function (slot0)
	slot0.__useUnit = true
end

slot0.disableUnit = function (slot0)
	slot0.__useUnit = false
end

slot0.onDestroy = function (slot0)
	slot0.__textureSet = nil

	for slot4 = 1, slot0.__workingSprites.size, 1 do
		slot7 = slot0.__workingSprites[slot4]

		slot0.__workingSprites[slot4].removeFromParent(slot6)

		slot0.__workingSprites[slot4] = nil
	end

	slot0.__workingSprites = nil
	slot3 = slot0.__spriteContainer

	slot0.__spriteContainer.removeFromParent(slot2)

	slot0.__spriteContainer = nil
	slot0.defaultSizeFix = nil
	slot0.defaultPositionFix = nil
	slot0._splited = nil
end

return slot0
