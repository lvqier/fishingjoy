slot1 = class("EffectAddBuffer", import(".Effect"))

slot1.ctor = function (slot0)
	slot0.super.ctor(slot0)
	slot0:SetEffectType(DNTG_EffectType.ETP_ADDBUFFER)

	slot0.m_nParamCount = 5
end

slot1.Execute = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil or slot4 then
		return 0, slot3
	end

	slot6 = slot1:GetId()
	slot7 = slot0:GetParam(0)
	slot8 = slot0:GetParam(1)
	slot9 = slot0:GetParam(2)
	slot10 = slot0:GetParam(3)
	slot11 = slot0:GetParam(4)
	slot12 = slot1:GetPosition().x
	slot13 = slot1:GetPosition().y

	for slot17, slot18 in pairs(slot5) do
		if slot18:GetId() ~= slot6 then
			if slot7 == 0 then
				slot18:AddBuff(slot9, slot10, slot11)
			elseif slot7 == 1 then
				if (slot12 - slot18:GetPosition().x) * (slot12 - slot18.GetPosition().x) + (slot13 - slot18:GetPosition().y) * (slot13 - slot18.GetPosition().y) <= slot8 * slot8 then
					slot18:AddBuff(slot9, slot10, slot11)
				end
			elseif slot7 == 2 and slot18:GetTypeID() == slot8 then
				slot18:AddBuff(slot9, slot10, slot11)
			end
		end
	end

	return 0, slot3
end

return slot1
