slot0 = class("Cannon", {})

requireLuaFromModule("dntg.model.Dntg_CannonSet")
requireLuaFromModule("dntg.model.Dntg_BulletSetLocal")

slot1 = {
	MOVE = "move"
}
slot0.TYPE = {
	1,
	2,
	3,
	4
}
slot0._type = 1

slot0.ctor = function (slot0, slot1)
	slot0._player = slot1
	slot0._type = 1
	slot0._angle = math.pi
end

slot0.SetRoomKind = function (slot0, slot1)
	slot0.m_RoomKind = slot1
end

slot0.GetRoomKind = function (slot0)
	return slot0.m_RoomKind
end

slot0.Clear = function (slot0)
	if slot0._cnode then
		slot0._cnode:removeSelf()
	end

	slot0._cnode = nil
end

slot0.getLevel = function (slot0)
	return 1
end

slot0.updateType = function (slot0, slot1)
	slot0:Clear()
end

slot0.SetCannonAngle = function (slot0, slot1)
	slot0._angle = slot1 or 0
end

slot0.GetCannonAngle = function (slot0)
	return slot0._angle or 0
end

slot0.Fire = function (slot0)
	if slot0._cnode then
		slot0._cnode.cannon:getAnimation():play(slot0.MOVE)
	end
end

slot0.update = function (slot0)
	return
end

slot0.GetBulletConfig = function (slot0)
	return slot0.m_bulletConfig
end

slot0.GetMultiply = function (slot0)
	return slot0.m_nMultiply
end

slot0.GetMultiplyOffset = function (slot0)
	return slot0.m_nMultiplyOffsetX, slot0.m_nMultiplyOffsetY
end

slot0.GetPosition = function (slot0)
	return 0, 0
end

slot0.GetCurcannonMultiply = function (slot0)
	return slot0._player:GetCannonMultiply()
end

slot0.GetArmatureName = function (slot0)
	slot1 = nil
	slot4 = slot0._player.GetCannonType(slot2)
	slot0.m_bulletConfig = ((Dntg_BulletSet ~= nil and Dntg_BulletSet.BulletSet ~= nil) or Dntg_BulletSetLocal[gameMgr:getCurRoomKind()]) and Dntg_BulletSet.BulletSet[slot0:GetCurcannonMultiply() + 1]
	slot0.m_nMultiply = slot0.GetCurcannonMultiply()
	slot6 = nil

	if slot0._player.GetCannonSetType(slot2) == 0 then
		if slot5 >= 5 then
			slot6 = Dntg_CannonSet.CannonSet[1].CannonType[2]
		else
			slot6 = Dntg_CannonSet.CannonSet[1].CannonType[1]
		end
	elseif slot3 == 1 then
		slot0.m_nMultiplyOffsetY = (slot5 < 5 or Dntg_CannonSet.CannonSet[1].CannonType[4]) and Dntg_CannonSet.CannonSet[1].CannonType[3].Cannon.PosY
		slot0.m_nMultiplyOffsetX = (slot5 < 5 or Dntg_CannonSet.CannonSet[1].CannonType[4]) and Dntg_CannonSet.CannonSet[1].CannonType[3].Cannon.PosX

		return (slot5 < 5 or Dntg_CannonSet.CannonSet[1].CannonType[4]) and Dntg_CannonSet.CannonSet[1].CannonType[3].Cannon.ResName
	end
end

return slot0
