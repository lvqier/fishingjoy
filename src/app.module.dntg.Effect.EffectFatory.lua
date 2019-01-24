slot0 = class("EffectFatory", {})

slot0.ctor = function (slot0)
	slot0.m_effectFactory = {}
end

slot0.CreateEffect = function (slot0, slot1)
	if slot0.m_effectFactory[slot1] then
		return slot2.new()
	end
end

slot0.Register = function (slot0, slot1, slot2)
	slot0.m_effectFactory[slot1] = slot2
end

slot0.Clear = function (slot0)
	slot0.m_effectFactory = {}
end

return slot0
