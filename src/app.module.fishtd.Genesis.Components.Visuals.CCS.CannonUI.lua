slot0 = ClassLoader:aquireClass("BaseNode")
slot1 = ClassLoader:aquireClass("Tools")
slot2 = ClassLoader:aquireClass("TexturedNumber")
slot3 = class_C("CannonUI", function ()
	return slot0:create()
end)
slot3.CANNON_RESOURCE_MAP = {
	[0] = {
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen1.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou1.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen2.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou2.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen3.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou3.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen2.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou2.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen2.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou2.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen2.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou2.png")
	},
	{
		baseResPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/dizuo.png"),
		barrelJsonPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.json"),
		barrelAtlasPath = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/Cannons/paotai.atlas"),
		bodyResPath = GET_PATH(FilePath.UI, "common/cannon/paoshen1.png"),
		barrelResPath = GET_PATH(FilePath.UI, "common/cannon/paotou1.png")
	}
}
slot3.CANNON_SPINE_RESOURCE_MAP = {
	[0] = {
		[0] = {
			pathPrefix = "3dby_paotai1"
		},
		{
			pathPrefix = "3dby_paotai2"
		}
	},
	{
		[0] = {
			pathPrefix = "3dby_paotai3"
		},
		{
			pathPrefix = "3dby_paotai4"
		}
	},
	{
		[0] = {
			pathPrefix = "3dby_paotai5"
		},
		{
			pathPrefix = "3dby_paotai6"
		}
	}
}
slot3.CannonAccelerateMap = {
	[0] = {
		json = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffecta.json",
		atlas = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffecta.atlas"
	},
	{
		json = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffectb.json",
		atlas = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffectb.atlas"
	},
	{
		json = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffectc.json",
		atlas = FilePath.FISH_EFFECT .. "3dby_paotaijiasueffectc.atlas"
	}
}

slot3.ctor = function (slot0, slot1)
	slot0._cannonNode = slot1

	slot0:addChild(slot0._cannonNode)

	slot2 = slot0:seekChildByName(slot0._cannonNode, "Position_Text_Coin")
	slot0._textAtlas = cc.LabelAtlas:create("100000", GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_collect.png"), 16, 28, 48)

	slot0._textAtlas:setString("123123")
	slot0._textAtlas:setVisible(true)
	slot0._textAtlas:setScale(1)
	slot0._textAtlas:setOpacity(255)
	slot0._textAtlas:setAnchorPoint(0, 0.5)
	slot0._textAtlas:setPosition(-4, -2)
	slot2:addChild(slot0._textAtlas, 999)

	slot0._cannon = slot0:seekChildByName(slot0._cannonNode, "Position_Cannon")
	slot0._cannonBody = slot0:seekChildByName(slot0._cannonNode, "Position_Cannon"):getChildByName("body")

	slot0._cannonBody:setLocalZOrder(3)

	slot0._cannonBarrel = slot0:seekChildByName(slot0._cannonNode, "Position_Cannon"):getChildByName("barrel")
	slot0._cannonBarrelWidth = slot0._cannonBarrel:getContentSize().width
	slot0._cannonBarrelHeight = slot0._cannonBarrel.getContentSize().height

	slot0._cannonBarrel:setLocalZOrder(2)
	slot0:remedyScale()

	slot0._currentBase = 0
	slot0._cannonType = 0
	slot0.ObjectManager = ClassLoader:aquireSingleton("ObjectManager")
	slot0.muzzle_flash_1 = slot0.ObjectManager:getObject("muzzle_flash")

	slot0.muzzle_flash_1:setOpacity(0)
	slot0.muzzle_flash_1:setAnchorPoint(0.5, 0)

	slot0.muzzle_flash_2 = slot0.ObjectManager:getObject("muzzle_flash")

	slot0.muzzle_flash_2:setOpacity(0)
	slot0.muzzle_flash_2:setAnchorPoint(0.5, 0)

	slot0.muzzleAction_1 = cc.Spawn:create(cc.MoveBy:create(0.166, cc.p(0, slot5)), cc.ScaleTo:create(0.166, slot4), cc.Sequence:create(cc.FadeTo:create(0.033, 255), cc.DelayTime:create(0.1), cc.FadeTo:create(0.033, 0)))

	slot0.muzzleAction_1:retain()

	slot0.muzzleAction_2 = cc.Spawn:create(cc.MoveBy:create(0.166, cc.p(0, slot5)), cc.ScaleTo:create(0.166, slot4), cc.Sequence:create(cc.FadeTo:create(0.033, 255), cc.DelayTime:create(0.1), cc.FadeTo:create(0.033, 0)))

	slot0.muzzleAction_2:retain()
	slot0:seekChildByName(slot0._cannonNode, "Position_Cannon"):addChild(slot0.muzzle_flash_1, 1)
	slot0:seekChildByName(slot0._cannonNode, "Position_Cannon"):addChild(slot0.muzzle_flash_2, 4)

	slot0.barrelAction = cc.Sequence:create(cc.MoveBy:create(0.033, cc.p(0, -10)), cc.EaseSineOut:create(cc.MoveBy:create(0.15, cc.p(0, 10))))

	slot0.barrelAction:retain()

	slot0.bodyAction = cc.Sequence:create(cc.DelayTime:create(0.016), cc.MoveBy:create(0.033, cc.p(0, -5)), cc.EaseSineOut:create(cc.MoveBy:create(0.1, cc.p(0, 7))), cc.MoveBy:create(0.05, cc.p(0, -2)))

	slot0.bodyAction:retain()

	slot0._state = ENUM.CONTROLLER_STATE.LEFT

	slot0._cannonBody:setOpacity(0)
	slot0._cannonBarrel:setOpacity(0)

	slot0._mul = 0
	slot0._cannonSpine = sp.SkeletonAnimation:create(GET_PATH(FilePath.FISH_EFFECT, "%s.json", slot6), GET_PATH(FilePath.FISH_EFFECT, "%s.atlas", slot1.CANNON_SPINE_RESOURCE_MAP[slot0._mul][slot0._cannonType].pathPrefix))

	slot0._cannonSpine:setAnimation(0, "animation", false)
	slot0._cannonSpine:setScale(1)
	slot0._cannonSpine:setPosition(cc.p(0, 45))
	slot0._cannon:addChild(slot0._cannonSpine)

	slot0._textName = slot0:seekChildByName(slot0._cannonNode, "Text_PlayerName")
	slot0._textCannon = slot2:create()

	slot0._textCannon:setTextureSet(slot1.NUMBER_TEXTURE_CANNON)
	slot0._textCannon:setAnchorPoint(0.5, 0.5)
	slot0._textCannon:disableSeperator()
	slot0._textCannon:enableUnit()
	slot0._textCannon:setName("Text_Cannon")
	slot0._textCannon:setNumber(slot0._currentBase)
	slot0._textCannon:setScale(0.95)
	slot0._textCannon:setPosition(0, 3)

	slot0.txtPanel = cc.Node:create()

	slot0:addChild(slot0.txtPanel)

	slot7 = cc.Sprite:create(GET_PATH(FilePath.ANIMATION, "cannon_txt_panel.png"))

	slot7:setScaleX(1.1)
	slot7:setScaleY(1.4)
	slot0.txtPanel:addChild(slot7)
	slot0.txtPanel:setPosition(cc.p(0, 19))
	slot0.txtPanel:addChild(slot0._textCannon)

	slot0.txtPanel.sprite = slot7
	slot0._rotation = 0
end

slot3.setPlayerName = function (slot0, slot1)
	slot0._textName:setString(slot1)

	while slot0._textName:getContentSize().width > 200 do
		slot0._textName:setString(slot1 .. "...")
	end
end

slot3.setPlayerCoin = function (slot0, slot1)
	slot0._textAtlas:setString(slot0:splitNumber(slot1))
	slot0._textAtlas:setScale(1)

	if slot0._textAtlas:getContentSize().width > 160 then
		slot0._textAtlas:setScale(160 / slot2)
	end
end

slot3.setGameWorld = function (slot0, slot1)
	slot0._world = slot1
end

slot3.changeCannon = function (slot0, slot1, slot2, slot3, slot4)
	slot0:changeCannonType(slot1)
	slot0:changeBarrel(slot2)
	slot0:changeBase(slot3)
	slot0:changeMul(slot4)

	slot5 = slot0._cannonType

	if slot0._cannonType == 0 and slot0._barrelType == 1 then
		slot5 = 2
	end

	slot0._cannonBody:loadTexture(slot0.CANNON_RESOURCE_MAP[slot5].bodyResPath)
	slot0._cannonBarrel:loadTexture(slot0.CANNON_RESOURCE_MAP[slot5].barrelResPath)

	slot0._currentBase = slot3

	slot0._textCannon:setNumber(slot0._currentBase)
	slot0:arrangeCannon()

	if slot0._state ~= ENUM.CONTROLLER_STATE.LEFT then
		slot0:playChangeAnimation()
	end

	slot0._cannonSpine:removeFromParent()

	slot0._cannonSpine = sp.SkeletonAnimation:create(GET_PATH(FilePath.FISH_EFFECT, "%s.json", slot7), GET_PATH(FilePath.FISH_EFFECT, "%s.atlas", slot0.CANNON_SPINE_RESOURCE_MAP[slot0._mul][slot0._cannonType].pathPrefix))

	slot0._cannonSpine:setAnimation(0, "animation", false)
	slot0._cannonSpine:setScale(1)
	slot0._cannonSpine:setPosition(cc.p(0, 45))
	slot0._cannon:addChild(slot0._cannonSpine)

	if slot0._cannonType == 1 then
		if slot0._specialSpine and slot0._lastCannonMultiplyType ~= slot0._mul then
			slot0._specialSpine:removeFromParent()

			slot0._specialSpine = nil
		end

		if not slot0._specialSpine then
			slot0._lastCannonMultiplyType = slot0._mul
			slot8, slot9 = slot0._cannon:getPosition()
			slot10 = slot0._cannon:getZOrder()
			slot0._specialSpine = sp.SkeletonAnimation:create(slot0.CannonAccelerateMap[slot0._mul].json, slot0.CannonAccelerateMap[slot0._mul].atlas)

			slot0._specialSpine:setAnimation(0, "animation", true)
			slot0._specialSpine:setRotation(slot0._rotation)

			if slot0._rotation ~= 0 then
				slot0._specialSpine:setPosition(slot8, slot9 + 30)
			else
				slot0._specialSpine:setPosition(slot8, slot9 - 30)
			end

			slot0._cannonNode:addChild(slot0._specialSpine, slot10)
		end

		slot0._specialSpine:setVisible(true)
	elseif slot0._specialSpine then
		slot0._specialSpine:setVisible(false)
	end
end

slot3.changeControllerState = function (slot0, slot1)
	slot0._state = slot1

	if slot1 == ENUM.CONTROLLER_STATE.LEFT then
		slot0:showWaiting()
	else
		slot0:showPlayerInfo()
	end
end

slot3.changeCannonType = function (slot0, slot1)
	slot0._cannonType = slot1
end

slot3.changeBarrel = function (slot0, slot1)
	slot0._barrelType = slot1
end

slot3.changeBase = function (slot0, slot1)
	slot0._currentBase = slot1
end

slot3.changeMul = function (slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 < 4 then
		slot0._mul = 0
	elseif slot1 < 7 then
		slot0._mul = 1
	else
		slot0._mul = 2
	end
end

slot3.playChangeAnimation = function (slot0)
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

slot3.playFireAnimation = function (slot0)
	slot0._cannonSpine:setAnimation(0, "animation", false)
end

slot3.showPlayerInfo = function (slot0)
	slot0:seekChildByName(slot0._cannonNode, "Container_Personal_Info"):setVisible(true)

	if slot0:seekChildByName(slot0._cannonNode, "Text_Waiting") then
		slot1:setVisible(false)
	end

	slot0._cannonBarrel:setVisible(true)
	slot0._cannonBody:setVisible(true)
	slot0._cannonSpine:setVisible(true)
	slot0.txtPanel:setVisible(true)
end

slot3.showWaiting = function (slot0)
	slot0:seekChildByName(slot0._cannonNode, "Container_Personal_Info"):setVisible(false)

	if slot0:seekChildByName(slot0._cannonNode, "Text_Waiting") then
		slot1:setVisible(true)
	end

	slot0._cannonBarrel:setVisible(false)
	slot0._cannonBody:setVisible(false)
	slot0._cannonSpine:setVisible(false)
	slot0.txtPanel:setVisible(false)
end

slot3.remedyScale = function (slot0)
	slot0:setScale(0.85)
end

slot3.fire = function (slot0)
	slot0:playFireAnimation()
end

slot3.changeOrientation = function (slot0, slot1)
	slot0._cannon:setRotation(90 - slot1)
end

slot3.arrangeCannon = function (slot0)
	return
end

slot3.getFirePosition = function (slot0)
	return
end

slot3.getCoinPosition = function (slot0)
	slot1 = slot0:seekChildByName(slot0._cannonNode, "Image_Coin")

	return ClassLoader:aquireSingleton("CocosLayerManager"):getLayer("EffectLayer"):convertToNodeSpace(slot1:getParent():convertToWorldSpace(slot2))
end

slot3.enableButtons = function (slot0)
	return
end

slot3.disableButtons = function (slot0)
	return
end

slot3.onDestroy = function (slot0)
	slot0._cannonNode = nil

	slot0._textCannon:onDestroy()

	slot0._textCannon = nil
	slot0._cannon = nil
	slot0._cannonBody = nil
	slot0._cannonBarrel = nil
	slot0._textName = nil

	slot0.ObjectManager:recycleObject(slot0.muzzle_flash_1)
	slot0.ObjectManager:recycleObject(slot0.muzzle_flash_2)
	slot0.muzzleAction_1:release()
	slot0.muzzleAction_2:release()
	slot0.barrelAction:release()
	slot0.bodyAction:release()

	slot0._textAtlas = nil

	slot0:removeFromParent()

	slot0._lastCannonMultiplyType = nil
end

slot3.splitNumber = function (slot0, slot1)
	return (#tostring(slot1) % 3 == 0 and slot2:reverse():gsub("(%d%d%d)", "%1:"):reverse():sub(2)) or slot2:reverse():gsub("(%d%d%d)", "%1:"):reverse()
end

slot3.NUMBER_TEXTURE_COIN = {
	[0] = {
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_0.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_1.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_2.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_3.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_4.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_5.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_6.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_7.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_8.png"),
		sizeFix = {
			-4,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_9.png"),
		sizeFix = {
			-4,
			0
		}
	},
	textureType = ENUM.NUMBER_TEXTURE_TYPE.SPRITE,
	[","] = {
		texture = GET_PATH(FilePath.INGAME_UI, "cannon/FishGameCannon/number/gold_number_fen.png"),
		sizeFix = {
			-10,
			0
		},
		positionFix = {
			0,
			0
		}
	}
}
slot3.NUMBER_TEXTURE_CANNON = {
	[0] = {
		texture = GET_PATH(FilePath.UI, "common/cannon/number/0.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/1.png"),
		sizeFix = {
			-15,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/2.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/3.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/4.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/5.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/6.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/7.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/8.png"),
		sizeFix = {
			-12,
			0
		}
	},
	{
		texture = GET_PATH(FilePath.UI, "common/cannon/number/9.png"),
		sizeFix = {
			-12,
			0
		}
	},
	textureType = ENUM.NUMBER_TEXTURE_TYPE.SPRITE,
	w = {
		texture = GET_PATH(FilePath.UI, "common/cannon/number/wan.png"),
		sizeFix = {
			-6,
			0
		}
	}
}

return slot3
