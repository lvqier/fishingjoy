SerialCacheManager = class("SerialCacheManager")

SerialCacheManager.init = function (slot0)
	slot0._keyIndex = 1
	slot0._objectType = {
		[Serial.CacheType.CacheType_Spine] = Serial.ObjectType.ObjectType_Cocos2dx,
		[Serial.CacheType.CacheType_Particle] = Serial.ObjectType.ObjectType_Cocos2dx,
		[Serial.CacheType.CacheType_Spine] = Serial.ObjectType.ObjectType_Cocos2dx,
		[Serial.CacheType.CacheType_RollingText] = Serial.ObjectType.ObjectType_Lua
	}
end

SerialCacheManager.registerCocos2dxObject = function (slot0, slot1)
	slot0._cocos2dxObject = {}

	for slot5, slot6 in pairs(slot1) do
		slot0._cocos2dxObject[slot5] = slot6
		slot0._cocos2dxObject[slot5]._inuseObject = {}
		slot0._cocos2dxObject[slot5]._freeObject = {}
		slot0._cocos2dxObject[slot5]._base_key = slot5
		slot0._cocos2dxObject[slot5]._base_index = 1
		slot0._keyIndex = slot0._keyIndex + 1
	end
end

SerialCacheManager.getCacheObject = function (slot0, slot1, ...)
	if not slot0._cocos2dxObject[slot1] then
		print("object key ", slot1, " do not exitst.")

		return nil
	end

	slot3 = nil

	if #slot2._freeObject > 0 then
		slot3 = table.remove(slot2._freeObject)

		if slot2.type == Serial.CacheType.CacheType_Particle then
			slot3:resetSystem()
		end

		slot2._inuseObject[slot3.__base_index] = slot3
	else
		if slot2.type == Serial.CacheType.CacheType_Particle then
			cc.ParticleSystemQuad:create(slot2.particle):setScale(slot2.scale)
		elseif slot2.type == Serial.CacheType.CacheType_Spine then
			if sp.SkeletonAnimation.isExistSkeletonDataInCache and not slot2.isRead then
				sp.SkeletonAnimation:readSkeletonDataToCacheByJson(slot2.cache, slot2.json, slot2.atlas)

				slot2.isRead = true
			end

			if sp.SkeletonAnimation.createFromCache then
				slot3 = sp.SkeletonAnimation:createFromCache(slot2.cache)
			else
				slot3 = sp.SkeletonAnimation:create(slot2.json, slot2.atlas)
			end
		elseif slot2.type == Serial.CacheType.CacheType_RollingText then
			require(slot2.class).new(...):init()
		end

		slot3.__key = slot2._base_key
		slot3.__base_index = slot2._base_index
		slot2._base_index = slot2._base_index + 1

		slot3:retain()

		slot2._inuseObject[slot3.__base_index] = slot3
	end

	return slot3
end

SerialCacheManager.recycleCocos2dxObject = function (slot0, slot1)
	if not slot0._cocos2dxObject[slot1.__key] then
		print("could not recycle object,key-->", slot1.__key)

		return
	end

	if not slot2._inuseObject[slot1.__base_index] then
		print("could not recycle uninuse object", slot1.__key)

		return
	end

	slot1:removeFromParent()

	slot2._inuseObject[slot1.__base_index] = nil

	if slot2.max_count <= #slot2._freeObject then
		slot1:release()
	else
		table.insert(slot2._freeObject, slot1)
	end
end

SerialCacheManager.onExit = function (slot0)
	for slot4, slot5 in pairs(slot0._cocos2dxObject) do
		for slot9, slot10 in pairs(slot5._inuseObject) do
			slot0:recycleCocos2dxObject(slot10)
		end
	end
end

SerialCacheManager.onDestroy = function (slot0)
	for slot4, slot5 in pairs(slot0._cocos2dxObject) do
		for slot9, slot10 in pairs(slot5._inuseObject) do
			slot5._inuseObject[slot9] = nil

			slot10:release()
		end

		for slot9 = 1, #slot5._freeObject, 1 do
			slot5._freeObject[slot9]:release()
		end

		slot5._freeObject = {}
		slot5.isRead = nil
	end
end

return
