slot4 = import(slot1)
slot1 = class(".Effect", "EffectAward")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_EFFECT_TYPE.AWARD

	slot0.SetEffectType(slot2, slot0)

	slot0.m_nParamCount = 4
end

slot1.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0
	slot9 = 1

	if slot0.GetParam(slot7, slot0) == 0 and slot4 then
		slot9 = 2

		if slot0.GetParam(slot7, slot0) == 0 then
			slot9 = 3
			slot5 = slot0.GetParam(slot7, slot0)
		elseif slot2 then
			slot10 = 3
			slot5 = slot2.GetScore(slot7) * slot0.GetParam(slot2, slot0)
		end
	end

	if not slot4 then
	end

	return slot5, slot3
end

return slot1
