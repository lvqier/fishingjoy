function slot3(slot0)
	if slot0 ~= nil then
		slot3 = slot0

		return fishcc.createBullet(slot2)
	end

	slot3 = fishgame.Bullet

	return fishgame.Bullet.Create(slot2)
end

slot0 = class(slot1, "Bullet")

slot0.ctor = function (slot0, slot1)
	slot0.ProbabilitySet = {}
	slot0.m_nMaxCatch = 0
	slot0.m_nCatchRadio = 0
	slot0.m_nCannonType = 0
	slot0.m_nCannonSetType = 0
	slot0.m_wChairID = 0
	slot0.m_nSize = 0
	slot0.m_bDouble = false
end

slot0.AddProbilitySet = function (slot0, slot1, slot2)
	slot0.ProbabilitySet[slot1] = slot2
end

slot0.GetProbilitySet = function (slot0, slot1)
	return slot0.ProbabilitySet[slot1] or MAX_PROBABILITY
end

slot0.GetMaxCatch = function (slot0)
	return slot0.m_nMaxCatch
end

slot0.SetMaxCatch = function (slot0, slot1)
	slot0.m_nMaxCatch = slot1
end

slot0.GetChairID = function (slot0)
	return slot0.m_wChairID
end

slot0.SetChairID = function (slot0, slot1)
	slot0.m_wChairID = slot1
end

slot0.GetSize = function (slot0)
	return slot0.m_nSize
end

slot0.SetSize = function (slot0, slot1)
	slot0.m_nSize = slot1
end

slot0.bDouble = function (slot0)
	return slot0.m_bDouble
end

slot0.setDouble = function (slot0, slot1)
	slot0.m_bDouble = slot1
end

slot0.SetScore = function (slot0, slot1)
	slot0.m_nScore = slot1
end

slot0.GetScore = function (slot0)
	return slot0.m_nScore
end

return slot0
