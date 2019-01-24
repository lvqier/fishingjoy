slot2 = "YszRoomCcsView"
YszRoomCcsView = class(slot1)

YszRoomCcsView.onCreationComplete = function (slot0)
	slot6 = -49

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.bg, UIConfig.ALIGN_RIGHT)

	slot6 = -49

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.btnKSKS, UIConfig.ALIGN_RIGHT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.Ysz_Room_tx1, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.head, UIConfig.ALIGN_LEFT)

	slot6 = 80

	slot0.controller.adjustSlimWidth(slot2, slot0.controller, slot0.layerBottom.txtName, UIConfig.ALIGN_LEFT)

	slot0._roomBtns = {}
	slot0._btnPos = {}
	slot0.temV = {}
	slot6 = 405
	slot6 = 483
	slot6 = 277
	slot6 = 479
	slot6 = 479
	slot6 = 285
	slot6 = 479.4
	slot6 = 479.4
	slot6 = 265.76
	slot6 = 265.76
	slot6 = 479.4
	slot6 = 479.4
	slot6 = 479.4
	slot6 = 265.76
	slot6 = 265.76
	slot0.newBtnPos = {
		{
			cc.p(slot0.layerBottom.txtName, 863)
		},
		{
			cc.p(slot0.layerBottom.txtName, 960),
			cc.p(slot0.layerBottom.txtName, 853)
		},
		{
			cc.p(slot0.layerBottom.txtName, 671),
			cc.p(slot0.layerBottom.txtName, 1121),
			cc.p(slot0.layerBottom.txtName, 863)
		},
		{
			cc.p(slot0.layerBottom.txtName, 671.5),
			cc.p(slot0.layerBottom.txtName, 1121.11),
			cc.p(slot0.layerBottom.txtName, 614.62),
			cc.p(slot0.layerBottom.txtName, 1091.74)
		},
		{
			cc.p(slot0.layerBottom.txtName, 251.5),
			cc.p(slot0.layerBottom.txtName, 690.11),
			cc.p(slot0.layerBottom.txtName, 1111.1),
			cc.p(slot0.layerBottom.txtName, 441.74),
			cc.p(slot0.layerBottom.txtName, 898.6)
		}
	}
	slot5 = slot0.layerRoomList

	for slot4, slot5 in pairs(slot0.layerRoomList.getChildren(slot0.layerBottom.txtName)) do
		slot10 = slot5
		slot9 = "btn(%d)"

		if string.match(slot7, slot5.getName(slot9)) then
			slot11 = slot6

			slot0.addAnimation(slot8, slot0, slot5)

			slot10 = slot6
			slot0._roomBtns[tonumber(slot0)] = slot5
			slot9 = slot6
			slot5._kind = parseInt(tonumber(slot0))
		end

		slot10 = false

		slot5.setVisible(slot8, slot5)
	end

	slot5 = slot0

	Hero.pNickNameChangedSignal.add(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.onNickNameChanged(slot2)

	slot5 = slot0.layerRoomList.Ysz_Room_rw
	slot0.Ysz_Room_rw_pos = cc.p(slot0.layerRoomList.Ysz_Room_rw.getPosition(slot0.onNickNameChanged))
	slot5 = slot0.layerTop
	slot0.layerTop_pos = cc.p(slot0.layerTop.getPosition(slot0.onNickNameChanged))
	slot5 = slot0.layerBottom
	slot0.layerBottom_pos = cc.p(slot0.layerBottom.getPosition(slot0.onNickNameChanged))
	slot4 = "hlssmxc_quickstart"
	slot0.ksksSpine = slot0.controller.createSpineByPool(slot2, slot0.controller)
	slot6 = true

	slot0.ksksSpine.setAnimation(slot2, slot0.ksksSpine, 0, "animation")

	slot5 = 0

	slot0.ksksSpine.setPosition(slot2, slot0.ksksSpine, 400)

	slot4 = slot0.ksksSpine

	slot0.layerBottom.btnKSKS.addChild(slot2, slot0.layerBottom.btnKSKS)
	slot0.updateRoomList(slot2)

	slot7 = {}

	ClassUtil.extends(slot0, slot0, BaseGameAniamtionView, true)

	slot7 = slot0._roomBtns

	ClassUtil.extends(slot0, slot0, BaseGameRoomView, true)

	slot5 = not NEED_CHANGE_SUB_GAME_NAME

	slot0.layerTop.logo.setVisible(slot0, slot0.layerTop.logo)

	slot4 = slot0

	slot0:resetUIInfo()
end

YszRoomCcsView.addAnimation = function (slot0, slot1, slot2)
	slot3 = ""
	slot4 = ""
	slot11 = "yszxuanyoulizi.plist"
	slot9 = 1

	cc.ParticleSystemQuad.create(slot6, slot0.controller.getParticlePath(slot9, slot0.controller)).setPositionType(cc.ParticleSystemQuad, slot5)

	slot9 = "ysz_xuanchang.json"
	slot3 = slot0.controller.getSpinePath(cc.ParticleSystemQuad, slot0.controller)
	slot9 = "ysz_xuanchang.atlas"
	slot4 = slot0.controller.getSpinePath(cc.ParticleSystemQuad, slot0.controller)

	if slot2 == "1" then
		slot12 = slot1
		slot10 = slot1.getContentSize(slot11).height / 2 - 20

		slot5.setPosition(slot7, slot5, 100)
	elseif slot2 == "2" then
		slot12 = slot1
		slot10 = slot1.getContentSize(slot11).height / 2 - 20

		slot5.setPosition(slot7, slot5, 100)
	elseif slot2 == "3" then
		slot12 = slot1
		slot10 = slot1.getContentSize(slot11).height / 2 - 20

		slot5.setPosition(slot7, slot5, 100)
	elseif slot2 == "4" then
		slot12 = slot1
		slot10 = slot1.getContentSize(slot11).height / 2 - 20

		slot5.setPosition(slot7, slot5, 110)
	elseif slot2 == "5" then
		slot12 = slot1
		slot10 = slot1.getContentSize(slot11).height / 2 - 20

		slot5.setPosition(slot7, slot5, 110)
	end

	slot10 = slot4
	slot12 = true

	sp.SkeletonAnimation.create(slot7, sp.SkeletonAnimation, slot3).setAnimation(sp.SkeletonAnimation, sp.SkeletonAnimation.create(slot7, sp.SkeletonAnimation, slot3), 0, "animation")

	if slot2 == "3" then
		slot13 = slot1
		slot11 = slot1:getContentSize().height / 2

		slot6.setPosition(slot8, slot6, slot1.getContentSize(slot11).width / 2 - 0)
	else
		slot13 = slot1
		slot11 = slot1:getContentSize().height / 2

		slot6.setPosition(slot8, slot6, slot1.getContentSize(slot11).width / 2 - 20)
	end

	slot10 = slot6

	slot1.addChild(slot8, slot1)

	slot10 = slot5

	slot1.addChild(slot8, slot1)
end

YszRoomCcsView.updateRoomList = function (slot0)
	slot4 = slot0.model
	slot5 = "房间列表:"

	dump(slot3, gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or {})

	slot2 = 0
	slot5 = gameMgr.getServerVosDicEx(slot2)[slot0.model.getGameKind(gameMgr)] or 

	for slot6, slot7 in pairs(slot1) do
		slot2 = slot2 + 1
	end

	slot0.temV = {}
	slot0._btnPos = slot0.newBtnPos[slot2]

	if slot2 < 5 then
		slot6 = "ysz_js7c"
		slot0.bgSpine = slot0.controller.createSpineByPool(slot4, slot0.controller)
		slot8 = true

		slot0.bgSpine.setAnimation(slot4, slot0.bgSpine, 0, "animation1")

		slot7 = -780

		slot0.bgSpine.setPosition(slot4, slot0.bgSpine, 230)

		slot6 = true

		slot0.layerRoomList.Ysz_Room_rw.setVisible(slot4, slot0.layerRoomList.Ysz_Room_rw)

		slot6 = slot0.bgSpine

		slot0.layerRoomList.Ysz_Room_rw.addChild(slot4, slot0.layerRoomList.Ysz_Room_rw)
	end

	slot5 = slot0._roomBtns

	for slot6, slot7 in pairs(slot4) do
		slot12 = false

		slot7.setVisible(slot10, slot7)

		if slot1[slot7._kind] ~= nil then
			slot15 = "common/Ysz_Room_tb7.png"
			slot9 = cc.Scale9Sprite.create(slot10, slot0.controller.getUIPath(slot13, slot0.controller))
			slot12 = slot9
			slot16 = 0.5

			slot9.setAnchorPoint(cc.Scale9Sprite, cc.p(slot0.controller, 0))

			slot12 = slot9
			slot18 = 16

			slot9.setCapInsets(cc.Scale9Sprite, CCRectMake(slot0.controller, 50, 10, 80))

			slot10 = 1

			if slot8._totalOnline >= 80 then
				slot10 = 3
			elseif slot8._totalOnline >= 40 then
				slot10 = 2
			end

			slot14 = "txt/ysz_state_" .. slot10 .. ".png"
			slot21 = 8
			slot12 = HtmlUtil.createImg(slot0.controller, slot11, nil, nil, nil, -6, nil, nil)
			slot20 = TextField.H_LEFT
			txt = TextField.new(slot11, nil, 22, "#00ff00", 300, nil)
			slot15 = txt
			slot19 = 0.5

			txt.setAnchorPoint(slot11, cc.p("#00ff00", 0))

			if slot8[1].wSortID >= 100 then
				if slot8[1].dwMinEnterScore > 0 then
					slot13, slot18 = slot0.controller.getIScore(slot14, slot0.controller)
					slot20 = "txt/Ysz_Room_zf6.png"
					slot21 = 0
					slot19 = "#YSZ_RoomType_%s.png"
					slot19 = HtmlUtil.createImg(slot8[1].dwMinEnterScore, slot0.controller.getUIPath(slot18, slot0.controller), nil, nil, nil) .. HtmlUtil.createNum(slot0.controller.getUIPath(slot18, slot0.controller), slot14) .. slot12

					txt.setHtmlText(slot12, txt)
				end

				if slot7._kind == 2 then
					slot15 = slot9
					slot19 = 28

					slot9.setContentSize(slot14, cc.size(slot17, 220))

					slot19 = slot7
					slot17 = slot7:getContentSize().height / 2 - 20

					slot9.setPosition(slot14, slot9, slot7.getContentSize(slot17).width / 4 + 50)

					slot19 = slot9
					slot17 = slot9.getContentSize(slot7).height / 2 - 13

					txt.setPosition(slot14, txt, 10)
				elseif slot7._kind == 3 then
					slot15 = slot9
					slot19 = 28

					slot9.setContentSize(slot14, cc.size(slot17, 220))

					slot19 = slot9

					txt.setPosition(slot14, txt, 10)

					slot19 = slot7
					slot17 = slot7:getContentSize().height / 2 - 20

					slot9.setPosition(slot14, slot9, slot7.getContentSize(slot9.getContentSize(220).height / 2 - 13).width / 4 + 50)
				elseif slot7._kind == 4 then
					slot15 = slot9
					slot19 = 28

					slot9.setContentSize(slot14, cc.size(slot17, 220))

					slot19 = slot9

					txt.setPosition(slot14, txt, 10)

					slot19 = slot7
					slot17 = slot7:getContentSize().height / 2 - 20

					slot9.setPosition(slot14, slot9, slot7.getContentSize(slot9.getContentSize(220).height / 2 - 13).width / 4 + 50)
				elseif slot7._kind == 5 then
					slot15 = slot9
					slot19 = 28

					slot9.setContentSize(slot14, cc.size(slot17, 220))

					slot19 = slot9

					txt.setPosition(slot14, txt, 10)

					slot19 = slot7
					slot17 = slot7:getContentSize().height / 2 - 20

					slot9.setPosition(slot14, slot9, slot7.getContentSize(slot9.getContentSize(220).height / 2 - 13).width / 4 + 50)
				end

				slot16 = txt

				slot9.addChild(slot14, slot9)
			else
				slot15 = slot9
				slot19 = 28

				slot9.setContentSize(slot14, cc.size(slot17, 220))

				slot18 = "txt/Ysz_Room_zf5.png"
				slot15 = slot0.controller.getUIPath(cc.size, slot0.controller)
				slot17 = HtmlUtil.createImg(slot14, slot15, nil, nil, nil, -2, nil, nil) .. slot12

				txt.setHtmlText(slot15, txt)

				slot17 = txt

				slot9.addChild(slot15, slot9)

				slot20 = slot9

				txt.setPosition(slot15, txt, 10)

				slot20 = slot7
				slot18 = slot7:getContentSize().height / 2 - 20

				slot9.setPosition(slot15, slot9, slot7.getContentSize(slot9.getContentSize(-2).height / 2 - 11).width / 4 + 45)
			end

			slot16 = slot9

			slot7.addChild(slot14, slot7)

			slot16 = slot7

			table.insert(slot14, slot0.temV)

			slot16 = true

			slot7.setVisible(slot14, slot7)
		end
	end

	function slot6(slot0, slot1)
		return slot0._kind < slot1._kind
	end

	table.sort(slot4, slot0.temV)

	for slot6 = 1, #slot0.temV, 1 do
		if slot0._btnPos[slot6] ~= nil and slot0.temV[slot6] ~= nil then
			slot10 = slot0._btnPos[slot6]

			slot0.temV[slot6].setPosition(slot8, slot0.temV[slot6])
		end
	end
end

YszRoomCcsView.resetUIInfo = function (slot0)
	slot4 = 0

	slot0.layerRoomList.Ysz_Room_rw.setOpacity(slot2, slot0.layerRoomList.Ysz_Room_rw)

	slot4 = -100

	slot0.layerRoomList.Ysz_Room_rw.setPositionX(slot2, slot0.layerRoomList.Ysz_Room_rw)

	slot4 = 0

	slot0.layerTop.setOpacity(slot2, slot0.layerTop)

	slot4 = 770

	slot0.layerTop.setPositionY(slot2, slot0.layerTop)

	slot4 = 0

	slot0.layerBottom.setOpacity(slot2, slot0.layerBottom)

	slot4 = 0

	slot0.layerBottom.setPositionY(slot2, slot0.layerBottom)

	for slot4 = 1, #slot0.temV, 1 do
		if slot0.temV[slot4] ~= nil and slot0._btnPos[slot4] ~= nil then
			slot8 = slot0._btnPos[slot4].x + 100

			slot0.temV[slot4].setPositionX(slot6, slot0.temV[slot4])
		end
	end
end

YszRoomCcsView.onShow = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.onShow(slot2)

	slot3 = slot0.layerRoomList.Ysz_Room_rw
	slot10 = 0.4
	slot7 = cc.FadeIn.create(slot8, cc.FadeIn)
	slot10 = cc.EaseSineOut
	slot15 = slot0.Ysz_Room_rw_pos

	slot0.layerRoomList.Ysz_Room_rw.runAction(slot2, cc.Spawn.create(slot5, cc.Spawn, cc.EaseSineOut.create(cc.FadeIn, cc.MoveTo.create(slot12, cc.MoveTo, 0.4))))

	slot3 = slot0.layerTop
	slot10 = 0.4
	slot7 = cc.FadeIn.create(cc.EaseSineOut.create, cc.FadeIn)
	slot10 = cc.EaseSineOut
	slot15 = slot0.layerTop_pos

	slot0.layerTop.runAction(slot2, cc.Spawn.create(slot5, cc.Spawn, cc.EaseSineOut.create(cc.FadeIn, cc.MoveTo.create(slot12, cc.MoveTo, 0.4))))

	slot3 = slot0.layerBottom
	slot10 = 0.4
	slot7 = cc.FadeIn.create(cc.EaseSineOut.create, cc.FadeIn)
	slot10 = cc.EaseSineOut
	slot15 = slot0.layerBottom_pos

	slot0.layerBottom.runAction(slot2, cc.Spawn.create(slot5, cc.Spawn, cc.EaseSineOut.create(cc.FadeIn, cc.MoveTo.create(slot12, cc.MoveTo, 0.4))))

	for slot4 = 1, #slot0.temV, 1 do
		if slot0.temV[slot4] ~= nil then
			slot7 = slot0.temV[slot4]
			slot14 = 0.2
			slot11 = cc.FadeIn.create(slot12, cc.FadeIn)
			slot14 = cc.EaseSineOut
			slot19 = slot0._btnPos[slot4]

			slot0.temV[slot4].runAction(slot6, cc.Spawn.create(slot9, cc.Spawn, cc.EaseSineOut.create(cc.FadeIn, cc.MoveTo.create(slot16, cc.MoveTo, 0.2))))
		end
	end

	slot5 = {
		autoAlpha = 1
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot5 = slot0
	slot5 = slot0.getParent(0.05)
	slot5 = {
		x = 432,
		y = 658
	}

	TweenLite.to(slot2, slot0.getParent(0.05).getParent(0.05).layerNotice, 0.4)

	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)
end

YszRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot5 = slot0.controller

		slot0.controller.exitGame(slot4)
	elseif slot1._kind then
		slot6 = slot1._kind

		slot0.model.setGameType(slot4, slot0.model)

		slot6 = slot1._kind

		slot0.controller.requestEnterRoom(slot4, slot0.controller)
	elseif slot1 == slot0.layerTop.btnHelp then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.layerBottom.btnKSKS then
		slot5 = slot0.controller

		slot0.controller.quickStartGame(slot4)
	end
end

YszRoomCcsView.onHide = function (slot0)
	slot5 = {
		autoAlpha = 0
	}

	TweenLite.to(slot2, slot0.bg, 0.05)

	slot3 = slot0

	BaseGameAniamtionView.onHide(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot3 = slot0

	slot0.resetUIInfo(slot2)
end

YszRoomCcsView.onNickNameChanged = function (slot0)
	slot7 = 2
	slot5 = StringUtil.truncate(Hero, Hero.getPNickName(slot2), 10, nil)

	slot0.layerBottom.txtName.setString(Hero, slot0.layerBottom.txtName)
end

YszRoomCcsView.onUserScoreChanged = function (slot0)
	slot3 = slot0.layerBottom.userScore
	slot8 = Hero
	slot7 = "#ysz_room_%s.png"

	slot0.layerBottom.userScore.setStrTxt(slot2, HtmlUtil.createArtNumDot(slot5, Hero.getUserScore(slot7)))

	slot5 = GAME_STATE.ROOM

	slot0.controller.setHeadBg(slot2, slot0.controller, slot0.layerBottom.head)
end

YszRoomCcsView.destroy = function (slot0)
	slot3 = slot0

	BaseGameAniamtionView.destroy(slot2)

	slot3 = slot0.bg

	TweenLite.killTweensOf(slot2)

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onNickNameChanged)

	if slot0.bgSpine ~= nil then
		slot4 = slot0.bgSpine

		spPoolMgr.put(slot2, spPoolMgr)
	end

	slot3 = slot0._roomBtns

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot3 = slot0.layerTop.userScore

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.head

	destroySomeObj(slot2)

	slot3 = slot0.layerTop.layerNotice

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnHelp

	destroySomeObj(slot2)

	slot3 = slot0.layerBottom.btnKSKS

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameRoomView.destroy(slot2)
end

return
