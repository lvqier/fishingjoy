slot0 = class_C("World")

slot0.ctor = function (slot0)
	slot0._state = ENUM.WORLD_STATE.STOPPED
	slot0._entites = {}
	slot0._observations = {}
	slot0._dictionary = {}
	slot0._sizeCache = {}
	slot0._serverTimeOffset = 0
	slot0._currentUpdateDelta = 0
	slot0._pendingEvents = {}
	slot0._updatePriorityMap = {}
	slot0._fishCount = 0
	slot0._playerBulletNumberMap = {}
	slot0.objectManager = ClassLoader:aquireSingleton("ObjectManager")
end

slot0.setServerTimeOffset = function (slot0, slot1)
	slot0._serverTimeOffset = slot1
end

slot0.getCurrentTime = function (slot0)
	return parseInt(TimeApi.getTime() + slot0._serverTimeOffset)
end

slot0.getCurrentFrameDelta = function (slot0)
	return parseInt(TimeApi.getCurrentFrameDelta())
end

slot0.addEntity = function (slot0, slot1)
	slot0._entites[slot1] = slot1
	slot2 = slot1.category._value or "anonyms"

	if slot1.id._value then
		if not slot0._dictionary[slot2] then
			slot0._dictionary[slot2] = {}
			slot0._sizeCache[slot2] = 0
		end

		if slot0._dictionary[slot2][slot3] then
		end

		slot0._dictionary[slot2][slot3] = slot1
		slot0._sizeCache[slot2] = slot0._sizeCache[slot2] + 1
	end

	if slot0._state ~= ENUM.WORLD_STATE.STOPPED then
		slot1:onEnter(slot0)
	end
end

slot0.removeEntity = function (slot0, slot1)
	if slot0._state ~= ENUM.WORLD_STATE.STOPPED then
		slot1:onExit()
	else
		assert(false, "-------World:removeEntity(entity)-------")
	end

	slot2 = slot1:getValue("category") or "anonyms"

	if slot1.id._value and slot0._dictionary[slot2][slot3] then
		slot0._dictionary[slot2][slot3] = nil
		slot0._sizeCache[slot2] = slot0._sizeCache[slot2] - 1
	end

	slot0._entites[slot1] = nil

	slot0:destroyEntity(slot1)
end

slot0.update = function (slot0, slot1)
	if slot0._state == ENUM.WORLD_STATE.RUNNING then
		for slot5, slot6 in ipairs(slot0._updatePriorityMap) do
			DebugUtil.beginMark(slot6.categoryName)

			for slot11, slot12 in pairs(slot7) do
				slot12:onUpdate(slot1)
			end

			DebugUtil.endMark(slot6.categoryName)
		end
	end
end

slot0.retisterCategoryPriority = function (slot0, slot1, slot2)
	slot3 = slot2 or 0
	slot4 = 1

	for slot8, slot9 in ipairs(slot0._updatePriorityMap) do
		if slot3 <= slot9.priority then
			slot4 = slot8

			break
		else
			slot4 = slot8 + 1
		end
	end

	table.insert(slot0._updatePriorityMap, slot4, {
		priority = slot3,
		categoryName = slot1
	})
end

slot0.start = function (slot0)
	if slot0._state == ENUM.WORLD_STATE.STOPPED then
		slot0._state = ENUM.WORLD_STATE.RUNNING

		for slot4, slot5 in pairs(slot0._entites) do
			slot5:onEnter(slot0)
		end

		slot0:startUpdate()
	elseif slot0._state == ENUM.WORLD_STATE.PAUSING then
		slot0._state = ENUM.WORLD_STATE.RUNNING

		slot0:dispatchAllPendingEvents()
	end
end

slot0.pause = function (slot0)
	if slot0._state == ENUM.WORLD_STATE.RUNNING then
		slot0._state = ENUM.WORLD_STATE.PAUSING
	end
end

slot0.stop = function (slot0)
	if slot0._state == ENUM.WORLD_STATE.RUNNING then
		slot0._state = ENUM.WORLD_STATE.STOPPED

		for slot4, slot5 in pairs(slot0._entites) do
			slot5:onExit()
			slot0:destroyEntity(slot5)
		end

		slot0:stopUpdate()

		slot0._pendingEvents = {}
	end
end

slot0.destroyEntity = function (slot0, slot1)
	if (slot1:getValue("category") or "anonyms") == "fish" or slot2 == "bullet" then
		slot0.objectManager:recycleObject(slot1)
	else
		slot1:onDestroy()
	end
end

slot0.addObservation = function (slot0, slot1, slot2)
	slot0._observations[slot2] = slot0._observations[slot2] or {}
	slot0._observations[slot2][slot1] = slot1
end

slot0.removeObservation = function (slot0, slot1, slot2)
	if slot0._observations[slot2] then
		slot0._observations[slot2][slot1] = nil
	end
end

slot0.triggerEvent = function (slot0, slot1, slot2)
	if slot0._state == ENUM.WORLD_STATE.RUNNING then
		if slot0._observations[slot1] then
			for slot6, slot7 in pairs(slot0._observations[slot1]) do
				if slot7:getValue("enabled") then
					slot7:onEvent(slot1, slot2)
				end
			end
		end
	elseif slot0._state == ENUM.WORLD_STATE.PAUSING then
		slot0._pendingEvents[#slot0._pendingEvents + 1] = {
			eventName = slot1,
			eventParam = slot2
		}
	end
end

slot0.triggerFrameworkEvent = function (slot0, slot1, slot2)
	slot0._framework:fireSignal(slot1, slot2)
end

slot0.dispatchAllPendingEvents = function (slot0)
	for slot4, slot5 in ipairs(slot0._pendingEvents) do
		slot0:triggerEvent(slot5.eventName, slot5.eventParam)

		slot0._pendingEvents[slot4] = nil
	end

	slot0._pendingEvents = {}
end

slot0.startUpdate = function (slot0)
	slot0._cocosHandler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function (slot0)
		slot0:update(slot0)
	end, 0, false)
end

slot0.stopUpdate = function (slot0)
	cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0._cocosHandler)
end

slot0.getState = function (slot0)
	return slot0._state
end

slot0.retrieveEntity = function (slot0, slot1, slot2)
	slot3 = slot0._dictionary[slot1]
	slot4 = slot0._sizeCache[slot1]

	if slot2 then
		if slot3 then
			return slot3[slot2]
		else
			return nil
		end
	else
		return slot3 or {}, slot4 or 0
	end

	if slot3 and slot2 then
		return slot3[slot2]
	end
end

return slot0
