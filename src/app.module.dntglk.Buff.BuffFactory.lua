slot3 = {}
slot0 = class(slot1, "BuffFactory")

slot0.ctor = function (slot0)
	slot0.m_buffFactory = {}
end

slot0.CreateBuff = function (slot0, slot1)
	if slot0.m_buffFactory[slot1] then
		return slot2.new()
	end
end

slot0.Register = function (slot0, slot1, slot2)
	slot0.m_buffFactory[slot1] = slot2
end

slot0.Clear = function (slot0)
	slot0.m_buffFactory = {}
end

return slot0
