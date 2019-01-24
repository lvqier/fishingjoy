slot0 = class_C("FishVisualVortex", ClassLoader:aquireClass("FishVisual"))

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
	slot0._fishSprite:set3DModelClearDepth(false)
	slot0._fishSprite:runAction(cc.RepeatForever:create(cc.Animate3D:create(cc.Animation3D:create(slot0._texturePath), ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].ffrom / 30, ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].fto / 30 - ClassLoader.aquireSingleton("GameConfig").VisualMap[slot1.Ref[1].Id].live[1].ffrom / 30)))

	slot0._cycleSpine = sp.SkeletonAnimation:create(ENUM.FishVortexEffect.Effect.json, ENUM.FishVortexEffect.Effect.atlas, slot1.Effect[1].Scale)

	slot0._cycleSpine:setPosition3D({
		x = slot1.Effect[1].OffsetX,
		y = slot1.Effect[1].OffsetY,
		z = slot1.Effect[1].OffsetZ
	})
	slot0._cycleSpine:setAnimation(0, "animation", true)
	slot0._cycleSpine:setGlobalZOrder(-1)
	slot0._cycleSpine:setDepthTest(true)
	slot0._visualNode:addChild(slot0._cycleSpine)
	slot0._visualNode:addChild(slot0._fishSprite, 1)
end

slot0.changeDeadAction = function (slot0)
	slot0._fishSprite:stopAllActions()
	slot0._fishSprite:setColor(cc.c3b(255, 255, 255))
	slot0._fishSprite:runAction(cc.Sequence:create(slot5, slot6, slot7))
	slot0._cycleSpine:runAction(cc.Sequence:create(cc.DelayTime:create(slot3), cc.FadeTo:create(0.15, 0)))
end

slot0.changeNormalAction = function (slot0, slot1)
	slot0.super.changeNormalAction(slot0)

	if slot1 ~= "swim" then
		slot0._cycleSpine:setOpacity(255)
		slot0._cycleSpine:clearTracks()
		slot0._cycleSpine:setAnimation(0, "animation", true)
	end
end

return slot0
