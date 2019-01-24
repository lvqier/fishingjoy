slot0 = ClassLoader:aquireClass("SimpleQueue")
slot1 = class_C("SimplePropertyMediator")

slot1.ctor = function (slot0)
	slot0._eventQueue = slot0:create()
	slot0._targetQueue = slot0:create()
	slot0._eventDispatching = false
	slot0._eventForTarget = {}
	slot0._visited = {}
end

slot1.send = function (slot0, slot1)
	slot0._eventQueue:pushBack(slot1)

	if not slot0._eventDispatching then
		slot0._eventDispatching = true

		while not slot0._eventQueue:isEmpty() do
			slot0._visited = {
				[slot0._eventQueue:popFront()._sender] = true
			}

			slot0:pushListeners(slot0._eventQueue.popFront()._sender)

			while not slot0._targetQueue:isEmpty() do
				slot4 = slot0._targetQueue:popFront()
				slot0._eventForTarget._sender = slot4._triggeredSender
				slot0._eventForTarget._value = slot4._triggeredSender:get()
				slot0._eventForTarget._trigger = slot2._trigger

				slot4:receive(slot0._eventForTarget)
				slot0:pushListeners(slot4)
			end
		end

		slot0._eventDispatching = false
	end
end

slot1.pushListeners = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1._listeners) do
		if not slot0._visited[slot5] then
			slot5._triggeredSender = slot1

			slot0._targetQueue:pushBack(slot5)

			slot0._visited[slot5] = true
		end
	end
end

return slot1
