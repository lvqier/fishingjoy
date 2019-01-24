slot0 = class("EventManager")

slot0.ctor = function (slot0)
	slot0._eventSignal = {}
end

slot0.create = function (slot0)
	return slot0.new()
end

slot0.add = function (slot0, slot1, slot2, slot3)
	assert(slot1 ~= nil, "event cannot be nil")
	slot0:getSignalByEvent(slot1):add(slot2, slot3)
end

slot0.addOnce = function (slot0, slot1, slot2, slot3)
	assert(slot1 ~= nil, "event cannot be nil")
	slot0:getSignalByEvent(slot1):addOnce(slot2, slot3)
end

slot0.remove = function (slot0, slot1, slot2, slot3)
	assert(slot1 ~= nil, "event cannot be nil")

	if slot0._eventSignal[slot1] then
		slot4:remove(slot2, slot3)
		slot0:try2RemoveSignal(slot1)
	end
end

slot0.has = function (slot0, slot1)
	return slot0._eventSignal[slot1] ~= nil
end

slot0.dispatch = function (slot0, slot1, ...)
	assert(slot1 ~= nil, "event cannot be nil")

	if slot0._eventSignal[slot1] then
		slot2:emit(...)
		slot0:try2RemoveSignal(slot1)
	end
end

slot0.try2RemoveSignal = function (slot0, slot1)
	if slot0._eventSignal[slot1] and slot2:isEmpty() then
		slot0._eventSignal[slot1] = nil
	end
end

slot0.getSignalByEvent = function (slot0, slot1)
	if not slot0._eventSignal[slot1] then
		slot0._eventSignal[slot1] = SignalAs3.new("Event:" .. slot1)
	end

	return slot2
end

slot0.destroy = function (slot0)
	if slot0._eventSignal then
		for slot4, slot5 in pairs(slot0._eventSignal) do
			slot5:removeAll()
		end

		slot0._eventSignal = nil
	end
end

eventMgr = slot0.new()

return eventMgr
