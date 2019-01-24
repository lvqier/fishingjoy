slot4 = import(slot1)
slot1 = class(".Buff", "BuffDoubleCannon")

slot1.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = DNTGTEST_BUFF_TYPE.DOUBLE_CANNON

	slot0.SetType(slot2, slot0)
end

slot1.Clear = function (slot0)
	if slot0.m_pOwner then
		slot4 = slot1

		if slot1.GetCannonSetType(slot3) < #CGameConfig.GetInstance().CannonSetArray then
			slot2 = CGameConfig.GetInstance().CannonSetArray[slot2].nNormalID
		end

		slot6 = slot2

		slot1.SetCannonSetType(slot4, slot1)

		slot6 = slot1

		RaiseEvent(slot4, "CannonSetChanaged")
	end
end

slot1.SetOwner = function (slot0, slot1)
	slot5 = slot1

	slot0.super.SetOwner(slot3, slot0)

	if slot1 then
		slot4 = slot1

		if slot1.GetCannonSetType(slot3) < #CGameConfig.GetInstance().CannonSetArray then
			slot2 = CGameConfig.GetInstance().CannonSetArray[slot2].nDoubleID
		end

		slot6 = slot2

		slot1.SetCannonSetType(slot4, slot1)

		slot6 = slot1

		RaiseEvent(slot4, "CannonSetChanaged")
	end
end

return slot1
