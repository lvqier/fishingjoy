slot0 = require("app.module.fishtd.view.WaterEffect")
FishTdRoomCcsView = class("FishTdRoomCcsView")

FishTdRoomCcsView.onCreationComplete = function (slot0)
	slot1 = cc.Director:getInstance():getVisibleSize()

	slot0.layerRoomList.content_sv.setIsCenterWhileNeed(slot3, true)
	slot0.layerRoomList.content_sv.addContentChild(slot3, slot0.layerRoomList.layerContent)

	if slot0.model:getIsAdjustSlimWidth() and slot1.width > 1334 then
		slot0.layerRoomList.layerContent.buttonContainer:setPosition(cc.p(80, 0))
		slot0.layerRoomList.layerContent:setContentSize(cc.size(slot0.layerRoomList.layerContent:getContentSize().width + 80, 750))
	end

	slot0._roomBtnInitPoses = {}
	slot0._roomBtns = {}
	slot4 = 1

	while true do
		if slot2.buttonContainer["btn" .. slot4] then
			slot5._index = slot4

			table.insert(slot0._roomBtns, slot5)

			slot5._kind = slot4
			slot0._roomBtnInitPoses[slot4] = DisplayUtil.ccpCopy(slot5:getPosition())
			slot6 = slot5:getContentSize()

			slot3:addBtn2HandleTouchOperate(slot5)
		else
			break
		end

		slot4 = slot4 + 1
	end

	slot7 = sp.SkeletonAnimation:create(FilePath.UI .. "bg/3dby_xuanfangwaterdi.json", FilePath.UI .. "bg/3dby_xuanfangwaterdi.atlas")

	slot7:setAnimation(0, "animation", true)
	slot7:setPosition(slot1.width / 2, 750 / 2)
	slot0.spBg:addChild(slot7)

	slot8 = sp.SkeletonAnimation:create(FilePath.UI .. "bg/3dby_xuanfangwater.json", FilePath.UI .. "bg/3dby_xuanfangwater.atlas")

	slot8:setAnimation(0, "animation", true)
	slot8:setPosition(slot1.width / 2, 750 / 2)
	slot0.spBg:addChild(slot8)

	slot9 = false

	if device.platform == "android" and (not PathMath.getVersion or PathMath.getVersion() < 4) then
		for slot14 = 1, #gl.getSupportedExtensions(), 1 do
			if slot10[slot14] == "GL_OES_element_index_uint" then
				slot9 = true

				break
			end
		end
	else
		slot9 = true
	end

	if slot9 and (not custom.WaterSimulate.isMachineSupport or custom.WaterSimulate:isMachineSupport()) then
		slot10 = slot0:create()

		slot10:setPosition(ClassLoader:aquireSingleton("GameConfig").Width / 2, ClassLoader.aquireSingleton("GameConfig").Height / 2)
		slot0.spBg:addChild(slot10, 0)
	end

	slot0._textCoin = ClassLoader:aquireInstance("FixWidthTexturedNumber")

	slot0._textCoin:setTextureSet(FishTdRoomCcsView.NUMBER_TEXTURE_COIN)
	slot0._textCoin:setAnchorPoint(0, 0.5)
	slot0._textCoin:setName("Text_Coin")
	slot0._textCoin:setNumber(1600000000)
	slot0._textCoin:setScale(0.75)
	slot0._textCoin:setFixWidth(240)
	slot0._textCoin:setPosition(0, 0)
	slot0.layerBottom.positionScore.addChild(slot10, slot0._textCoin)
	slot0.layerRoomList:setLocalZOrder(3)
	slot0.layerTop:setLocalZOrder(4)
	slot0.layerBottom:setLocalZOrder(5)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onNickNameChanged()
	slot0.controller:adjustSlimWidth(slot0.layerRoomList, UIConfig.ALIGN_LEFT, 0)
	slot3:setContentSize(cc.size(slot1.width, slot1.height))
	slot3:setInnerContainerSize(slot2:getContentSize())
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnBack, UIConfig.ALIGN_LEFT_UP, 80)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnHelp, UIConfig.ALIGN_LEFT_UP, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.head, UIConfig.ALIGN_LEFT_DOWN, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.Image_Background, UIConfig.ALIGN_LEFT_DOWN, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.Image_Coin, UIConfig.ALIGN_LEFT_DOWN, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT_DOWN, 80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.positionScore, UIConfig.ALIGN_LEFT_DOWN, 80)
	slot0.controller:adjustSlimWidth(slot0.imageLogo, UIConfig.ALIGN_RIGHT_UP, -80)
	slot0.controller:adjustSlimWidth(slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT_DOWN, -80)

	slot0.originalPosScroll = cc.p(slot0.layerRoomList.layerContent.getPosition(slot11))
	slot0.originalPosTopLayer = cc.p(slot0.layerTop.getPosition(slot12))
	slot0.originalPosBottomLayer = cc.p(slot0.layerBottom:getPosition())
end

FishTdRoomCcsView.onButtonClick = function (slot0, slot1, slot2, slot3)
	if slot3 == ccui.TouchEventType.ended then
		slot0.controller:requestEnterRoom(slot1)
		slot0.controller:clearMessageCache()
		slot0.controller:onNetMessageCabcelCache()
	end
end

FishTdRoomCcsView.onHide = function (slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

FishTdRoomCcsView.onShow = function (slot0)
	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = 1

	for slot7 = 1, #slot0._roomBtns, 1 do
		slot0:updateRoomBtn(slot0._roomBtns[slot7], slot1[slot7])
	end

	slot0.layerRoomList.content_sv:jumpTo(0)
	slot0.controller:clearMessageCache()
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:playEnterAnimation()
end

FishTdRoomCcsView.playEnterAnimation = function (slot0)
	slot0.layerRoomList:setCascadeOpacityEnabled(true)
	slot0.layerTop:setCascadeOpacityEnabled(true)
	slot0.layerBottom:setCascadeOpacityEnabled(true)
	slot0.layerRoomList.layerContent.setOpacity(slot1, 0)
	slot0.layerRoomList.layerContent.setPosition(slot1, cc.p(slot0.originalPosScroll.x + 100, slot0.originalPosScroll.y))
	slot0.layerRoomList.layerContent.runAction(slot1, cc.FadeTo:create(0.3, 255))
	slot0.layerRoomList.layerContent.runAction(slot1, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))
	slot0.layerTop.setOpacity(slot3, 0)
	slot0.layerTop.setPosition(slot3, cc.p(slot0.originalPosTopLayer.x, slot0.originalPosTopLayer.y + 60))
	slot0.layerTop.runAction(slot3, cc.FadeTo:create(0.3, 255))
	slot0.layerTop.runAction(slot3, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot4)))
	slot0.layerBottom.setOpacity(slot5, 0)
	slot0.layerBottom.setPosition(slot5, cc.p(slot0.originalPosBottomLayer.x, slot0.originalPosBottomLayer.y - 60))
	slot0.layerBottom.runAction(slot5, cc.FadeTo:create(0.3, 255))
	slot0.layerBottom:runAction(cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot0.originalPosBottomLayer)))
end

FishTdRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2)
	slot1.container:setLocalZOrder(1)

	if not slot1.spine then
		slot1.spine = sp.SkeletonAnimation:create(string.format("gameres/module/fishtd/animation/room/room_spine_%d/spine.json", slot1._index), string.format("gameres/module/fishtd/animation/room/room_spine_%d/spine.atlas", slot1._index), 1)

		slot1.spine:setAnimation(0, "animation", true)
		slot1.spine:setPosition(117, 22)
		slot1:addChild(slot1.spine)

		slot1.effect = sp.SkeletonAnimation:create("gameres/module/fishtd/animation/room/room_spine_light/spine.json", "gameres/module/fishtd/animation/room/room_spine_light/spine.atlas", 1)

		slot1.effect:setAnimation(0, "animation", true)
		slot1.effect:setPosition(117, 22)
		slot1:addChild(slot1.effect)

		slot1.particle = cc.ParticleSystemQuad:create("gameres/module/fishtd/animation/room/room_spine_particle/particle.plist")

		slot1.particle:setPosition(117, 102)
		slot1:addChild(slot1.particle)
	end

	if slot2 then
		if slot2._totalOnline >= 80 then
			slot1.container.Sprite_1:setTexture(slot0.controller:getUIPath("txt/1_07.png"))
		elseif slot2._totalOnline >= 40 then
			slot1.container.Sprite_1:setTexture(slot0.controller:getUIPath("txt/1_05.png"))
		else
			slot1.container.Sprite_1:setTexture(slot0.controller:getUIPath("txt/1_03.png"))
		end

		slot1.bg:setVisible(false)
		slot1.spine:setVisible(true)
		slot1.effect:setVisible(true)
		slot1.particle:setVisible(true)
		slot1:setCanTouch(true)
		slot1.container:setVisible(true)
		slot1.bg:loadTexture(string.format("gameres/module/fishtd/ui/txt/room_Btn_%d.png", slot1._index))
		slot1.container.Sprite_6:setVisible(false)
		slot1.container.txtNeed_tf:setHtmlText(HtmlUtil.createImg("gameres/module/fishtd/ui/txt/1_09.png") .. HtmlUtil.createArtNumWithHansUnits(slot2._miniNeed, "gameres/module/fishtd/ui/txt/room_%s.png"))
	else
		slot1.bg:setVisible(true)
		slot1.spine:setVisible(false)
		slot1.effect:setVisible(false)
		slot1.particle:setVisible(false)
		slot1:setCanTouch(false)
		slot1.container:setVisible(false)
		slot1.bg:loadTexture(string.format("gameres/module/fishtd/ui/txt/room_Btn_%d_lock.png", slot1._index))
	end
end

FishTdRoomCcsView.cookMiniNeedString = function (slot0, slot1)
	if slot1 == 0 then
		return "0"
	elseif slot1 >= 100000000 then
		if slot1 / 100000000 > 10000 then
			return tostring(math.floor(slot2 / 10000)) .. "万亿"
		else
			return tostring(slot2) .. "亿"
		end
	elseif slot1 >= 10000 then
		return tostring(math.floor(slot1 / 10000)) .. "万"
	else
		return tostring(slot1)
	end
end

FishTdRoomCcsView.rearrangeContainer = function (slot0, slot1)
	slot1.txtNeed_tf:setPosition(-15, -3)
end

FishTdRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.layerBottom.btnJDZJ then
		tweenMsgMgr:showRedMsg("该功能尚未开放！")
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot0.controller:quickStartGame()
	elseif slot1 == slot0.layerTop.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif table.indexof(slot0._roomBtns, slot1) then
		slot0.controller:requestEnterRoom(slot3)
		slot0.controller:clearMessageCache()
		slot0.controller:onNetMessageCabcelCache()
	end
end

FishTdRoomCcsView.onNickNameChanged = function (slot0)
	slot0.layerBottom.txtName:setString(StringUtil.truncate(Hero:getPNickName(), 10, nil, 2))
end

FishTdRoomCcsView.onUserScoreChanged = function (slot0)
	slot0._textCoin:setNumber(parseInt(Hero:getUserScore()))

	if slot0.layerBottom ~= nil and slot0.layerBottom.head ~= nil then
		slot0.controller:setHeadBg(slot0.layerBottom.head, GAME_STATE.ROOM)
	end
end

FishTdRoomCcsView.NUMBER_TEXTURE_COIN = {
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

return
