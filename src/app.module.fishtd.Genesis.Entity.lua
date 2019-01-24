slot0 = class_C("Entity", ClassLoader:aquireClass("IPropertyContainer"))

slot0.onCreate = function (slot0)
	slot0:ctor()
	slot0:addProperty("category")
	slot0:addProperty("id")
	slot0:addProperty("state")
	slot0:addProperty("enabled")

	slot0._world = nil
	slot0._alive = true
	slot0._listeners = {}
end

slot0.onCreateFinish = function (slot0)
	slot0:searchAndRegisterChangeHandlers()
	slot0:setValue("enabled", true)
end

slot0.onReset = function (slot0)
	return
end

slot0.onEnter = function (slot0, slot1)
	slot0._world = slot1

	for slot5, slot6 in pairs(slot0._listeners) do
		slot0._world:addObservation(slot0, slot5)
	end
end

slot0.onExit = function (slot0)
	for slot4, slot5 in pairs(slot0._listeners) do
		slot0._world:removeObservation(slot0, slot4)
	end

	slot0._world = nil
end

slot0.onUpdate = function (slot0, slot1)
	return
end

slot0.onEvent = function (slot0, slot1, slot2)
	if slot0._listeners[slot1] then
		slot3(slot0, slot2)
	end
end

slot0.startListen = function (slot0, slot1)
	if slot0[string.format("handle_%s", slot1)] then
		slot0._listeners[slot1] = slot0[slot2]
	end

	if slot0._world then
		slot0._world:addObservation(slot0, slot1)
	end
end

slot0.stopListen = function (slot0, slot1)
	slot0._listeners[slot1] = nil

	if slot0._world then
		slot0._world:removeObservation(slot0, slot1)
	end
end

slot0.triggerEvent = function (slot0, slot1, slot2)
	if slot0._world and slot0:getValue("enabled") then
		slot0._world:triggerEvent(slot1, slot2)
	end
end

slot0.onDestroy = function (slot0)
	slot0.super.onDestroy(slot0)

	for slot4, slot5 in pairs(slot0._listeners) do
		slot0._listeners[slot4] = nil
	end

	slot0._listeners = nil
	slot0._world = nil
end

return slot0
