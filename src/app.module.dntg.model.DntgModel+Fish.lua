FISH_ANIMATION_TYPE = {
	FRAME = 0,
	SKELETON = 1
}
slot0 = class("Fish", function ()
	return fishgame.Fish:Create()
end)

slot0.ctor = function (slot0)
	slot0.m_effects = {}
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
	table.insert(slot0.m_effects, slot1)
end

slot0.ExecuteEffects = function (slot0, slot1, slot2, slot3)
	slot4 = 0

	for slot8, slot9 in ipairs(slot2) do
		if slot9:GetId() == slot0:GetId() then
			return slot4, slot2
		end
	end

	if slot0:GetState() < DNTG_EOS_OBJ.EOS_DEAD then
		table.insert(slot2, slot0)

		for slot8, slot9 in ipairs(slot0.m_effects) do
			slot4, slot2 = slot9:Execute(slot0, slot1, slot2, slot3)
		end
	end

	return slot4, slot2
end

return slot0
