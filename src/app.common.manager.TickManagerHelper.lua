TickManager.initHelper = function (slot0)
	slot4 = "serverTime"
	slot7 = slot0

	createSetterGetter(slot2, tickMgr, slot0.getTime(slot6))
end

TickManager.tickHooker = function (slot0, slot1, slot2)
	if slot0._serverTime then
		slot0._serverTime = slot0._serverTime + slot2
	end
end

TickManager.getDeltaToServerTime = function (slot0, slot1, slot2, slot3)
	if slot0._serverTime then
		slot4 = slot1 - slot0._serverTime

		if slot2 and slot4 < 0 then
			slot4 = 0
		end

		if not slot3 then
			slot7 = slot4
			slot4 = math.ceil(slot6)
		end

		return slot4
	else
		return 0
	end
end

slot2 = tickMgr

tickMgr.initHelper(function (slot0, slot1, slot2, slot3)
	if slot0._serverTime then
		slot4 = slot1 - slot0._serverTime

		if slot2 and slot4 < 0 then
			slot4 = 0
		end

		if not slot3 then
			slot7 = slot4
			slot4 = math.ceil(slot6)
		end

		return slot4
	else
		return 0
	end
end)

return
