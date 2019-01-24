slot0 = class_C("WorldBuilder")

slot0.ctor = function (slot0)
	return
end

slot0.buildWorld = function (slot0, slot1, slot2)
	if slot1 == "TEST_WORLD" then
		slot0:buildTestWorld()._framework = slot2

		return slot0.buildTestWorld()
	end
end

slot0.buildSelector = function (slot0)
	slot1 = ClassLoader:aquireInstance("LockSelector")

	slot1:addComponent(slot2, "collision")
	slot1:setValue("id", "select_10")
	slot1:setValue("position", {
		z = 0,
		x = 0,
		y = 0
	})
	slot1:setValue("collisionEnabled", false)
	slot1:setValue("id", "LockSelector")
	slot1:setValue("category", "selector")
	slot1:setValue("isDead", false)

	return slot1
end

slot0.buildTestWorld = function (slot0)
	ClassLoader:clearSingleton("CollisionManager")

	slot1 = ClassLoader:aquireInstance("World")

	slot1:retisterCategoryPriority("selector", 0)
	slot1:retisterCategoryPriority("group", 1)
	slot1:retisterCategoryPriority("fish", 2)
	slot1:retisterCategoryPriority("bullet", 3)
	slot1:retisterCategoryPriority("presentor", 4)
	slot1:retisterCategoryPriority("collisionManager", 5)
	slot1:retisterCategoryPriority("supervisor", 6)
	slot1:retisterCategoryPriority("cannon", 7)
	slot1:addEntity(slot2)
	slot1:addEntity(slot3)
	slot1:addEntity(slot4)
	slot1:addEntity(slot5)
	slot1:addEntity(slot0:buildSelector())

	return slot1
end

return slot0
