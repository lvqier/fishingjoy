LhdRoomCcsView = class("LhdRoomCcsView")

LhdRoomCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameRoomView, true, slot0.entranceBtnDic)
	slot0.controller:adjustSlimWidth(slot0.layerTop.btnRule, UIConfig.ALIGN_LEFT, 80)
	slot0:customCtor()
end

LhdRoomCcsView.customCtor = function (slot0)
	slot0:initMembers()
	slot0:initUIName()
	slot0:initScrollView()
	slot0:initSelfInfo()
	slot0:initQucikStartBtn()
end

LhdRoomCcsView.initUIName = function (slot0)
	slot0.roomSV = slot0.layerRoomList.content_sv
	slot0.btnBack = slot0.layerTop.btnBack
	slot0.btnHelp = slot0.layerTop.btnRule
	slot0.selfName = slot0.layerBottom.txtName
	slot0.selfScore = slot0.layerBottom.userScore
	slot0.roomContent = slot0.layerRoomList.layerContent
	slot0.btnQuickStart = slot0.layerBottom.btnQuickStart

	slot0.selfScore:setStrBaseWidth(28)
end

LhdRoomCcsView.initQucikStartBtn = function (slot0)
	slot1 = slot0.controller:createSpine(LHD_SPINE.RoomQuickStart)

	slot1:setLocalZOrder(-1)
	slot0.btnQuickStart:addChild(slot1)
	slot1:setPosition(217.5, 49)
	slot1:setAnimation(0, LHD_SPINE.RoomQuickStart.PlayName, LHD_SPINE.RoomQuickStart.Loop)
end

LhdRoomCcsView.initMembers = function (slot0)
	slot0.entranceBtnPos = {}
	slot0.entranceBtnDic = {}
	slot0.bInitSpine = false
end

LhdRoomCcsView.initScrollView = function (slot0)
	slot0.roomSV:setContentSize(slot1)
	slot0.roomSV:setClippingEnabled(false)
	slot0.roomSV:setIsCenterWhileNeed(true)
	slot0.roomSV:addContentChild(slot0.roomContent)
	slot0.roomSV:setInnerContainerSize(slot0.roomContent:getContentSize())
	DisplayUtil.setAllCascadeOpacityEnabled(slot0.roomSV)

	slot2 = 1
	slot3 = 1

	while slot2 <= 10 do
		if slot0.roomContent["btn" .. slot2] then
			slot0.entranceBtnDic[slot2] = slot4
			slot4.roomKind = slot2
			slot0.entranceBtnPos[slot3] = DisplayUtil.ccpCopy(slot4:getPosition())
			slot3 = slot3 + 1

			slot0.roomSV:addBtn2HandleTouchOperate(slot4)

			if LHD_SPINE["RoomEntranceSpine" .. slot2] then
				slot6 = slot0.controller:createSpine(slot5)

				slot6:setLocalZOrder(-1)
				slot4:addChild(slot6)
				slot6:setPosition(157.5, 232.5)
				slot6:setAnimation(0, slot5.PlayName, slot5.Loop)
			end
		end

		slot2 = slot2 + 1
	end

	slot0._originX, slot0._originY = slot0.roomContent:getPosition()
end

LhdRoomCcsView.initSelfInfo = function (slot0)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onNickNameChanged()
end

LhdRoomCcsView.onShow = function (slot0)
	TweenLite.to(slot0:getParent():getParent().layerNotice, 0.4, {
		x = 432,
		y = 658
	})
	slot0.roomSV:jumpTo(0)
	slot0:updateRoomList()
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	Hero.userInsureChangedSignal:add(slot0.onUserScoreChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:playEntryAnimation()
end

LhdRoomCcsView.playEntryAnimation = function (slot0)
	slot0.layerRoomList:setCascadeOpacityEnabled(true)
	slot0.layerTop:setCascadeOpacityEnabled(true)
	slot0.layerBottom:setCascadeOpacityEnabled(true)

	if slot0._roomCount >= 5 then
		slot3, slot4 = slot0.layerRoomList.content_sv:getPosition()

		slot0.layerRoomList.layerContent:setPosition(slot5, slot2)
		slot0.layerRoomList.layerContent.setOpacity(slot6, 0)
		slot0.layerRoomList.layerContent.runAction(slot6, cc.Sequence:create(cc.DelayTime:create(0.1), cc.FadeTo:create(0.1, 255)))
		slot0.layerRoomList.layerContent:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(slot0._originX, slot0._originY)))))
	else
		slot2 = cc.p(slot0._originX, slot0._originY)

		slot0.layerRoomList.layerContent.setOpacity(slot1, 0)
		slot0.layerRoomList.layerContent.setPosition(slot1, slot2.x + 100, slot2.y)
		slot0.layerRoomList.layerContent.runAction(slot1, cc.FadeTo:create(0.3, 255))
		slot0.layerRoomList.layerContent:runAction(cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))
	end

	slot2 = cc.p(slot0.layerTop.getPosition(slot1))

	slot0.layerTop.setOpacity(slot1, 0)
	slot0.layerTop.setPosition(slot1, slot2.x, slot2.y + 60)
	slot0.layerTop.runAction(slot1, cc.FadeTo:create(0.3, 255))
	slot0.layerTop.runAction(slot1, cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot2)))

	slot4 = cc.p(slot0.layerBottom.getPosition(slot3))

	slot0.layerBottom.setOpacity(slot3, 0)
	slot0.layerBottom.setPosition(slot3, slot4.x, slot4.y - 60)
	slot0.layerBottom.runAction(slot3, cc.FadeTo:create(0.3, 255))
	slot0.layerBottom:runAction(cc.EaseBackOut:create(cc.MoveTo:create(0.4, slot4)))
end

LhdRoomCcsView.onHide = function (slot0)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
	Hero.userInsureChangedSignal:remove(slot0.onUserScoreChanged, slot0)
end

LhdRoomCcsView.updateRoomList = function (slot0)
	slot1 = gameMgr:getServerVosDicEx()[slot0.model:getGameKind()] or {}
	slot2 = 1
	slot3 = 0
	slot4 = {}

	while slot2 <= 10 do
		slot5 = slot1[slot2]

		if slot0.entranceBtnDic[slot2] then
			DisplayUtil.setVisible(slot6, slot5 ~= nil)

			if slot5 then
				slot6:setPosition(slot0.entranceBtnPos[slot3 + 1])

				if slot0.bInitSpine == false then
				end

				slot4[slot3] = slot6

				slot0:updateRoomBtn(slot6, slot5, slot2)
			end
		end

		slot2 = slot2 + 1
	end

	slot0.bInitSpine = true
	slot5 = 0
	slot0._roomCount = slot3

	if slot3 > 0 then
		slot5 = math.max(slot5, 50 + slot4[slot3].getPositionX(slot6) + slot4[slot3].getScaleX(slot6) * slot4[slot3].getContentSize(slot6).width * slot4[slot3]:getAnchorPoint().x)
	end

	slot0.roomSV:setInnerContainerSize(cc.size(slot5, slot0.roomContent:getContentSize().height))

	if display.width <= slot5 then
		slot7 = 80

		if math.abs(slot6) < 10 then
			slot7 = 0
		end

		if display.width <= CONFIG_CUR_WIDTH then
			slot7 = slot7 + 20
		end

		slot0.roomSV:setPositionX(-slot6 + slot7)
	else
		slot0.roomSV:setPositionX((CONFIG_DESIGN_WIDTH - display.width) * 0.5 + math.max(40, (display.width - slot5) * 0.5))
	end

	slot0._roomsWidth = slot5
end

LhdRoomCcsView.updateRoomBtn = function (slot0, slot1, slot2, slot3)
	if slot3 == 1 and slot1.imgFree then
	else
		slot1.txtNeed_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot2._miniNeed / LHD_BET_SCORE_RATE_VIEW, "#lhd_room_zhunru_%s.png"))
	end

	if slot1.imgOnline then
		slot4 = nil

		if slot2._totalOnline < 40 and slot2._totalOnline >= 0 then
			slot4 = LHD_ROOM_STATUS_0_40
		elseif slot2._totalOnline >= 40 and slot2._totalOnline < 80 then
			slot4 = LHD_ROOM_STATUS_40_80
		elseif slot2._totalOnline >= 80 then
			slot4 = LHD_ROOM_STATUS_80
		end

		if slot4 == nil then
			slot1.imgOnline:setVisible(false)

			return
		end

		slot1.imgOnline:setVisible(true)
		slot1.imgOnline:loadTexture(slot4)
	end
end

LhdRoomCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBack then
		slot0.controller:exitGame()
	elseif slot1 == slot0.btnHelp then
		slot0.model:setIsShowingRule(true)
	elseif slot1 == slot0.btnQuickStart then
		slot0.controller:quickStartGame()
	elseif slot1.roomKind then
		slot0.controller:requestEnterRoom(slot1.roomKind)
	end
end

LhdRoomCcsView.onNickNameChanged = function (slot0)
	slot0.selfName:setString(StringUtil.truncate(Hero:getPNickName(), 10, nil, 2))
end

LhdRoomCcsView.onUserScoreChanged = function (slot0)
	slot0.selfScore:setStrTxt(HtmlUtil.createArtNumDot(Hero:getUserScore() / LHD_BET_SCORE_RATE_VIEW, "#lhd_score_%s.png"))
	slot0.controller:setHeadBg(slot0.layerBottom.head, GAME_STATE.ROOM)
end

LhdRoomCcsView.destroy = function (slot0)
	Hero.pNickNameChangedSignal:remove(slot0.onNickNameChanged, slot0)
	destroySomeObj(slot0.layerBottom.userScore)
	destroySomeObj(slot0.layerTop.btnBack)
	destroySomeObj(slot0.layerTop.btnKSKS)
	destroySomeObj(slot0.layerBottom.head)
	destroySomeObj(slot0.roomSV)
	BaseGameRoomView.destroy(slot0)
end

return
