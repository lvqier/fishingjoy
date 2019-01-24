slot0 = requireLuaFromModule("dntg.model.DntgModel+Cannon")

requireLuaFromModule("dntg.model.Dntg_BulletSetLocal")

slot1 = class("Player", {})

slot1.ctor = function (slot0, slot1)
	slot0.m_Wastage = 0
	slot0.m_nCannonSetType = 0
	slot0.m_nCannonType = 0
	slot0.m_nCannonMultiply = 0
	slot0.m_CannonPos = cc.p(0, 0)
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

	slot0:SetUpdateNickName()
	slot0:SetUpdateCannonDirection()
	slot0:SetUpdateScore()
	slot0:SetUpdateCannon()
	slot0:SetShowMyPosition()

	slot0.m_bUpdateCannon = true
	slot0.m_pCannon = slot0:new()
end

slot1.SetBulletSpeedRate = function (slot0, slot1, slot2)
	print("Player:" .. tostring(slot0.m_nickName) .. " getRate:" .. tostring(slot1) .. " delayTick:" .. tostring(slot2))

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

	slot0.m_pCannon:SetRoomKind(slot1)
end

slot1.GetRoomKind = function (slot0)
	return slot0.m_RoomKind
end

slot1.GetChairId = function (slot0)
	return slot0.m_chairId
end

slot1.ClearSet = function (slot0, slot1)
	slot0:SetScore(0)
	slot0:SetProbability(MAX_PROBABILITY)

	slot0.m_Wastage = 0
	slot2 = nil
	slot0.m_nCannonType = ((Dntg_BulletSet ~= nil and Dntg_BulletSet.BulletSet ~= nil) or Dntg_BulletSetLocal[gameMgr:getCurRoomKind()]) and Dntg_BulletSet.BulletSet[1].CannonType
	slot0.BulletCount = 0
	slot0.m_bCanFire = true

	slot0:SetCreateTick(slot3)
	slot0:SetLastFireTick(TimeService.GetInstance():GetClientTick())

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

	slot0:SetUpdateCannon()
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

	slot0:SetUpdateCannon()
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
		table.insert(slot0.LockBuffer, slot1)
	else
		slot0:ClearLockedBuffer()
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

	-- Decompilation error in this vicinity:
	slot1 = nil

	if ((slot0:GetCannonMultiply() < 5 or Dntg_CannonSet.CannonSet[1].CannonType[4]) and Dntg_CannonSet.CannonSet[1].CannonType[3]) ~= nil then
		return slot1
	end

	return Dntg_CannonSet.CannonSet[1].CannonType[1]
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

	slot0:SetUpdateScore()
end

slot1.GetScore = function (slot0)
	return slot0.m_lScore
end

slot1.SetNickName = function (slot0, slot1)
	slot0.m_nickName = slot1

	slot0:SetUpdateNickName()
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
	slot0.m_pCannon:Clear()
end

return slot1
