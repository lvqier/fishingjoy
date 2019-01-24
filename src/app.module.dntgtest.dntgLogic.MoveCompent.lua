slot3 = {}
MoveCompent = class(slot1, "MoveCompent")

MoveCompent.ctor = function (slot0)
	slot0.view = nil
	slot0.m_pPosition = {
		x = 0,
		y = 0
	}
	slot0.m_fDirection = 0
	slot0.m_fSpeed = 0
	slot0.m_bPause = false
	slot0.m_nPathID = 0
	slot0.m_bEndPath = false
	slot0.m_Offest = {
		x = 0,
		y = 0
	}
	slot0.m_fDelay = 0
	slot0.m_bBeginMove = false
	slot0.m_bRebound = false
	slot0.m_dwTargetID = 0
	slot0.m_bTroop = false
	slot0.m_pOwner = nil
end

MoveCompent.SetPathMoveData = function (slot0, slot1)
	slot0.m_strMoveData = slot1

	if not slot0.m_strMoveData.isPointBuff then
		slot0.m_strMoveData.xPos = {
			slot0.m_strMoveData.Position[1].x,
			slot0.m_strMoveData.Position[2].x,
			slot0.m_strMoveData.Position[3].x,
			slot0.m_strMoveData.Position[4].x
		}
		slot0.m_strMoveData.yPos = {
			slot0.m_strMoveData.Position[1].y,
			slot0.m_strMoveData.Position[2].y,
			slot0.m_strMoveData.Position[3].y,
			slot0.m_strMoveData.Position[4].y
		}

		if slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.LINE then
			slot0.m_strMoveData.xPos[5] = slot0.m_strMoveData.xPos[2] - slot0.m_strMoveData.xPos[1]
			slot0.m_strMoveData.yPos[5] = slot0.m_strMoveData.yPos[2] - slot0.m_strMoveData.yPos[1]
			slot11 = slot0.m_strMoveData.yPos[2]
			slot0.m_strMoveData.dir = slot0.CalcAngle(slot6, slot0, slot0.m_strMoveData.xPos[1], slot0.m_strMoveData.yPos[1], slot0.m_strMoveData.xPos[2]) - M_PI_2
		elseif slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.BEZIER then
			slot2 = slot0.m_strMoveData.xPos
			slot3 = slot0.m_strMoveData.yPos

			if slot0.m_strMoveData.nPointCount == 3 then
				slot2[5] = slot2[2] - slot2[1]
				slot2[6] = slot2[3] - slot2[2]
				slot3[5] = slot3[2] - slot3[1]
				slot3[6] = slot3[3] - slot3[2]
			else
				slot2[5] = slot2[2] - slot2[1]
				slot2[6] = slot2[3] - slot2[2]
				slot2[7] = slot2[4] - slot2[3]
				slot3[5] = slot3[2] - slot3[1]
				slot3[6] = slot3[3] - slot3[2]
				slot3[7] = slot3[4] - slot3[3]
			end
		end

		slot0.m_strMoveData.isPointBuff = true
	end
end

MoveCompent.SetSpeed = function (slot0, slot1)
	slot0.m_fSpeed = slot1
end

MoveCompent.GetSpeed = function (slot0)
	return slot0.m_fSpeed or 0
end

MoveCompent.SetPause = function (slot0, slot1)
	slot0.m_bPause = slot1 or true
end

MoveCompent.IsPaused = function (slot0)
	return slot0.m_bPause or true
end

MoveCompent.SetPathID = function (slot0, slot1, slot2)
	slot0.m_nPathID = slot1
	slot0.m_bTroop = slot2
end

MoveCompent.GetPathID = function (slot0)
	return slot0.m_nPathID
end

MoveCompent.bTroop = function (slot0)
	return slot0.m_bTroop
end

MoveCompent.InitMove = function (slot0)
	slot0.m_Elaspe = 0
	slot0.m_LastElaspe = -1
	slot0.m_bEndPath = false
end

MoveCompent.OnAttach = function (slot0)
	slot3 = slot0

	slot0.InitMove(slot2)
end

MoveCompent.IsEndPath = function (slot0)
	return slot0.m_bEndPath or false
end

MoveCompent.SetEndPath = function (slot0, slot1)
	slot0.m_bEndPath = slot1
end

MoveCompent.GetOffest = function (slot0)
	if not slot0.m_Offest then
		slot4 = 0
		slot1 = cc.p(slot2, 0)
	end

	return slot1
end

MoveCompent.SetOffest = function (slot0, slot1)
	slot0.m_Offest = slot1
end

MoveCompent.SetDelay = function (slot0, slot1)
	slot0.m_fDelay = slot1
end

MoveCompent.GetDelay = function (slot0)
	return slot0.m_fDelay or 0
end

MoveCompent.HasBeginMove = function (slot0)
	return slot0.m_bBeginMove or false
end

MoveCompent.Rebound = function (slot0)
	return slot0.m_bRebound or false
end

MoveCompent.SetRebound = function (slot0, slot1)
	slot0.m_bRebound = slot1
end

MoveCompent.SetPosition = function (slot0, slot1, slot2)
	slot0.m_pPosition.x = slot1
	slot0.m_pPosition.y = slot2
end

MoveCompent.GetCompentPosition = function (slot0)
	return slot0.m_pPosition
end

MoveCompent.SetDirection = function (slot0, slot1)
	slot0.m_fDirection = slot1
end

MoveCompent.GetCompentDirection = function (slot0)
	return slot0.m_fDirection
end

MoveCompent.SetOwner = function (slot0, slot1)
	slot0.m_pOwner = slot1
end

MoveCompent.GetOwner = function (slot0)
	return slot0.m_pOwner
end

slot0 = math.atan

MoveCompent.CalcAngle = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1 - slot3

	if slot2 - slot4 == 0 then
		if slot1 < slot3 then
			return M_PI_2
		else
			return -M_PI_2
		end
	end

	slot9 = slot5 / slot6
	slot7 = slot0(slot8)

	if slot6 < 0 then
		return -slot7 + M_PI
	else
		return -slot7
	end
end

MoveCompent.CacLine = function (slot0, slot1, slot2, slot3)
	return slot1[1] + slot1[5] * slot3, slot2[1] + slot2[5] * slot3, slot0.m_strMoveData.dir
end

MoveCompent.CacBesier = function (slot0, slot1, slot2, slot3, slot4)
	if slot3 == 3 then
		slot17 = slot2[2] + slot2[6] * slot4

		return slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4, slot0.CalcAngle(slot12, slot0, slot5, slot2[1] + slot2[5] * slot4, slot1[2] + slot1[6] * slot4) - M_PI_2
	else
		slot23 = slot2[2] + slot2[6] * slot4 + ((slot2[3] + slot2[7] * slot4) - (slot2[2] + slot2[6] * slot4)) * slot4

		return slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4 + ((slot1[2] + slot1[6] * slot4 + ((slot1[3] + slot1[7] * slot4) - (slot1[2] + slot1[6] * slot4)) * slot4) - (slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4)) * slot4, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4 + ((slot2[2] + slot2[6] * slot4 + ((slot2[3] + slot2[7] * slot4) - (slot2[2] + slot2[6] * slot4)) * slot4) - (slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4)) * slot4, slot0.CalcAngle(slot18, slot0, slot11, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4, slot1[2] + slot1[6] * slot4 + ((slot1[3] + slot1[7] * slot4) - (slot1[2] + slot1[6] * slot4)) * slot4) - M_PI_2
	end
end

slot1 = math.abs
slot2 = math.cos
slot3 = math.sin

MoveCompent.CalCircle = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot10 = slot5
	slot14 = slot4 + slot7 * slot0(slot9)

	return slot1 + slot3 * (1 + slot6 * slot7 * slot0(slot9)) * slot1(slot12), slot2 + slot3 * (1 + slot6 * slot7 * slot0(slot9)) * slot2(slot10), slot4 + slot7 * slot0(slot9) + M_PI_2
end

return
