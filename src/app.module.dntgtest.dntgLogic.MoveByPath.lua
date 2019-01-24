slot2 = "MoveByPath"
slot0 = class(slot1)

slot0.ctor = function (slot0)
	slot4 = MoveCompent

	ClassUtil.extends(slot2, slot0)

	slot0.view = nil
	slot0.m_bEndPath = false
	slot0.m_Elaspe = 0
	slot0.m_LastElaspe = 0
end

slot1 = math.min
slot2 = math.abs

slot0.OnUpdate = function (slot0, slot1)
	slot2 = slot1

	if slot0.m_pOwner == nil then
		return
	end

	if slot0.m_bEndPath == true then
		slot5 = slot0.m_pOwner

		slot0.m_pOwner.OnMoveEnd(slot4)

		return
	end

	slot6 = slot0.m_pOwner.GetBuffs(slot4)

	for slot7, slot8 in pairs(slot0.m_pOwner) do
		slot11 = slot8

		if slot8.GetType(slot10) == DNTGTEST_BUFF_TYPE.CHANGESPEED then
			slot11 = slot8
			slot2 = slot2 * slot8.GetParam(slot10)
		end
	end

	if slot0.m_fDelay > 0 then
		slot0.m_fDelay = slot0.m_fDelay - slot2

		if slot0.m_fDelay >= 0 then
			slot8 = -500

			slot0.m_pOwner.SetPosition(slot5, slot0.m_pOwner, -500)

			return
		else
			slot6 = slot0.m_fDelay
			slot2 = slot0(slot5)
		end
	end

	if slot0.m_bBeginMove == false and slot0.m_Elaspe > 0 then
		slot0.m_bBeginMove = true
	end

	slot7 = slot0
	slot0.m_Elaspe = slot0.m_Elaspe + slot2 * slot0.GetSpeed(slot6)

	if slot0.m_LastElaspe == slot0.m_Elaspe then
		return
	end

	slot0.m_LastElaspe = slot4

	if slot0.m_strMoveData.nDuration <= slot4 then
		slot0.m_bEndPath = true
	end

	slot8 = slot4 / slot0.m_strMoveData.nDuration
	slot5 = slot1(slot6, 1)
	slot6 = 0
	slot7 = 0
	slot8 = 0

	if slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.LINE then
		slot14 = slot5
		slot6, slot7, slot8 = slot0.CacLine(slot10, slot0, slot0.m_strMoveData.xPos, slot0.m_strMoveData.yPos)
	elseif slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.BEZIER then
		slot15 = slot5
		slot6, slot7, slot8 = slot0.CacBesier(slot10, slot0, slot0.m_strMoveData.xPos, slot0.m_strMoveData.yPos, slot0.m_strMoveData.nPointCount)
	elseif slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.CIRCLE then
	elseif slot0.m_strMoveData.Type == DNTGTEST_PATH_MOVE_TYPE.STAY then
		slot6 = slot0.m_strMoveData.xPos[0]
		slot7 = slot0.m_strMoveData.yPos[0]
	end

	slot14 = slot7 + slot0.GetOffest(slot10).y

	slot0.m_pOwner.SetPosition(slot0, slot0.m_pOwner, slot6 + slot0.GetOffest(slot10).x)

	slot13 = slot8

	slot0.m_pOwner.SetDirection(slot0, slot0.m_pOwner)
end

return slot0
