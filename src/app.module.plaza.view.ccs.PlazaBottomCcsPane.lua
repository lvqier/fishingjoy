PlazaBottomCcsPane = class("PlazaBottomCcsPane")

PlazaBottomCcsPane.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaTweenComponent, true, 0, -112, 1)

	slot0._ksksSpine = sp.SkeletonAnimation:create(slot1, slot2)

	slot0._ksksSpine:setPosition(165, 43)
	slot0._ksksSpine:setAnimation(0, "animation", true)
	slot0.btnQuickGame.nodeSpine:addChild(slot0._ksksSpine)

	slot0._chongzhiSpine = sp.SkeletonAnimation:create(slot1, slot2)

	slot0._chongzhiSpine:setPosition(78, 35)
	slot0._chongzhiSpine:setAnimation(0, "animation", true)
	slot0.btnCharge.nodeSpine:addChild(slot0._chongzhiSpine)

	if IS_IOS_VERIFY and IS_IOS_VERIFY_ALL_NO_BANK then
		slot0.btnCharge:setVisible(false)
	end

	uiMgr:adjustSlimWidth(slot0.bg, UIConfig.ALIGN_RIGHT_DOWN)
	uiMgr:adjustSlimWidth(slot0.btnQuickGame, UIConfig.ALIGN_RIGHT_DOWN)
	uiMgr:adjustSlimWidth(slot0.btnCharge, UIConfig.ALIGN_RIGHT_DOWN, 0)
	uiMgr:adjustSlimWidth(slot0.headNode, UIConfig.ALIGN_LEFT_DOWN, 50)
	uiMgr:adjustSlimWidth(slot0.txtName_tf, UIConfig.ALIGN_LEFT_DOWN, 50)
	uiMgr:adjustSlimWidth(slot0.scoreInfo, UIConfig.ALIGN_LEFT_DOWN, 50)
	Hero.pNickNameChangedSignal:add(slot0.onNickNameChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onUserInsureChanged()
	slot0:onNickNameChanged()
end

PlazaBottomCcsPane.doHide = function (slot0, slot1, slot2)
	Hero.userScoreChangedSignal:remove(slot0.onUserScoreChanged, slot0)
	Hero.userInsureChangedSignal:remove(slot0.onUserInsureChanged, slot0)
	BasePlazaTweenComponent.doHide(slot0, slot1, slot2)
end

PlazaBottomCcsPane.doShow = function (slot0, slot1, slot2)
	BasePlazaTweenComponent.doShow(slot0, slot1, slot2)
	Hero.userScoreChangedSignal:add(slot0.onUserScoreChanged, slot0)
	Hero.userInsureChangedSignal:add(slot0.onUserInsureChanged, slot0)
	slot0:onUserScoreChanged()
	slot0:onUserInsureChanged()
end

PlazaBottomCcsPane.onNickNameChanged = function (slot0)
	slot0.txtName_tf:setHtmlText(StringUtil.truncate(Hero:getPNickName(), 10, nil, 2))
end

PlazaBottomCcsPane.onUserScoreChanged = function (slot0)
	slot0.scoreInfo:setStrBaseWidth(185)
	slot0.scoreInfo:setStrTxt(HtmlUtil.createArtNumDot(Hero:getUserScore(), "#plist_font_yellow_2_%s.png"))

	if B_HEADCLIPPING == false then
		slot0.headNode.head.root.head:changeHeadBG(mainMgr:getHeadBgByGameKind(GameKind_HALL, GAME_STATE.ZJM, Hero:getCbGender()))
	end
end

PlazaBottomCcsPane.onUserInsureChanged = function (slot0)
	slot0.bankInfo:setStrBaseWidth(185)
	slot0.bankInfo:setStrTxt(HtmlUtil.createArtNumDot(Hero:getUserInsure(), "#plist_font_yellow_2_%s.png"))
end

PlazaBottomCcsPane.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.headNode.btnHead then
		if not IS_IOS_VERIFY then
			requireModule("AccountModule")
			ProxyAccount:show()
		end

		trackMgr:recordTracks(TRACK_HALL_GRZX)
	elseif slot1 == slot0.btnAddMoney or slot1 == slot0.btnCharge then
		requireModule("ChargeModule")
		ProxyCharge:show()
		trackMgr:recordTracks(TRACK_HALL_CZ)
	elseif slot1 == slot0.btnQuickGame then
		slot0.controller:quickStartGame()
	else
		tweenMsgMgr:showWhiteMsg("该功能尚未开放！")
	end
end

return
