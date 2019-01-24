slot4 = import(slot1)
slot1 = class(".Effect", "EffectAddMoney")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_EFFECT_TYPE.ADDMONEY

	slot0.SetEffectType(slot2, slot0)

	slot0.m_nParamCount = 3
	slot0.lSco = 0
end

slot1.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0
	slot6 = 1
	slot10 = 0
	slot7 = slot0.GetParam(slot8, slot0)
	slot11 = 1
	slot8 = slot0:GetParam(slot0)
	slot12 = 2
	slot9 = slot0:GetParam(slot0)

	if slot0.lSco == 0 then
		if slot8 < slot9 then
			slot13 = slot9
			slot0.lSco = math.random(slot11, slot8) or slot8
		end
	end

	if slot7 == 0 then
		slot6 = 1
	elseif slot2 then
		slot12 = slot2
		slot6 = slot2.GetScore(slot11)
	end

	if -1 ~= -1 then
		slot0.lSco = 0
	end

	if slot9 < slot10 + slot0.lSco then
		slot10 = slot9 - slot0.lSco
	end

	if not slot4 then
	else
		slot10 = 0
	end

	slot5 = (slot0.lSco + slot10) * slot6

	if slot2.__cname == "Bullet" then
		slot13 = slot2

		if slot2.bDouble(slot12) then
			slot5 = slot5 * 2
		end
	end

	return slot5, slot3
end

return slot1
