slot2 = "FishingJoyFish"
FishingJoyFish = class(slot1)

FishingJoyFish.ctor = function (slot0)
	slot3 = slot0
	slot6 = "entity.FishingJoyEntityBase"

	ClassUtil.extends(slot2, FishingJoyRequireLua(slot5))

	slot0.redColorTime = 0
	slot0.catchedRadio = 0
	slot0.boundingBoxContainer = {}
	slot0.appendEffectContainer = {}
	slot0.renderData = {}
	slot0.renderId = 0
end

FishingJoyFish.getEntityType = function (slot0)
	return FISHINGJOY_ENTITY_TYPE_OBJ.FISH
end

FishingJoyFish.getAppendParticle = function (slot0)
	if slot0.fishConfig ~= nil then
		if slot0.fishConfig.entityParticle == nil then
			return ""
		end

		return slot0.fishConfig.entityParticle
	end

	return ""
end

FishingJoyFish.setFishRenderData = function (slot0, slot1)
	slot0.renderData = slot1
end

FishingJoyFish.getFishRenderData = function (slot0)
	return slot0.renderData
end

FishingJoyFish.setEntityRenderId = function (slot0, slot1)
	slot0.renderId = slot1
end

FishingJoyFish.getEntityRenderId = function (slot0)
	return slot0.renderId or 0
end

FishingJoyFish.setBoundingBoxId = function (slot0, slot1)
	slot0.boundingBoxId = slot1
end

FishingJoyFish.setFishTypeId = function (slot0, slot1)
	slot0.fishTypeId = slot1
end

FishingJoyFish.getFishTypeId = function (slot0)
	return slot0.fishTypeId
end

FishingJoyFish.setFishType = function (slot0, slot1)
	slot0.fishType = slot1
end

FishingJoyFish.getFishType = function (slot0)
	return slot0.fishType
end

FishingJoyFish.setFishConfig = function (slot0, slot1)
	slot0.fishConfig = slot1
end

FishingJoyFish.getFishConfig = function (slot0)
	return slot0.fishConfig
end

FishingJoyFish.setBatchId = function (slot0, slot1)
	slot0.fishBatchId = slot1
end

FishingJoyFish.getBatchId = function (slot0)
	return slot0.fishBatchId
end

FishingJoyFish.setFishScore = function (slot0, slot1)
	slot0.fishScore = slot1
end

FishingJoyFish.getFishScore = function (slot0)
	return slot0.fishScore
end

FishingJoyFish.appendFishEffect = function (slot0, slot1)
	slot5 = slot1

	table.insert(slot3, slot0.appendEffectContainer)
end

FishingJoyFish.executeFishEffects = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot8 = slot0
	slot6 = slot0.getEntityId(slot7)
	slot7 = ipairs
	slot9 = slot2 or {}

	for slot10, slot11 in slot7(slot8) do
		slot14 = slot11

		if slot11.getEntityId(slot13) == slot6 then
			return slot5, slot2
		end
	end

	slot9 = slot0

	if slot0.getEntityStatus(slot8) < FISHINGJOY_ENTITY_STATUS.DEAD then
		slot10 = slot0

		table.insert(slot8, slot2)

		slot9 = slot0.appendEffectContainer

		for slot10, slot11 in pairs(slot8) do
			slot19 = slot4
			slot5, slot2 = slot11.executeEffect(slot13, slot11, slot0, slot1, slot2, slot3)
		end
	end

	return slot5, slot2
end

FishingJoyFish.appendBoundingBox = function (slot0, slot1, slot2, slot3)
	slot0.boundingBoxContainer[#slot0.boundingBoxContainer + 1] = {
		entityOffsetx = slot1,
		entityOffsety = slot2,
		rad = slot3
	}
	slot10 = slot1
	slot8 = math.abs(slot9) + slot3
	slot0.catchedRadio = math.max(#slot0.boundingBoxContainer + 1, slot0.catchedRadio)
	slot10 = slot2
	slot8 = math.abs(slot9) + slot3
	slot0.catchedRadio = math.max(#slot0.boundingBoxContainer + 1, slot0.catchedRadio)
end

FishingJoyFish.getBoundingBox = function (slot0)
	return slot0.boundingBoxContainer
end

FishingJoyFish.getFishCatchedRadio = function (slot0)
	return slot0.catchedRadio or 0
end

FishingJoyFish.onUpdate = function (slot0, slot1)
	slot5 = slot1

	slot0.super.onUpdate(slot3, slot0)

	if slot0.redColorTime > 0 then
		slot0.redColorTime = slot0.redColorTime - 1

		if slot0.redColorTime == 0 then
			slot2 = pairs
			slot4 = slot0.entityRenderContainer or {}

			for slot5, slot6 in slot2(slot3) do
				if slot6.cocosTarget and slot6.entityShadow ~= true and slot6.entitySpecial ~= true then
					slot9 = slot6.cocosTarget
					slot14 = 255

					slot6.cocosTarget.setColor(slot8, cc.c3b(slot11, 255, 255))
				end
			end
		end
	end
end

FishingJoyFish.fishHitted = function (slot0)
	slot1 = pairs
	slot3 = slot0.entityRenderContainer or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5.cocosTarget and slot5.entityShadow ~= true and slot5.entitySpecial ~= true then
			slot8 = slot5.cocosTarget
			slot13 = 209

			slot5.cocosTarget.setColor(slot7, cc.c3b(slot10, 255, 82))
		end
	end

	slot0.redColorTime = 5
end

return FishingJoyFish
