slot0 = class("Effect", {})

slot0.ctor = function (slot0)
	slot0.m_pParam = {}
	slot0.m_nParamCount = 2
	slot0.m_nType = DNTG_EffectType.ETF_NONE
end

slot0.GetEffectType = function (slot0)
	return slot0.m_nType
end

slot0.SetEffectType = function (slot0, slot1)
	slot0.m_nType = slot1
end

slot0.GetParam = function (slot0, slot1)
	return slot0.m_pParam[slot1 + 1] or 0
end

slot0.SetParam = function (slot0, slot1, slot2)
	slot0.m_pParam[slot1 + 1] = slot2
end

slot0.GetParamSize = function (slot0)
	return slot0.m_nParamCount
end

slot0.Execute = function (slot0)
	print("Effect:Execute 必须被继承并重写")
end

return slot0
