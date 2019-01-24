slot0 = class_C("BulletVisual", ClassLoader:aquireClass("Visual"))

slot0.onCreate = function (slot0, slot1, slot2)
	slot0.super.onCreate(slot0)
	slot0:addProperty("boneData", slot2)
	slot0:addProperty("isDead", slot2)
	slot0:addProperty("isRemoved", slot2)

	slot0._textureName = slot1.szResourceName
	slot0._texturePath = GET_PATH(FilePath.ANIMATION, "%s/%s_other.png", slot0._textureName, slot0._textureName)
	slot0._sprite = cc.Sprite:create(slot0._texturePath)

	if cc.Node.setCullFace then
		slot0._sprite:setCullFace(true)
	end

	slot0._visualNode:addChild(slot0._sprite)

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.mirroredPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0.lastPosition = {
		z = 0,
		x = 0,
		y = 0
	}
end

slot0.onLoad = function (slot0)
	slot0.super.onLoad(slot0)

	slot1 = slot0:getValue("owner")

	slot0:bindSameName("boneData", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
	slot0.boneData:trigger(slot0._visualNode)
end

slot0.onUnload = function (slot0)
	slot0.super.onUnload(slot0)

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0.boneData._value.transformation = nil
		slot0.boneData._value.skeleton = nil
	end

	slot0:unBindAll()
end

slot0.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("BulletLayer"):addChild(slot0._visualNode, 2)
end

slot0.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0._visualNode:removeFromParent()
end

slot0.on_scale_changed = function (slot0)
	return
end

slot0.onUpdate = function (slot0)
	slot1 = cc.Director:getInstance():getVisibleSize()

	if slot0.gameConfig.MirrorFlag then
		slot0.mirroredPosition.x = slot0.gameConfig.Width - slot0.position._value.x
		slot0.mirroredPosition.y = slot0.gameConfig.Height - slot0.position._value.y
		slot0.mirroredPosition.z = 0

		slot0._visualNode:setPosition3D(slot0.mirroredPosition)
		slot0._visualNode:setRotation(270 - slot0.rotation._value * 57.29578)
	else
		slot0.mirroredPosition.x = slot0.position._value.x
		slot0.mirroredPosition.y = slot0.position._value.y
		slot0.mirroredPosition.z = 0

		slot0._visualNode:setPosition3D(slot0.mirroredPosition)
		slot0._visualNode:setRotation(90 - slot0.rotation._value * 57.29578)
	end

	slot0.lastPosition.x = slot0.mirroredPosition.x
	slot0.lastPosition.y = slot0.mirroredPosition.y
	slot0.lastPosition.z = slot0.mirroredPosition.z

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0.boneData._value.transformation = slot0._visualNode:getNodeToWorldTransform()

		slot0:trigger("boneData", slot0.boneData._value)
	end
end

slot0.onReset = function (slot0, slot1)
	slot0.super.onReset(slot0)
	slot0._sprite:setVisible(true)

	slot0._textureName = slot1.szResourceName
	slot0._texturePath = GET_PATH(FilePath.ANIMATION, "%s/%s_other.png", slot0._textureName, slot0._textureName)

	slot0._sprite:setTexture(slot0._texturePath)
end

slot0.onDestroy = function (slot0)
	slot0.mirroredPosition = nil

	slot0._sprite:removeFromParent()

	slot0._sprite = nil

	slot0.super.onDestroy(slot0)
end

return slot0
