slot4 = import(slot1)
slot1 = class(".Buff", "BuffSpeed")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGLK_BUFF_TYPE.CHANGESPEED

	slot0.SetType(slot2, slot0)
end

slot1.Clear = function (slot0)
	slot0.m_param = 1
end

slot1.GetParam = function (slot0)
	return slot0.m_param
end

slot1.OnCCEvent = function (slot0, slot1)
	slot4 = slot1

	if slot1.GetID(slot3) == EME_QUERY_SPEED_MUL then
		slot5 = slot1
		slot2 = slot1.GetParam2(slot3) * slot0.m_param

		if slot1:GetParam3() then
			slot6 = slot2

			slot3(slot5)
		end
	end
end

return slot1
