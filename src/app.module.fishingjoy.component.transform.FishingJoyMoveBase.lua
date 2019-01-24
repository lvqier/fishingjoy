slot3 = {}
slot0 = class(slot1, "FishingJoyMoveBase")

slot0.ctor = function (slot0)
	slot0.entityPosition = {
		x = 0,
		y = 0
	}
	slot0.entityDirection = 0
	slot0.moveSpeed = 0
	slot0.movePause = false
	slot0.pathId = 0
	slot0.moveOffset = {
		x = 0,
		y = 0
	}
	slot0.moveDelay = 0
	slot0.moveBegin = false
	slot0.moveFinish = false
	slot0.moveRebound = false
	slot0.targetId = 0
	slot0.troop = false
	slot0.executor = nil
end

slot0.setMovePathData = function (slot0, slot1)
	slot0.movePathData = slot1

	if not slot0.movePathData.isPointBuff then
		slot0.movePathData.xPos = {
			slot0.movePathData.Position[1].x,
			slot0.movePathData.Position[2].x,
			slot0.movePathData.Position[3].x,
			slot0.movePathData.Position[4].x
		}
		slot0.movePathData.yPos = {
			slot0.movePathData.Position[1].y,
			slot0.movePathData.Position[2].y,
			slot0.movePathData.Position[3].y,
			slot0.movePathData.Position[4].y
		}

		if slot0.movePathData.Type == FISHINGJOY_PATH_TYPE.LINE then
			slot0.movePathData.xPos[5] = slot0.movePathData.xPos[2] - slot0.movePathData.xPos[1]
			slot0.movePathData.yPos[5] = slot0.movePathData.yPos[2] - slot0.movePathData.yPos[1]
			slot11 = slot0.movePathData.yPos[2]
			slot0.movePathData.dir = slot0.calRotationAngle(slot6, slot0, slot0.movePathData.xPos[1], slot0.movePathData.yPos[1], slot0.movePathData.xPos[2]) - FISHINGJOY_HALF_PI
		elseif slot0.movePathData.Type == FISHINGJOY_PATH_TYPE.BEZIER then
			slot0.movePathData.xPos[5] = slot0.movePathData.xPos[2] - slot0.movePathData.xPos[1]
			slot0.movePathData.xPos[6] = slot0.movePathData.xPos[3] - slot0.movePathData.xPos[2]
			slot0.movePathData.yPos[5] = slot0.movePathData.yPos[2] - slot0.movePathData.yPos[1]
			slot0.movePathData.yPos[6] = slot0.movePathData.yPos[3] - slot0.movePathData.yPos[2]

			if slot0.movePathData.nPointCount ~= 3 then
				slot2[7] = slot2[4] - slot2[3]
				slot3[7] = slot3[4] - slot3[3]
			end
		end

		slot0.movePathData.isPointBuff = true
	end
end

slot0.setMoveSpeed = function (slot0, slot1)
	slot0.moveSpeed = slot1
end

slot0.getMoveSpeed = function (slot0)
	return slot0.moveSpeed or 0
end

slot0.setMovePause = function (slot0, slot1)
	slot0.movePause = slot1 or true
end

slot0.checkMovePause = function (slot0)
	return slot0.movePause or true
end

slot0.readyBeforeMoving = function (slot0)
	slot0.goneLen = 0
	slot0.lastGoneLen = -1
	slot0.moveFinish = false
end

slot0.attach = function (slot0)
	slot3 = slot0

	slot0.readyBeforeMoving(slot2)
end

slot0.getMoveOffset = function (slot0)
	if not slot0.moveOffset then
		slot4 = 0
		slot1 = cc.p(slot2, 0)
	end

	return slot1
end

slot0.setMoveOffset = function (slot0, slot1)
	slot0.moveOffset = slot1
end

slot0.setMoveDelay = function (slot0, slot1)
	slot0.moveDelay = slot1
end

slot0.getMoveDelay = function (slot0)
	return slot0.moveDelay or 0
end

slot0.checkMoveBegin = function (slot0)
	return slot0.moveBegin or false
end

slot0.checkMoveRebound = function (slot0)
	return slot0.moveRebound or false
end

slot0.setMoveRebound = function (slot0, slot1)
	slot0.moveRebound = slot1
end

slot0.setEntityPosition = function (slot0, slot1, slot2)
	slot0.entityPosition.x = slot1
	slot0.entityPosition.y = slot2
end

slot0.getComponentPosition = function (slot0)
	return slot0.entityPosition
end

slot0.setComponentDirection = function (slot0, slot1)
	slot0.entityDirection = slot1
end

slot0.getComponentDirection = function (slot0)
	return slot0.entityDirection
end

slot0.setComponentExecutor = function (slot0, slot1)
	slot0.executor = slot1
end

slot0.getComponentExecutor = function (slot0)
	return slot0.executor
end

slot1 = math.atan

slot0.calRotationAngle = function (slot0, slot1, slot2, slot3, slot4)
	if slot2 - slot4 == 0 then
		if slot1 < slot3 then
			return FISHINGJOY_HALF_PI
		else
			return -FISHINGJOY_HALF_PI
		end
	end

	slot9 = (slot1 - slot3) / slot5
	slot7 = slot0(slot8)

	if slot5 < 0 then
		return -slot7 + FISHINGJOY_PI
	else
		return -slot7
	end
end

slot0.calPathLine = function (slot0, slot1, slot2, slot3)
	return slot1[1] + slot1[5] * slot3, slot2[1] + slot2[5] * slot3, slot0.movePathData.dir
end

slot0.calPathBezier = function (slot0, slot1, slot2, slot3, slot4)
	if slot3 == 3 then
		slot17 = slot2[2] + slot2[6] * slot4

		return slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4, slot0.calRotationAngle(slot12, slot0, slot5, slot2[1] + slot2[5] * slot4, slot1[2] + slot1[6] * slot4) - FISHINGJOY_HALF_PI
	else
		slot23 = slot2[2] + slot2[6] * slot4 + ((slot2[3] + slot2[7] * slot4) - (slot2[2] + slot2[6] * slot4)) * slot4

		return slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4 + ((slot1[2] + slot1[6] * slot4 + ((slot1[3] + slot1[7] * slot4) - (slot1[2] + slot1[6] * slot4)) * slot4) - (slot1[1] + slot1[5] * slot4 + ((slot1[2] + slot1[6] * slot4) - (slot1[1] + slot1[5] * slot4)) * slot4)) * slot4, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4 + ((slot2[2] + slot2[6] * slot4 + ((slot2[3] + slot2[7] * slot4) - (slot2[2] + slot2[6] * slot4)) * slot4) - (slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4)) * slot4, slot0.calRotationAngle(slot18, slot0, slot11, slot2[1] + slot2[5] * slot4 + ((slot2[2] + slot2[6] * slot4) - (slot2[1] + slot2[5] * slot4)) * slot4, slot1[2] + slot1[6] * slot4 + ((slot1[3] + slot1[7] * slot4) - (slot1[2] + slot1[6] * slot4)) * slot4) - FISHINGJOY_HALF_PI
	end
end

return slot0
