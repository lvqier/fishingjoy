MathUtil = {
	RANDIAN_2_DEGREE = 180 / math.pi
}

MathUtil.getValueBetween = function (slot0, slot1, slot2)
	slot1, slot2 = MathUtil.getMinMax(slot1, slot2)

	return math.min(math.max(slot0, slot3), slot4)
end

MathUtil.getMin = function (slot0, slot1)
	if not slot0 then
		return slot1
	end

	return math.min(slot0, slot1)
end

MathUtil.getMax = function (slot0, slot1)
	if not slot0 then
		return slot1
	end

	return math.max(slot0, slot1)
end

MathUtil.getValueDiretion = function (slot0)
	if slot0 == 0 then
		return 1
	else
		return slot0 / math.abs(slot0)
	end
end

MathUtil.getMinMax = function (...)
	slot1, slot2 = nil

	for slot6, slot7 in ipairs(slot0) do
		slot1 = (slot1 == nil and slot7) or math.min(slot1, slot7)
		slot2 = (slot2 == nil and slot7) or math.max(slot2, slot7)
	end

	return slot1, slot2
end

MathUtil.getValueBetweenByPercent = function (slot0, slot1, slot2)
	slot1, slot2 = MathUtil.getMinMax(slot1, slot2)

	return slot3 + (slot4 - slot3) * slot0
end

MathUtil.isBetween = function (slot0, slot1, slot2)
	return slot1 <= slot0 and slot0 <= slot2
end

MathUtil.getRandomRate = function ()
	return math.random(1, 100000000) / 100000000
end

MathUtil.getRandom = function (slot0, slot1, slot2)
	if slot0 and slot1 then
		return math.random(slot0, slot1)
	elseif slot0 and not slot1 then
		return math.random(slot0)
	else
		return math.random()
	end
end

MathUtil.getDistance = function (slot0, slot1, slot2, slot3)
	return math.sqrt(math.pow(slot0 - slot2, 2) + math.pow(slot1 - slot3, 2))
end

function isNumberValid(slot0)
	return not isNaN(slot0) and slot0 ~= 0
end

function isNaN(slot0)
	return not slot0 or type(slot0) ~= "number" or tostring(slot0) == "nan"
end

function parseUInt(slot0)
	return math.max(0, parseInt(slot0))
end

function parseInt(slot0)
	if type(slot0) ~= "number" then
		slot0 = tonumber(slot0)
	end

	return math.floor(slot0 or 0)
end

function fixFloat1(slot0, slot1)
	return fixFloat(slot0, 1, slot1)
end

function fixFloat(slot0, slot1, slot2)
	slot1 = math.pow(10, slot1 or 2)

	if slot2 == 1 then
		return math.round(slot0 * slot1) / slot1
	elseif slot2 == 2 then
		return math.ceil(slot0 * slot1) / slot1
	else
		return math.floor(slot0 * slot1) / slot1
	end
end

function fixFloat2(slot0, slot1)
	return fixFloat(slot0, 2, slot1)
end

function numberEqual(slot0, slot1, slot2)
	return math.abs(slot0 - slot1) < (slot2 or 1e-11)
end

MathUtil.isRectSame = function (slot0, slot1)
	return slot0.x == slot1.x and slot0.y == slot1.y and slot0.width == slot1.width and slot0.height == slot1.height
end

MathUtil.inRect = function (slot0, slot1, slot2)
	if slot2:getMinX() <= slot0 and slot0 <= slot2:getMaxX() and slot2:getMinY() <= slot1 and slot1 <= slot2:getMaxY() then
		return true
	end

	return false
end

MathUtil.ixXYEqual = function (slot0, slot1, slot2, slot3)
	return slot0 == slot2 and slot1 == slot3
end

MathUtil.calRoundRectPosition = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot3 * 0.5
	slot18 = false

	if numberEqual(math.abs(MathUtil.segmentIntersectPolygon(slot13, slot15, slot16, true).y), slot4 * 0.5) then
		slot18 = math.abs(slot17.x - slot13.x) > slot7 - slot5
	end

	if math.abs(slot17.y - slot13.y) > slot8 - slot5 then
		slot19 = cc.p(0, 0)

		if slot1 < slot17.x then
			slot19.x = (slot1 + slot7) - slot5
		else
			slot19.x = slot1 - (slot7 - slot5)
		end

		if slot2 < slot17.y then
			slot19.y = (slot2 + slot8) - slot5
		else
			slot19.y = slot2 - (slot8 - slot5)
		end

		slot21 = 0
		slot22 = nil

		for slot26, slot27 in ipairs(slot20) do
			if slot21 < MathUtil.getDistance(slot1, slot2, slot27.x, slot27.y) then
				slot21 = slot28
				slot22 = slot27
			end
		end

		return slot22
	else
		return slot17
	end
end

MathUtil.calQuadByRadian = function (slot0)
	return MathUtil.getValueBetween(math.ceil(((slot0 < 0 and slot0 + math.ceil(-slot0 / (2 * math.pi)) * 2 * math.pi) or slot0 % (2 * math.pi)) / (math.pi * 0.5)), 1, 4)
end

MathUtil.createRectByLdAndRu = function (slot0, slot1, slot2, slot3)
	return cc.rect(slot0[slot2 or "x"], slot0[slot3 or "y"], slot1[slot2 or "x"] - slot0[slot2 or "x"], slot1[slot3 or "y"] - slot0[slot3 or "y"])
end

MathUtil.cutRect = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if not cc.rectIntersectsRect(slot6(slot0, slot0, slot1, slot1, slot4 or "x", slot5 or "y"), slot6(slot2, slot2, slot3, slot3, slot4 or "x", slot5 or "y")) then
		return slot8
	else
		slot9, slot10 = nil

		if slot0[slot4] <= slot2[slot4] and slot0[slot5] <= slot2[slot5] then
			slot9 = slot6(slot2, slot1, slot1, slot3, slot4, slot5)
			slot10 = slot6(slot1, slot2, slot3, slot3, slot4, slot5)
		elseif slot2[slot4] <= slot0[slot4] and slot0[slot5] <= slot2[slot5] then
			slot9 = slot6(slot2, slot2, slot0, slot1, slot4, slot5)
			slot10 = slot6(slot2, slot1, slot3, slot3, slot4, slot5)
		elseif slot2[slot4] <= slot0[slot4] and slot2[slot5] <= slot0[slot5] then
			slot9 = slot6(slot2, slot2, slot0, slot3, slot4, slot5)
			slot10 = slot6(slot0, slot2, slot3, slot0, slot4, slot5)
		elseif slot0[slot4] <= slot2[slot4] and slot2[slot5] <= slot0[slot5] then
			slot9 = slot6(slot2, slot2, slot1, slot0, slot4, slot5)
			slot10 = slot6(slot1, slot2, slot3, slot3, slot4, slot5)
		end

		if slot9.width < 0 and slot9.height < 0 then
			slot9 = nil
		end

		if slot10.width < 0 and slot10.height < 0 then
			slot10 = nil
		end

		if not slot9 then
			return slot10
		elseif not slot10 then
			return slot9
		else
			return slot9, slot10
		end
	end
end

MathUtil.cookNumWithComma = function (slot0)
	if #string.split(slot1, ".")[1] % 3 == 0 then
		slot5 = 3
	end

	slot6 = ""
	slot7 = 1

	while slot4 >= slot7 do
		if slot6 ~= "" then
			slot6 = slot6 .. ","
		end

		slot6 = slot6 .. string.sub(slot1, slot7, (slot7 + slot5) - 1)
		slot7 = slot7 + slot5
		slot5 = 3
	end

	if (slot2[2] or "") ~= "" then
		slot6 = slot6 .. "." .. slot8
	end

	return slot6
end

MathUtil.cookNumWithHansUnits = function (slot0, slot1, slot2)
	slot1 = slot1 or 2
	slot3 = ""

	if slot0 < 10000 then
		if slot0 >= 1000 and slot2 ~= nil and slot2 then
			return slot0 .. "千"
		end

		return slot0
	else
		return (slot0 < 100000000 and MathUtil.ifloor(slot0 / 10000 * 10^slot1) / 10^slot1 .. "万") or (slot0 < 1000000000000.0 and MathUtil.ifloor(slot0 / 100000000 * 10^slot1) / 10^slot1 .. "亿") or MathUtil.ifloor(slot0 / 1000000000000.0 * 10^slot1) / 10^slot1 .. "万亿"
	end
end

MathUtil.interpolatePoint = function (slot0, slot1, slot2)
	return cc.pLerp(slot0, slot1, slot2)
end

MathUtil.getDuFenMiao = function (slot0, slot1)
	slot4 = ((slot0 - math.floor(slot2)) * 60 - math.floor((slot0 - math.floor(slot2)) * 60)) * 60

	if (slot1 or 1) == 1 then
		return math.floor(slot2), math.floor(slot3), math.floor(slot4)
	elseif slot1 == 2 then
		return math.floor(slot2), math.floor(slot3), math.round(slot4 * 100) / 100
	end

	return nil
end

MathUtil.checkRectIntersectLine = function (slot0, slot1, slot2)
	slot3, slot4 = nil
	slot5 = {
		cc.p(cc.rectGetMinX(slot0), cc.rectGetMaxY(slot0)),
		cc.p(cc.rectGetMinX(slot0), cc.rectGetMinY(slot0)),
		cc.p(cc.rectGetMaxX(slot0), cc.rectGetMinY(slot0)),
		cc.p(cc.rectGetMaxX(slot0), cc.rectGetMaxY(slot0))
	}

	function slot6(slot0)
		if slot0 then
			if not slot0 then
				slot0 = slot0
			elseif not slot1 then
				slot1 = slot0
			else
				print("居然多出来？")
			end
		end
	end

	for slot10 = 1, 4, 1 do
		slot6(MathUtil.pGetIntersectPoint(slot1, slot2, slot5[slot10], slot5[slot10 + 1] or slot5[1]))
	end

	if cc.rectContainsPoint(slot0, slot1) then
		slot6(slot1)
	end

	if cc.rectContainsPoint(slot0, slot2) then
		slot6(slot2)
	end

	if slot3 and slot4 and not numberEqual(math.atan2(slot4.y - slot3.y, slot4.x - slot3.x), math.atan2(slot2.y - slot1.y, slot2.x - slot1.x)) then
		slot3 = slot4
		slot4 = slot3
	end

	return slot3, slot4
end

MathUtil.expandPoint = function (slot0, slot1, slot2)
	slot3 = cc.p(0, 0)
	slot4 = MathUtil.getDistance(slot0.x, slot0.y, slot1.x, slot1.y)
	slot3.x = slot0.x - (slot0.x - slot1.x) / slot4 * (slot4 + slot2)
	slot3.y = slot0.y - (slot0.y - slot1.y) / slot4 * (slot4 + slot2)

	return slot3
end

MathUtil.pGetIntersectPoint = function (slot0, slot1, slot2, slot3)
	slot6 = false
	slot6, slot4, slot5 = cc.pIsLineIntersect(slot0, slot1, slot2, slot3, 0, 0)

	if slot7 and slot4 <= 1 and slot4 >= 0 and slot5 >= 0 and slot5 <= 1 then
		return cc.p(slot0.x + slot4 * (slot1.x - slot0.x), slot0.y + slot4 * (slot1.y - slot0.y))
	else
		return nil
	end
end

MathUtil.checkBitState = function (slot0, slot1)
	return bit.band(slot0, slot1) ~= 0
end

MathUtil.setBitState = function (slot0, slot1, slot2)
	if slot2 then
		return MathUtil.setBitStateTrue(slot0, slot1)
	else
		return MathUtil.setBitStateFalse(slot0, slot1)
	end
end

MathUtil.setBitStateTrue = function (slot0, slot1)
	if not MathUtil.checkBitState(slot0, slot1) then
		return bit.bor(slot0, slot1)
	else
		return slot0
	end
end

MathUtil.setBitStateFalse = function (slot0, slot1)
	if MathUtil.checkBitState(slot0, slot1) then
		return bit.bxor(slot0, slot1)
	else
		return slot0
	end
end

MathUtil.fixRotation = function (slot0)
	if slot0 % 360 < 0 then
		slot1 = slot1 + 360
	end

	return slot1
end

MathUtil.segmentIntersectPolygon = function (slot0, slot1, slot2, slot3)
	slot4 = #slot2
	slot5 = nil

	for slot9, slot10 in ipairs(slot2) do
		if MathUtil.pGetIntersectPoint(slot0, slot1, slot10, slot2[slot9 + 1] or slot2[1]) then
			if slot3 then
				return slot12
			else
				table.insert(slot5 or {}, slot12)
			end
		end
	end

	return slot5
end

MathUtil.isPointInsidePolygon = function (slot0, slot1, slot2, slot3)
	if slot3 and slot0 < 0 then
		slot0 = slot0 + 360
	end

	if #(slot2 or {}) < 3 then
		return false
	end

	slot5 = false
	slot6 = slot4

	for slot10 = 1, slot4, 1 do
		slot13 = slot2[slot10].x
		slot14 = slot2[slot6].x

		if slot3 and slot13 < 0 then
			slot13 = slot13 + 360
		end

		if slot3 and slot14 < 0 then
			slot14 = slot14 + 360
		end

		if ((slot11.y < slot1 and slot1 <= slot12.y) or (slot12.y < slot1 and slot1 <= slot11.y)) and slot0 > slot13 + (slot1 - slot11.y) / (slot12.y - slot11.y) * (slot14 - slot13) then
			slot5 = not slot5
		end

		slot6 = slot10
	end

	return slot5
end

MathUtil.calLineInterpointViaCircle = function (slot0, slot1, slot2, slot3)
	slot4, slot5, slot6, slot7, slot8, slot9, slot10 = nil
	slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21 = nil
	slot19 = 2 * ((slot2.x * slot0.x + slot0.x * slot1.x + slot2.y * slot0.y + slot0.y * slot1.y) - slot2.x * slot1.x - slot2.y * slot1.y - slot0.x *  - slot0.y * ) *  - 4 * ((slot0.x *  + slot1.x *  + slot0.y *  + slot1.y * ) - 2 * slot0.x * slot1.x - 2 * slot0.y * slot1.y) * ((slot2.x *  + slot0.x *  + slot2.y *  + slot0.y * ) - 2 * slot2.x * slot0.x - 2 * slot2.y * slot0.y - slot3 * )
	slot22 = {}

	if math.abs((slot2.y - slot0.y) * slot2.x + (slot0.x - slot2.x) * slot2.y + slot2.x * slot0.y - slot0.x * slot2.y) / math.sqrt((slot2.y - slot0.y) * () + (slot0.x - slot2.x) * () + 1e-12) <= slot3 then
		slot23 = cc.p(0, 0)
		slot24 = cc.p(0, 0)

		if slot19 < slot11 then
			slot25, slot26 = nil
			slot23.x = slot4 + (-slot16 + math.sqrt(slot19)) / (2 * slot15) * (slot6 - slot4)
			slot23.y = slot5 + (-slot16 + math.sqrt(slot19)) / (2 * slot15) * (slot7 - slot5)
			slot25 = (slot23.x - slot8) / slot10
			slot26 = (slot23.y - slot9) / slot10

			table.insert(slot22, slot23)
		else
			slot25, slot26, slot27, slot28 = nil
			slot23.x = slot4 + (-slot16 + math.sqrt(slot19)) / (2 * slot15) * (slot6 - slot4)
			slot23.y = slot5 + (-slot16 + math.sqrt(slot19)) / (2 * slot15) * (slot7 - slot5)
			slot25 = (slot23.x - slot8) / slot10
			slot26 = (slot23.y - slot9) / slot10
			slot24.x = slot4 + (-slot16 - math.sqrt(slot19)) / (2 * slot15) * (slot6 - slot4)
			slot24.y = slot5 + (-slot16 - math.sqrt(slot19)) / (2 * slot15) * (slot7 - slot5)
			slot27 = (slot24.x - slot8) / slot10
			slot28 = (slot24.y - slot9) / slot10

			table.insert(slot22, slot23)
			table.insert(slot22, slot24)
		end
	end

	return slot22
end

MathUtil.rect4ContainsXY = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = false

	if slot0 <= slot4 and slot4 <= slot0 + slot2 and slot1 <= slot5 and slot5 <= slot1 + slot3 then
		slot6 = true
	end

	return slot6
end

MathUtil.rectContainsXY = function (slot0, slot1, slot2)
	return MathUtil.rect4ContainsXY(slot0.x, slot0.y, slot0.width, slot0.height, slot1, slot2)
end

MathUtil.ifloor = function (slot0)
	return math.floor(checknumber(slot0) + 1e-14)
end

return
