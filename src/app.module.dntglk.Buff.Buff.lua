slot3 = {}
slot0 = class(slot1, "Buffer")

slot0.ctor = function (slot0, slot1, slot2, slot3)
	slot0.m_BTP = slot1
	slot0.m_fLife = slot3
	slot0.m_param = slot2
	slot0.m_pOwner = nil
end

slot0.GetOwner = function (slot0)
	return slot0.m_pOwner
end

slot0.SetOwner = function (slot0, slot1)
	slot0.m_pOwner = slot1
end

slot0.GetType = function (slot0)
	return slot0.m_BTP
end

slot0.SetType = function (slot0, slot1)
	slot0.m_BTP = slot1
end

slot0.GetLife = function (slot0)
	return slot0.m_fLife
end

slot0.SetLife = function (slot0, slot1)
	slot0.m_fLife = slot1
end

slot0.OnUpdate = function (slot0, slot1)
	if slot0.m_fLife > 0 then
		slot0.m_fLife = slot0.m_fLife - slot1
	end

	return slot0.m_fLife == -1 or slot0.m_fLife > 0
end

slot0.GetParam = function (slot0)
	return slot0.m_param
end

slot0.SetParam = function (slot0, slot1)
	slot0.m_param = slot1
end

slot0.Clear = function (slot0)
	return
end

slot0.Init = function (slot0)
	return
end

return slot0
