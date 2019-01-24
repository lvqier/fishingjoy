slot0 = math.floor
slot1 = math.sin
slot2 = math.cos
slot3 = math.pow
slot4 = math.abs
slot7 = "FishingJoyEntityLogic"
slot5 = class(slot6)

slot5.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot9 = slot1

	slot0.setGameController(slot7, slot0)

	slot0.switchingLevel = false
	slot0.fishContainer = {}
	slot0.bulletContainer = {}
	slot12 = slot5

	slot0.initLazy(slot7, slot0, slot2, slot3, slot4)
end

slot5.setGameController = function (slot0, slot1)
	slot0.controller = slot1
end

slot5.getGameController = function (slot0)
	return slot0.controller
end

slot5.initLazy = function (slot0, slot1, slot2, slot3, slot4)
	slot0.serverSceneWidth = slot3
	slot0.serverSceneHeight = slot4
	slot0.clientSceneWidth = slot1
	slot0.clientSceneHeight = slot2
	slot0.cutSceneX = 8
	slot0.cutSceneY = 4
	slot0.oneIntervalX = slot0.cutSceneX / slot0.serverSceneWidth
	slot0.oneIntervalY = slot0.cutSceneY / slot0.serverSceneHeight
end

slot5.setChangeLevel = function (slot0, slot1)
	slot0.switchingLevel = slot1
end

slot5.checkChangeLevel = function (slot0)
	return slot0.switchingLevel
end

slot5.newBullet2Container = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.bulletContainer[slot1.getEntityId(slot3)] == nil then
		slot0.bulletContainer[slot2] = slot1

		return true
	end

	return false
end

slot5.findBulletFromContainer = function (slot0, slot1)
	return slot0.bulletContainer[slot1]
end

slot5.cleanBulletContainer = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.bulletContainer or {}

	for slot5, slot6 in slot2(slot3) do
		slot10 = true

		slot6.clearEntity(slot8, slot6)
	end

	slot0.bulletContainer = {}

	return true
end

slot5.newFish2Container = function (slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot4 = slot1

	if slot0.fishContainer[slot1.getEntityId(slot3)] == nil then
		slot0.fishContainer[slot2] = slot1
		slot6 = FISHINGJOY_ENTITY_STATUS.LIVE

		slot1.setEntityStatus(slot4, slot1)

		return true
	end

	return false
end

slot5.findFishFromContainer = function (slot0, slot1)
	return slot0.fishContainer[slot1]
end

slot5.findLockFish = function (slot0, slot1)
	return slot0.fishContainer[slot1]
end

slot5.getFishContainer = function (slot0)
	return slot0.fishContainer or {}
end

slot5.cleanFishContainer = function (slot0, slot1)
	slot2 = pairs
	slot4 = slot0.fishContainer or {}

	for slot5, slot6 in slot2(slot3) do
		slot10 = true

		slot6.clearEntity(slot8, slot6)
	end

	slot0.fishContainer = {}

	return true
end

slot5.checkFishContainer = function (slot0, slot1)
	slot2 = {}
	slot3 = 0
	slot4 = pairs
	slot6 = slot0.fishContainer or {}

	for slot7, slot8 in slot4(slot5) do
		slot12 = slot1

		slot8.onUpdate(slot10, slot8)

		slot11 = slot8

		if slot8.getEntityStatus(slot10) < FISHINGJOY_ENTITY_STATUS.DEAD then
			slot9 = slot8.getEntityPosition(slot10)
			slot10 = slot8:getFishCatchedRadio()
			slot13 = slot0((slot9.x + slot10) * slot0.oneIntervalX)
			slot16 = (slot9.y + slot10) * slot0.oneIntervalY
			slot14 = slot0((slot9.y - slot10) * slot0.oneIntervalY)

			for slot18 = slot0(slot8), slot0((slot9.x - slot10) * slot0.oneIntervalX), 1 do
				for slot22 = slot13, slot14, 1 do
					if slot22 >= 0 and slot22 < slot0.cutSceneY and slot18 >= 0 and slot18 < slot0.cutSceneX then
						if slot2[slot22] == nil then
							slot2[slot22] = {}
						end

						if slot2[slot22][slot18] == nil then
							slot2[slot22][slot18] = {}
						end

						slot2[slot22][slot18][#slot2[slot22][slot18] + 1] = slot8
					end
				end
			end
		end

		if slot3 == FISHINGJOY_ENTITY_STATUS.DEAD then
			slot13 = FISHINGJOY_ENTITY_TYPE_OBJ.FISH

			slot8.clearEntity(slot10, slot8, false)

			slot0.fishContainer[slot7] = nil
		elseif FISHINGJOY_ENTITY_STATUS.DEAD < slot3 then
			slot13 = FISHINGJOY_ENTITY_TYPE_OBJ.FISH

			slot8.clearEntity(slot10, slot8, true)

			slot0.fishContainer[slot7] = nil
		end
	end

	return slot2
end

slot5.checkBulletContainer = function (slot0, slot1, slot2)
	slot3 = 0
	slot4 = pairs
	slot6 = slot0.bulletContainer or {}

	for slot7, slot8 in slot4(slot5) do
		slot12 = slot2

		slot8.onUpdate(slot10, slot8)

		slot11 = slot8
		slot3 = slot8.getEntityStatus(slot10)

		if slot0.switchingLevel == false and slot3 < FISHINGJOY_ENTITY_STATUS.DEAD then
			slot11 = slot8

			if slot8.getEntityTargetId(slot10) == 0 then
				slot11 = slot0(slot8)
				slot14 = slot8.getEntityPosition(slot11).y * slot0.oneIntervalY

				if slot1[slot0(slot8.getEntityPosition(slot11).x * slot0.oneIntervalX)] ~= nil and slot1[slot12][slot11] ~= nil then
					slot13 = pairs
					slot15 = slot1[slot12][slot11] or {}

					for slot16, slot17 in slot13(slot14) do
						slot23 = false

						if slot0.checkBulletHitFish(slot19, slot0, slot8, slot17) then
							slot22 = slot17

							slot0.bulletHitFish(slot19, slot0, slot8)

							break
						end
					end
				end
			elseif slot0.fishContainer[slot9] == nil then
				slot14 = 0

				slot8.setEntityTargetId(slot12, slot8)
			else
				slot16 = true

				if slot0.checkBulletHitFish(slot12, slot0, slot8, slot10) then
					slot15 = slot10

					slot0.bulletHitFish(slot12, slot0, slot8)
				end
			end
		end

		if slot3 == FISHINGJOY_ENTITY_STATUS.DEAD then
			slot13 = FISHINGJOY_ENTITY_TYPE_OBJ.BULLET

			slot8.clearEntity(slot10, slot8, false)

			slot0.bulletContainer[slot7] = nil
		elseif FISHINGJOY_ENTITY_STATUS.DEAD < slot3 then
			slot13 = FISHINGJOY_ENTITY_TYPE_OBJ.BULLET

			slot8.clearEntity(slot10, slot8, true)

			slot0.bulletContainer[slot7] = nil
		end
	end
end

slot5.onUpdate = function (slot0, slot1)
	slot5 = slot1
	slot7 = slot1

	slot0:checkBulletContainer(slot0, slot0.checkFishContainer(slot3, slot0))
end

slot5.checkBulletHitFish = function (slot0, slot1, slot2, slot3)
	slot4 = slot2.getFishCatchedRadio(slot5)
	slot5 = slot1.getEntityPosition(slot2)
	slot8 = slot2
	slot6 = slot2.getEntityPosition(slot1)

	if slot3 == true then
		slot10 = slot6.y - slot5.y
		slot8 = slot0(slot6.x - slot5.x)

		if slot0(slot8) < 20 and slot8 < 20 then
			return true
		else
			return false
		end
	end

	if slot5.x < slot6.x - slot4 or slot5.y < slot6.y - slot4 or slot5.x > slot6.x + slot4 or slot5.y > slot6.y + slot4 then
		return false
	end

	slot9 = slot2

	if #slot2.getBoundingBox(slot8) == 1 then
		return true
	end

	slot9 = slot1(slot2)
	slot10 = slot2(slot8)
	slot13 = slot7

	for slot14, slot15 in pairs(slot8) do
		slot22 = (slot15.entityOffsetx * slot9 + slot15.entityOffsety * slot10 + slot6.y) - slot5.y
		slot20 = slot0((slot15.entityOffsetx * slot10 - slot15.entityOffsety * slot9 + slot6.x) - slot5.x)

		if slot0(slot20) <= slot15.rad and slot20 < slot18 then
			return true
		end
	end

	return false
end

slot5.bulletHitFish = function (slot0, slot1, slot2)
	slot6 = FISHINGJOY_ENTITY_STATUS.DEAD

	slot1.setEntityStatus(slot4, slot1)

	slot5 = slot2

	slot2.fishHitted(slot4)

	slot7 = slot2

	slot0.controller.bulletHitFish(slot4, slot0.controller, slot1)
end

slot5.appendFishBuff = function (slot0, slot1, slot2, slot3, slot4)
	if slot4 then
	else
		slot5 = pairs
		slot7 = slot0.fishContainer or {}

		for slot8, slot9 in slot5(slot6) do
			slot15 = slot3

			slot9.appendEntityBuff(slot11, slot9, slot1, slot2)
		end
	end
end

return slot5
