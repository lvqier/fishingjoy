slot2 = "TreeActionManager"
TreeActionManager = class(slot1)

TreeActionManager.ctor = function (slot0)
	slot0._actions = {}
	slot0._objectMaps = {}
	slot0._baseActionIndex = 1
	slot0._lastTime = 0
end

TreeActionManager.start = function (slot0)
	slot0._actions = {}
	slot0._objectMaps = {}
	slot3 = TimeApi
	slot0._lastTime = TimeApi.getTime(slot2)
end

TreeActionManager.addAction = function (slot0, slot1, slot2)
	slot7 = slot2
	slot6 = "TreeAction could not entry secondary."

	assert(slot4, not slot2.isInQueue(slot6))

	slot6 = slot2

	table.insert(slot4, slot0._actions)

	if not slot0._objectMaps[slot1] then
		slot0._objectMaps[slot1] = {}
	end

	slot6 = slot1

	slot2.startWithTarget(slot4, slot2)

	slot6 = slot2

	table.insert(slot4, slot0._objectMaps[slot1])

	slot6 = true

	slot2.setInQueue(slot4, slot2)
end

TreeActionManager.getTargetAction = function (slot0, slot1)
	return slot0._objectMaps[action]
end

TreeActionManager.visit = function (slot0)
	slot3 = TimeApi
	slot2 = (TimeApi.getTime(slot2) - slot0._lastTime) / 1000
	slot3 = 1

	while slot3 <= #slot0._actions do
		slot7 = slot0._actions[slot3]

		if not slot0._actions[slot3].isRemoved(slot6) then
			slot7 = slot4

			if not slot4.finish(slot6) then
				slot8 = slot2

				slot4.step(slot6, slot4)
			end
		end

		slot7 = slot4

		if not slot4.finish(slot6) then
			slot7 = slot4

			if slot4.isRemoved(slot6) then
				slot8 = slot3

				table.remove(slot6, slot0._actions)

				slot8 = slot4

				slot0.removeActionFromObjectMap(slot6, slot0)

				slot8 = false

				slot4.setInQueue(slot6, slot4)
			else
				slot3 = slot3 + 1
			end
		end
	end

	slot0._lastTime = slot1
end

TreeActionManager.removeTargetAction = function (slot0, slot1)
	if slot0._objectMaps[slot1] then
		slot5 = slot2

		for slot6, slot7 in pairs(slot4) do
			slot11 = true

			slot7.setRemoved(slot9, slot7)
		end

		slot0._objectMaps[slot1] = nil
	end
end

TreeActionManager.removeAction = function (slot0, slot1)
	slot5 = true

	slot1.setRemoved(slot3, slot1)
end

TreeActionManager.removeActionFromObjectMap = function (slot0, slot1)
	if slot0._objectMaps[slot1._target] then
		for slot6 = 1, #slot2, 1 do
			if slot2[slot6] == slot1 then
				slot10 = slot6

				table.remove(slot8, slot2)

				break
			end
		end

		if #slot2 <= 0 then
			slot0._objectMaps[slot1._target] = nil
		end
	end
end

TreeActionManager.clear = function (slot0)
	slot0._actions = {}
	slot0._objectMaps = {}
end

return
