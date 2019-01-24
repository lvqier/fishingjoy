slot2 = "FishingJoyMovePoint"
FishingJoyMovePoint = class(slot1)
slot0 = math.min
slot1 = math.abs

FishingJoyMovePoint.ctor = function (slot0)
	slot3 = slot0
	slot6 = "component.transform.FishingJoyMoveBase"

	ClassUtil.extends(slot2, FishingJoyRequireLua(slot5))

	slot0.moveFinish = false
	slot0.goneLen = 0
	slot0.lastGoneLen = 0
end

FishingJoyMovePoint.onUpdate = function (slot0, slot1)
	slot2 = slot1

	if slot0.executor == nil then
		return
	end

	if slot0.moveFinish == true then
		slot5 = slot0.executor

		slot0.executor.entityFinishMove(slot4)

		return
	end

	slot5 = slot0.executor
	slot6 = slot0.executor.getEntityAppendBuffs(pairs) or {}

	for slot7, slot8 in slot4(slot5) do
		slot11 = slot8

		if slot8.getBuffType(slot10) == FISHINGJOY_BUFF_TYPE.CHANGESPEED then
			slot11 = slot8
			slot2 = slot2 * slot8.getBuffParam(slot10)
		end
	end

	if slot0.moveDelay > 0 then
		slot0.moveDelay = slot0.moveDelay - slot2

		if slot0.moveDelay >= 0 then
			slot8 = -500

			slot0.executor.setEntityPosition(slot5, slot0.executor, -500)

			return
		else
			slot6 = slot0.moveDelay
			slot2 = slot0(slot5)
		end
	end

	if slot0.moveBegin == false and slot0.goneLen > 0 then
		slot0.moveBegin = true
	end

	slot7 = slot0
	slot0.goneLen = slot0.goneLen + slot2 * slot0.getMoveSpeed(slot6)

	if slot0.lastGoneLen == slot0.goneLen then
		return
	end

	slot0.lastGoneLen = slot0.goneLen

	if slot0.movePathData.pathDuration <= slot0.goneLen then
		slot0.moveFinish = true
	end

	slot8 = slot4 / slot0.movePathData.pathDuration
	slot5 = slot1(slot6, 1)
	slot6 = 0
	slot7 = 0
	slot8 = 0

	if slot0.movePathData.Type == FISHINGJOY_PATH_TYPE.LINE then
		slot14 = slot5
		slot6, slot7, slot8 = slot0.calPathLine(slot10, slot0, slot0.movePathData.xPos, slot0.movePathData.yPos)
	elseif slot0.movePathData.Type == FISHINGJOY_PATH_TYPE.BEZIER then
		slot15 = slot5
		slot6, slot7, slot8 = slot0.calPathBezier(slot10, slot0, slot0.movePathData.xPos, slot0.movePathData.yPos, slot0.movePathData.nPointCount)
	elseif slot0.movePathData.Type == FISHINGJOY_PATH_TYPE.STAY then
		slot6 = slot0.movePathData.xPos[0]
		slot7 = slot0.movePathData.yPos[0]
	end

	slot14 = slot7 + slot0.getMoveOffset(slot10).y

	slot0.executor.setEntityPosition(slot0, slot0.executor, slot6 + slot0.getMoveOffset(slot10).x)

	slot13 = slot8

	slot0.executor.setComponentDirection(slot0, slot0.executor)
end

return FishingJoyMovePoint
