slot0 = class_C("GameObject", ClassLoader:aquireClass("Entity"))

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0, param)

	slot0._components = {}
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)

	for slot5, slot6 in pairs(slot0._components) do
		slot6:onEnter(slot1)
	end
end

slot0.onExit = function (slot0)
	slot0.super.onExit(slot0)

	for slot4, slot5 in pairs(slot0._components) do
		slot5:onExit()
	end
end

slot0.onDestroy = function (slot0)
	slot0:removeAllComponents()

	slot0._components = nil

	slot0.super.onDestroy(slot0)
end

slot0.addComponent = function (slot0, slot1, slot2)
	slot0._components[slot2] = slot1

	slot1:setValue("owner", slot0)
	slot1:onLoad()

	if slot0._world then
		slot1:onEnter(slot0._world)
	end

	slot0["c_" .. slot2] = slot1
end

slot0.getComponentByName = function (slot0, slot1)
	return slot0._components[slot1]
end

slot0.removeComponentByName = function (slot0, slot1)
	if slot0._components[slot1] then
		if slot0._world then
			slot2:onExit()
		end

		slot2:onUnload()
		slot2:onDestroy()

		slot0._components[slot1] = nil
	end
end

slot0.removeAllComponents = function (slot0)
	for slot4, slot5 in pairs(slot0._components) do
		slot0:removeComponentByName(slot4)
	end
end

slot0.updateComponents = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._components) do
		if slot6:getValue("enabled") then
			slot6:onUpdate(slot1)
		end
	end
end

slot0.onUpdate = function (slot0, slot1)
	slot0:updateComponents(slot1)
end

slot0.reset = function (slot0, slot1)
	slot0:onReset(slot1)

	for slot5, slot6 in pairs(slot0._components) do
		slot6:onReset(slot1)
	end
end

slot0.onReset = function (slot0)
	return
end

return slot0
