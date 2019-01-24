slot0 = class_C("SimpleQueue")

slot0.ctor = function (slot0)
	slot0._front = 0
	slot0._back = 0
end

slot0.reset = function (slot0)
	for slot4 = slot0._front, slot0, _back - 1 do
		slot0[slot4] = nil
	end

	slot0._front = 0
	slot0._back = 0
end

slot0.popFront = function (slot0)
	if slot0._front < slot0._back then
		slot0[slot0._front] = nil
		slot0._front = slot0._front + 1

		return slot0[slot0._front]
	else
		return nil
	end
end

slot0.popBack = function (slot0)
	if slot0._front < slot0._back then
		slot0[slot0._back - 1] = nil
		slot0._back = slot0._back - 1

		return slot0[slot0._back - 1]
	else
		return nil
	end
end

slot0.pushFront = function (slot0, slot1)
	if slot1 then
		slot0._front = slot0._front - 1
		slot0[slot0._front] = slot1
	end
end

slot0.pushBack = function (slot0, slot1)
	if slot1 then
		slot0[slot0._back] = slot1
		slot0._back = slot0._back + 1
	end
end

slot0.front = function (slot0)
	if slot0._front < slot0._back then
		return slot0[slot0._front]
	end
end

slot0.back = function (slot0)
	if slot0._front < slot0._back then
		return slot0[slot0._back - 1]
	end
end

slot0.isEmpty = function (slot0)
	return slot0._front == slot0._back
end

slot0.size = function (slot0)
	return slot0._back - slot0._front
end

return slot0
