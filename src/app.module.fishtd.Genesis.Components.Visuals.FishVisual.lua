slot0 = ClassLoader:aquireClass("Tools")
slot1 = class_C("FishVisual", ClassLoader:aquireClass("Visual"))

slot1.onCreate = function (slot0, slot1, slot2)
	slot0.super.onCreate(slot0, slot2)
	slot0:addProperty("boneData", slot2)
	slot0:addProperty("isDead", slot2)
	slot0:addProperty("isRemoved", slot2)
	slot0:addProperty("hit", slot2)
	slot0:addProperty("deadCause", slot2)
	slot0:addProperty("grouped", slot2)
	slot0:addProperty("bonePosition", slot2)
	slot0:addProperty("specialAction", slot2)
	slot0._visualNode:setScale(slot1.scale)

	slot0.models = {}
	slot0.effects = {}
	slot0.modelBindings = {}
	slot0.effectBindings = {}
	slot0.collisionModel = nil
	slot0.modelWidth = 0
	slot0.normalActionCounter = 0
	slot0.actionChangeCircle = math.random(6, 10)
	slot0.tempPosition = {
		z = 0,
		x = 0,
		y = 0
	}
	slot0.PathMath = PathMath
	slot0.bonePositionDirty = false
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0._visualConfig = slot1
	slot0.tinting = false
	slot0.actionQueue = ClassLoader:aquireInstance("ListQueue")
	slot0.specialActionRunning = false

	if device.platform == "android" then
		slot0._animationQuality = cc.Animate3DQuality.QUALITY_LOW
	else
		slot0._animationQuality = cc.Animate3DQuality.QUALITY_HIGH
	end

	slot0:loadModels(slot1)
	slot0:loadEffects(slot1)
	slot0:loadModelActions()
	slot0:initStateMachine()
end

slot1.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)

	if not slot0.gameConfig.PLATFORM_ANDROID then
		slot0:setValue("boneData", {})
	end

	slot0:setValue("isDead", false)
	slot0:setValue("collisionEnabled", true)
	slot0:setValue("isRemoved", false)
	slot0:setValue("hit", false)
	slot0:setValue("maxKill", -1)
	slot0:setValue("grouped", false)
	slot0:setValue("bonePosition", {
		z = 0,
		x = 0,
		y = 0
	})
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
			event = "kill",
			to = "dead",
			from = "idle"
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
	slot2 = 999999
	slot3 = -999999

	for slot7, slot8 in ipairs(slot1.modelRefs) do
		if slot0.gameConfig.FishModels[slot8.id] then
			slot12 = nil
			slot12 = (not PathMath.getVersion or cc.Sprite3D:createFish(GET_PATH(FilePath.MODEL, "%s/%s.c3b", slot9.resName, slot9.resName), FilePath.INGAME_UI .. "caustics.png")) and cc.Sprite3D:create(GET_PATH(FilePath.MODEL, "%s/%s.c3b", slot9.resName, slot9.resName))

			if slot9.compareBone and slot12.addCompareBone then
				for slot16 = 1, #slot9.compareBone, 1 do
					slot12:addCompareBone(slot9.compareBone[slot16].name)
				end
			end

			if slot12 then
				slot12:setScale(slot8.scale)
				slot12:setRotation3D(Fish3D_Constant.Location3D_Zero)
				slot12:setPosition3D(slot8.offset)
				slot12:setCascadeOpacityEnabled(true)
				slot12:setGlobalZOrder(0)
				slot12:set3DModelClearDepth(false)
				slot12:setForce2DQueue(true)

				if slot12:getAABB()._min.x < slot2 then
					slot2 = slot13._min.x
				end

				if slot3 < slot13._max.x then
					slot3 = slot13._max.x
				end

				table.insert(slot0.models, {
					id = slot8.id,
					sprite = slot12,
					live = slot9.live,
					hurt = slot9.hurt,
					die = slot9.die,
					cast = slot9.cast,
					special = slot9.special,
					texturePath = slot10
				})

				if slot8.bindingTarget and slot8.bindingPoint then
					table.insert(slot0.modelBindings, {
						src = #slot0.models,
						target = slot8.bindingTarget,
						point = slot8.bindingPoint
					})
					slot0.models[slot8.bindingTarget].sprite:addChild(slot12, 2)

					slot0.hasBindings = true
				else
					slot0._visualNode:addChild(slot12, 2)
				end
			end
		end
	end

	slot0.collisionModel = slot0.models[slot1.collisionModel]
	slot0.modelWidth = slot3 - slot2
end

slot1.loadEffects = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1.effectRefs) do
		if slot0.gameConfig.FishEffects[slot6.id] then
			if slot7.type == "spine" then
				if sp.SkeletonAnimation:create(GET_PATH(FilePath.FISH_EFFECT, "%s.json", slot7.resName), GET_PATH(FilePath.FISH_EFFECT, "%s.atlas", slot7.resName)) then
					slot10:setScale(slot6.scale)
					slot10:setPosition3D(slot6.offset)
					slot10:setAnimation(0, slot7.live, true)
					slot10:setDepthTest(slot6.useDepthTest)
					slot10:setOpacity(216.75)

					if slot6.depthLevel == "front" then
						slot0._visualNode:addChild(slot10, 3)
					elseif slot6.depthLevel == "back" then
						slot0._visualNode:addChild(slot10, 1)
					else
						slot0._visualNode:addChild(slot10, 1)
					end

					table.insert(slot0.effects, {
						id = slot6.id,
						live = slot7.live,
						cast = slot7.cast,
						die = slot7.die,
						sprite = slot10,
						type = slot7.type
					})

					if slot6.bindingTarget and slot6.bindingPoint then
						table.insert(slot0.effectBindings, {
							src = #slot0.effects,
							target = slot6.bindingTarget,
							point = slot6.bindingPoint,
							useRotation = slot6.useRotation
						})

						slot0.hasBindings = true
					end
				end
			else
				slot9 = cc.Node:create()

				if cc.ParticleSystemQuad:create("res/gameres/module/fishtd/particle/" .. slot7.resName .. ".plist") then
					slot8:setPositionType(slot6.positionType)
					slot8:setScale(slot6.scale)
					slot8:setPosition3D(slot6.offset)

					if slot6.depthLevel == "front" then
						slot0._visualNode:addChild(slot8, 3)
					elseif slot6.depthLevel == "back" then
						slot0._visualNode:addChild(slot8, 1)
					else
						slot0._visualNode:addChild(slot8, 1)
					end

					table.insert(slot0.effects, {
						id = slot6.id,
						sprite = slot8,
						type = slot7.type
					})

					if slot6.bindingTarget and slot6.bindingPoint then
						table.insert(slot0.effectBindings, {
							src = #slot0.effects,
							target = slot6.bindingTarget,
							point = slot6.bindingPoint,
							useRotation = slot6.useRotation
						})

						slot0.hasBindings = true
					end
				end
			end
		end
	end
end

slot1.loadModelActions = function (slot0)
	slot2 = {
		dieIndex = 0,
		specialIndex = 0,
		hurtIndex = 0,
		liveIndex = 0,
		castIndex = 0
	}
	slot3 = cc.Animation3D:create(slot0.collisionModel.texturePath)

	for slot7, slot8 in ipairs(slot0.collisionModel.live) do
		slot10 = cc.Sequence:create(slot9, cc.CallFunc:create(function ()
			slot0._animationState:forceTransition("swimming")
		end))

		slot10:retain()

		slot2[slot2.liveIndex + slot7] = slot10
	end

	slot2.specialIndex = slot2.liveIndex + slot1.live.size

	for slot7, slot8 in ipairs(slot0.collisionModel.special) do
		slot10 = cc.Sequence:create(slot9, cc.CallFunc:create(function ()
			slot0._animationState:forceTransition("swimming")
		end))

		slot10:retain()

		slot2[slot2.specialIndex + slot7] = slot10
	end

	slot2.hurtIndex = slot2.specialIndex + slot1.special.size

	for slot7, slot8 in ipairs(slot0.collisionModel.hurt) do
		slot10 = cc.Sequence:create(slot9, cc.CallFunc:create(function ()
			slot0._animationState:doEvent("recover")
		end))

		slot10:retain()

		slot2[slot2.hurtIndex + slot7] = slot10
	end

	slot2.dieIndex = slot2.hurtIndex + slot1.hurt.size

	for slot7, slot8 in ipairs(slot0.collisionModel.die) do
		slot13 = cc.Sequence:create(slot11, cc.CallFunc:create(function ()
			slot0:setValue("isRemoved", true)
		end))

		slot13:retain()

		slot2[slot2.dieIndex + slot7] = slot13
	end

	slot2.castIndex = slot2.dieIndex + slot1.die.size

	for slot7, slot8 in ipairs(slot0.collisionModel.cast) do
		slot10 = cc.RepeatForever:create(slot9)

		slot10:retain()

		slot2[slot2.castIndex + slot7] = slot10
	end

	slot2.tintAction = cc.Sequence:create(cc.TintTo:create(0, Fish3D_Constant.Hit_Color_Begin3b), cc.TintTo:create(0.3, Fish3D_Constant.Hit_Color_End3b), cc.CallFunc:create(function ()
		slot0.tinting = false
	end))

	slot2.tintAction:retain()

	slot0.actions = slot2
end

slot1.changeNormalAction = function (slot0)
	slot0.actionObjectSpecial = nil

	if slot0.actionQueue:size() > 0 then
		slot0.actionObjectSpecial = slot0.actionQueue:popFront()

		slot0.actionObjectSpecial:startWithTarget(slot0.collisionModel.sprite)

		slot0.specialActionRunning = true
	else
		slot1 = false

		if slot0._visualConfig.useRandomAction and (not slot0.grouped or not slot0.grouped._value) then
			slot0.normalActionCounter = slot0.normalActionCounter + 1

			if slot0.normalActionCounter == slot0.actionChangeCircle then
				slot0.normalActionCounter = 0
				slot0.actionChangeCircle = math.random(6, 10)
				slot0.specialActionRunning = true
				slot1 = true
			else
				slot0.specialActionRunning = false
			end
		end

		slot1 = slot1 and slot0.gameConfig.PLATFORM_ANDROID

		if slot0.collisionModel.live.size > 0 then
			slot0.actionObjectSpecial = slot0.actions[slot0.actions.liveIndex + ((slot1 and math.random(1, slot2.live.size)) or 1)]

			slot0.actionObjectSpecial:startWithTarget(slot0.collisionModel.sprite)
		end
	end
end

slot1.changeHurtAction = function (slot0)
	if slot0.collisionModel.hurt.size > 0 then
		slot0.actionObjectSpecial = nil

		slot1.sprite:runAction(slot0.actions[slot0.actions.hurtIndex + 1])
	end
end

slot1.changeDeadAction = function (slot0)
	slot0.actionObjectSpecial = nil

	if slot0.specialActionRunning then
		for slot4, slot5 in ipairs(slot0.models) do
			slot5.sprite:runAction(cc.Sequence:create(cc.FadeTo:create(0.3, 0), cc.CallFunc:create(function ()
				slot0:setValue("isRemoved", true)
			end)))
		end
	else
		for slot4, slot5 in ipairs(slot0.models) do
			slot5.sprite:setColor(Fish3D_Constant.Color_White3b)

			slot0.tinting = false

			if slot5.die.size > 0 then
				slot5.sprite:runAction(slot0.actions[slot0.actions.dieIndex + 1])
			else
				slot5.sprite:runAction(cc.Sequence:create(cc.FadeTo:create(0.3, 0), cc.CallFunc:create(function ()
					slot0:setValue("isRemoved", true)
				end)))
			end
		end
	end

	for slot4, slot5 in ipairs(slot0.effects) do
		if slot5.type == "spine" then
			if slot5.die then
				slot5.sprite:setAnimation(0, slot5.die, false)
			else
				slot5.sprite:setOpacity(0)
			end
		else
			slot5.sprite:stopSystem()
		end
	end
end

slot1.changeCastAction = function (slot0)
	slot0.collisionModel.sprite:setColor(Fish3D_Constant.Color_White3b)

	slot0.actionObjectSpecial = nil
	slot0.tinting = false

	if slot0.collisionModel.cast.size > 0 then
		slot3 = cc.RepeatForever:create(slot2)

		slot3:setTag(999)
		slot1.sprite:runAction(slot3)
	end

	for slot5, slot6 in ipairs(slot0.effects) do
		if slot6.type == "spine" then
			if slot6.cast then
				slot6.sprite:setAnimation(0, "start", false)
				slot6.sprite:addAnimation(0, slot6.cast, true)
			else
				slot6.sprite:setOpacity(0)
			end
		end
	end
end

slot1.changeHoldAction = function (slot0)
	return
end

slot1.willHurt = function (slot0)
	if not slot0.specialActionRunning and math.random() < 0.08 then
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
	slot0:bindSameName("hit", slot1, "TWO_WAY")
	slot0:bindSameName("deadCause", slot1, "TWO_WAY")
	slot0:bindSameName("deadTrigger", slot1, "TWO_WAY")
	slot0:bindSameName("grouped", slot1, "TWO_WAY")
	slot0:bindSameName("bonePosition", slot1, "TWO_WAY")
	slot0:bindSameName("specialAction", slot1, "TWO_WAY")

	function getBonePosition(slot0)
		if slot0.bonePositionDirty then
			if slot0.gameConfig.PLATFORM_ANDROID then
				if slot0._visualConfig.id == 21 or slot0._visualConfig.id == 28 then
					slot0.PathMath.getBonePosition(slot0.collisionModel.sprite, "Bip001", slot0)
				else
					slot0.PathMath.getBonePosition(slot0.collisionModel.sprite, nil, slot0)
				end

				cc_matrix_project(slot0.gameConfig._viewProjectMatrix, slot0, slot0)

				slot0.bonePositionDirty = false
			else
				cc_matrix_project(slot0.gameConfig._viewProjectMatrix, slot0.tempPosition, slot0)

				slot0.bonePositionDirty = false
			end
		end

		return slot0
	end

	slot1:assignGetterSetter("bonePosition", getBonePosition, nil)
	slot0.boneData:trigger(slot0.collisionModel.sprite)
end

slot1.onUnload = function (slot0)
	slot0.super.onUnload(slot0)
	slot0:unBindAll()
end

slot1.onEnter = function (slot0, slot1)
	slot0.super.onEnter(slot0, slot1)
	ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("FishLayer"):addChild(slot0._visualNode, slot0._visualConfig.localZOrder)
	slot0._visualNode:setOpacity(0)
	slot0._visualNode:runAction(cc.FadeTo:create(0.2, 255))

	if slot0.grouped._value then
		slot0._visualNode:setScale(slot0._visualConfig.troopScale)
	else
		slot0._visualNode:setScale(1)
	end
end

slot1.onExit = function (slot0)
	slot0.super.onExit(slot0)
	slot0._visualNode:removeFromParent()
end

slot1.on_scale_changed = function (slot0)
	slot0._visualNode:setScale(slot0.scale._value)
end

slot1.onUpdate = function (slot0, slot1, slot2)
	slot3 = (slot2 == nil and slot0.gameConfig.MirrorFlag) or slot2
	slot4 = cc.Director:getInstance():getVisibleSize()
	slot0.bonePositionDirty = true

	if not slot0.isDead._value or (slot0.isDead._value and slot0.deadCause._value == "EFFECT_KILL") then
		slot5 = slot0:getValue("position")

		if slot3 then
			slot0.tempPosition.x = slot0.gameConfig.Width - slot5.x
			slot0.tempPosition.y = slot0.gameConfig.Height - slot5.y
			slot0.tempPosition.z = slot5.z

			if slot2 ~= false then
				slot0.tempPosition.x = (slot0.tempPosition.x * slot4.width) / 1334 - (slot4.width - 1334) / 2
			end
		else
			slot0.tempPosition.x = slot5.x
			slot0.tempPosition.y = slot5.y
			slot0.tempPosition.z = slot5.z

			if slot2 ~= false then
				slot0.tempPosition.x = (slot0.tempPosition.x * slot4.width) / 1334 - (slot4.width - 1334) / 2
			end
		end

		slot0._visualNode:setPosition3D(slot0.tempPosition)
		slot0._visualNode:setLocalZOrder(slot5.z + 6000)

		if not slot0._visualConfig.noRotation then
			if slot0.gameConfig.PLATFORM_ANDROID then
				slot0.PathMath.setOrientation(slot0.collisionModel.sprite, slot0:getValue("direction"), slot0:getValue("roll"), slot3)
			else
				for slot9, slot10 in ipairs(slot0.models) do
					slot10.sprite:setRotationQuat(PathMath.directionToQuat(slot0:getValue("direction"), slot0:getValue("roll"), slot3))
				end
			end
		end

		if not slot0.gameConfig.PLATFORM_ANDROID then
			slot0.boneData._value.transformation = slot0.collisionModel.sprite:getNodeToWorldTransform()
			slot0.boneData._value.skeleton = slot0.collisionModel.sprite:getSkeleton()

			slot0:trigger("boneData", slot0.boneData._value)
		end
	end

	if slot0.hasBindings then
		for slot8, slot9 in ipairs(slot0.modelBindings) do
			slot11 = slot0.models[slot9.target]

			if slot0.models[slot9.src] and slot11 and slot9.point then
				PathMath.updateSprite3DWithBone(slot10.sprite, slot9.point)
			end
		end

		for slot8, slot9 in ipairs(slot0.effectBindings) do
			slot11 = slot0.models[slot9.target]

			if slot0.effects[slot9.src] and slot11 and slot9.point then
				PathMath.updateSprite3DWithBoneEx(slot10.sprite, slot11.sprite, slot9.point, not slot9.useRotation)
			end
		end
	end

	if slot0.actionObjectSpecial then
		slot0.actionObjectSpecial:step(slot1)
	end

	if slot0.tinting then
		slot0.actions.tintAction:step(slot1)
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
		slot0.tinting = true

		slot0.actions.tintAction:startWithTarget(slot0.collisionModel.sprite)
		slot0._animationState:doEvent("hit")
	end
end

slot1.on_specialAction_changed = function (slot0)
	slot1 = slot0.specialAction._value

	if slot0.models[1] and slot1 > 0 and slot2.special[slot1 + 1] then
		slot0.actionQueue:pushBack(slot0.actions[slot0.actions.specialIndex + slot1])
	end
end

slot1.onReset = function (slot0)
	slot0.specialActionRunning = false
	slot0.actionObjectSpecial = nil
	slot0.normalActionCounter = 0
	slot0.actionChangeCircle = math.random(6, 10)

	slot0._visualNode:setPosition3D(Fish3D_Constant.Location3D_Zero)
	slot0._visualNode:setRotation3D(Fish3D_Constant.Location3D_Zero)
	slot0._visualNode:setScale(slot0._visualConfig.scale)
	slot0._visualNode:setOpacity(255)
	slot0._animationState:forceTransition("swimming")

	for slot4, slot5 in pairs(slot0.models) do
		slot5.sprite:setOpacity(255)
	end

	for slot4, slot5 in pairs(slot0.effects) do
		if slot5.type == "spine" then
			slot5.sprite:setOpacity(255)
			slot5.sprite:setAnimation(0, slot5.live, true)
		else
			slot5.sprite:resetSystem()
		end
	end
end

slot1.onDestroy = function (slot0)
	for slot4, slot5 in pairs(slot0.models) do
		slot5.sprite = nil
		slot0.models[slot4] = nil
	end

	slot0.models = nil

	for slot4, slot5 in pairs(slot0.effects) do
		slot5.sprite = nil
		slot0.effects[slot4] = nil
	end

	slot0.effects = nil

	for slot4, slot5 in pairs(slot0.effectBindings) do
		slot0.effectBindings[slot4] = nil
	end

	slot0.effectBindings = nil

	for slot4, slot5 in pairs(slot0.modelBindings) do
		slot0.modelBindings[slot4] = nil
	end

	slot0.modelBindings = nil

	for slot4, slot5 in ipairs(slot0.actions) do
		slot5:release()

		slot0.actions[slot4] = nil
	end

	slot0.actions.tintAction:release()

	slot0.actions.tintAction = nil
	slot0.actions = nil
	slot0.collisionModel = nil

	slot0._animationState:onDestroy()

	slot0._animationState = nil
	slot0.tempPosition = nil

	slot0.super.onDestroy(slot0)
end

return slot1
