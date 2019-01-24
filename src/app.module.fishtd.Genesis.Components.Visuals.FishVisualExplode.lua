slot0 = class_C("FishVisualExplode", ClassLoader:aquireClass("FishVisual"))

slot0.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0, slot1)
end

slot0.loadVisualFish = function (slot0, slot1)
	slot0._fishConfig = ClassLoader:aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id]
	slot0._textureName = ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].Image
	slot0._texturePath = GET_PATH(FilePath.MODEL, "%s/%s.c3b", slot0._textureName, slot0._textureName)
	slot0._effectPath = GET_PATH(FilePath.INGAME_UI, "caustics.png")
	slot0._fishSprite = cc.Sprite3D:createFish(slot0._texturePath, slot0._effectPath)

	slot0._fishSprite:setScale(slot1.Ref[1].Scale)
	slot0._fishSprite:setRotation3D(slot3)
	slot0._fishSprite:setPosition3D(slot3)
	slot0._fishSprite:set3DModelClearDepth(false)
	slot0._fishSprite:runAction(cc.RepeatForever:create(cc.Animate3D:create(cc.Animation3D:create(slot0._texturePath), ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].ffrom / 30, ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].fto / 30 - ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].ffrom / 30)))

	slot0._leftEffect = sp.SkeletonAnimation:create(ENUM.FishExplodeEffect.Fire.json, ENUM.FishExplodeEffect.Fire.atlas, slot1.Effect[2].Scale)

	slot0._leftEffect:setAnimation(0, "animation", true)
	slot0._leftEffect:setPosition3D({
		x = slot1.Effect[2].OffsetX,
		y = slot1.Effect[2].OffsetY,
		z = slot1.Effect[2].OffsetZ
	})
	slot0._leftEffect:setGlobalZOrder(-1)
	slot0._leftEffect:setDepthTest(true)
	slot0._fishSprite:addChild(slot0._leftEffect)

	slot0._leftBoneName = slot1.Effect[2].Bone
	slot0._rightEffect = sp.SkeletonAnimation:create(ENUM.FishExplodeEffect.Fire.json, ENUM.FishExplodeEffect.Fire.atlas, slot1.Effect[3].Scale)

	slot0._rightEffect:setAnimation(0, "animation", true)
	slot0._rightEffect:setPosition3D({
		x = slot1.Effect[2].OffsetX,
		y = slot1.Effect[3].OffsetY,
		z = slot1.Effect[3].OffsetZ
	})
	slot0._rightEffect:setGlobalZOrder(-1)
	slot0._rightEffect:setDepthTest(true)
	slot0._fishSprite:addChild(slot0._rightEffect)

	slot0._rightBoneName = slot1.Effect[3].Bone
	slot0._cycleSpine = sp.SkeletonAnimation:create(ENUM.FishExplodeEffect.Explode.json, ENUM.FishExplodeEffect.Explode.atlas, slot1.Effect[1].Scale)

	slot0._cycleSpine:setPosition3D({
		x = slot1.Effect[1].OffsetX,
		y = slot1.Effect[1].OffsetY,
		z = slot1.Effect[1].OffsetZ
	})
	slot0._cycleSpine:setOpacity(178.5)
	slot0._cycleSpine:setAnimation(0, "idle", true)
	slot0._cycleSpine:setMix("idle", "end", 0.1)
	slot0._cycleSpine:setGlobalZOrder(-1)

	slot0._effectBone = slot1.Effect[1].Bone

	slot0._visualNode:addChild(slot0._fishSprite)
	slot0._visualNode:addChild(slot0._cycleSpine)
end

slot0.changeDeadAction = function (slot0)
	slot0._fishSprite:stopAllActions()
	slot0._fishSprite:setColor(cc.c3b(255, 255, 255))
	slot0._fishSprite:runAction(cc.Sequence:create(slot5, cc.FadeTo:create(0.3, 0), cc.CallFunc:create(function ()
		slot0:setValue("isRemoved", true)
	end)))
	slot0._cycleSpine:clearTracks()
	slot0._cycleSpine:setAnimation(1, "end", false)
end

slot0.changeNormalAction = function (slot0, slot1)
	slot0.super.changeNormalAction(slot0)

	if slot1 ~= "swim" then
		slot0._rightEffect:setAnimation(0, "animation", true)
		slot0._leftEffect:setAnimation(0, "animation", true)
		slot0._cycleSpine:clearTracks()
		slot0._cycleSpine:setAnimation(0, "idle", true)
	end
end

slot0.on_position_changed = function (slot0)
	slot2 = slot0:getValue("position")

	if ClassLoader:aquireSingleton("GameConfig").MirrorFlag then
		slot0._visualNode:setPosition3D({
			x = slot1.Width - slot2.x,
			y = slot1.Height - slot2.y,
			z = slot2.z
		})
	else
		slot0._visualNode:setPosition3D(slot2)
	end
end

slot0.on_direction_changed = function (slot0)
	slot0._fishSprite:setRotationQuat(PathMath.directionToQuat(slot0:getValue("direction"), slot0:getValue("roll"), ClassLoader:aquireSingleton("GameConfig").MirrorFlag))
	PathMath.updateSprite3DWithBone(slot0._leftEffect, slot0._leftBoneName)
	PathMath.updateSprite3DWithBone(slot0._rightEffect, slot0._rightBoneName)
	PathMath.updateNodeWithoutRotate(slot0._cycleSpine, slot0._fishSprite, slot0._effectBone)
end

slot0.on_scale_changed = function (slot0)
	slot0._visualNode:setScale(slot0:getValue("scale"))
end

return slot0
