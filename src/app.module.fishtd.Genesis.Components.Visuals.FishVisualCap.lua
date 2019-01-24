slot0 = class_C("FishVisualCap", ClassLoader:aquireClass("FishVisual"))

slot0.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0, slot1)
end

slot0.loadVisualFish = function (slot0, slot1)
	slot0._fishConfig = ClassLoader:aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id]
	slot0._texturePath = FilePath.MODEL .. slot0._fishConfig.live[1].Image .. "/" .. slot0._fishConfig.live[1].Image .. ".c3b"
	slot0._fishSprite = cc.Sprite3D:createFish(slot0._texturePath, slot4)

	slot0._fishSprite:setScale(slot1.Ref[1].Scale)
	slot0._fishSprite:setRotation3D({
		z = 0,
		x = 0,
		y = 0
	})
	slot0._fishSprite:setPosition3D({
		z = 0,
		x = 0,
		y = 0
	})
	slot0._fishSprite:runAction(cc.RepeatForever:create(slot8))
	slot0._fishSprite:setCascadeColorEnabled(true)
	slot0._fishSprite:setCascadeOpacityEnabled(true)
	slot0._fishSprite:setDepthSpread(40)
	slot0._fishSprite:set3DModelClearDepth(false)
	slot0._visualNode:addChild(slot0._fishSprite)

	slot0._capSprite = cc.Sprite3D:createFish(slot10, slot4)

	slot0._capSprite:setPosition3D({
		x = slot1.Ref[2].OffsetX,
		y = slot1.Ref[2].OffsetY,
		z = slot1.Ref[2].OffsetZ
	})
	slot0._capSprite:setRotation3D({
		z = 0,
		x = 0,
		y = 0
	})
	slot0._capSprite:setScale(1 / slot1.Ref[1].Scale * slot1.Ref[2].Scale)
	slot0._capSprite:set3DModelClearDepth(false)
	slot0._fishSprite:addChild(slot0._capSprite)

	slot0._boneName = slot1.Ref[1].Bone
end

slot0.on_position_changed = function (slot0)
	if ClassLoader:aquireSingleton("GameConfig").MirrorFlag then
		slot0._visualNode:setPosition3D({
			x = ClassLoader:aquireSingleton("GameConfig").Width - slot0:getValue("position").x,
			y = ClassLoader:aquireSingleton("GameConfig").Height - slot0:getValue("position").y,
			z = slot0:getValue("position").z
		})
	else
		slot0._visualNode:setPosition3D(slot0:getValue("position"))
	end
end

slot0.on_direction_changed = function (slot0)
	slot0._visualNode:setRotationQuat(PathMath.directionToQuat(slot0:getValue("direction"), slot0:getValue("roll"), ClassLoader:aquireSingleton("GameConfig").MirrorFlag))
	PathMath.updateSprite3DWithBone(slot0._capSprite, slot0._boneName)
end

return slot0
