slot1 = class("EffectBlackWater", import(".Effect"))

slot1.ctor = function (slot0)
	slot0.super.ctor(slot0)
	slot0:SetEffectType(DNTG_EffectType.ETP_BLACKWATER)

	slot0.m_nParamCount = 0
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot4 then
		return 0, slot3
	end

	return 0, slot3
end

return slot1
