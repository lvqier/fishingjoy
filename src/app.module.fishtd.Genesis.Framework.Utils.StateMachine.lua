slot0 = class_C("StateMachine")

slot0.ctor = function (slot0)
	slot0._states = {}
	slot0._currentState = "idle"

	slot0:registerStates({
		{
			name = "idle"
		}
	})
end

slot0.registerStates = function (slot0, slot1)
	for slot5 = 1, #slot1, 1 do
		if not slot0._states[slot1[slot5].name] then
			slot0._states[slot6.name] = {
				enter = slot6.enter or slot0.voidHandler,
				exit = slot6.exit or slot0.voidHandler,
				jumps = {},
				context = {}
			}
		end
	end
end

slot0.registerJumps = function (slot0, slot1)
	for slot5 = 1, #slot1, 1 do
		if slot0._states[slot1[slot5].from] then
			slot8[slot9] = slot7.jumps[slot6.event] or {}

			table.insert(slot8[slot9], {
				to = slot6.to,
				check = slot6.check or slot0.trueHandler,
				constraint = slot6.constraint
			})
		end
	end
end

slot0.doEvent = function (slot0, slot1, slot2, slot3)
	if slot0._states[slot0._currentState] and slot4.jumps[slot1] then
		for slot9 = 1, #slot5, 1 do
			slot11 = slot0._states[slot0._currentState]

			if slot0._states[slot5[slot9].to] and slot0:matchCondition(slot10.condition, slot3) and slot10.check(slot0._currentState, slot10.to, slot2) then
				slot11.exit(slot1, slot2)

				slot0._currentState = slot10.to

				slot12.enter(slot1, slot2)
			end
		end
	end
end

slot0.forceTransition = function (slot0, slot1)
	if slot0._states[slot1] then
		slot0._states[slot0._currentState].exit(slot2)

		slot0._currentState = slot1

		slot0._states[slot1]:enter()
	end
end

slot0.forceSet = function (slot0, slot1)
	if slot0._states[slot1] then
		slot0._currentState = slot1
	end
end

slot0.matchCondition = function (slot0, slot1, slot2)
	if not slot1 then
		return true
	elseif type(slot1) == "table" then
		if type(slot2) == "table" then
			for slot6, slot7 in pairs(slot1) do
				slot0:matchCondition(slot7, slot2[slot6])
			end
		else
			return false
		end
	elseif slot1 == slot2 then
		return true
	else
		return false
	end
end

slot0.onDestroy = function (slot0)
	for slot4, slot5 in pairs(slot0._states) do
		slot5.enter = nil
		slot5.exit = nil
		slot5.context = nil

		for slot9, slot10 in pairs(slot5.jumps) do
			slot10.check = nil
			slot5.jumps[slot9] = nil
		end

		slot5.jumps = nil
		slot0._states[slot4] = nil
	end

	slot0._states = nil
end

slot0.voidHandler = function ()
	return
end

slot0.trueHandler = function ()
	return true
end

return slot0
