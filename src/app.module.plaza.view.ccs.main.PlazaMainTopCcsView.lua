PlazaMainTopCcsView = class("PlazaMainTopCcsView")

PlazaMainTopCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, TickBase)
	ClassUtil.extends(slot0, BasePlazaTweenComponent, true, 0, 81, 1)
	slot0:startTick(1)
	slot0:tick()
	uiMgr:adjustSlimWidth(slot0.layerSignal, UIConfig.ALIGN_LEFT_UP, 90)
	uiMgr:adjustSlimWidth(slot0.layerWifi, UIConfig.ALIGN_LEFT_UP, 90)
	uiMgr:adjustSlimWidth(slot0.nodeRight, UIConfig.ALIGN_RIGHT, -63)
	Hero.isShowReportChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowRouleteeChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowYydbChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowSjbChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowDzpkMatchChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowJjjChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowSpeadIconChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowMcChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isShowSignInEntranceChangedSignal:add(slot0.refreshButton, slot0)
	Hero.firstPayEnableChangedSignal:add(slot0.refreshButton, slot0)
	slot0.model.signInDataChangedSignal:add(slot0.onCanSignIn, slot0)
	Hero.isShowSigninChangedSignal:add(slot0.onCanSignIn, slot0)
	Hero.hongDianDicChangedSignal:add(slot0.onComplaintMsg, slot0)
	slot0.model.redPacketInfoChangedSignal:add(slot0.onRedPacketInfoChanged, slot0)
	slot0:onRedPacketInfoChanged()
	slot0:onComplaintMsg()
	Hero.isTouristChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isBindMobileChangedSignal:add(slot0.refreshButton, slot0)
	Hero.registerRewardChangedSignal:add(slot0.refreshButton, slot0)
	Hero.isUserTypeChangedSignal:add(slot0.refreshButton, slot0)
	slot0.nodeRight.btnZhuanPan.sp:setVisible(false)
	slot0.nodeRight.btnDuoBao.sp:setVisible(false)
	slot0.nodeRight.btnSjb.sp:setVisible(false)
	slot0.nodeRight.btnDzpkMatch.sp:setVisible(false)
	slot0.nodeRight.btnJjj.sp:setVisible(false)
	slot0.nodeRight.btnMonthCard.sp:setVisible(false)
	slot0.nodeRight.btnSignIn.sp:setVisible(false)
	slot0.nodeRight.btnSignIn.spReddot:setLocalZOrder(100)
	slot0.nodeRight.btnFirstPay.sp:setVisible(false)
	slot0.nodeRight.btnBind.sp:setVisible(false)
	slot0.nodeRight.btnSpead.sp:setVisible(false)
	slot0.nodeRight.btnNewPack.sp:setVisible(false)
	slot0.nodeRight.btnRedPacket.sp:setVisible(false)

	slot1 = sp.SkeletonAnimation:create("res/gameres/animation/spine/zdb_xydzp/zdb_xydzp.json", "res/gameres/animation/spine/zdb_xydzp/zdb_xydzp.atlas")

	slot1:setAnimation(0, "animation", true)
	slot1:setPosition(cc.p(slot0.nodeRight.btnZhuanPan.sp:getPosition()))
	slot0.nodeRight.btnZhuanPan:addChild(slot1)

	slot2 = sp.SkeletonAnimation:create("gameres/animation/spine/hl_ttdbicon/hl_ttdbicon.json", "gameres/animation/spine/hl_ttdbicon/hl_ttdbicon.atlas")

	slot2:setAnimation(0, "animation", true)
	slot2:setPosition(cc.p(slot0.nodeRight.btnDuoBao.sp:getPosition()))
	slot0.nodeRight.btnDuoBao:addChild(slot2)

	slot3 = sp.SkeletonAnimation:create("gameres/animation/spine/sjb_rk/sjb_rk.json", "gameres/animation/spine/sjb_rk/sjb_rk.atlas")

	slot3:setAnimation(0, "animation", true)
	slot3:setPosition(cc.p(slot0.nodeRight.btnSjb.sp:getPosition()))
	slot0.nodeRight.btnSjb:addChild(slot3)

	slot4 = sp.SkeletonAnimation:create("gameres/animation/spine/dzpk_mtthdrk/dzpk_mtthdrk.json", "gameres/animation/spine/dzpk_mtthdrk/dzpk_mtthdrk.atlas")

	slot4:setAnimation(0, "animation", true)
	slot4:setPosition(cc.p(slot0.nodeRight.btnDzpkMatch.sp:getPosition()))
	slot0.nodeRight.btnDzpkMatch:addChild(slot4)

	slot5 = sp.SkeletonAnimation:create("gameres/animation/spine/hqb2_dt_jjj/hqb2_dt_jjj.json", "gameres/animation/spine/hqb2_dt_jjj/hqb2_dt_jjj.atlas")

	slot5:setAnimation(0, "animation", true)
	slot5:setPosition(cc.p(slot0.nodeRight.btnJjj.sp:getPosition()))
	slot5:setScale(0.8)
	slot0.nodeRight.btnJjj:addChild(slot5)

	slot6 = sp.SkeletonAnimation:create("gameres/animation/spine/hqb2_dt_tttg/hqb2_dt_tttg.json", "gameres/animation/spine/hqb2_dt_tttg/hqb2_dt_tttg.atlas")

	slot6:setAnimation(0, "animation", true)
	slot6:setPosition(cc.p(slot0.nodeRight.btnSpead.sp:getPosition()))
	slot6:setScale(0.85)
	slot0.nodeRight.btnSpead:addChild(slot6)

	slot7 = sp.SkeletonAnimation:create("gameres/animation/spine/zsb_ykrk/zsb_ykrk.json", "gameres/animation/spine/zsb_ykrk/zsb_ykrk.atlas")

	slot7:setAnimation(0, "animation", true)
	slot7:setPosition(cc.p(slot0.nodeRight.btnMonthCard.sp:getPosition()))
	slot7:setScale(0.85)
	slot0.nodeRight.btnMonthCard:addChild(slot7)

	slot8 = sp.SkeletonAnimation:create("gameres/animation/spine/zsb_qdrk/zsb_qdrk.json", "gameres/animation/spine/zsb_qdrk/zsb_qdrk.atlas")

	slot8:setAnimation(0, "animation", true)
	slot8:setPosition(cc.p(slot0.nodeRight.btnSignIn.sp:getPosition()))
	slot8:setScale(0.85)
	slot0.nodeRight.btnSignIn:addChild(slot8)
	sp.SkeletonAnimation:create("gameres/animation/spine/shouchongtehui/shouchongtehui.json", "gameres/animation/spine/shouchongtehui/shouchongtehui.atlas").setAnimation(slot8, 0, "animation", true)
	sp.SkeletonAnimation.create("gameres/animation/spine/shouchongtehui/shouchongtehui.json", "gameres/animation/spine/shouchongtehui/shouchongtehui.atlas").setPosition(slot8, cc.p(slot0.nodeRight.btnFirstPay.sp:getPosition()))
	sp.SkeletonAnimation.create("gameres/animation/spine/shouchongtehui/shouchongtehui.json", "gameres/animation/spine/shouchongtehui/shouchongtehui.atlas").setScale(slot8, 0.9)
	slot0.nodeRight.btnFirstPay:addChild(slot8)
	sp.SkeletonAnimation:create("gameres/animation/spine/zsb_bdsjrkicon/zsb_bdsjrkicon.json", "gameres/animation/spine/zsb_bdsjrkicon/zsb_bdsjrkicon.atlas").setAnimation(slot8, 0, "animation", true)
	sp.SkeletonAnimation.create("gameres/animation/spine/zsb_bdsjrkicon/zsb_bdsjrkicon.json", "gameres/animation/spine/zsb_bdsjrkicon/zsb_bdsjrkicon.atlas").setPosition(slot8, cc.p(slot0.nodeRight.btnBind.sp:getPosition()))
	slot0.nodeRight.btnBind:addChild(slot8)
	sp.SkeletonAnimation:create("gameres/animation/spine/zsb_xbsjrkicon/zsb_xbsjrkicon.json", "gameres/animation/spine/zsb_xbsjrkicon/zsb_xbsjrkicon.atlas").setAnimation(slot8, 0, "animation", true)

	slot9 = cc.p(slot0.nodeRight.btnNewPack.sp:getPosition())
	slot9.y = slot9.y + 11

	sp.SkeletonAnimation.create("gameres/animation/spine/zsb_xbsjrkicon/zsb_xbsjrkicon.json", "gameres/animation/spine/zsb_xbsjrkicon/zsb_xbsjrkicon.atlas").setPosition(slot8, slot9)
	slot0.nodeRight.btnNewPack:addChild(slot8)
	sp.SkeletonAnimation:create("gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.json", "gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.atlas").setAnimation(slot8, 0, "animation", true)
	sp.SkeletonAnimation.create("gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.json", "gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.atlas").setPosition(slot8, cc.p(slot0.nodeRight.btnRedPacket.sp:getPosition()))
	slot0.nodeRight.btnRedPacket:addChild(sp.SkeletonAnimation.create("gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.json", "gameres/animation/spine/tjcs_rkicon/tjcs_rkicon.atlas"))
	slot0:refreshButton()
end

PlazaMainTopCcsView.onCanSignIn = function (slot0)
	if (slot0.model:getSignInData().data[1].IsMC == 1 and slot1.TodaySignIn == 0) or (slot1.IsMC == 0 and not Hero:getIsShowSignin()) then
		slot0.nodeRight.btnSignIn.spReddot:setVisible(true)
	else
		slot0.nodeRight.btnSignIn.spReddot:setVisible(false)
	end
end

PlazaMainTopCcsView.onRedPacketInfoChanged = function (slot0)
	if slot0.model:getRedPacketInfo() and parseInt(slot1.Quantity) > 0 then
		slot0.nodeRight.btnRedPacket.spReddot:setVisible(true)
	else
		slot0.nodeRight.btnRedPacket.spReddot:setVisible(false)
	end
end

PlazaMainTopCcsView.onComplaintMsg = function (slot0)
	slot0.nodeRight.btnComplaint.spReddot:setVisible(Hero:getHd(HERO_COMPLAINT))
end

PlazaMainTopCcsView.refreshButton = function (slot0)
	slot0.nodeRight.btnDuoBao:setVisible(false)
	slot0.nodeRight.btnZhuanPan:setVisible(false)
	slot0.nodeRight.btnReport:setVisible(false)
	slot0.nodeRight.btnComplaint:setVisible(false)
	slot0.nodeRight.btnSjb:setVisible(false)
	slot0.nodeRight.btnDzpkMatch:setVisible(false)
	slot0.nodeRight.btnJjj:setVisible(false)
	slot0.nodeRight.btnSpead:setVisible(false)
	slot0.nodeRight.btnMonthCard:setVisible(false)
	slot0.nodeRight.btnSignIn:setVisible(false)
	slot0.nodeRight.btnFirstPay:setVisible(false)
	slot0.nodeRight.btnBind:setVisible(false)
	slot0.nodeRight.btnNewPack:setVisible(false)
	slot0.nodeRight.btnRedPacket:setVisible(false)

	slot1 = 10
	slot2 = {}

	if false or Hero:getIsShowRouletee() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnZhuanPan
	end

	if slot3 or (Hero:getIsShowYydb() and not IS_IOS_VERIFY) then
		slot2[#slot2 + 1] = slot0.nodeRight.btnDuoBao
	end

	if slot3 or Hero:getIsShowReport() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnReport

		slot0.nodeRight.btnReport.value_tf:setHtmlText(HtmlUtil.createImg("#plist_font_report_xp.png") .. HtmlUtil.createArtNumWithHansUnits(Hero:getReportReward() or 0, "#plist_font_report_x%s.png"))
	end

	if slot3 or Hero:getIsShowSjb() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnSjb
	end

	if slot3 or Hero:getIsShowDzpkMatch() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnDzpkMatch
	end

	if slot3 or Hero:getIsShowJjj() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnJjj
	end

	if slot3 or Hero:getIsShowSpeadIcon() or not isOutServer or not not isOutServerTest then
		slot2[#slot2 + 1] = slot0.nodeRight.btnSpead
	end

	if slot3 or Hero:getIsShowMc() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnMonthCard
	end

	if slot3 or (Hero:getIsShowMc() and Hero:getIsShowSignInEntrance()) then
		slot2[#slot2 + 1] = slot0.nodeRight.btnSignIn
	end

	if slot3 or Hero:getFirstPayEnable() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnFirstPay
	end

	if slot3 or ((Hero:getIsTourist() or Hero:getIsUserType() ~= 0) and not Hero:getIsBindMobile() and Hero:getRegisterReward() > 0) then
		slot2[#slot2 + 1] = slot0.nodeRight.btnBind
	end

	if slot3 or Hero:getNewPackagePromotion() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnNewPack
	end

	if slot3 or (not IS_IOS_VERIFY and not IS_YYB_VERIFY and not IS_SDK_VERIFY and not IS_SDK_OFFIIAL_VERIFY) then
		slot2[#slot2 + 1] = slot0.nodeRight.btnComplaint
	end

	if slot3 or Hero:getIsShowRedPacket() then
		slot2[#slot2 + 1] = slot0.nodeRight.btnRedPacket
	end

	slot4 = 1319

	for slot8 = 1, #slot2, 1 do
		cc.p(slot2[slot8]:getPosition()).x = slot4 - slot2[slot8]:getContentSize().width / 2 - slot1

		slot2[slot8]:setPosition(slot10)
		slot2[slot8]:setVisible(true)

		slot4 = slot4 - slot2[slot8].getContentSize().width - slot1
	end
end

PlazaMainTopCcsView.tick = function (slot0)
	slot1 = {
		type = mainMgr:getNetworkState()
	}

	if socketMgr:isConnected(SOCKET_TYPE_ROOM) then
		if networkMgr:getHeadPingTime() < 0.1 then
			slot1.signalLevel = 4
		elseif slot2 < 0.2 then
			slot1.signalLevel = 3
		elseif slot2 < 1 then
			slot1.signalLevel = 2
		elseif slot2 < 2 then
			slot1.signalLevel = 1
		else
			slot1.signalLevel = 0
		end
	else
		slot1.signalLevel = bridgeMgr:getNetJsonInfo() or {}.signalLevel
	end

	slot0.layerSignal:setVisible(parseInt(slot1.type) ~= 1)
	slot0.layerWifi:setVisible(slot2 == 1)
	slot0:setNetSpShowing((slot2 == 1 and slot0.layerWifi) or slot0.layerSignal, parseInt(slot1.signalLevel))
end

PlazaMainTopCcsView.setNetSpShowing = function (slot0, slot1, slot2)
	if isAndroid then
	elseif slot2 >= 3 then
		slot2 = 4
	elseif slot2 >= 2 then
		slot2 = 3
	end

	slot3 = 0
	slot4 = false

	while true do
		if slot1["sp" .. slot3] then
			slot4 = true

			slot5:setVisible(slot3 == slot2)
		else
			break
		end

		slot3 = slot3 + 1
	end

	if not slot4 then
		slot1.sp3:setVisible(true)
	end
end

PlazaMainTopCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.nodeRight.btnComplaint then
		requireModule("ComplaintModule")
		ProxyComplaint:show()
	elseif slot1 == slot0.nodeRight.btnReport then
		slot0.model:setIsShowingReport(true)
	elseif slot1 == slot0.nodeRight.btnZhuanPan then
		requireModule("RouleteeModule")
		ProxyRouletee:show()
	elseif slot1 == slot0.nodeRight.btnDuoBao then
		requireModule("YydbModule")
		ProxyYydb:show()
		trackMgr:recordTracks(TRACK_HALL_YYDB)
	elseif slot1 == slot0.nodeRight.btnSjb then
		slot0.controller:onSjbEntranceBtnClick()
	elseif slot1 == slot0.nodeRight.btnDzpkMatch then
		slot0.controller:onDzpkMatchEntranceBtnClick()
	elseif slot1 == slot0.nodeRight.btnJjj then
		slot0.controller:requestGetJjj(function ()
			popupMgr:showRewardPopup(Hero:getReliefNum())
		end)
	elseif slot1 == slot0.nodeRight.btnSpead then
		requireModule("DailySpeadModule")
		ProxyDailySpead:show()
	elseif slot1 == slot0.nodeRight.btnMonthCard then
		slot0.controller:requestMonthCard()
	elseif slot1 == slot0.nodeRight.btnFirstPay then
		slot0.model:setIsShowingFirstPay(true)
	elseif slot1 == slot0.nodeRight.btnSignIn then
		slot0.controller:requestSignInData(function ()
			slot0.model:setIsShowingSignIn(true)
		end)
	elseif slot1 == slot0.nodeRight.btnBind then
		slot0.model:setIsShowingNewbieReward(2)
	elseif slot1 == slot0.nodeRight.btnNewPack then
		slot0.model:setIsShowingNewbieReward(3)
	elseif slot1 == slot0.nodeRight.btnRedPacket then
		slot0.controller:openRedPacketMain()
	else
		tweenMsgMgr:showWhiteMsg("该功能尚未开放！")
	end
end

return
