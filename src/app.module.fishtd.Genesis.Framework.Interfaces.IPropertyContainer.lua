slot0 = class_C("IPropertyContainer")

slot0.ctor = function (slot0)
	slot0._properties = {}
	slot0._binded = {}
end

slot0.addProperty = function (slot0, slot1, slot2)
	if not slot0._properties[slot1] and not slot2 and ClassLoader:aquireInstance("IDerivedProperty", slot1) then
		slot3:setContainer(slot0)

		slot0._properties[slot1] = slot3
		slot0[slot1] = slot3
	end
end

slot0.bindSameName = function (slot0, slot1, slot2)
	slot3 = slot0._properties[slot1]

	if slot2._properties[slot1] then
		slot0._properties[slot1] = slot4
		slot0[slot1] = slot4

		slot4:addPropertyChangedCallback(slot0, slot0[string.format("on_%s_changed", slot1)])

		if slot3 then
			slot0._binded[slot1] = slot3
		else
			slot0._binded[slot1] = true
		end
	end
end

slot0.unBindAll = function (slot0)
	for slot4, slot5 in pairs(slot0._properties) do
		if slot0._binded[slot4] then
			slot5:removePropertyChangedCallback(slot0)

			if type(slot0._binded[slot4]) == "table" then
				slot0._binded[slot4]:set(slot5:get())

				slot0._properties[slot4] = slot0._binded[slot4]
				slot0[slot4] = slot0._binded[slot4]
			else
				slot0._binded[slot4] = nil
				slot0._properties[slot4] = nil
			end

			slot0._binded[slot4] = nil
		end
	end
end

slot0.assignGetterSetter = function (slot0, slot1, slot2, slot3)
	if slot0._properties[slot1] then
		slot4[12] = slot3
		slot4[13] = slot2
	end
end

slot0.getProperty = function (slot0, slot1)
	return slot0._properties[slot1]
end

slot0.getValue = function (slot0, slot1)
	if slot0._properties[slot1] then
		return slot2:get()
	end
end

slot0.setValue = function (slot0, slot1, slot2)
	if slot0._properties[slot1] then
		slot3:set(slot2)
	end
end

slot0.trigger = function (slot0, slot1, slot2)
	if slot0._properties[slot1] then
		slot3:trigger(slot2)
	end
end

slot0.searchAndRegisterChangeHandlers = function (slot0)
	for slot4, slot5 in pairs(slot0._properties) do
		if slot0[string.format("on_%s_changed", slot4)] then
			slot5:addPropertyChangedCallback(slot0, slot7)
		end
	end
end

slot0.onDestroy = function (slot0)
	slot0:unBindAll()

	for slot4, slot5 in pairs(slot0._properties) do
		slot0._properties[slot4] = nil

		slot5:onDestroy()
	end

	slot0._properties = nil
	slot0._binded = nil
end

return slot0
