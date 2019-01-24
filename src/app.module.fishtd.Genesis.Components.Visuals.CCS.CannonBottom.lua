slot0 = ClassLoader:aquireClass("CannonUI")
slot1 = class_C("CannonBottom", function (...)
	return slot0:create(...)
end)

slot1.changeOrientation = function (slot0, slot1)
	slot0._cannon:setRotation(90 - slot1)
end

slot1.getFirePosition = function (slot0)
	return
end

slot1.setPosition = function (slot0, slot1)
	cc.Node.setPosition(slot0, slot1.x, 0)
	slot0.txtPanel:setPosition(cc.p(0, 19))
end

slot1.playChangeAnimation = function (slot0)
	slot1 = cc.ParticleSystemQuad:create("gameres/module/fishtd/particle/paotaiboomlizi.plist")

	slot1:setPosition(0, 40)
	slot1:setAutoRemoveOnFinish(true)
	slot1:setScale(0.3)
	slot0:addChild(slot1)

	slot2 = cc.ParticleSystemQuad:create("gameres/module/fishtd/particle/paotaigxboomlizi.plist")

	slot2:setPosition(0, 40)
	slot2:setAutoRemoveOnFinish(true)
	slot2:setScale(0.2)
	slot0:addChild(slot2)

	slot3 = sp.SkeletonAnimation:create("gameres/module/fishtd/animation/paotai/paotaieffect.json", "gameres/module/fishtd/animation/paotai/paotaieffect.atlas", 1)

	slot3:setPosition(0, 40)
	slot3:setAnimation(0, "animation", false)
	slot3:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.RemoveSelf:create()))
	slot0:addChild(slot3)
end

return slot1
