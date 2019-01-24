slot2 = "ListQueue"
slot0 = class(slot1)

slot0.ctor = function (slot0)
	slot0._front = nil
	slot0._back = nil
	slot0._size = 0
	slot0._freeNode = {}
	slot0._freeNodeNumber = 0

	for slot4 = 1, 50000, 1 do
		slot0._freeNode[slot4] = {}
	end

	slot0._freeNodeNumber = 50000
end

slot0.reset = function (slot0)
	slot3 = slot0

	while not slot0.isEmpty(slot2) do
		slot3 = slot0

		slot0.popFront(slot2)
	end
end

slot0.popFront = function (slot0)
	if slot0._front then
		slot1 = slot0._front._val
		slot0._freeNodeNumber = slot0._freeNodeNumber + 1
		slot0._freeNode[slot0._freeNodeNumber] = slot0._front
		slot0._front = slot0._front._next
		slot0._size = slot0._size - 1

		if slot0._size == 0 then
			slot0._back = nil
		end

		return slot1
	end

	return nil
end

slot0.popBack = function (slot0)
	if slot0._back then
		slot1 = slot0._back._val
		slot0._freeNodeNumber = slot0._freeNodeNumber + 1
		slot0._freeNode[slot0._freeNodeNumber] = slot0._front
		slot0._back = slot0._back._prev
		slot0._size = slot0._size - 1

		if slot0._size == 0 then
			slot0._front = nil
		end

		return slot1
	end

	return nil
end

slot0.pushFront = function (slot0, slot1)
	if slot1 then
		slot0._freeNodeNumber = slot0._freeNodeNumber - 1
		slot0._freeNode[slot0._freeNodeNumber]._val = slot1
		slot0._freeNode[slot0._freeNodeNumber]._next = slot0._front
		slot0._freeNode[slot0._freeNodeNumber]._prev = nil

		if slot0._front then
			slot0._front._prev = slot2
		end

		slot0._front = slot2

		if slot0._size == 0 then
			slot0._back = slot0._front
		end

		slot0._size = slot0._size + 1
	end
end

slot0.pushBack = function (slot0, slot1)
	if slot1 then
		slot0._freeNodeNumber = slot0._freeNodeNumber - 1
		slot0._freeNode[slot0._freeNodeNumber]._val = slot1
		slot0._freeNode[slot0._freeNodeNumber]._next = nil
		slot0._freeNode[slot0._freeNodeNumber]._prev = slot0._back

		if slot0._back then
			slot0._back._next = slot2
		end

		slot0._back = slot2

		if slot0._size == 0 then
			slot0._front = slot0._back
		end

		slot0._size = slot0._size + 1
	end
end

slot0.front = function (slot0)
	return slot0._front._val
end

slot0.back = function (slot0)
	return slot0._back._val
end

slot0.isEmpty = function (slot0)
	return slot0._size == 0
end

slot0.size = function (slot0)
	return slot0._size
end

return slot0
