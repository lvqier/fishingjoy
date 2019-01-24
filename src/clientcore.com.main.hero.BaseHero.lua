BaseHero = class("BaseHero")

requireClientCoreMain("tick.TickBase")

BaseHero.ctor = function (slot0, ...)
	ClassUtil.extends(slot0, TickBase)

	slot0._so = cc.UserDefault:getInstance()
	slot0._isNeed2Flush = false

	slot0:startTick(3)
end

BaseHero.updateSoendFixKey = function (slot0)
	return
end

BaseHero.createSOProperty = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot8 = string.upper(slot7) .. string.sub(slot1, 2)
	slot11 = "_" .. slot9 .. (slot5 or "")
	slot12 = slot9 .. (slot5 or "")
	slot0[slot10] = slot0[slot9 .. "ChangedSignal"] or SignalAs3.new()

	if slot3 ~= nil then
	elseif slot2 == BaseHero.INT or slot2 == BaseHero.NUMBER then
		slot3 = 0
	elseif slot2 == BaseHero.STRING then
		slot3 = ""
	end

	if slot4 then
		slot0[slot11] = slot3
	else
		slot0[slot11] = BaseHero.soGetters[slot2](slot0, slot12, slot3)
	end

	slot0["set" .. slot8] = function (slot0, slot1, slot2)
		if slot0[slot0] ~= slot1 or slot2 then
			slot0[slot0] = slot1

			BaseHero.setters[slot1](slot0, slot2, slot1)
			applyFunction(applyFunction)
			slot0[slot4]:emit()
		end
	end

	slot0["get" .. slot8] = function (slot0)
		return slot0[slot0]
	end

	if slot2 == BaseHero.INT or slot2 == BaseHero.NUMBER then
		slot0["add" .. slot8] = function (slot0, slot1)
			slot0["set" .. slot0](slot0, slot0["get" .. slot0](slot0) + slot1)
		end
	end
end

BaseHero.tick = function (slot0, slot1, slot2)
	if slot0._isNeed2Flush then
		slot0._so:flush()

		slot0._isNeed2Flush = false
	end
end

BaseHero.getFlushStringData = function (slot0, slot1, slot2)
	return slot0._so:getStringForKey(slot1, slot2)
end

BaseHero.getFlushNumberData = function (slot0, slot1, slot2)
	return checknumber(slot0._so:getStringForKey(slot1, tostring(checknumber(slot2))))
end

BaseHero.getFlushBooleanData = function (slot0, slot1, slot2)
	return slot0._so:getIntegerForKey(slot1, (slot2 and 1) or 0) ~= 0
end

BaseHero.getFlushIntData = function (slot0, slot1, slot2)
	return slot0._so:getIntegerForKey(slot1, slot2 or 0)
end

BaseHero.setFlushStringData = function (slot0, slot1, slot2)
	slot0._so:setStringForKey(slot1, slot2)

	slot0._isNeed2Flush = true
end

BaseHero.setFlushNumberData = function (slot0, slot1, slot2)
	slot0._so:setStringForKey(slot1, tostring(checknumber(slot2)))

	slot0._isNeed2Flush = true
end

BaseHero.setFlushBooleanData = function (slot0, slot1, slot2)
	slot0._so:setIntegerForKey(slot1, (slot2 and 1) or 0)

	slot0._isNeed2Flush = true
end

BaseHero.setFlushIntData = function (slot0, slot1, slot2)
	slot0._so:setIntegerForKey(slot1, slot2)

	slot0._isNeed2Flush = true
end

BaseHero.INT = 1
BaseHero.STRING = 2
BaseHero.NUMBER = 3
BaseHero.BOOLEAN = 4
BaseHero.setters = {
	[BaseHero.INT] = BaseHero.setFlushIntData,
	[BaseHero.STRING] = BaseHero.setFlushStringData,
	[BaseHero.NUMBER] = BaseHero.setFlushNumberData,
	[BaseHero.BOOLEAN] = BaseHero.setFlushBooleanData
}
BaseHero.soGetters = {
	[BaseHero.INT] = BaseHero.getFlushIntData,
	[BaseHero.STRING] = BaseHero.getFlushStringData,
	[BaseHero.NUMBER] = BaseHero.getFlushNumberData,
	[BaseHero.BOOLEAN] = BaseHero.getFlushBooleanData
}

return
