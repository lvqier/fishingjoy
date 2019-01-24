function slot3()
	slot2 = fishgame.Fish

	return fishgame.Fish.Create(slot1)
end

FishingJoyFishAndroid = class(slot1, "FishingJoyFishAndroid")

FishingJoyFishAndroid.ctor = function (slot0)
	slot0.appendEffectContainer = {}

	if slot0.SetHitFishColor ~= nil then
		slot3 = slot0
		slot8 = 209

		slot0.SetHitFishColor(slot2, cc.c3b(slot5, 255, 82))
	end
end

FishingJoyFishAndroid.getAppendParticle = function (slot0)
	if slot0.fishConfig ~= nil then
		if slot0.fishConfig.entityParticle == nil then
			return ""
		end

		return slot0.fishConfig.entityParticle
	end

	return ""
end

FishingJoyFishAndroid.setEntityRenderId = function (slot0, slot1)
	slot0.renderId = slot1
end

FishingJoyFishAndroid.getEntityRenderId = function (slot0)
	return slot0.renderId
end

FishingJoyFishAndroid.setFishTypeId = function (slot0, slot1)
	slot0.fishTypeId = slot1
end

FishingJoyFishAndroid.getEntityPosition = function (slot0)
	slot3 = slot0

	return slot0.GetPosition(slot2)
end

FishingJoyFishAndroid.setEntityStatus = function (slot0, slot1)
	slot5 = slot1

	slot0.SetState(slot3, slot0)
end

FishingJoyFishAndroid.getEntityStatus = function (slot0)
	slot3 = slot0

	return slot0.GetState(slot2)
end

FishingJoyFishAndroid.getEntityId = function (slot0)
	slot3 = slot0

	return slot0.GetId(slot2)
end

FishingJoyFishAndroid.getFishTypeId = function (slot0)
	return slot0.fishTypeId
end

FishingJoyFishAndroid.setFishType = function (slot0, slot1)
	slot0.fishType = slot1
end

FishingJoyFishAndroid.getFishType = function (slot0, slot1)
	return slot0.fishType
end

FishingJoyFishAndroid.setEntityPosition = function (slot0, slot1, slot2)
	slot7 = slot2

	slot0.SetPosition(slot4, slot0, slot1)
end

FishingJoyFishAndroid.setFishConfig = function (slot0, slot1)
	slot0.fishConfig = slot1
end

FishingJoyFishAndroid.getFishConfig = function (slot0)
	return slot0.fishConfig
end

FishingJoyFishAndroid.setEntityId = function (slot0, slot1)
	slot5 = slot1

	slot0.SetId(slot3, slot0)
end

FishingJoyFishAndroid.setBatchId = function (slot0, slot1)
	slot0.fishBatchId = slot1
end

FishingJoyFishAndroid.getBatchId = function (slot0)
	return slot0.fishBatchId
end

FishingJoyFishAndroid.setFishScore = function (slot0, slot1)
	slot0.fishScore = slot1
end

FishingJoyFishAndroid.getFishScore = function (slot0)
	return slot0.fishScore
end

FishingJoyFishAndroid.appendFishEffect = function (slot0, slot1)
	slot5 = slot1

	table.insert(slot3, slot0.appendEffectContainer)
end

FishingJoyFishAndroid.getEntityActiving = function (slot0)
	slot3 = slot0

	return slot0.InSideScreen(slot2)
end

FishingJoyFishAndroid.getEntityMoveComponent = function (slot0)
	slot3 = slot0

	return slot0.GetMoveCompent(slot2)
end

FishingJoyFishAndroid.setEntityMoveComponent = function (slot0, slot1)
	slot5 = slot1

	slot0.SetMoveCompent(slot3, slot0)
end

FishingJoyFishAndroid.appendBoundingBox = function (slot0, slot1, slot2, slot3)
	slot9 = slot3

	slot0.AddBoundingBox(slot5, slot0, slot1, slot2)
end

FishingJoyFishAndroid.appendEntityBuff = function (slot0, slot1, slot2, slot3)
	slot9 = slot3

	slot0.AddBuff(slot5, slot0, slot1, slot2)
end

FishingJoyFishAndroid.executeFishEffects = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot8 = slot0
	slot6 = slot0.GetId(slot7)
	slot7 = ipairs
	slot9 = slot2 or {}

	for slot10, slot11 in slot7(slot8) do
		slot14 = slot11

		if slot11.GetId(slot13) == slot6 then
			return slot5, slot2
		end
	end

	slot9 = slot0

	if slot0.GetState(slot8) < FISHINGJOY_ENTITY_STATUS.DEAD then
		slot10 = slot0

		table.insert(slot8, slot2)

		slot9 = slot0.appendEffectContainer

		for slot10, slot11 in ipairs(slot8) do
			slot19 = slot4
			slot5, slot2 = slot11.executeEffect(slot13, slot11, slot0, slot1, slot2, slot3)
		end
	end

	return slot5, slot2
end

return FishingJoyFishAndroid
