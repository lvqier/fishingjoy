slot2 = "TreeCacheManager"
TreeCacheManager = class(slot1)

TreeCacheManager.init = function (slot0)
	slot0._keyIndex = 1
	slot0._objectType = {
		[Tree.CacheType.CacheType_Spine] = Tree.ObjectType.ObjectType_Cocos2dx,
		[Tree.CacheType.CacheType_Particle] = Tree.ObjectType.ObjectType_Cocos2dx,
		[Tree.CacheType.CacheType_Sprite] = Tree.ObjectType.ObjectType_Cocos2dx,
		[Tree.CacheType.CacheType_SpriteFrame] = Tree.ObjectType.ObjectType_Cocos2dx,
		[Tree.CacheType.CacheType_RollingText] = Tree.ObjectType.ObjectType_Lua
	}
	slot0._animation3DCache = {}
end

TreeCacheManager.registerCocos2dxObject = function (slot0, slot1)
	slot0._cocos2dxObject = {}
	slot4 = slot1

	for slot5, slot6 in pairs(slot3) do
		slot0._cocos2dxObject[slot5] = slot6
		slot0._cocos2dxObject[slot5]._inuseObject = {}
		slot0._cocos2dxObject[slot5]._freeObject = {}
		slot0._cocos2dxObject[slot5]._base_key = slot5
		slot0._cocos2dxObject[slot5]._base_index = 1
		slot0._keyIndex = slot0._keyIndex + 1
	end
end

TreeCacheManager.putAnimation3D = function (slot0, slot1, slot2)
	slot5 = slot1

	slot1.retain(slot4)

	slot0._animation3DCache[slot2] = slot1
end

TreeCacheManager.getAnimation3D = function (slot0, slot1)
	return slot0._animation3DCache[slot1]
end

TreeCacheManager.getCacheObject = function (slot0, slot1, ...)
	if not slot0._cocos2dxObject[slot1] then
		slot7 = " do not exitst."

		print(slot4, "object key ", slot1)

		return nil
	end

	slot3 = nil

	if #slot2._freeObject > 0 then
		slot6 = slot2._freeObject
		slot3 = table.remove(slot5)

		if slot2.type == Tree.CacheType.CacheType_Particle then
			slot6 = slot3

			slot3.resetSystem(slot5)
		end

		slot2._inuseObject[slot3.__base_index] = slot3
	else
		if slot2.type == Tree.CacheType.CacheType_Spine then
			if sp.SkeletonAnimation.isExistSkeletonDataInCache and not slot2.isRead then
				slot10 = slot2.atlas

				sp.SkeletonAnimation.readSkeletonDataToCacheByJson(slot6, sp.SkeletonAnimation, slot2.cache, slot2.json)

				slot2.isRead = true
			end

			if sp.SkeletonAnimation.createFromCache then
				slot7 = slot2.cache
				slot3 = sp.SkeletonAnimation.createFromCache(slot5, sp.SkeletonAnimation)
			else
				slot8 = slot2.atlas
				slot3 = sp.SkeletonAnimation.create(slot5, sp.SkeletonAnimation, slot2.json)
			end
		elseif slot2.type == Tree.CacheType.CacheType_Particle then
			slot7 = slot2.particle
			slot7 = slot2.scale

			cc.ParticleSystemQuad.create(slot5, cc.ParticleSystemQuad).setScale(slot5, cc.ParticleSystemQuad.create(slot5, cc.ParticleSystemQuad))
		elseif slot2.type == Tree.CacheType.CacheType_Sprite then
			slot7 = slot2.path
			slot3 = cc.Sprite.create(slot5, cc.Sprite)
		elseif slot2.type == Tree.CacheType.CacheType_SpriteFrame then
			slot7 = slot2.frame_name
			slot3 = cc.Sprite.createWithSpriteFrameName(slot5, cc.Sprite)
		elseif slot2.type == Tree.CacheType.CacheType_RollingText then
			slot6 = slot2.class
			slot6 = require(slot5).new(...)

			require(slot5).new(...).init(slot5)
		end

		slot3.__key = slot2._base_key
		slot3.__base_index = slot2._base_index
		slot2._base_index = slot2._base_index + 1
		slot6 = slot3

		slot3.retain(slot5)

		slot2._inuseObject[slot3.__base_index] = slot3
	end

	return slot3
end

TreeCacheManager.recycleCocos2dxObject = function (slot0, slot1)
	if not slot0._cocos2dxObject[slot1.__key] then
		slot6 = slot1.__key

		print(slot4, "could not recycle object,key-->")

		return
	end

	if not slot2._inuseObject[slot1.__base_index] then
		slot6 = slot1.__key

		print(slot4, "could not recycle uninuse object")

		return
	end

	slot5 = slot1

	slot1.removeFromParent(slot4)

	slot2._inuseObject[slot1.__base_index] = nil

	if slot2.max_count <= #slot2._freeObject then
		slot5 = slot1

		slot1.release(slot4)
	else
		slot6 = slot1

		table.insert(slot4, slot2._freeObject)
	end
end

TreeCacheManager.onExit = function (slot0)
	slot3 = slot0._cocos2dxObject

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5._inuseObject

		for slot9, slot10 in pairs(slot7) do
			slot14 = slot10

			slot0.recycleCocos2dxObject(slot12, slot0)
		end
	end
end

TreeCacheManager.onDestroy = function (slot0)
	slot3 = slot0._cocos2dxObject

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5._inuseObject

		for slot9, slot10 in pairs(slot7) do
			slot5._inuseObject[slot9] = nil
			slot13 = slot10

			slot10.release(nil)
		end

		for slot9 = 1, #slot5._freeObject, 1 do
			slot12 = slot5._freeObject[slot9]

			slot5._freeObject[slot9].release(slot11)
		end

		slot5._freeObject = {}
		slot5.isRead = nil
	end

	slot3 = slot0._animation3DCache

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5

		slot5.release(slot7)
	end

	slot0._animation3DCache = {}
end

return
