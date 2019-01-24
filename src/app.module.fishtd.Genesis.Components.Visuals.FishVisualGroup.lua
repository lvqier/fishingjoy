slot0 = class_C("FishVisualGroup", ClassLoader:aquireClass("FishVisual"))

slot0.loadVisualFish = function (slot0, slot1)
	slot0._children = {}
	slot0._collisionVisualIndex = 0

	custom.Layer3D:create(slot1.Collision).setCascadeColorEnabled(slot2, true)

	slot3 = ClassLoader:aquireSingleton("GameConfig").VisualMap

	for slot7 = 1, #slot1.Ref, 1 do
		slot9 = slot3[slot1.Ref[slot7].Id].Scale
		slot10 = slot3[slot1.Ref[slot7].Id].OffsetX
		slot11 = slot3[slot1.Ref[slot7].Id].OffsetY
		slot12 = slot3[slot1.Ref[slot7].Id].OffsetZ
		slot13 = slot3[slot1.Ref[slot7].Id].Color
		slot14 = nil
		slot16 = GET_PATH(FilePath.MODEL, "%s/%s.c3b", slot3[slot1.Ref[slot7].Id].live[1].Image, slot3[slot1.Ref[slot7].Id].live[1].Image)
		slot17 = GET_PATH(FilePath.INGAME_UI, "caustics.png")

		if slot3[slot1.Ref[slot7].Id].live[1].Skin then
			slot14 = cc.Sprite3D:createFish(slot16, slot17)
		else
			cc.Sprite3D:create(slot16):setGlobalZOrder(-1)
		end

		slot2:addChild(slot14)
		slot14:setPosition(cc.p(slot15.OffsetX, slot15.OffsetY))
		slot14:setRotation3D({
			z = 0,
			x = 0,
			y = 0
		})
		slot14:setScale(slot1.Ref[slot7].Scale)
		slot14:setTag(slot7 - 1)
		slot14:setOpacity(255)
		slot14:set3DModelClearDepth(false)
		slot0:setModelColor(slot14, slot1.Ref[slot7].Color)
		slot14:runAction(cc.RepeatForever:create(cc.Animate3D:createWithFrames(slot18, slot15.ffrom, slot15.fto, 30)))
		table.insert(slot0._children, slot14)

		if slot15.Image == slot1.Collision then
			slot0._collisionVisualIndex = #slot0._children
		end
	end

	slot2:bindCollisionSprite3D()
	slot0._visualNode:addChild(slot2)

	slot0._fishSprite = slot2
end

slot0.setModelColor = function (slot0, slot1, slot2)
	if slot2 == "WHITE" then
		slot1:setColor(cc.c3b(255, 255, 255))

		slot1._originalColor = cc.c3b(255, 255, 255)
	elseif slot2 == "GREEN" then
		slot1:setColor(cc.c3b(0, 255, 0))

		slot1._originalColor = cc.c3b(0, 255, 0)
	elseif slot2 == "BLUE" then
		slot1:setColor(cc.c3b(0, 0, 255))

		slot1._originalColor = cc.c3b(0, 0, 255)
	elseif slot2 == "GOLD" then
		slot1:setColor(cc.c3b(255, 255, 0))

		slot1._originalColor = cc.c3b(255, 255, 0)
	end
end

slot0.onUpdate = function (slot0)
	if slot0._collisionVisualIndex > 0 then
		slot0:setValue("boneData", {
			transformation = slot0._children[slot0._collisionVisualIndex]:getNodeToWorldTransform(),
			skeleton = slot0._children[slot0._collisionVisualIndex]:getSkeleton()
		})
	end
end

slot0.changeNormalAction = function (slot0)
	slot1 = ClassLoader:aquireSingleton("GameConfig").VisualMap

	for slot5 = 1, #slot0._fishConfig.Ref, 1 do
		slot0._children[slot5]:stopAllActions()
		slot0._children[slot5]:setColor(cc.c3b(255, 255, 255))
		slot0._children[slot5]:setOpacity(255)
		slot0._children[slot5]:runAction(cc.RepeatForever:create(cc.Animate3D:create(cc.Animation3D:create(slot7), slot1[slot0._fishConfig.Ref[slot5].Id].live[1].ffrom / 30, slot1[slot0._fishConfig.Ref[slot5].Id].live[1].fto / 30 - slot1[slot0._fishConfig.Ref[slot5].Id].live[1].ffrom / 30)))
	end
end

slot0.changeHurtAction = function (slot0)
	slot1 = ClassLoader:aquireSingleton("GameConfig").VisualMap

	for slot5 = 1, #slot0._fishConfig.Ref, 1 do
		slot0._children[slot5]:stopAllActions()

		slot8 = math.random(1, slot7)
		slot10 = slot1[slot0:getValue("visualId")]

		slot0._children[slot5]:runAction(cc.Sequence:create(slot12, cc.CallFunc:create(function ()
			slot0._animationState:doEvent("recover")
		end)))
		slot0._children[slot5]:runAction(cc.Sequence:create(cc.TintTo:create(0.2, cc.c3b(255, 180, 180)), cc.TintTo:create(0.3, slot0._children[slot5]._originalColor)))
	end
end

slot0.changeDeadAction = function (slot0)
	slot1 = 0
	slot2 = ClassLoader:aquireSingleton("GameConfig").VisualMap

	for slot6 = 1, #slot0._fishConfig.Ref, 1 do
		slot0._children[slot6]:stopAllActions()
		slot0._children[slot6]:setColor(slot0._children[slot6]._originalColor)

		slot9 = slot2[slot0:getValue("visualId")]

		slot0._children[slot6]:runAction(cc.Sequence:create(cc.Animate3D:create(slot10, slot2[slot0._fishConfig.Ref[slot6].Id].die[1].ffrom / 30, slot2[slot0._fishConfig.Ref[slot6].Id].die[1].fto / 30 - slot2[slot0._fishConfig.Ref[slot6].Id].die[1].ffrom / 30), cc.FadeTo:create(0.3, 0), cc.CallFunc:create(function ()
			if slot0 + 1 == #slot1._fishConfig.Ref then
				slot1:setValue("isRemoved", true)
			end
		end)))
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

slot0.on_hit_changed = function (slot0)
	if slot0:getValue("hit") then
		for slot4 = 1, #slot0._fishConfig.Ref, 1 do
			slot0._children[slot4]:runAction(cc.Sequence:create(cc.TintTo:create(0, cc.c3b(255, 130, 130)), cc.TintTo:create(0.8, slot0._children[slot4]._originalColor)))
		end

		slot0._animationState:doEvent("hit")
	end
end

return slot0
