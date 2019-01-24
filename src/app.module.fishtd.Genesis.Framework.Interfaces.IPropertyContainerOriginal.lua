slot0 = class_C("IPropertyContainer")

slot0.ctor = function (slot0)
	slot0._properties = {}
	slot0._callbacks = {}
end

slot0.addProperty = function (slot0, slot1, slot2)
	if not slot0._properties[slot1] and ClassLoader:aquireInstance("IDerivedProperty", slot1, slot2) then
		slot3:setName(slot1)
		slot3:setPropertyChangedCallback(slot0.onPropertyChanged, slot0)

		slot0._properties[slot1] = slot3
		slot0[slot1] = slot3
	end
end

slot0.bindSameName = function (slot0, slot1, slot2, slot3)
	slot5 = slot2._properties[slot1]

	if slot0._properties[slot1] and slot5 then
		slot4:bind(slot5, slot3)
	end
end

slot0.removeProperty = function (slot0, slot1)
	if slot0._properties[slot1] then
		slot0._callbacks[slot2] = nil
		slot0._properties[slot1] = nil
		slot0[slot1] = nil

		slot2:destroy()
	end
end

slot0.removeAllProperties = function (slot0)
	for slot4, slot5 in pairs(slot0._properties) do
		slot5:destroy()

		slot0[slot4] = nil
	end

	slot0._properties = {}
	slot0._callbacks = {}
end

slot0.getProperty = function (slot0, slot1)
	return slot0._properties[slot1]
end

slot0.getValue = function (slot0, slot1, slot2)
	if slot0._properties[slot1] then
		return slot3:get()
	else
		return slot2
	end
end

slot0.setValue = function (slot0, slot1, slot2)
	return slot0._properties[slot1] and slot3:set(slot2)
end

slot0.trigger = function (slot0, slot1, slot2)
	return slot0._properties[slot1] and slot3:trigger(slot2)
end

slot0.onPropertyChanged = function (slot0, slot1, slot2)
	if slot0._callbacks[slot1] then
		slot3(slot0, slot1, slot2)
	end
end

slot0.searchAndRegisterChangeHandlers = function (slot0)
	for slot4, slot5 in pairs(slot0._properties) do
		if slot0[string.format("on_%s_changed", slot4)] then
			slot0._callbacks[slot5] = slot7
		end
	end
end

return slot0
