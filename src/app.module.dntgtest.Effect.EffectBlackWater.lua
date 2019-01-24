slot4 = import(slot1)
slot1 = class(".Effect", "EffectBlackWater")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_EFFECT_TYPE.BLACKWATER

	slot0.SetEffectType(slot2, slot0)

	slot0.m_nParamCount = 0
end

slot1.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot4 then
		return 0, slot3
	end

	return 0, slot3
end

return slot1
