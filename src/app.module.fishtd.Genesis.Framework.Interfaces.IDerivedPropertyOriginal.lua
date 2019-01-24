slot1 = class_C("IDerivedProperty", ClassLoader:aquireClass("INotification"))

slot1.ctor = function (slot0, slot1, slot2)
	slot0._listeners = {}
	slot0._senders = {}
	slot0._binders = {}
	slot0._valueChangeEvent = {}
	slot0._value = slot2
	slot0._propertyName = slot1
	slot0._mediator = ClassLoader:aquireSingleton("PropertyMediator")

	slot0._propertyChanged = function ()
		return
	end
end

slot1.destroy = function (slot0)
	for slot4, slot5 in pairs(slot0._senders) do
		slot0:unbind(slot4)
	end

	for slot4, slot5 in pairs(slot0._listeners) do
		slot4:unbind(slot0)
	end
end

slot1.set = function (slot0, slot1)
	if slot0._value == nil or slot0._value ~= slot1 then
		if slot0._setter then
			slot0._value = slot0._setter(slot1)
		else
			slot0._value = slot1
		end

		slot0._propertyChanged(slot0._propertyChangedTarget, slot0, slot0)

		slot0._valueChangeEvent._sender = slot0

		if slot0._getter then
			slot0._valueChangeEvent._value = slot0._getter(slot0._value)
		else
			slot0._valueChangeEvent._value = slot0._value
		end

		slot0:send(slot0._valueChangeEvent)
	end
end

slot1.get = function (slot0)
	if slot0._getter then
		return slot0._getter(slot0._value)
	else
		return slot0._value
	end
end

slot1.rawget = function (slot0, slot1)
	return slot0._value
end

slot1.rawset = function (slot0, slot1)
	slot0._value = slot1
end

slot1.trigger = function (slot0, slot1)
	slot1 = slot1 or slot0._value

	if slot0._setter then
		slot0._value = slot0._setter(slot1)
	else
		slot0._value = slot1
	end

	slot0._propertyChanged(slot0._propertyChangedTarget, slot0, slot0)

	slot0._valueChangeEvent._sender = slot0

	if slot0._getter then
		slot0._valueChangeEvent._value = slot0._getter(slot0._value)
	else
		slot0._valueChangeEvent._value = slot0._value
	end

	slot0._valueChangeEvent._trigger = true

	slot0:send(slot0._valueChangeEvent)
end

slot1.send = function (slot0, slot1)
	if slot0._mediator then
		slot0._mediator:send(slot1)
	end
end

slot1.receive = function (slot0, slot1)
	if slot0._value ~= slot1._value then
		if slot0._setter then
			slot0._value = slot0._setter(slot1._value)
		else
			slot0._value = slot1._value
		end

		slot0._propertyChanged(slot0._propertyChangedTarget, slot0, slot1._sender)
	elseif slot1._trigger then
		slot0._propertyChanged(slot0._propertyChangedTarget, slot0, slot1._sender)
	end
end

slot1.bind = function (slot0, slot1, slot2)
	if slot1 ~= slot0 and not slot0._senders[slot1] then
		slot0._senders[slot1] = {}
		slot1._listeners[slot0] = 
	end

	if slot2 == "TWO_WAY" then
		slot1:bind(slot0)
	end
end

slot1.unBindAll = function (slot0)
	for slot4, slot5 in pairs(slot0._senders) do
		slot0:unbind(slot4)
	end

	for slot4, slot5 in pairs(slot0._listeners) do
		slot4:unbind(slot0)
	end
end

slot1.unbind = function (slot0, slot1, slot2)
	if slot0._senders[slot1] then
		slot0._senders[slot1] = nil
		slot1._listeners[slot0] = nil
	end

	if slot2 == "TWO_WAY" then
		slot1:unbind(slot0)
	end
end

slot1.getName = function (slot0)
	return slot0._propertyName
end

slot1.setName = function (slot0, slot1)
	slot0._propertyName = slot1
end

slot1.setPropertyChangedCallback = function (slot0, slot1, slot2)
	slot0._propertyChanged = slot1
	slot0._propertyChangedTarget = slot2
end

slot1.assignGetterSetter = function (slot0, slot1, slot2)
	slot0._getter = slot1
	slot0._setter = slot2
end

return slot1
