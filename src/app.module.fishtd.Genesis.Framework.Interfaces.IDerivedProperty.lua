slot0 = ClassLoader:aquireClass("INotification")
slot1 = class_C("IDerivedProperty")

slot1.ctor = function (slot0, slot1, slot2)
	slot0._value = slot2
	slot0.targetStart = 0
	slot0.targetMax = 5
	slot0.funcStart = 5
	slot0.funcMax = 10
	slot0.handlerScout = 0

	for slot6 = 1, 13, 1 do
		slot0[slot6] = false
	end
end

slot1.set = function (slot0, slot1)
	if slot0._value == nil or slot0._value ~= slot1 then
		if slot0[12] then
			slot0._value = slot0[12](slot1)
		else
			slot0._value = slot1
		end

		for slot5 = 1, slot0.handlerScout, 1 do
			slot0[slot0.funcStart + slot5](slot0[slot0.targetStart + slot5])
		end
	end
end

slot1.get = function (slot0)
	if slot0[13] then
		return slot0[13](slot0._value)
	else
		return slot0._value
	end
end

slot1.trigger = function (slot0, slot1)
	if slot0[12] then
		slot0._value = slot0[12](slot1)
	else
		slot0._value = slot1
	end

	for slot5 = 1, slot0.handlerScout, 1 do
		slot0[slot0.funcStart + slot5](slot0[slot0.targetStart + slot5])
	end
end

slot1.addPropertyChangedCallback = function (slot0, slot1, slot2)
	if slot2 then
		if slot0.handlerScout + slot0.targetStart == slot0.targetMax then
			assert(false)
		end

		slot0.handlerScout = slot0.handlerScout + 1
		slot0[slot0.targetStart + slot0.handlerScout] = slot1
		slot0[slot0.funcStart + slot0.handlerScout] = slot2
	end
end

slot1.removePropertyChangedCallback = function (slot0, slot1)
	slot2 = slot0.handlerScout + 1

	for slot6 = 1, slot0.handlerScout, 1 do
		if slot0[slot0.targetStart + slot6] == slot1 then
			slot2 = slot6
		end
	end

	for slot6 = slot2, slot0.handlerScout, 1 do
		slot0[slot0.targetStart + slot6] = nil
		slot0[slot0.funcStart + slot6] = nil

		if slot2 < slot0.handlerScout then
			slot0[slot7] = slot0[slot7 + 1]
			slot0[slot8] = slot0[slot8 + 1]
		else
			slot0.handlerScout = slot0.handlerScout - 1
		end
	end
end

slot1.setContainer = function (slot0, slot1)
	slot0[11] = slot1
end

slot1.getContainer = function (slot0)
	return slot0[11]
end

slot1.onDestroy = function (slot0)
	for slot4 = 1, 13, 1 do
		slot0[slot4] = nil
	end

	slot0._value = nil
end

return slot1
