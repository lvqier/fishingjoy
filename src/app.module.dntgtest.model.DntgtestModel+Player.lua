slot0 = requireLuaFromModule(slot1)
slot3 = "dntgtest.fishConfig.Dntgtest_BulletSet"

requireLuaFromModule("dntgtest.model.DntgtestModel+Cannon")

slot4 = {}
slot1 = class("dntgtest.model.DntgtestModel+Cannon", "Player")

slot1.ctor = function (slot0, slot1)
	slot0.m_Wastage = 0
	slot0.m_nCannonSetType = 0
	slot0.m_nCannonType = 0
	slot0.m_nCannonMultiply = 0
	slot5 = 0
	slot0.m_CannonPos = cc.p(slot3, 0)
	slot0.m_dwLastFireTick = 0
	slot0.m_dwLockFishID = 0
	slot0.m_bLocking = false
	slot0.LockBuffer = {}
	slot0.BulletCount = 0
	slot0.m_bCanFire = false
	slot0.m_chairId = slot1
	slot0.m_nUserId = -1
	slot0.m_lScore = 0
	slot0.m_nickName = "???"
	slot0.m_BulletSpeedRateOld = 1
	slot0.m_BulletSpeedRate = 1
	slot0.m_bUpdateScore = false
	slot4 = slot0

	slot0.SetUpdateNickName(slot3)

	slot4 = slot0

	slot0.SetUpdateCannonDirection(slot3)

	slot4 = slot0

	slot0.SetUpdateScore(slot3)

	slot4 = slot0

	slot0.SetUpdateCannon(slot3)

	slot4 = slot0

	slot0.SetShowMyPosition(slot3)

	slot0.m_bUpdateCannon = true
	slot4 = slot0
	slot0.m_pCannon = slot0.new(slot3)
end

slot1.SetBulletSpeedRate = function (slot0, slot1, slot2)
	slot8 = slot0.m_nickName
	slot10 = slot1
	slot12 = slot2
	slot5 = "Player:" .. tostring(slot7) .. " getRate:" .. tostring(slot9) .. " delayTick:" .. tostring(slot11)

	print(slot4)

	slot0.m_BulletSpeedRate = slot1
	slot0.TakeEffectTime = slot2
end

slot1.GetTakeEffectTime = function (slot0)
	return slot0.TakeEffectTime or 0
end

slot1.GetOldRate = function (slot0, slot1)
	if slot1 == true then
		slot0.m_BulletSpeedRateOld = slot0.m_BulletSpeedRate
	end

	return slot0.m_BulletSpeedRateOld or 1
end

slot1.SetRoomKind = function (slot0, slot1)
	slot0.m_RoomKind = slot1
	slot5 = slot1

	slot0.m_pCannon.SetRoomKind(slot3, slot0.m_pCannon)
end

slot1.GetRoomKind = function (slot0)
	return slot0.m_RoomKind
end

slot1.GetChairId = function (slot0)
	return slot0.m_chairId
end

slot1.ClearSet = function (slot0, slot1)
	slot5 = 0

	slot0.SetScore(slot3, slot0)

	slot5 = MAX_PROBABILITY

	slot0.SetProbability(slot3, slot0)

	slot0.m_Wastage = 0
	slot0.m_nCannonType = Dntgtest_BulletSet.BulletSet[1].CannonType
	slot0.BulletCount = 0
	slot0.m_bCanFire = true
	slot6 = TimeService.GetInstance().GetClientTick(slot3)

	slot0.SetCreateTick(TimeService.GetInstance(), slot0)

	slot6 = TimeService.GetInstance().GetClientTick(slot3)

	slot0.SetLastFireTick(TimeService.GetInstance(), slot0)

	slot0.LockBuffer = {}
	slot0.m_dwLockFishID = 0
end

slot1.SetShowMyPosition = function (slot0)
	slot0.m_bShowMyPosition = true
end

slot1.GetShowMyPosition = function (slot0)
	slot0.m_bShowMyPosition = false

	return slot0.m_bShowMyPosition
end

slot1.SetUpdateNickName = function (slot0)
	slot0.m_bUpdateNickName = true
end

slot1.GetUpdateNickName = function (slot0)
	slot0.m_bUpdateNickName = false

	return slot0.m_bUpdateNickName
end

slot1.SetUpdateCannonDirection = function (slot0)
	slot0.m_bUpdateCannonDirection = true
end

slot1.GetUpdateCannonDirection = function (slot0)
	slot0.m_bUpdateCannonDirection = false

	return slot0.m_bUpdateCannonDirection
end

slot1.SetUpdateScore = function (slot0)
	slot0.m_bUpdateScore = true
end

slot1.GetUpdateScore = function (slot0)
	slot0.m_bUpdateScore = false

	return slot0.m_bUpdateScore
end

slot1.SetUpdateCannon = function (slot0)
	slot0.m_bUpdateCannon = true
end

slot1.GetUpdateCannon = function (slot0)
	slot0.m_bUpdateCannon = false

	return slot0.m_bUpdateCannon
end

slot1.SetCannonType = function (slot0, slot1)
	slot0.m_nCannonType = slot1
	slot4 = slot0

	slot0.SetUpdateCannon(slot3)
end

slot1.GetCannonType = function (slot0)
	return slot0.m_nCannonType or 0
end

slot1.AddWastage = function (slot0, slot1)
	slot0.m_Wastage = slot0.m_Wastage + slot1
end

slot1.GetWastage = function (slot0)
	return slot0.m_Wastage
end

slot1.SetCannonMultiply = function (slot0, slot1)
	slot0.m_nCannonMultiply = slot1
	slot4 = slot0

	slot0.SetUpdateCannon(slot3)
end

slot1.GetCannonMultiply = function (slot0)
	return slot0.m_nCannonMultiply or 0
end

slot1.SetLastFireTick = function (slot0, slot1)
	slot0.m_dwLastFireTick = slot1
end

slot1.GetLastFireTick = function (slot0)
	return slot0.m_dwLastFireTick or 0
end

slot1.SetLockFishID = function (slot0, slot1)
	slot0.m_dwLockFishID = slot1

	if slot0.m_dwLockFishID ~= 0 then
		slot0.LockBuffer[#slot0.LockBuffer + 1] = slot1
	else
		slot4 = slot0

		slot0.ClearLockedBuffer(slot3)
	end
end

slot1.GetLockFishID = function (slot0)
	return slot0.m_dwLockFishID or 0
end

slot1.ClearLockedBuffer = function (slot0)
	slot0.LockBuffer = {}
end

slot1.bLocking = function (slot0)
	return slot0.m_bLocking
end

slot1.SetLocking = function (slot0, slot1)
	slot0.m_bLocking = slot1
end

slot1.GetCannonSetType = function (slot0)
	return slot0.m_nCannonSetType
end

slot1.SetCannonSetType = function (slot0, slot1)
	slot0.m_nCannonSetType = slot1
end

slot1.GetCannonConfig = function (slot0)
	slot1 = nil
	slot4 = slot0

	if slot0.GetCannonSetType(slot3) == 0 then
		slot4 = slot0

		if slot0.GetCannonMultiply(slot3) >= 6 then
			slot1 = Dntgtest_CannonSet.CannonSet[1].CannonType[3]
		else
			slot4 = slot0

			if slot0.GetCannonMultiply(slot3) >= 3 then
				slot1 = Dntgtest_CannonSet.CannonSet[1].CannonType[2]
			else
				slot1 = Dntgtest_CannonSet.CannonSet[1].CannonType[1]
			end
		end
	else
		slot4 = slot0

		if slot0.GetCannonSetType(slot3) == 1 then
			slot4 = slot0

			if slot0.GetCannonMultiply(slot3) >= 6 then
				slot1 = Dntgtest_CannonSet.CannonSet[1].CannonType[6]
			else
				slot4 = slot0
				slot1 = (slot0.GetCannonMultiply(slot3) < 3 or Dntgtest_CannonSet.CannonSet[1].CannonType[5]) and Dntgtest_CannonSet.CannonSet[1].CannonType[4]
			end
		end
	end

	if slot1 ~= nil then
		return slot1
	end

	return Dntgtest_CannonSet.CannonSet[1].CannonType[1]
end

slot1.SetCannonType = function (slot0)
	return
end

slot1.CanFire = function (slot0)
	return slot0.m_bCanFire
end

slot1.SetCanFire = function (slot0, slot1)
	slot0.m_bCanFire = slot1
end

slot1.AddScore = function (slot0, slot1)
	slot0.m_lScore = slot0.m_lScore + slot1
end

slot1.SetScore = function (slot0, slot1)
	slot0.m_lScore = slot1
	slot4 = slot0

	slot0.SetUpdateScore(slot3)
end

slot1.GetScore = function (slot0)
	return slot0.m_lScore
end

slot1.SetNickName = function (slot0, slot1)
	slot0.m_nickName = slot1
	slot4 = slot0

	slot0.SetUpdateNickName(slot3)
end

slot1.GetNickName = function (slot0)
	return slot0.m_nickName
end

slot1.SetUserId = function (slot0, slot1)
	slot0.m_nUserId = slot1
end

slot1.GetUserId = function (slot0)
	return slot0.m_nUserId
end

slot1.SetPlayerInfo = function (slot0, slot1)
	slot0.m_playerInfo = slot1
end

slot1.GetPlayerInfo = function (slot0)
	return slot0.m_playerInfo
end

slot1.GetCannon = function (slot0)
	return slot0.m_pCannon
end

slot1.Clear = function (slot0)
	slot3 = slot0.m_pCannon

	slot0.m_pCannon.Clear(slot2)
end

return slot1
