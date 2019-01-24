slot1 = class("EffectAddMoney", import(".Effect"))

slot1.ctor = function (slot0)
	slot0.super.ctor(slot0)
	slot0:SetEffectType(DNTG_EffectType.ETP_ADDMONEY)

	slot0.m_nParamCount = 3
	slot0.lSco = 0
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0
	slot6 = 1

	if slot0.lSco == 0 then
		slot0.lSco = (slot0:GetParam(1) < slot0:GetParam(2) and math.random(slot0:GetParam(1), slot0:GetParam(2))) or slot0:GetParam(1)
	end

	if slot0:GetParam(0) == 0 then
		slot6 = 1
	elseif slot2 then
		slot6 = slot2:GetScore()
	end

	if -1 ~= -1 then
		slot0.lSco = 0
	end

	if slot0:GetParam(2) < slot7 + slot0.lSco then
		slot7 = slot0:GetParam(2) - slot0.lSco
	end

	if not slot4 then
	else
		slot7 = 0
	end

	slot5 = (slot0.lSco + slot7) * slot6

	if slot2.__cname == "Bullet" and slot2:bDouble() then
		slot5 = slot5 * 2
	end

	return slot5, slot3
end

return slot1
