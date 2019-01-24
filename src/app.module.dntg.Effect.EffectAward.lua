slot1 = class("EffectAward", import(".Effect"))

slot1.ctor = function (slot0)
	slot0.super.ctor(slot0)
	slot0:SetEffectType(DNTG_EffectType.ETP_AWARD)

	slot0.m_nParamCount = 4
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0

	if slot0:GetParam(1) == 0 and slot4 then
		if slot0:GetParam(2) == 0 then
			slot5 = slot0:GetParam(3)
		elseif slot2 then
			slot5 = slot2:GetScore() * slot0:GetParam(3)
		end
	end

	if not slot4 then
	end

	return slot5, slot3
end

return slot1
