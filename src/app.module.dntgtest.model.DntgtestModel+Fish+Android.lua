function slot3(slot0)
	if slot0 ~= nil then
		slot3 = slot0

		return fishcc.createFish(slot2)
	end

	slot3 = fishgame.Fish

	return fishgame.Fish.Create(slot2)
end

slot0 = class(slot1, "Fish")

slot0.ctor = function (slot0, slot1)
	slot0.m_effects = {}

	if slot0.SetHitFishColor ~= nil then
		slot4 = slot0
		slot9 = 209

		slot0.SetHitFishColor(slot3, cc.c3b(slot6, 255, 82))
	end
end

slot0.GetParticle = function (slot0)
	if slot0.m_fishConfigData ~= nil then
		if slot0.m_fishConfigData.Particle == nil then
			return ""
		end

		return slot0.m_fishConfigData.Particle
	end

	return ""
end

slot0.SetVisualID = function (slot0, slot1)
	slot0.m_FishVisualID = slot1
end

slot0.GetVisualID = function (slot0)
	return slot0.m_FishVisualID
end

slot0.SetTypeID = function (slot0, slot1)
	slot0.m_nTypeId = slot1
end

slot0.GetTypeID = function (slot0)
	return slot0.m_nTypeId
end

slot0.SetFishType = function (slot0, slot1)
	slot0.m_FishType = slot1
end

slot0.GetFishType = function (slot0, slot1)
	return slot0.m_FishType
end

slot0.SetFishCofigData = function (slot0, slot1)
	slot0.m_fishConfigData = slot1
end

slot0.GetFishCofigData = function (slot0)
	return slot0.m_fishConfigData
end

slot0.SetRefershID = function (slot0, slot1)
	slot0.m_nRefershID = slot1
end

slot0.GetRefershID = function (slot0)
	return slot0.m_nRefershID
end

slot0.SetScore = function (slot0, slot1)
	slot0.m_nMul = slot1
end

slot0.GetScore = function (slot0)
	return slot0.m_nMul
end

slot0.SetCreateTick = function (slot0, slot1)
	slot0.m_nCreateTick = slot1
end

slot0.AddEffect = function (slot0, slot1)
	slot5 = slot1

	table.insert(slot3, slot0.m_effects)
end

slot0.ExecuteEffects = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot6 = slot0.GetId(slot7)
	slot9 = slot2

	for slot10, slot11 in ipairs(slot0) do
		slot14 = slot11

		if slot11.GetId(slot13) == slot6 then
			return slot5, slot2
		end
	end

	slot9 = slot0

	if slot0.GetState(slot8) < DNTGTEST_OBJ_STATE.EOS_DEAD then
		slot10 = slot0

		table.insert(slot8, slot2)

		slot9 = slot0.m_effects

		for slot10, slot11 in ipairs(slot8) do
			slot19 = slot4
			slot5, slot2 = slot11.Execute(slot13, slot11, slot0, slot1, slot2, slot3)
		end
	end

	return slot5, slot2
end

return slot0
