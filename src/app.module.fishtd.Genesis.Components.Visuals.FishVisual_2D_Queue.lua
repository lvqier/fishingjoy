slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("FishVisual", ClassLoader:aquireClass("Visual"))

slot1.onCreate = function (slot0, slot1)
	slot0.super.onCreate(slot0)
	slot0._visualNode:setScale(slot1.scale)

	slot0.models = {}
	slot0.effects = {}
	slot0.modelBindings = {}
	slot0.effectBindings = {}
	slot0.collisionModel = nil
	slot0.modelWidth = 0

	slot0:addProperty("boneData")
	slot0:addProperty("isDead")
	slot0:addProperty("visualId")
	slot0:addProperty("isRemoved")
	slot0:addProperty("hit")
	slot0:addProperty("deadCause", nil)
	slot0:addProperty("deadTrigger", nil)
	slot0:loadModels(slot1)
	slot0:loadEffects(slot1)
	slot0:initStateMachine()

	slot0._visualConfig = slot1
end

slot1.initStateMachine = function (slot0)
	slot0._animationState = ClassLoader:aquireInstance("StateMachine")

	slot0._animationState:registerStates({
		{
			name = "swimming",
			enter = slot0:thisCall(slot0.changeNormalAction, slot0)
		},
		{
			name = "hurt",
			enter = slot0:thisCall(slot0.changeHurtAction, slot0)
		},
		{
			name = "dead",
			enter = slot0:thisCall(slot0.changeDeadAction, slot0)
		},
		{
			name = "casting",
			enter = slot0:thisCall(slot0.changeCastAction, slot0)
		},
		{
			name = "holding",
			enter = slot0:thisCall(slot0.changeHoldAction, slot0)
		}
	})
	slot0._animationState:registerJumps({
		{
			event = "hit",
			to = "hurt",
			from = "swimming",
			check = slot0:thisCall(slot1.willHurt, slot0)
		},
		{
			event = "recover",
			to = "swimming",
			from = "hurt"
		},
		{
			event = "cast",
			to = "casting",
			from = "hurt"
		},
		{
			event = "cast",
			to = "casting",
			from = "swimming"
		},
		{
			event = "stop",
			to = "holding",
			from = "hurt"
		},
		{
			event = "stop",
			to = "holding",
			from = "swimming"
		},
		{
			event = "kill",
			to = "dead",
			from = "hurt"
		},
		{
			event = "kill",
			to = "dead",
			from = "swimming"
		},
		{
			event = "kill",
			to = "dead",
			from = "casting"
		},
		{
			event = "kill",
			to = "dead",
			from = "holding"
		},
		{
			event = "swim",
			to = "swimming",
			from = "swimming"
		}
	})
	slot0._animationState:forceTransition("swimming")
end

slot1.loadModels = function (slot0, slot1)
	slot2 = ClassLoader:aquireSingleton("GameConfig")
	slot3 = 999999
	slot4 = -999999

	for slot8, slot9 in ipairs(slot1.modelRefs) do
		if slot2.FishModels[slot9.id] then
			slot12 = GET_PATH(FilePath.INGAME_UI, "caustics.png")

			if cc.Sprite3D:create(GET_PATH(FilePath.MODEL, "%s/%s.c3b", slot10.resName, slot10.resName)) then
				slot13:setScale(slot9.scale)
				slot13:setRotation3D({
					z = 0,
					x = 0,
					y = 0
				})
				slot13:setPosition3D(slot9.offset)
				slot13:setCascadeOpacityEnabled(true)
				slot13:setForce2DQueue(true)

				if slot13:getAABB()._min.x < slot3 then
					slot3 = slot14._min.x
				end

				if slot4 < slot14._max.x then
					slot4 = slot14._max.x
				end

				table.insert(slot0.models, {
					id = slot9.id,
					sprite = slot13,
					live = slot10.live,
					hurt = slot10.hurt,
					die = slot10.die,
					cast = slot10.cast,
					texturePath = slot11
				})

				if slot9.bindingTarget and slot9.bindingPoint then
					table.insert(slot0.modelBindings, {
						src = #slot0.models,
						target = slot9.bindingTarget,
						point = slot9.bindingPoint
					})
					slot0.models[slot9.bindingTarget].sprite:addChild(slot13, 2)
				else
					slot13:set3DModelClearDepth(true)
					slot0._visualNode:addChild(slot13, 2)
				end
			end
		end
	end

	slot0.collisionModel = slot0.models[slot1.collisionModel]
	slot0.modelWidth = slot4 - slot3
end

slot1.loadEffects = function (slot0, slot1)
	slot2 = ClassLoader:aquireSingleton("GameConfig")

	for slot6, slot7 in pairs(slot1.effectRefs) do
		if slot2.FishEffects[slot7.id] and sp.SkeletonAnimation:create(GET_PATH(FilePath.FISH_EFFECT, "%s.json", slot8.resName), GET_PATH(FilePath.FISH_EFFECT, "%s.atlas", slot8.resName)) then
			slot11:setScale(slot7.scale)
			slot11:setPosition3D(slot7.offset)
			slot11:setAnimation(0, slot8.live, true)
			slot11:setDepthTest(slot7.useDepthTest)

			if slot7.depthLevel == "front" then
				slot0._visualNode:addChild(slot11, 3)
			elseif slot7.depthLevel == "back" then
				slot0._visualNode:addChild(slot11, 1)
			else
				slot0._visualNode:addChild(slot11, 1)
			end

			table.insert(slot0.effects, {
				id = slot7.id,
				sprite = slot11,
				live = slot8.live,
				cast = slot8.cast,
				die = slot8.die
			})

			if slot7.bindingTarget and slot7.bindingPoint then
				table.insert(slot0.effectBindings, {
					src = #slot0.effects,
					target = slot7.bindingTarget,
					point = slot7.bindingPoint
				})
			end
		end
	end
end

slot1.changeNormalAction = function (slot0)
	for slot4, slot5 in ipairs(slot0.models) do
		slot5.sprite:stopAllActions()
		slot5.sprite:setColor(cc.c3b(255, 255, 255))

		if slot5.live.size > 0 then
			slot9 = cc.RepeatForever:create(cc.Animate3D:create(cc.Animation3D:create(slot5.texturePath), slot5.live[1].ffrom / 30, slot5.live[1].fto / 30 - slot5.live[1].ffrom / 30))

			slot9:setTag(999)
			slot5.sprite:runAction(slot9)
		end
	end
end

slot1.changeHurtAction = function (slot0)
	for slot4, slot5 in ipairs(slot0.models) do
		slot5.sprite:stopAllActions()
		slot5.sprite:setColor(cc.c3b(255, 255, 255))

		if slot5.hurt.size > 0 then
			slot9 = cc.Sequence:create(cc.Animate3D:create(slot8, slot6, slot5.hurt[1].fto / 30 - slot5.hurt[1].ffrom / 30), cc.CallFunc:create(function ()
				slot0._animationState:doEvent("recover")
			end))

			slot9:setTag(999)
			slot5.sprite:runAction(slot9)
		end
	end
end

slot1.changeDeadAction = function (slot0)
	for slot4, slot5 in ipairs(slot0.models) do
		slot5.sprite:stopAllActions()
		slot5.sprite:setColor(cc.c3b(255, 255, 255))

		if slot5.die.size > 0 then
			slot5.sprite:runAction(cc.Sequence:create(cc.Spawn:create(slot9, slot10), cc.CallFunc:create(function ()
				slot0:setValue("isRemoved", true)
			end)))
		else
			slot5.sprite:runAction(cc.Sequence:create(cc.FadeTo:create(0.3, 0), cc.CallFunc:create(function ()
				slot0:setValue("isRemoved", true)
			end)))
		end
	end

	for slot4, slot5 in ipairs(slot0.effects) do
		if slot5.die then
			slot5.sprite:setAnimation(0, slot5.die, false)
		else
			slot5.sprite:setOpacity(0)
		end
	end
end

slot1.changeCastAction = function (slot0)
	for slot4, slot5 in ipairs(slot0.models) do
		slot5.sprite:stopAllActions()
		slot5.sprite:setColor(cc.c3b(255, 255, 255))

		if slot5.cast.size > 0 then
			slot9 = cc.RepeatForever:create(cc.Animate3D:create(cc.Animation3D:create(slot5.texturePath), slot5.cast[1].ffrom / 30, slot5.cast[1].fto / 30 - slot5.cast[1].ffrom / 30))

			slot9:setTag(999)
			slot5.sprite:runAction(slot9)
		else
			slot5.sprite:stopAllActions()
		end
	end

	for slot4, slot5 in ipairs(slot0.effects) do
		if slot5.cast then
			slot5.sprite:setAnimation(0, "start", false)
			slot5.sprite:addAnimation(0, slot5.cast, true)
		else
			slot5.sprite:setOpacity(0)
		end
	end
end

slot1.changeHoldAction = function (slot0)
	return
end

slot1.willHurt = function (slot0)
	if math.random() < 0.15 then
		return true
	else
		return false
	end
end

slot1.onLoad = function (slot0)
	slot0.super.onLoad(slot0)

	slot1 = slot0:getValue("owner")

	slot0:bindSameName("boneData", slot1, "TWO_WAY")
	slot0:bindSameName("isDead", slot1, "TWO_WAY")
	slot0:bindSameName("isRemoved", slot1, "TWO_WAY")
	slot0:bindSameName("visualId", slot1, "TWO_WAY")
	slot0:bindSameName("hit", slot1, "TWO_WAY")
	slot0:bindSameName("deadCause", slot1, "TWO_WAY")
	slot0:bindSameName("deadTrigger", slot1, "TWO_WAY")
end

slot1.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:setValue("boneData", {})
	slot0:unBindAll()
end

slot1.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("FishLayer"):addChild(slot0._visualNode, slot0._visualConfig.localZOrder)
end

slot1.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0._visualNode:removeFromParent()
end

slot1.on_position_changed = function (slot0)
	slot2 = slot0:getValue("position")

	if ClassLoader:aquireSingleton("GameConfig").MirrorFlag then
		slot0._visualNode:setPosition3D(slot3)
		slot0._visualNode:setLocalZOrder(slot2.z)
	else
		slot0._visualNode:setPosition3D(slot2)
		slot0._visualNode:setLocalZOrder(slot2.z)
	end
end

slot1.on_direction_changed = function (slot0)
	slot1 = ClassLoader:aquireSingleton("GameConfig")

	for slot5, slot6 in ipairs(slot0.models) do
		slot6.sprite:setRotationQuat(PathMath.directionToQuat(slot0:getValue("direction"), slot0:getValue("roll"), slot1.MirrorFlag))
	end

	for slot5, slot6 in ipairs(slot0.modelBindings) do
		slot8 = slot0.models[slot6.target]

		if slot0.models[slot6.src] and slot8 and slot6.point then
			PathMath.updateSprite3DWithBone(slot7.sprite, slot6.point)
		end
	end

	for slot5, slot6 in ipairs(slot0.effectBindings) do
		slot8 = slot0.models[slot6.target]

		if slot0.effects[slot6.src] and slot8 and slot6.point then
			PathMath.updateSprite3DWithBoneEx(slot7.sprite, slot8.sprite, slot6.point, true)
		end
	end
end

slot1.on_scale_changed = function (slot0)
	slot0._visualNode:setScale(slot0:getValue("scale"))
end

slot1.onUpdate = function (slot0)
	if slot0.collisionModel then
		slot0:setValue("boneData", {
			transformation = slot0.collisionModel.sprite:getNodeToWorldTransform(),
			skeleton = slot0.collisionModel.sprite:getSkeleton()
		})

		for slot6, slot7 in ipairs(slot0.modelBindings) do
			slot9 = slot0.models[slot7.target]

			if slot0.models[slot7.src] and slot9 and slot7.point then
				PathMath.updateSprite3DWithBone(slot8.sprite, slot7.point)
			end
		end

		for slot6, slot7 in ipairs(slot0.effectBindings) do
			slot9 = slot0.models[slot7.target]

			if slot0.effects[slot7.src] and slot9 and slot7.point then
				PathMath.updateSprite3DWithBoneEx(slot8.sprite, slot9.sprite, slot7.point, true)
			end
		end
	end
end

slot1.on_isDead_changed = function (slot0)
	if slot0:getValue("isDead") then
		if slot0:getValue("deadCause") == "NORMAL_KILL" then
			slot0._animationState:doEvent("kill")
		elseif slot1 == "EFFECT_KILL_FINISH" then
			slot0._animationState:doEvent("kill")
		elseif slot1 == "EFFECT_KILL" then
			slot0._animationState:doEvent("stop")
		elseif slot1 == "CAST_EFFECT" then
			slot0._animationState:doEvent("cast")
		end
	end
end

slot1.on_hit_changed = function (slot0)
	if slot0:getValue("hit") then
		for slot4, slot5 in pairs(slot0.models) do
			slot5.sprite:runAction(cc.Sequence:create(cc.TintTo:create(0, cc.c3b(255, 130, 130)), cc.TintTo:create(0.8, cc.c3b(255, 255, 255))))
		end

		slot0._animationState:doEvent("hit")
	end
end

slot1.onReset = function (slot0)
	slot0._visualNode:setRotation3D({
		z = 0,
		x = 0,
		y = 0
	})
	slot0._visualNode:setScale(slot0._visualConfig.scale)
	slot0._visualNode:setOpacity(255)
	slot0._animationState:forceTransition("swimming")

	for slot4, slot5 in pairs(slot0.models) do
		slot5.sprite:setOpacity(255)
	end

	for slot4, slot5 in pairs(slot0.effects) do
		slot5.sprite:setOpacity(255)
		slot5.sprite:setAnimation(0, slot5.live, true)
	end
end

return slot1
