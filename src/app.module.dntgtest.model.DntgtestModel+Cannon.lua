slot3 = {}
slot0 = class(slot1, "Cannon")
slot3 = "dntgtest.fishConfig.Dntgtest_CannonSet"

requireLuaFromModule("Cannon")

slot3 = "dntgtest.fishConfig.Dntgtest_BulletSet"

requireLuaFromModule("Cannon")

slot0.TYPE = {
	1,
	2,
	3,
	4
}
slot0._type = slot0.TYPE[1]

slot0.ctor = function (slot0, slot1)
	slot0._player = slot1
	slot0._type = slot0.TYPE[1]
	slot0._angle = M_PI
end

slot0.SetRoomKind = function (slot0, slot1)
	slot0.m_RoomKind = slot1
end

slot0.GetRoomKind = function (slot0)
	return slot0.m_RoomKind
end

slot0.Clear = function (slot0)
	if slot0._cnode then
		slot3 = slot0._cnode

		slot0._cnode.removeSelf(slot2)
	end

	slot0._cnode = nil
end

slot0.getLevel = function (slot0)
	return 1
end

slot0.updateType = function (slot0, slot1)
	slot4 = slot0

	slot0.Clear(slot3)
end

slot0.SetCannonAngle = function (slot0, slot1)
	slot0._angle = slot1 or 0
end

slot0.GetCannonAngle = function (slot0)
	return slot0._angle or 0
end

slot0.Fire = function (slot0)
	if slot0._cnode then
		slot3 = slot0._cnode.cannon
		slot4 = DNTGTEST_CANNON_ANI.MOVE

		slot0._cnode.cannon.getAnimation(slot2).play(slot2, slot0._cnode.cannon.getAnimation(slot2))
	end
end

slot0.GetPosition = function (slot0)
	return 0, 0
end

slot0.GetArmatureName = function (slot0, slot1)
	slot0.m_nMultiplyOffsetY = slot1.Cannon.PosY
	slot0.m_nMultiplyOffsetX = slot1.Cannon.PosX

	return slot1.Cannon.ResName
end

return slot0
