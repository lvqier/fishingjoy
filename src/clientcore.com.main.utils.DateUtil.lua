DateUtil = {
	getDateString = function (slot0, slot1, slot2)
		slot1 = slot1 or 1

		if slot0 == nil then
			slot3 = os.date("%Y", tickMgr:getServerTime() or tickMgr:getTime())
			slot4 = os.date("%m", tickMgr.getServerTime() or tickMgr.getTime())
			slot5 = os.date("%d", tickMgr.getServerTime() or tickMgr.getTime())
			slot6 = os.date("%H", tickMgr.getServerTime() or tickMgr.getTime())
			slot7 = os.date("%M", tickMgr.getServerTime() or tickMgr.getTime())
			slot8 = os.date("%S", tickMgr.getServerTime() or tickMgr.getTime())
		end

		if slot2 then
			slot3 = StringUtil.int2StringKeepBits(slot3, 2, true)
			slot4 = StringUtil.int2StringKeepBits(slot4, 2)
			slot5 = StringUtil.int2StringKeepBits(slot5, 2)
			slot6 = StringUtil.int2StringKeepBits(slot6, 2)
			slot7 = StringUtil.int2StringKeepBits(slot7, 2)
			slot8 = StringUtil.int2StringKeepBits(slot8, 2)
		end

		if slot1 == 1 then
			return slot4 .. "-" .. slot5 .. " " .. slot6 .. ":" .. slot7
		elseif slot1 == 2 then
			return slot3 .. "-" .. slot4 .. "-" .. slot5
		elseif slot1 == 3 then
			return slot3 .. "-" .. slot4 .. "-" .. slot5 .. "  " .. slot6 .. ":" .. slot7 .. ":" .. slot8
		elseif slot1 == 4 then
			return slot6 .. ":" .. slot7
		elseif slot1 == 5 then
			return string.format("%s-%s %s:%s", slot4, slot5, slot6, slot7)
		elseif slot1 == 6 then
			return slot3, slot4, slot5
		elseif slot1 == 7 then
			return slot4 .. "月" .. slot5 .. "日"
		end
	end
}

DateUtil.getChinaDateString = function (slot0, slot1, slot2)
	return DateUtil.getDateString(tickMgr:getChinaTime(slot0), slot1, slot2)
end

DateUtil.getSecondByString = function (slot0)
	slot1, slot2, slot11, slot4, slot5, slot6, slot7, slot8 = string.find(slot0, "(%d+)-(%d+)-(%d+) *(%d*):?(%d*):?(%d*)")

	return os.time({
		year = tonumber(slot3) or 0,
		month = tonumber(slot4) or 0,
		day = tonumber(slot5) or 0,
		hour = tonumber(slot6) or 0,
		min = tonumber(slot7) or 0,
		sec = tonumber(slot8) or 0
	})
end

DateUtil.getTimeString = function (slot0, slot1, slot2)
	if slot0 == nil then
		slot0 = tickMgr:getTodaySecond()
	end

	slot1 = slot1 or 1

	if slot2 == nil then
		slot2 = true
	end

	slot3 = slot0 % 60
	slot4 = parseInt((slot0 / 60) % 60)
	slot5 = parseInt(slot0 / 60 / 60)
	slot6 = parseInt((slot0 / 60 / 60) % 24)
	slot7 = parseInt(slot0 / 60 / 60 / 24)
	slot8, slot9, slot10, slot11, slot12 = nil

	if slot2 then
		slot8 = StringUtil.int2StringKeepBits(slot5, 2, true)
		slot9 = StringUtil.int2StringKeepBits(slot4, 2)
		slot10 = StringUtil.int2StringKeepBits(slot3, 2)
		slot11 = StringUtil.int2StringKeepBits(slot6, 2)
		slot12 = tostring(slot7)
	else
		slot8 = tostring(slot5)
		slot9 = tostring(slot4)
		slot10 = tostring(slot3)
		slot11 = tostring(slot6)
		slot12 = tostring(slot7)
	end

	if slot1 == 1 then
		return slot8 .. ":" .. slot9 .. ":" .. slot10
	elseif slot1 == 2 then
		slot13 = ""

		if slot5 ~= 0 then
			slot13 = slot13 .. slot8 .. ":"
		end

		if slot5 ~= 0 or slot4 ~= 0 then
			slot13 = slot13 .. slot9 .. ":"
		end

		return slot13 .. slot10
	elseif slot1 == 3 then
		slot13 = ""

		if slot5 ~= 0 then
			slot13 = slot13 .. slot8 .. ":"
		end

		return slot13 .. slot9 .. ":" .. slot10
	elseif slot1 == 4 then
		slot13 = ""

		if slot5 ~= 0 then
			slot13 = I18n.get("c672", slot13, slot8)
		end

		if slot5 ~= 0 or slot4 ~= 0 then
			slot13 = I18n.get("c673", slot13, slot9)
		end

		return I18n.get("c674", slot13, slot10)
	elseif slot1 == 5 then
		slot13 = ""

		if slot7 ~= 0 then
			slot13 = slot13 .. slot12 .. "d" .. " "
		end

		return slot13 .. slot11 .. ":" .. slot9 .. ":" .. slot10
	elseif slot1 == 6 then
		return slot9 .. ":" .. slot10
	end

	return ""
end

DateUtil.isNextDay = function (slot0)
	if slot0 <= 0 then
		return true
	end

	if os.date("%Y", slot0) < os.date("%Y", tickMgr:getServerTime() or tickMgr:getTime()) then
		return true
	elseif slot3 < slot2 then
		return false
	end

	if os.date("%m", slot0) < os.date("%m", slot1) then
		return true
	elseif slot5 < slot4 then
		return false
	end

	return os.date("%d", slot0) < os.date("%d", slot1)
end

return
