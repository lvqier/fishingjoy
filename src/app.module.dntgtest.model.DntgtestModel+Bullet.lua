slot0 = class(slot1)
slot3 = "dntgtest.dntgLogic.MyObject"
slot1 = requireLuaFromModule("Bullet")

slot0.ctor = function (slot0)
	slot4 = slot0

	ClassUtil.extends(slot2, slot0)

	slot0.ProbabilitySet = {}
	slot0.m_nMaxCatch = 0
	slot0.m_nCatchRadio = 0
	slot0.m_nCannonType = 0
	slot0.m_nCannonSetType = 0
	slot0.m_wChairID = 0
	slot0.m_nSize = 0
	slot0.m_bDouble = false
end

slot0.GetType = function (slot0)
	return DNTGTEST_OBJ_TYPE.EOT_BULLET
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

slot0.SetCannonSetType = function (slot0, slot1)
	slot0.m_nCannonSetType = slot1
end

slot0.GetCannonSetType = function (slot0)
	return slot0.m_nCannonSetType
end

slot0.SetCannonType = function (slot0, slot1)
	slot0.m_nCannonType = slot1
end

slot0.GetCannonType = function (slot0)
	return slot0.m_nCannonType
end

slot0.SetCatchRadio = function (slot0, slot1)
	slot0.m_nCatchRadio = slot1
end

slot0.GetCatchRadio = function (slot0)
	return slot0.m_nCatchRadio
end

slot0.SetVisualData = function (slot0, slot1, slot2)
	slot0.m_BulletVisualID = slot1
end

slot0.SetVisualID = function (slot0, slot1)
	slot0.m_BulletVisualID = slot1
end

slot0.GetVisualID = function (slot0)
	return slot0.m_BulletVisualID or 0
end

slot0.SetCannonConfig = function (slot0, slot1)
	slot0.m_BulletCannonConfig = slot1
end

slot0.GetCannonConfig = function (slot0)
	return slot0.m_BulletCannonConfig or {}
end

slot0.AddVisualLiveDataWithZOrder = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot0.m_BulletCannonConfig = slot0.m_BulletCannonConfig or {}
	slot0.m_BulletCannonConfig.Bullet = slot0.m_BulletCannonConfig.Bullet or {}
	slot0.m_BulletCannonConfig.Bullet[#slot0.m_BulletCannonConfig.Bullet + 1] = {
		Image = slot1,
		ResPath = slot2,
		Name = slot3,
		Scale = slot4,
		OffestX = slot5,
		OffestY = slot6,
		Direction = slot7,
		AniType = slot8,
		nZOrder = slot9
	}
end

slot0.AddVisualDieDataWithZOrder = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot0.m_BulletCannonConfig = slot0.m_BulletCannonConfig or {}
	slot0.m_BulletCannonConfig.Net = slot0.m_BulletCannonConfig.Net or {}
	slot0.m_BulletCannonConfig.Net[#slot0.m_BulletCannonConfig.Net + 1] = {
		Image = slot1,
		ResPath = slot2,
		Name = slot3,
		Scale = slot4,
		OffestX = slot5,
		OffestY = slot6,
		Direction = slot7,
		AniType = slot8,
		nZOrder = slot9
	}
end

return slot0
