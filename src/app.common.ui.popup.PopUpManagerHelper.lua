POPUP_ID_YYDB_RESULT = 1001
POPUP_ID_NEWBIE_REWARD_1 = 1002
POPUP_ID_NEWBIE_REWARD_2 = 1003
POPUP_ID_TOURIST_LOGIN_TIP = 1004
POPUP_ID_WORLD_CUP = 1005
POPUP_ID_NOTICE_DETAIL = 1006
POPUP_ID_DZPK_HDTS = 1007
POPUP_ID_NEW_PACKAGE = 1008
POPUP_PRIORITY_CONFIG = {
	[POPUP_ID_NEW_PACKAGE] = 1,
	[POPUP_ID_WORLD_CUP] = 2,
	[POPUP_ID_NOTICE_DETAIL] = 3,
	[POPUP_ID_NEWBIE_REWARD_1] = 4,
	[POPUP_ID_NEWBIE_REWARD_2] = 5,
	[POPUP_ID_TOURIST_LOGIN_TIP] = 6,
	[POPUP_ID_YYDB_RESULT] = 7,
	[POPUP_ID_DZPK_HDTS] = 8
}

PopUpManager.deploy = function (slot0)
	slot5 = true
	slot9 = slot0.showFirstPopupInQueue

	createSetterGetterHandler(slot2, slot0, "isFordbidPopupQueue", handler(slot7, slot0))

	slot7 = true

	createSetterGetterHandler(slot2, slot0, "popupQueue", {}, false)

	slot5 = false

	createSetterGetterHandler(slot2, slot0, "isFordbidNormalActivityIndicator")

	slot0._count4ActivityIndicator = 0
	slot0._loadingView = nil
	slot0._normalPopup = nil
	slot0._normalInputPopup = nil
	slot0._reconnectPopUpView = nil
	slot0._awardPopupView = nil
	slot0._noticeContentPopupView = nil
	slot0._popUpNoticeDetailView = nil
	slot0._popUpNoticeDetailStr = nil
	slot0._commonRoomListPopupView = nil
	slot0._roomPasswordPopupView = nil
	slot0._gmCommandPopupView = nil
	slot0._kefuKpiPopupView = nil
	slot0._sharePopupView = nil
	slot0._curShowingNormalPopUps = {}
	slot0._curShowingPopupsByContentDic = {}
end

PopUpManager.push = function (slot0, slot1, slot2)
	if POPUP_PRIORITY_CONFIG[slot1] then
		slot6 = slot2

		if type(slot5) == "function" then
			slot7 = {
				id = slot1,
				showFunc = slot2,
				priority = slot3
			}

			table.insert(slot5, slot0._popupQueue)

			function slot7(slot0, slot1)
				return slot0.priority < slot1.priority
			end

			table.sort(slot5, slot0._popupQueue)

			slot6 = slot0

			slot0.showFirstPopupInQueue(slot5)
		end
	else
		slot14 = slot2
		slot8 = "PopUpManager:push() param error!" .. "id:" .. (slot1 or "nil") .. ".showFunc:" .. type(slot13)

		trace(HtmlUtil.createRedTxt(slot7))
	end
end

PopUpManager.pop = function (slot0, slot1)
	if #slot0._popupQueue > 0 then
		for slot5 = 1, #slot0._popupQueue, 1 do
			if slot1 == slot0._popupQueue[slot5].id and slot6.isShowing then
				slot10 = slot5

				table.remove(slot8, slot0._popupQueue)

				break
			end
		end

		slot4 = slot0

		slot0.showFirstPopupInQueue(slot3)
	end
end

PopUpManager.showFirstPopupInQueue = function (slot0)
	if not slot0._isFordbidPopupQueue and #slot0._popupQueue > 0 and slot0._popupQueue[1] and slot1.showFunc and not slot1.isShowing then
		slot1.showFunc()

		slot1.isShowing = true
	end
end

PopUpManager.clearPopupQueue = function (slot0)
	slot0._popupQueue = {}
end

PopUpManager.isCacheNormalPopUp = function (slot0, slot1)
	return slot1 == slot0._normalPopup
end

PopUpManager.showAlert = function (slot0, slot1, slot2, slot3, slot4)
	slot13 = nil

	return slot0.showConfirm(slot6, slot0, slot1, slot2, slot3, slot4, true)
end

__paf = PopUpManager.showAlert
fdsafdsa = "u"

PopUpManager.showConfirm = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	slot12 = nil
	slot9 = slot9 or 0
	slot10 = slot10 or false
	slot15 = slot1

	if slot0._curShowingPopupsByContentDic[tostring(slot14)] then
		return slot12
	end

	if slot0._normalPopup then
		slot16 = slot0._normalPopup

		if not slot0._normalPopup.getIsShowing(slot15) then
			slot12 = slot0._normalPopup
		end
	end

	slot12 = slot12 or NormalPopupTipView.new()

	if not slot0._normalPopup then
		slot0._normalPopup = slot12
	end

	slot0._curShowingPopupsByContentDic[slot13] = slot12
	slot20 = slot12

	table.insert(slot18, slot0._curShowingNormalPopUps)

	slot20 = slot4

	slot12.changeTitleTxt(slot18, slot12)

	function slot20()
		table.removebyvalue(slot1, slot0._curShowingNormalPopUps)

		table.removebyvalue._curShowingPopupsByContentDic[slot0._curShowingNormalPopUps] = nil
		slot2 = slot1

		applyFunction(slot0._curShowingNormalPopUps)
	end

	slot12.setConfirmCallback(slot18, slot12)

	function slot20()
		table.removebyvalue(slot1, slot0._curShowingNormalPopUps)

		table.removebyvalue._curShowingPopupsByContentDic[slot0._curShowingNormalPopUps] = nil
		slot2 = slot1

		applyFunction(slot0._curShowingNormalPopUps)
	end

	slot12.setCancelCallback(slot18, slot12)

	function slot20()
		slot3 = slot1

		table.removebyvalue(slot1, slot0._curShowingNormalPopUps)

		table.removebyvalue._curShowingPopupsByContentDic[slot0._curShowingNormalPopUps] = nil
	end

	slot12.setHideCallback(slot18, slot12)

	slot20 = slot6 or "是"

	slot12.setConfirmTxt(slot18, slot12)

	slot20 = slot7 or "否"

	slot12.setCancelTxt(slot18, slot12)

	if slot5 == nil then
		slot5 = true
	end

	slot20 = slot10

	slot12.setForbidCloseEvent(slot18, slot12)

	slot20 = slot5

	slot12.setIsConfirmBtnOnly(slot18, slot12)

	slot20 = slot1 or ""

	slot12.changeContentTxtOrFunc(slot18, slot12)

	slot20 = slot11 or false

	slot12.setIsHideCloseBtn(slot18, slot12)

	slot21 = slot9

	slot12.show(slot18, slot12, slot8)

	return slot12
end

PopUpManager.getPopupByContent = function (slot0, slot1)
	if slot1 then
		return slot0._curShowingPopupsByContentDic[slot1]
	end

	return nil
end

PopUpManager.hidePopupByContent = function (slot0, slot1)
	if slot1 and slot0._curShowingPopupsByContentDic[slot1] then
		if slot1 == TIP_NETWORK_SLOW then
			slot5 = mainMgr

			mainMgr.clearReconnectPopup(slot4)
		end

		slot5 = slot2

		slot2.hide(slot4)
	end
end

PopUpManager.hideCommonRoomList = function (slot0)
	if slot0._commonRoomListPopupView then
		slot3 = slot0._commonRoomListPopupView

		slot0._commonRoomListPopupView.hide(slot2)
	end
end

PopUpManager.showCommonRoomList = function (slot0, slot1, slot2)
	slot3 = nil

	if slot0._commonRoomListPopupView then
		slot6 = slot0._commonRoomListPopupView

		if not slot0._commonRoomListPopupView.getIsShowing(slot5) then
			slot3 = slot0._commonRoomListPopupView
		end
	end

	slot3 = slot3 or CommonRoomListPopupView.new()

	if not slot0._commonRoomListPopupView then
		slot0._commonRoomListPopupView = slot3
	end

	slot7 = slot2

	slot3.setOnRoomSelectedCallback(slot5, slot3)

	slot7 = slot1

	slot3.setDatas(slot5, slot3)

	slot6 = slot3

	slot3.show(slot5)
end

PopUpManager.hideAllNormalPopups = function (slot0)
	slot3 = slot0._curShowingNormalPopUps

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5

		slot5.hide(slot7)
	end

	slot0._curShowingPopupsByContentDic = {}
	slot0._curShowingNormalPopUps = {}
	slot3 = slot0

	slot0.hideAwardPopupView(slot2)

	slot3 = slot0

	slot0.hideNoticePopup(slot2)

	slot3 = slot0

	slot0.hideCommonRoomList(slot2)

	slot3 = slot0

	slot0.hideOnlineServicePopup(slot2)

	slot3 = slot0

	slot0.hideUserInfoPopup(slot2)

	slot3 = slot0

	slot0.hidePopupNoticeDetail(slot2)

	if slot0._gmCommandPopupView then
		slot3 = slot0._gmCommandPopupView

		slot0._gmCommandPopupView.hide(slot2)
	end

	if slot0._roomPasswordPopupView then
		slot3 = slot0._roomPasswordPopupView

		slot0._roomPasswordPopupView.hide(slot2)
	end

	if slot0._touristLoginTipsPopupView then
		slot3 = slot0._touristLoginTipsPopupView

		slot0._touristLoginTipsPopupView.hide(slot2)
	end

	if slot0._kefuKpiPopupView then
		slot3 = slot0._kefuKpiPopupView

		slot0._kefuKpiPopupView.hide(slot2)
	end

	if slot0._sharePopupView then
		slot3 = slot0._sharePopupView

		slot0._sharePopupView.hide(slot2)
	end
end

PopUpManager.hideAwardPopupView = function (slot0)
	if slot0._awardPopupView then
		slot3 = slot0._awardPopupView

		slot0._awardPopupView.hide(slot2)
	end
end

PopUpManager.hideNoticePopup = function (slot0)
	if slot0._noticeContentPopupView then
		slot3 = slot0._noticeContentPopupView

		slot0._noticeContentPopupView.hide(slot2)
	end
end

PopUpManager.hidePopupNoticeDetail = function (slot0)
	if slot0._popUpNoticeDetailView then
		slot3 = slot0._popUpNoticeDetailView

		slot0._popUpNoticeDetailView.hide(slot2)
	end
end

PopUpManager.hideUserInfoPopup = function (slot0)
	if slot0._userInfoPopupView then
		slot3 = slot0._userInfoPopupView

		slot0._userInfoPopupView.hide(slot2)
	end
end

PopUpManager.hideOnlineServicePopup = function (slot0)
	if slot0._onlineServicePopupView then
		slot3 = slot0._onlineServicePopupView

		slot0._onlineServicePopupView.hide(slot2)
	end
end

PopUpManager.showNoticePopup = function (slot0, slot1)
	if IS_IOS_VERIFY or IS_YYB_VERIFY or IS_SDK_VERIFY then
		return
	end

	slot2 = nil

	if slot0._noticeContentPopupView then
		slot5 = slot0._noticeContentPopupView

		if not slot0._noticeContentPopupView.getIsShowing(slot4) then
			slot2 = slot0._noticeContentPopupView
		end
	end

	slot2 = slot2 or NoticeContentPopupView.new()

	if not slot0._noticeContentPopupView then
		slot0._noticeContentPopupView = slot2
	end

	slot6 = slot1

	slot2.setNoticeVo(slot4, slot2)

	slot5 = slot2

	slot2.show(slot4)
end

PopUpManager.showPopupNoticeDetail = function (slot0, slot1)
	if IS_IOS_VERIFY or IS_YYB_VERIFY or IS_SDK_VERIFY or IS_SDK_OFFIIAL_VERIFY then
		return
	end

	slot4 = mainMgr

	if mainMgr.getServerStateVo(slot3) and slot2.status == "1" then
		slot5 = slot2.tips

		if StringUtil.isStringValid(slot4) then
			slot1 = slot2.tips
		end
	end

	slot5 = slot1

	if StringUtil.isStringValid(slot4) then
		slot0._popUpNoticeDetailStr = slot1
	end

	slot5 = slot0._popUpNoticeDetailStr

	if StringUtil.isStringValid(slot4) then
		slot5 = uiMgr

		if uiMgr.getCurSceneType(slot4) == SceneType.scene_login then
			return
		end
	end

	slot3 = nil

	if slot0._popUpNoticeDetailView then
		slot6 = slot0._popUpNoticeDetailView

		if not slot0._popUpNoticeDetailView.getIsShowing(slot5) then
			slot3 = slot0._popUpNoticeDetailView
		end
	end

	slot3 = slot3 or PopUpNoticeDetailView.new()

	if not slot0._popUpNoticeDetailView then
		slot0._popUpNoticeDetailView = slot3
	end

	slot7 = slot0._popUpNoticeDetailStr

	slot3.setNoticeVo(slot5, slot3)

	function slot9()
		slot2 = slot0

		slot0.show(slot1)
	end

	slot0.push(slot3, slot0, POPUP_ID_NOTICE_DETAIL)

	slot0._popUpNoticeDetailStr = nil
end

PopUpManager.showAwardPopup = function (slot0, slot1)
	slot2 = nil

	if slot0._awardPopupView then
		slot5 = slot0._awardPopupView

		if not slot0._awardPopupView.getIsShowing(slot4) then
			slot2 = slot0._awardPopupView
		end
	end

	slot2 = slot2 or AwardPopupTipView.new()

	if not slot0._awardPopupView then
		slot0._awardPopupView = slot2
	end

	slot6 = slot1

	slot2.setNumOfHuanLeDou(slot4, slot2)

	slot5 = slot2

	slot2.show(slot4)
end

PopUpManager.showRedPacketAwardPopup = function (slot0, slot1)
	slot2 = nil

	if slot0._redPacketAwardPopupView then
		slot5 = slot0._redPacketAwardPopupView

		if not slot0._redPacketAwardPopupView.getIsShowing(slot4) then
			slot2 = slot0._redPacketAwardPopupView
		end
	end

	slot2 = slot2 or PlazaRedPacketAwardCcsView.new()

	if not slot0._redPacketAwardPopupView then
		slot0._redPacketAwardPopupView = slot2
	end

	slot6 = slot1

	slot2.setNumOfHuanLeDou(slot4, slot2)

	slot5 = slot2

	slot2.show(slot4)

	return slot2
end

PopUpManager.showRewardPopup = function (slot0, slot1, slot2)
	slot3 = nil

	if slot0._rewardPopupView then
		slot6 = slot0._rewardPopupView

		if not slot0._rewardPopupView.getIsShowing(slot5) then
			slot3 = slot0._rewardPopupView
		end
	end

	slot3 = slot3 or RewardPopupTipView.new()

	if not slot0._rewardPopupView then
		slot0._rewardPopupView = slot3
	end

	slot7 = slot1

	slot3.setNumOfHuanLeDou(slot5, slot3)

	slot7 = slot2

	slot3.setIconIndex(slot5, slot3)

	slot6 = slot3

	slot3.show(slot5)
end

PopUpManager.showKefuKpiPopup = function (slot0, slot1)
	slot2 = nil

	if slot0._kefuKpiPopupView then
		slot5 = slot0._kefuKpiPopupView

		if not slot0._kefuKpiPopupView.getIsShowing(slot4) then
			slot2 = slot0._kefuKpiPopupView
		end
	end

	slot2 = slot2 or KefuKpiPopupView.new()

	if not slot0._kefuKpiPopupView then
		slot0._kefuKpiPopupView = slot2
	end

	slot6 = slot1

	slot2.setMsgid(slot4, slot2)

	slot6 = 0

	slot2.setScore(slot4, slot2)

	slot5 = slot2

	slot2.show(slot4)
end

PopUpManager.showSharePopup = function (slot0, slot1, slot2)
	slot3 = nil

	if slot0._sharePopupView then
		slot6 = slot0._sharePopupView

		if not slot0._sharePopupView.getIsShowing(slot5) then
			slot3 = slot0._sharePopupView
		end
	end

	slot3 = slot3 or SharePopupView.new()

	if not slot0._sharePopupView then
		slot0._sharePopupView = slot3
	end

	slot7 = slot1

	slot3.setShareFunc(slot5, slot3)

	slot7 = slot2

	slot3.setNodePosition(slot5, slot3)

	slot6 = slot3

	slot3.show(slot5)
end

PopUpManager.showGMCommandPopup = function (slot0)
	slot1 = nil

	if slot0._gmCommandPopupView then
		slot4 = slot0._gmCommandPopupView

		if not slot0._gmCommandPopupView.getIsShowing(slot3) then
			slot1 = slot0._gmCommandPopupView
		end
	end

	slot1 = slot1 or GMCommandPopupView.new()

	if not slot0._gmCommandPopupView then
		slot0._gmCommandPopupView = slot1
	end

	slot4 = slot1

	slot1.show(slot3)
end

PopUpManager.showRoomPasswordPopup = function (slot0, slot1)
	slot2 = nil

	if slot0._roomPasswordPopupView then
		slot5 = slot0._roomPasswordPopupView

		if not slot0._roomPasswordPopupView.getIsShowing(slot4) then
			slot2 = slot0._roomPasswordPopupView
		end
	end

	slot2 = slot2 or RoomPasswordPopupView.new()

	if not slot0._roomPasswordPopupView then
		slot0._roomPasswordPopupView = slot2
	end

	slot6 = slot1

	slot2.show(slot4, slot2)
end

PopUpManager.showTouristLoginTipsPopup = function (slot0)
	if IS_IOS_VERIFY or IS_YYB_VERIFY or IS_SDK_VERIFY then
		return
	end

	slot1 = nil

	if slot0._touristLoginTipsPopupView then
		slot4 = slot0._touristLoginTipsPopupView

		if not slot0._touristLoginTipsPopupView.getIsShowing(slot3) then
			slot1 = slot0._touristLoginTipsPopupView
		end
	end

	slot1 = slot1 or TouristLoginTipsPopupView.new()

	if not slot0._touristLoginTipsPopupView then
		slot0._touristLoginTipsPopupView = slot1
	end

	slot4 = slot1

	slot1.show(slot3)
end

PopUpManager.showOnlineServicePopup = function (slot0)
	slot1 = URL_ONLINE_QQ_KF_PHP

	if isOutServer and isOutServerTest then
		slot5 = Hero
		slot5 = Hero

		if not ({
			accountName = Hero.getPNickName(slot4),
			accountId = Hero.getDwUserID(slot4)
		})["accountId"] or slot2.accountId == 0 then
			slot5 = bridgeMgr
			slot2.accountId = bridgeMgr.getPhoneUUId(slot4)
		end

		slot6 = slot1
		slot3, slot7 = sign4PhpUrl(slot4, slot2)
		slot1 = slot1 .. "?" .. slot4
	end

	slot5 = slot1

	trace(slot3, "客服地址是")

	slot4 = slot1

	OSUtil.openURL(slot3)
end

PopUpManager.showUserInfoPopup = function (slot0, slot1, slot2)
	slot3 = nil

	if slot0._userInfoPopupView then
		slot6 = slot0._userInfoPopupView

		if not slot0._userInfoPopupView.getIsShowing(slot5) then
			slot3 = slot0._userInfoPopupView
		end
	end

	slot3 = slot3 or UserInfoPopupView.new()

	if not slot0._userInfoPopupView then
		slot0._userInfoPopupView = slot3
	end

	slot8 = slot2

	slot3.show(slot5, slot3, slot1)
end

PopUpManager.showInput = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot0._normalInputPopup then
		slot7 = slot0._normalInputPopup

		if not slot0._normalInputPopup.getIsShowing(slot6) then
			slot4 = slot0._normalInputPopup
		end
	end

	slot4 = slot4 or NormalInputPopupView.new()

	if not slot0._normalInputPopup then
		slot0._normalInputPopup = slot4
	end

	slot8 = slot2

	slot4.setConfirmCallback(slot6, slot4)

	slot8 = slot3

	slot4.setCancelCallback(slot6, slot4)

	slot7 = slot4
	slot5 = slot4.changeContentTxtOrFunc

	if not slot1 then
		slot10 = "c189"
		slot8 = I18n.get(slot9)
	end

	slot5(slot6, slot7)

	slot7 = slot4

	slot4.show(slot6)
end

PopUpManager.clearCache = function (slot0)
	return
end

PopUpManager.showActivityIndicator = function (slot0, slot1)
	if not slot1 then
		slot4 = "c1580"
		slot1 = I18n.get(slot3)
	end

	if not slot0._isFordbidNormalActivityIndicator then
		if ProxyLogin ~= nil then
			slot4 = ProxyLogin

			if ProxyLogin.isShowing(slot3) then
				slot4 = ProxyLogin
				slot2 = ProxyLogin.isShowingLoading(slot3)
			end
		else
			slot2 = false

			if false then
				slot2 = true
			end
		end

		if not slot2 then
			if slot0._loadingView then
				slot5 = slot0._loadingView

				if not slot0._loadingView.isShowing(slot4) and not slot0._loadingView then
					slot0._loadingView = ActivityLoadingPopUpView.new()
					slot5 = slot0._loadingView

					slot0._loadingView.show(slot4)

					slot6 = slot1

					slot0._loadingView.changeContent(slot4, slot0._loadingView)
				end
			end
		elseif slot0._loadingView then
			slot6 = slot1

			slot0._loadingView.changeContent(slot4, slot0._loadingView)
		end

		slot0._count4ActivityIndicator = slot0._count4ActivityIndicator + 1
	end
end

PopUpManager.hideActivityIndicator = function (slot0, slot1)
	if not slot0._isFordbidNormalActivityIndicator then
		if slot0._count4ActivityIndicator == 1 or slot1 then
			slot0._count4ActivityIndicator = 0

			if slot0._loadingView then
				slot5 = slot1

				slot0._loadingView.hide(slot3, slot0._loadingView)
			end
		elseif slot0._count4ActivityIndicator > 1 then
			slot0._count4ActivityIndicator = slot0._count4ActivityIndicator - 1
		end
	end
end

PopUpManager.showMoneyEffect = function (slot0, slot1)
	if not slot1 then
		slot4 = uiMgr
		slot2 = uiMgr.getTopLayerInAllScene(slot3)
	end

	slot3 = display.width
	slot4 = display.height
	slot7 = "pane/yydb_icon_bean_effect.png"
	slot5 = ResConfig.getUICommonPath(slot6)
	slot6 = 0

	function slot7()
		slot0 = slot0 + 1
		slot0 = display.newSprite(slot1)

		slot2.addChild(slot1, slot2)

		slot7 = slot3 + 50 + slot3 + 80
		slot8 = 10
		slot9 = 360
		slot11 = math.random(-50, -50 + slot3 + 80)

		slot0.setPosition(0, slot0, slot3)

		slot10 = math.random(-50 + slot3 + 80, 8) / 10

		slot0.setScale(0, slot0)
		slot0.setRotation(0, slot0)

		slot7 = 0.6
		slot8 = 0.5
		slot12 = 120
		slot9 = math.random(slot4 + 50, -120)
		slot13 = 10
		slot10 = math.random(-120, 0) / 1000
		slot11 = math.random(0, 220)
		slot15 = 1
		slot12 = math.random(220, 0)
		slot19 = 1
		slot16 = math.random(slot17, 0) == 1

		slot0.setFlippedX(360, slot0)

		slot16 = 1

		if math.random(slot14, -1) == -1 then
			slot13 = {
				0.9 * slot5,
				0.8 * slot5
			}
		elseif slot13 == 0 then
			slot13 = {
				1 * slot5,
				1 * slot5
			}
		elseif slot13 == 1 then
			slot13 = {
				1.05 * slot5,
				1.1 * slot5
			}
		end

		slot17 = slot0
		slot30 = (0.8 * slot7 * (slot4 + slot9)) / slot2
		slot31 = (1.4 * slot7 * (slot4 + slot9)) / slot2
		slot32 = (0.4 * slot7 * (slot4 + slot9)) / slot2
		slot29 = cc.DelayTime.create(cc.MoveTo, cc.DelayTime)
		slot33 = (0.9 * slot7 * (slot4 + slot9)) / slot2
		slot37 = 0
		slot37 = slot11 / 3
		slot30 = cc.EaseSineIn.create(cc.DelayTime, cc.RotateBy.create(cc.p, cc.RotateBy, (1 * slot7 * (slot4 + slot9)) / slot2))
		slot33 = cc.EaseSineOut
		slot38 = slot11
		slot27 = cc.Sequence.create(cc.Sequence, cc.Sequence, cc.EaseSineOut.create(cc.EaseSineIn, cc.RotateBy.create(cc.RotateBy, cc.RotateBy, slot8 * slot7 * 2.4)))
		slot30 = cc.EaseSineInOut
		slot35 = slot13[2]
		slot21 = cc.Spawn.create(slot22, cc.Spawn, cc.EaseSineIn.create(slot25, cc.FadeIn.create(slot28, cc.FadeIn)), cc.EaseBounceOut.create(cc.EaseSineIn, cc.MoveTo.create(cc.FadeIn, cc.MoveTo, cc.p(slot33, slot3 + 2 * slot9))), cc.Sequence.create(cc.EaseBounceOut, cc.Sequence, cc.MoveBy.create(cc.DelayTime, cc.MoveBy, cc.p(slot14, 2 * slot9))), cc.EaseSineInOut.create(cc.Sequence, cc.ScaleTo.create(cc.EaseSineIn, cc.ScaleTo, slot8 * slot7 * 3.4)))

		function slot25()
			slot2 = slot0

			slot0.removeFromParent(slot1)
		end

		slot0.runAction(slot16, cc.Sequence.create(slot19, cc.Sequence, cc.CallFunc.create(cc.Spawn, cc.CallFunc)))
	end

	slot18 = 300 / 10
	slot16 = math.floor(slot17) - 1

	tickMgr.delayedCall(slot12, tickMgr, slot10, 1)

	slot14 = "effect/effect_coins.mp3"

	audioMgr.playGameEffect(slot12, audioMgr)
end

PopUpManager.showGetRedPacketPopup = function (slot0, slot1, slot2)
	slot3 = false

	if slot0._redPacketPopup then
		slot6 = slot0._redPacketPopup

		if not slot0._redPacketPopup.getIsShowing(slot5) then
			popup = slot0._redPacketPopup
		end
	end

	if not popup then
		popup = GetRedPacketPopupView.new()
	end

	if not slot0._redPacketPopup then
		slot0._redPacketPopup = popup
	end

	slot7 = slot1

	popup.setContentTxt(slot5, popup)

	slot7 = slot2

	popup.setConfirmCallback(slot5, popup)

	slot6 = popup

	popup.show(slot5)

	return popup
end

return
