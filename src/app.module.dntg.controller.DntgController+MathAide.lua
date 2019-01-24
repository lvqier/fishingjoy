DntgController.setBattleLayerSize = function (slot0, slot1, slot2, slot3, slot4)
	slot0.nServerWidth = slot1
	slot0.nServerHeight = slot2
	slot0.nClientWidth = slot3
	slot0.nClientHeight = slot4
	slot0.widthRatio = slot3 / slot1
	slot0.heightRatio = slot4 / slot2
	slot0.widthRatioSC = slot1 / slot3
	slot0.heightRatioSC = slot2 / slot4
end

DntgController.SetMirrowShow = function (slot0, slot1)
	slot0.bMirrow = slot1
end

function slot0(slot0, slot1, slot2, slot3, slot4)
	return slot0 * (1 - slot4) * (1 - slot4) * (1 - slot4) + slot1 * 3 * slot4 * (1 - slot4) * (1 - slot4) + slot2 * 3 * slot4 * slot4 * (1 - slot4) + slot3 * slot4 * slot4 * slot4
end

function slot1(slot0, slot1)
	return {
		outX = slot0.Position[1].x + (slot0.Position[2].x - slot0.Position[1].x) * slot1,
		outY = slot0.Position[1].y + (slot0.Position[2].y - slot0.Position[1].y) * slot1
	}
end

function slot2(slot0, slot1)
	return {
		xPos = slot0(slot0.Position[1].x, slot0.Position[2].x, slot0.Position[3].x, slot0.Position[4].x, slot1),
		yPos = slot0(slot0.Position[1].y, slot0.Position[2].y, slot0.Position[3].y, slot0.Position[4].y, slot1)
	}
end

function slot3(slot0, slot1)
	return nil
end

function slot4(slot0, slot1)
	return {
		outX = slot0.Position[1].x,
		outY = slot0.Position[1].y
	}
end

DntgController.updateObjectPositon = function (slot0, slot1, slot2)
	if slot1.Type == DNTG_PathMoveType.PMT_LINE then
		return slot0(slot1, slot2)
	elseif slot1.Type == DNTG_PathMoveType.PMT_BEZIER then
		return slot1(slot1, slot2)
	elseif slot1.Type == DNTG_PathMoveType.PMT_CIRCLE then
		return slot2(slot1, slot2)
	elseif slot1.Type == DNTG_PathMoveType.PMT_STAY then
		return slot3(slot1, slot2)
	end

	return nil
end

DntgController.CalcDistance = function (slot0, slot1, slot2, slot3, slot4)
	return math.sqrt((slot1 - slot3) * (slot1 - slot3) + (slot2 - slot4) * (slot2 - slot4))
end

DntgController.CalcAngle = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1 - slot3

	if math.abs(slot6) <= 0.01 then
		if slot1 < slot3 then
			return M_PI_2
		else
			return -M_PI_2
		end
	end

	slot7 = math.atan(slot5 / slot6)

	if slot6 < 0 then
		return -slot7 + M_PI
	else
		return -slot7
	end
end

DntgController.ConvertCoord2Servers = function (slot0, slot1, slot2)
	slot3 = slot1 or 0
	slot4 = slot2 or 0
	slot3, slot4 = slot0:ConvertCoortToScreenSizeSC(slot3, slot4)
	slot3, slot4 = slot0:ConvertCoortToCleientPosition(slot5, slot6)

	if slot0.bMirrow then
		slot3, slot4 = slot0:ConvertMirrorCoord(slot3, slot4)
	end

	return slot3, slot4
end

DntgController.ConvertCoord = function (slot0, slot1, slot2)
	if slot0.bMirrow then
		slot1 = slot0.nServerWidth - slot1
	else
		slot2 = slot0.nServerHeight - slot2
	end

	return slot1 * slot0.widthRatio, slot2 * slot0.heightRatio
end

DntgController.ConvertDirection = function (slot0, slot1)
	if slot0.bMirrow then
		return slot1 + math.pi
	else
		return slot1
	end
end

DntgController.GetShowBingonPosition = function (slot0, slot1)
	slot2 = slot1 or 0

	if slot0.bMirrow ~= nil and slot0.bMirrow == true then
		if slot1 == 0 then
			slot2 = 2
		elseif slot1 == 1 then
			slot2 = 3
		elseif slot1 == 2 then
			slot2 = 0
		elseif slot1 == 3 then
			slot2 = 1
		end
	end

	slot3 = 170

	if slot1 == 2 or slot1 == 3 then
		slot3 = -170
	end

	return Dntg_CannonSet.CannonPos.Cannon[slot2 + 1].PosX * slot0.nClientWidth, slot0.nClientHeight * (1 - Dntg_CannonSet.CannonPos.Cannon[slot2 + 1].PosY) + slot3
end

DntgController.GetCannonPosition = function (slot0, slot1)
	if slot1 > 3 or slot1 < 0 then
		return 0, 0
	end

	return Dntg_CannonSet.CannonPos.Cannon[slot1 + 1].PosX * slot0.nServerWidth, Dntg_CannonSet.CannonPos.Cannon[slot1 + 1].PosY * slot0.nServerHeight
end

DntgController.ConvertMirrorCoord = function (slot0, slot1, slot2)
	return slot0.nServerWidth - (slot1 or 0), slot0.nServerHeight - (slot2 or 0)
end

DntgController.ConvertCoortToCleientPosition = function (slot0, slot1, slot2)
	return slot1, slot0.nServerHeight - (slot2 or 0)
end

DntgController.ConvertCoortToScreenSizeSC = function (slot0, slot1, slot2)
	return slot1 / slot0.widthRatio, slot2 / slot0.heightRatio
end

DntgController.ConvertCoortToScreenSize = function (slot0, slot1, slot2)
	return slot1 * slot0.widthRatio, slot2 * slot0.heightRatio
end

DntgController.BBulletHitFish = function (slot0, slot1, slot2)
	return
end

return
