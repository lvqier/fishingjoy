slot0 = requireLuaFromModule(slot1)
slot3 = "MoveByPath"
slot1 = class("dntglk.dntgLogic.MoveCompent")

slot1.ctor = function (slot0)
	slot4 = slot0

	ClassUtil.extends(slot2, slot0)

	slot0.view = nil
	slot0.m_bEndPath = false
	slot0.m_Elaspe = 0
	slot0.m_LastElaspe = 0
	slot0.OnUpdate = slot0.OnUpdate
	slot0._math_min = math.min
	slot0._math_abs = math.abs
	slot0.CacBesier = slot0.CacBesier
	slot0.CalcAngle = slot0.CalcAngle
end

slot1.SetOwner = function (slot0, slot1)
	slot0.m_pOwner = slot1
	slot6 = -500

	slot0.m_pOwner.SetPosition(slot3, slot0.m_pOwner, -500)
end

slot1.OnUpdate = function (slot0, slot1)
	if slot0.m_fDelay > 0 then
		slot0.m_fDelay = slot0.m_fDelay - slot1

		if slot0.m_fDelay >= 0 then
			return
		else
			slot4 = slot0.m_fDelay
			slot1 = slot0._math_abs(slot3)
			slot0.m_bBeginMove = true
		end
	end

	slot0.m_Elaspe = slot0.m_Elaspe + slot1 * slot0.m_fSpeed

	if slot0.m_strMoveData.nDuration <= slot0.m_Elaspe then
		slot0.m_pOwner.__elapsed = slot2
		slot5 = slot0.m_pOwner

		slot0.m_pOwner.OnMoveEnd(slot4)

		return
	end

	slot3 = 0
	slot4 = 0
	slot5 = 0

	if slot0.m_strMoveData.Type == DNTGLK_PATH_MOVE_TYPE.LINE then
		slot11 = slot2 / slot0.m_strMoveData.nDuration
		slot5 = slot0.m_strMoveData.dir
		slot4 = slot0.m_strMoveData.yPos[1] + slot0.m_strMoveData.yPos[5] * slot0._math_min(slot9, 1)
		slot3 = slot0.m_strMoveData.xPos[1] + slot0.m_strMoveData.xPos[5] * slot0._math_min(slot9, 1)
	elseif slot0.m_strMoveData.Type == DNTGLK_PATH_MOVE_TYPE.BEZIER then
		slot10 = slot2
		slot3, slot4, slot5 = slot0.CacBesier(slot7, slot0, slot0.m_strMoveData)
	end

	slot10 = slot4 + slot0.m_Offest.y

	slot0.m_pOwner.SetPosition(slot7, slot0.m_pOwner, slot3 + slot0.m_Offest.x)

	slot9 = slot5

	slot0.m_pOwner.SetDirection(slot7, slot0.m_pOwner)

	slot0.m_pOwner.__x = slot3 + slot0.m_Offest.x
	slot0.m_pOwner.__y = slot4 + slot0.m_Offest.y
end

slot1.CacBesier = function (slot0, slot1, slot2)
	slot5 = slot2
	slot2 = math.floor(slot4)

	if slot1._progress <= 10000 then
		slot3 = 1
		slot4 = DntglkController.coefMaps

		while slot1._calculatedDuration < slot2 do
			slot1._progress = slot1._progress + slot3

			if slot1._progress > 10000 then
				slot1.nDuration = slot1._calculatedDuration
				slot7 = slot1.nDuration

				print(slot6)

				break
			end

			slot5 = slot0.m_strMoveData.xPos
			slot6 = slot0.m_strMoveData.yPos
			slot7 = slot4[slot1._progress]
			slot8 = 0
			slot9 = 0
			slot10 = 1
			slot11 = 0

			if slot1.nPointCount == 3 then
				slot8 = slot5[1] * slot7[1] + slot5[2] * slot7[2] + slot5[3] * slot7[3]
				slot9 = slot6[1] * slot7[1] + slot6[2] * slot7[2] + slot6[3] * slot7[3]
			elseif slot1.nPointCount == 4 then
				slot8 = slot5[1] * slot7[4] + slot5[2] * slot7[5] + slot5[3] * slot7[6] + slot5[4] * slot7[7]
				slot9 = slot6[1] * slot7[4] + slot6[2] * slot7[5] + slot6[3] * slot7[6] + slot6[4] * slot7[7]
			else
				slot14 = false

				assert(slot13)
			end

			if slot1._calculatedDuration >= 0 then
				slot11 = (slot8 - slot1._x[slot1._calculatedDuration]) * () + (slot9 - slot1._y[slot1._calculatedDuration]) * ()
			end

			if slot11 > 1 or slot1._calculatedDuration < 0 then
				if slot1._calculatedDuration >= 0 then
					slot18 = slot9
					slot10 = slot0.CalcAngle(slot13, slot0, slot1._x[slot1._calculatedDuration], slot1._y[slot1._calculatedDuration], slot8) - math.pi / 2
				end

				slot1._calculatedDuration = slot1._calculatedDuration + 1
				slot1._x[slot1._calculatedDuration] = slot8
				slot1._y[slot1._calculatedDuration] = slot9
				slot1._dir[slot1._calculatedDuration] = slot10
			end
		end
	end

	if not slot1._x[(slot2 <= slot1._calculatedDuration and slot2) or slot1._calculatedDuration] then
		slot5 = slot1._calculatedDuration

		dump(slot4)

		slot5 = slot2

		dump(slot4)

		slot5 = slot1._progress

		dump(slot4)

		slot5 = false

		assert(slot4)
	end

	return slot1._x[slot2], slot1._y[slot2], slot1._dir[slot2]
end

return slot1
