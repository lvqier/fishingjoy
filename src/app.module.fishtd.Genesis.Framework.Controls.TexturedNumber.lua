slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = class_C("TexturedNumber", function ()
	return slot0:create()
end)
slot1.TEMPLATE_POS = 1

slot1.ctor = function (slot0)
	slot0.__textureSet = {}
	slot0.__currentNumber = 0
	slot0.__workingSprites = {
		size = 0
	}
	slot0.__usedSize = 0
	slot0.__hasTexture = false
	slot0.__willSeperate = true
	slot0.__limitTrigger = 0
	slot0.__spriteContainer = cc.Node:create()

	slot0.__spriteContainer:setCascadeOpacityEnabled(true)
	slot0:addChild(slot0.__spriteContainer)

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

slot1.setTextureSet = function (slot0, slot1)
	slot0.__textureSet = slot1

	slot0:doLayout()
end

slot1.setLimitTrigger = function (slot0, slot1)
	slot0.__limitTrigger = slot1
end

slot1.ensureWorkingCapacity = function (slot0, slot1)
	if slot0.__workingSprites.size < slot1 then
		for slot5 = slot0.__workingSprites.size + 1, slot1, 1 do
			if slot0.__textureSet.textureType == ENUM.NUMBER_TEXTURE_TYPE.SPRITE then
				slot0.__workingSprites[slot5] = cc.Sprite:create()

				if cc.Node.setCullFace then
					slot0.__workingSprites[slot5]:setCullFace(true)
				end
			elseif slot0.__textureSet.textureType == ENUM.NUMBER_TEXTURE_TYPE.SPINE then
				slot0.__workingSprites[slot5] = sp.SkeletonAnimation:create(slot0.__textureSet.jsonFileName, slot0.__textureSet.atlasFileName)
			else
				assert(false)
			end

			slot0.__workingSprites[slot5]:setVisible(false)
			slot0.__workingSprites[slot5]:setCascadeOpacityEnabled(true)
			slot0.__spriteContainer:addChild(slot0.__workingSprites[slot5])
		end

		slot0.__workingSprites.size = slot1
	end
end

slot1.setNumber = function (slot0, slot1)
	slot0.__currentNumber = slot1

	slot0:doLayout()
end

slot1.split = function (slot0, slot1)
	return slot0:splitNumber((tonumber(slot1) and slot1) or 0)
end

slot1.splitNumber = function (slot0, slot1)
	slot2 = 1
	splited = slot0._splited

	if slot0.__useUnit and slot0.__limitTrigger <= slot1 then
		if math.floor(slot1 / 100000000) > 0 then
			splited[slot2] = "y"
			slot2 = slot2 + 1
			slot1 = slot1 / 100000000
		end

		if math.floor(slot1 / 10000) > 0 then
			splited[slot2] = "w"
			slot2 = slot2 + 1
			slot1 = slot1 / 10000
		end
	end

	splited[slot2] = math.floor(slot1 % 10)
	slot2 = slot2 + 1
	slot1 = math.floor(slot1 / 10)

	while slot1 > 0 do
		if slot0.__willSeperate and math.floor(slot2 % 4) == 0 then
			splited[slot2] = ","
			slot2 = slot2 + 1
		end

		splited[slot2] = math.floor(slot1 % 10)
		slot2 = slot2 + 1
		slot1 = math.floor(slot1 / 10)
	end

	splited.size = slot2 - 1

	return splited
end

slot1.doLayout = function (slot0)
	slot0:ensureWorkingCapacity(slot0:split(slot0.__currentNumber).size)

	for slot5 = 1, slot0.__workingSprites.size, 1 do
		slot0.__workingSprites[slot5]:setVisible(false)
	end

	slot2 = 0
	slot3 = 0

	for slot7 = slot1.size, 1, -1 do
		if not slot0.__textureSet[slot1[slot7]] then
			print("Error Occured While Parsing!")
			print(slot1[slot7])

			slot1[slot7] = ","
		end

		slot8 = slot0.__textureSet[slot1[slot7]].texture or ""
		slot9 = slot0.__textureSet[slot1[slot7]].sizeFix or slot0.defaultSizeFix
		slot10 = slot0.__textureSet[slot1[slot7]].positionFix or slot0.defaultPositionFix
		slot12 = slot0.__workingSprites[slot7].getContentSize(slot11)

		slot0.__workingSprites[slot7].setVisible(slot11, true)

		if slot0.__textureSet.textureType == ENUM.NUMBER_TEXTURE_TYPE.SPRITE then
			slot11:setTexture(slot8)

			slot12 = slot11:getContentSize()
		elseif slot0.__textureSet.textureType == ENUM.NUMBER_TEXTURE_TYPE.SPINE then
			slot12 = cc.size(slot0.__textureSet.textureWidth, slot0.__textureSet.textureHeight)

			slot11:setSkin(slot8)
		else
			assert(false)
		end

		slot12.width = slot12.width + slot9[1]
		slot12.height = slot12.height + slot9[2]

		if slot2 < slot12.height then
			slot2 = slot12.height
		end

		slot11:setPosition(slot3 + slot12.width / 2 + slot10[1], slot2 / 2 + slot10[2])

		slot3 = slot3 + slot12.width
	end

	slot0:setContentSize(cc.size(slot3, slot2))

	slot0.__usedSize = slot1.size
end

slot1.enableSeperator = function (slot0)
	slot0.__willSeperate = true
end

slot1.disableSeperator = function (slot0)
	slot0.__willSeperate = false
end

slot1.enableUnit = function (slot0)
	slot0.__useUnit = true
end

slot1.disableUnit = function (slot0)
	slot0.__useUnit = false
end

slot1.onDestroy = function (slot0)
	slot0.__textureSet = nil

	for slot4 = 1, slot0.__workingSprites.size, 1 do
		slot0.__workingSprites[slot4]:removeFromParent()

		slot0.__workingSprites[slot4] = nil
	end

	slot0.__workingSprites = nil

	slot0.__spriteContainer:removeFromParent()

	slot0.__spriteContainer = nil
	slot0.defaultSizeFix = nil
	slot0.defaultPositionFix = nil
	slot0._splited = nil
end

return slot1
