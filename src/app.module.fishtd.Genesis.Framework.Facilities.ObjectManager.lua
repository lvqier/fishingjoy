slot0 = class_C("ObjectManager")

slot0.ctor = function (slot0)
	slot0._objectRegistry = {}
end

slot0.registerObject = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot6.maxCacheNumber = slot6.maxCacheNumber or 100
		slot0._objectRegistry[slot5] = slot6
		slot0._objectRegistry[slot5].freeObjects = {}
		slot0._objectRegistry[slot5].usedObjects = {}
		slot0._objectRegistry[slot5].freeNumber = 0
		slot0._objectRegistry[slot5].totalNumber = 0
	end
end

slot0.getObject = function (slot0, slot1, slot2)
	if slot0._objectRegistry[slot1] then
		slot4 = nil

		if slot3.freeNumber > 0 then
			slot4 = slot3.freeObjects[slot3.freeNumber]
			slot3.freeObjects[slot3.freeNumber] = nil
			slot3.freeNumber = slot3.freeNumber - 1

			if slot3.CATEGORY == slot0.OBJECT_CATEGORY.LOGIC then
				slot0:resetLogicObject(slot4, slot3, slot2)
			end
		else
			slot4 = slot0:createObject(slot1, slot2)
			slot3.totalNumber = slot3.totalNumber + 1
		end

		if slot4 then
			slot3.usedObjects[slot4] = true
		end

		return slot4
	end
end

slot0.getObjectWithDuration = function (slot0, slot1, slot2)
	if slot0:getObject(slot1) then
		cc.Director:getInstance():getNotificationNode():runAction(cc.Sequence:create(cc.DelayTime:create(slot2), cc.CallFunc:create(function ()
			slot0:recycleObject(slot0)
		end)))
	end

	return slot3
end

slot0.recycleSpineObject = function (slot0, slot1)
	if slot0._objectRegistry[slot1.__KOM] then
		if slot3.CATEGORY == slot0.OBJECT_CATEGORY.COCOS then
			slot1:removeFromParent()
		end

		for slot7 = 1, slot3.freeNumber, 1 do
			assert(slot3.freeObjects[slot7] ~= slot1, "recycleSpineObject repeat,error,index:" .. slot7)
		end

		slot3.freeNumber = slot3.freeNumber + 1
		slot3.freeObjects[slot3.freeNumber] = slot1
		slot3.usedObjects[slot1] = nil
	end
end

slot0.recycleObject = function (slot0, slot1)
	if slot0._objectRegistry[slot1.__KOM] and slot3.usedObjects[slot1] then
		if slot3.CATEGORY == slot0.OBJECT_CATEGORY.COCOS and slot1.removeFromParent then
			slot1:removeFromParent()
		end

		if slot3.maxCacheNumber <= slot3.freeNumber then
			slot3.usedObjects[slot1] = nil

			if slot3.CATEGORY == slot0.OBJECT_CATEGORY.COCOS then
				slot1:release()
			elseif slot3.CATEGORY == slot0.OBJECT_CATEGORY.LOGIC then
				slot1:onDestroy()
			end

			slot3.totalNumber = slot3.totalNumber - 1
		else
			slot3.freeNumber = slot3.freeNumber + 1
			slot3.freeObjects[slot3.freeNumber] = slot1
			slot3.usedObjects[slot1] = nil
		end
	end
end

slot0.createObject = function (slot0, slot1, slot2)
	if slot0._objectRegistry[slot1].CATEGORY == slot0.OBJECT_CATEGORY.COCOS then
		return slot0:createCocosObject(slot1, slot3, slot2)
	elseif slot3.CATEGORY == slot0.OBJECT_CATEGORY.LOGIC then
		return slot0:createLogicObject(slot1, slot3, slot2)
	end
end

slot0.createCocosObject = function (slot0, slot1, slot2)
	slot3 = nil
	slot4 = slot2

	if slot2.TYPE == slot0.OBJECT_TYPE.SPINE then
		slot3 = sp.SkeletonAnimation:create(slot2.JSON_PATH, slot2.ATLAS_PATH, slot2.Scale or 1)
	elseif slot2.TYPE == slot0.OBJECT_TYPE.SPRITE then
		slot3 = cc.Sprite:create(slot2.TEXTURE_PATH)
	elseif slot2.TYPE == slot0.OBJECT_TYPE.PARTICLE then
		slot3 = cc.ParticleSystemQuad:create(slot2.PLIST_PATH)
	elseif slot2.TYPE == slot0.OBJECT_TYPE.ARMATURE then
		if not slot4.isLoadedArmature then
			ccs.ArmatureDataManager:getInstance():addArmatureFileInfo(slot2.JSON_PATH)

			slot4.isLoadedArmature = true
		end

		slot3 = ccs.Armature:create(slot2.ARMATURE_NAME)
	elseif slot2.TYPE == slot0.OBJECT_TYPE.TEXTURED_NUMBER then
		ClassLoader:aquireInstance("TexturedNumber"):setTextureSet(slot2.NUMBER_RESOURCE)
	elseif slot2.TYPE == slot0.OBJECT_TYPE.FRAME_ANIMATION then
		cc.SpriteFrameCache:getInstance():addSpriteFrames(slot2.PLIST_PATH)

		if not cc.AnimationCache:getInstance():animationByName(slot1) then
			slot6 = {}

			for slot10 = 1, slot2.FRAME_NUMBER, 1 do
				slot6[slot10] = cc.SpriteFrameCache:getInstance():spriteFrameByName(string.format("%s_%d.png", slot2.FRAME_NAME, slot10))
			end

			cc.Animation:createWithSpriteFrames(slot6, 0.04).setLoops(slot5, 100)
			cc.AnimationCache:getInstance():addAnimation(cc.Animation.createWithSpriteFrames(slot6, 0.04), slot1)
		end

		slot3 = cc.Animate:create(slot5)
	end

	if slot3 then
		slot3.__KOM = slot1

		slot3:retain()
	end

	return slot3
end

slot0.createLogicObject = function (slot0, slot1, slot2, slot3)
	if ClassLoader:aquireSingleton(slot2.FACTORY_CLASS):createByConfig(slot3) then
		slot5.__KOM = slot1
	end

	return slot5
end

slot0.resetLogicObject = function (slot0, slot1, slot2, slot3)
	ClassLoader:aquireSingleton(slot2.FACTORY_CLASS):resetByConfig(slot1, slot3)
end

slot0.clear = function (slot0)
	for slot4, slot5 in pairs(slot0._objectRegistry) do
		if slot5.CATEGORY == slot0.OBJECT_CATEGORY.COCOS then
			for slot9 = 1, slot5.freeNumber, 1 do
				slot5.freeObjects[slot9]:release()
			end

			for slot9, slot10 in pairs(slot5.usedObjects) do
				slot9:release()
			end
		elseif slot5.CATEGORY == slot0.OBJECT_CATEGORY.LOGIC then
			for slot9 = 1, slot5.freeNumber, 1 do
				slot5.freeObjects[slot9]:onDestroy()
			end

			for slot9, slot10 in pairs(slot5.usedObjects) do
				slot9:onDestroy()
			end
		end

		slot5.freeNumber = 0
		slot5.totalNumber = 0
		slot5.existInCache = nil
		slot5.isLoadedArmature = nil
		slot5.freeObjects = {}
		slot5.usedObjects = {}
	end
end

slot0.dumpObjectCache = function (slot0)
	print("DUMP OBJECT CACHE BEGIN")

	slot1 = 0

	for slot5, slot6 in pairs(slot0._objectRegistry) do
		if slot6.totalNumber > 0 then
			slot1 = slot1 + slot6.totalNumber

			trace(string.format("%s : [%d]", slot5, slot6.totalNumber))
		end
	end

	trace(string.format("Total Object Number is: [%d]", slot1))
	print("DUMP OBJECT CACHE END")
end

slot0.OBJECT_CATEGORY = {
	LOGIC = 2,
	COCOS = 1
}
slot0.OBJECT_TYPE = {
	ARMATURE = 4,
	TEXTURED_NUMBER = 5,
	SPINE = 1,
	PARTICLE = 3,
	GAME_OBJECT = 5,
	SPRITE = 2
}

return slot0
