slot0 = class_C("BackgroundPresentor", ClassLoader:aquireClass("Entity"))
slot1 = "_Water_Shader_GLSL_"

function slot2(slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		slot7:setGlobalZOrder(slot1)
	end

	slot0:setGlobalZOrder(slot1)
end

slot0.onCreate = function (slot0)
	slot0.super.onCreate(slot0)
	slot0:addProperty("firstTime")
	slot0:setValue("category", "presentor")
	slot0:startListen("INIT")
	slot0:startListen("FISH3D_CMD_S_SWITCH_SCENE")

	slot0._localZOrder = 10
	slot0._sceneIndex = 0
	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")
	slot0.backgroundLayer = ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("BackgroundLayer")
	slot0.backgroundExchangeLayer = ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("BackgroundLayerExchangeLayer")
end

slot0.onCreateFinish = function (slot0)
	slot0.super.onCreateFinish(slot0)
	slot0:setValue("id", "BackgroundPresentor")
	slot0:setValue("category", "presentor")
	slot0:setValue("firstTime", false)
end

slot0.handle_INIT = function (slot0)
	slot0:handle_FISH3D_CMD_S_SWITCH_SCENE({
		nst = 1,
		bSwitching = false
	})
end

slot0.handle_FISH3D_CMD_S_SWITCH_SCENE = function (slot0, slot1)
	if slot1.nst == slot0._sceneIndex then
		return
	else
		slot0._sceneIndex = slot1.nst
		slot0.gameConfig.currentSceneIndex = slot0._sceneIndex
	end

	slot2 = slot0.gameConfig
	slot5 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	print("-----background scene id----", slot1.nst, "-----select scene index---", slot1.nst)

	if slot1.bSwitching then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.WAVE)

		slot6 = cc.Node:create()

		slot6:setPosition(slot3.width - 145 + 200, slot2.Height / 2)
		slot0.backgroundExchangeLayer:addChild(slot6, 2)

		for slot10 = 0, 8, 1 do
			slot11 = sp.SkeletonAnimation:create(FilePath.ANIMATION .. "effect_transition_water/transition_water.json", FilePath.ANIMATION .. "effect_transition_water/transition_water.atlas", 1)

			slot11:setAnimation(0, "animation", true)
			slot11:setPosition(50 + math.random() * 15, 375 - 90 * slot10)
			slot11:setScale(0.6 + math.random() * 0.1)
			slot6:addChild(slot11, 2)
		end

		slot6:runAction(slot8)

		if slot0.backgroundLayer:getChildByName("ShaderNode") ~= nil then
			slot9:setVisible(false)
		end

		slot10 = slot0:loadGravityConfig(slot4)

		slot0:addBubble(slot4, slot2, slot10)
		slot10:setPosition((slot3.width / 2 * 3 + 200) - slot5, slot2.Height / 2)
		slot10:setName("last_image")
		slot0.backgroundExchangeLayer:addChild(slot10, 1)
		slot10:runAction(cc.Sequence:create(slot11, cc.CallFunc:create(function ()
			slot0._world:triggerEvent("SCENE_SWITCH_FINISH")
			slot0._world.triggerEvent.backgroundLayer:removeChildByName("last_image")
			fishtdSound:playFishTdMusicByID(slot1.nst)
			slot2:retain()
			slot2:removeFromParent()
			slot3(slot1.nst, -1000)
			slot3.backgroundLayer:addChild(-1000)
			slot2:release()
			slot2.release:loadShaderNode()

			if slot2.release.loadShaderNode.backgroundLayer:getChildByName("ShaderNode") ~= nil then
				slot0:setVisible(true)
			end
		end)))
	else
		slot0.backgroundLayer:removeChildByName("last_image")
		slot0:switchBackground(slot1.nst)
		fishtdSound:playFishTdMusicByID(slot1.nst)
	end

	mainMgr:gc()
end

slot0.switchBackground = function (slot0, slot1)
	slot3 = cc.Director:getInstance():getVisibleSize()
	slot4 = slot0:loadGravityConfig(slot1)

	slot0:addBubble(slot1, slot2, slot4)
	slot4:setPosition(slot0.gameConfig.Width / 2, slot0.gameConfig.Height / 2)
	slot0(slot4, -1000)
	slot4:setName("last_image")
	slot0.backgroundLayer:addChild(slot4)
	slot0:loadShaderNode()
end

slot0.loadGravityConfig = function (slot0, slot1)
	slot2 = slot0.gameConfig
	slot4 = device.platform == "android"

	cc.Node:create().setCascadeOpacityEnabled(nil, true)

	slot6 = FilePath.UI .. "scene/"

	for slot10, slot11 in pairs(slot2.SceneMap[slot1].spriteMaps) do
		slot3:addChild(cc.Sprite:create(slot6 .. slot11.name), slot11.localZOrder)
	end

	if not slot4 then
		slot7 = slot6 .. slot5.directory

		for slot11, slot12 in pairs(slot5.spineMaps) do
			slot14 = sp.SkeletonAnimation:create(slot13 .. ".json", slot13 .. ".atlas")

			slot14:setAnimation(0, slot12.ani, true)
			slot14:update(0.1)
			slot3:addChild(slot14, slot12.localZOrder)
		end
	end

	slot3:setName("last_image")

	return slot3
end

slot0.loadShaderNode = function (slot0)
	slot1 = slot0.backgroundLayer:getChildByName("ShaderNode")

	if device.platform ~= "android" and custom.ShaderNode and not slot1 then
		slot3 = custom.ShaderNode:create(FilePath.SHADER .. "Shader_VS.glsl", FilePath.SHADER .. "Shader_FS.glsl", 128, cc.Director:getInstance():getOpenGLView():getFrameSize())

		slot0.backgroundLayer:addChild(slot3)
		slot3:setPosition(slot0.gameConfig.Width / 2, slot0.gameConfig.Height / 2)
		slot3:setName("ShaderNode")
		slot3:setGlobalZOrder(-100)
	end
end

slot0.addBubble = function (slot0, slot1, slot2, slot3)
	slot5 = FilePath.PARTICLE .. "3dby_hdqipao.plist"
	slot6 = slot2.Width / 2
	slot7 = slot2.Height / 2

	for slot11, slot12 in pairs(slot4) do
		slot3:runAction(cc.Sequence:create(cc.DelayTime:create(slot12.delay), cc.CallFunc:create(function ()
			slot0 = cc.ParticleSystemQuad:create(cc.ParticleSystemQuad.create)

			slot0:setPosition3D({
				x = slot1.x - slot2,
				y = slot1.y - ,
				z = slot1.z
			})
			slot4:addChild(slot0, 10)
			slot0:setGlobalZOrder(10:getGlobalZOrder())
		end)))
	end
end

return slot0
