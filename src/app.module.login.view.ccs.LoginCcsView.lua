LoginCcsView = class("LoginCcsView")

LoginCcsView.onCreationComplete = function (slot0)
	slot0._loadingLabel = slot0.layerLoading.txtLoading

	slot0.model.isShowingLoadingPaneChangedSignal:add(slot0.onLoadingPaneShow, slot0)
	slot0.model.loadingPercentChangedSignal:add(slot0.onLoadingPercentChanged, slot0)
	slot0.model.loadingTextChangedSignal:add(slot0.onLoadingTextChanged, slot0)
	slot0:onLoadingPercentChanged()
	slot0:onLoadingTextChanged()
	slot0:onLoadingPaneShow(nil, true)

	if IS_IOS_VERIFY and (IS_IOS_VERIFY_ALL or IS_IOS_VERIFY_ALL_NO_BANK) then
		ComponentsGroup.new(slot1, true):showThese({
			slot0.layerBtns.btnYouKe,
			slot0.layerBtns.btnZhangHao
		})
	end

	if (IS_IOS_VERIFY or IS_SDK_OFFIIAL_VERIFY) and slot0.btnKf then
		slot0.btnKf:setVisible(false)
	end

	slot0.layerBtns.txtBanHaoDesc:setString(slot0.model:getBanHaoConfigDic()[PACKAGE_DEVICE_TYPE] or "")
	slot0.layerBtnsIosVerify.txtBanHaoDesc:setString(slot0.model.getBanHaoConfigDic()[PACKAGE_DEVICE_TYPE] or "")
	slot0.layerYYB.txtBanHaoDesc:setString(slot0.model.getBanHaoConfigDic()[PACKAGE_DEVICE_TYPE] or "")
	slot0.layerYYBNoGuest.txtBanHaoDesc:setString(slot0.model.getBanHaoConfigDic()[PACKAGE_DEVICE_TYPE] or "")
	slot0.layerBtnsPotato.txtBanHaoDesc:setString(slot0.model.getBanHaoConfigDic()[PACKAGE_DEVICE_TYPE] or "")
	slot0.layerLoading.bgTxt:setVisible(not IS_IOS_VERIFY or IS_IOS_VERIFY_ALL or not not IS_IOS_VERIFY_ALL_NO_BANK)
	slot0.layerLoading.txtLoadingTips:setVisible(not IS_IOS_VERIFY or IS_IOS_VERIFY_ALL or not not IS_IOS_VERIFY_ALL_NO_BANK)
	slot0.txtVersion_tf:setHtmlText(slot0.layerLoading.txtLoadingTips.setVisible)
	slot0.txtVersion_tf:setPositionX((0.5 * (CONFIG_DESIGN_WIDTH - CUR_SELECTED_WIDTH) + CUR_SELECTED_WIDTH) - slot0.txtVersion_tf:getWidth() - 10)

	if IS_IOS_VERIFY then
		slot0.txtVersion_tf:setVisible(false)
	end

	slot0._loadingSentencesUpdateScheduleId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(slot0, slot0.updateLoadingTxtWithSentenceArr), 0.08333333333333333, false)

	slot0.model.isKfShowingChangedSignal:add(slot0.onKfShowingChanged, slot0)

	if PACKAGE_DEVICE_TYPE == 103 then
		slot0.layerBtns.btnWeiXin:setVisible(false)
		slot0.layerBtns.btnYouKe:setPositionX(slot0.layerBtns.btnYouKe:getPositionX() + 180)
		slot0.layerBtns.btnZhangHao:setPositionX(slot0.layerBtns.btnZhangHao:getPositionX() - 180)
	end

	slot0:updateLoadingTxtWithSentenceArr(nil, true)

	if IS_IOS_VERIFY and IS_FLIP_BG_IN_VERIFY then
		slot0.bg:setScaleX(-1)
	end

	if IS_IOS_VERIFY and IS_REGISTER_BY_PHONE_NUM == false then
		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerBtnsNewIosVerify:setVisible(true)
	else
		slot0.layerBtnsNewIosVerify:setVisible(false)
	end

	if CUR_SDK_TYPE then
		slot0.layerSdk.btnSdk:loadTextureNormal("res/gameres/ui/txt/txt_" .. CUR_SDK_TYPE .. "denglu.png")
		slot0.layerSdk.btnSdk:loadTexturePressed("res/gameres/ui/txt/txt_" .. CUR_SDK_TYPE .. "denglu.png")
	end
end

LoginCcsView.onKfShowingChanged = function (slot0)
	slot1 = not slot0.model:getIsKfShowing() and not slot0.model:getIsShowingLoadingPane()

	if IS_YYB then
		slot0.layerYYB:setVisible(slot1 and not isYYBForbidGuestLogin)
		slot0.layerYYBNoGuest:setVisible(slot1 and isYYBForbidGuestLogin)
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerSdk:setVisible(false)
	elseif CUR_SDK_TYPE then
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerSdk:setVisible(slot1)
	else
		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerSdk:setVisible(false)
		slot0.layerBtns:setVisible(slot1 and (not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL) and not isSupportPotatoLogin)
		slot0.layerBtnsPotato:setVisible(slot1 and (not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL) and isSupportPotatoLogin)
		slot0.layerBtnsIosVerify:setVisible(slot1 and IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL)
	end
end

LoginCcsView.updateLoadingTxtWithSentenceArr = function (slot0, slot1, slot2)
	if slot0._loadingLabel and not IS_IOS_VERIFY and LOADING_SENTENCES_ARR then
		LOADING_SENTENCES_ARR.__curT = (LOADING_SENTENCES_ARR.__curT or 0) + (slot1 or 0)
		slot4 = LOADING_SENTENCES_ARR.__oldT

		if slot2 or not slot4 or LOADING_SENTENCES_ARR.__intervalS < slot3 - slot4 then
			slot5 = LOADING_SENTENCES_ARR.__oldIndex or 1

			if not slot2 then
				slot5 = slot5 + 1
			end

			if #LOADING_SENTENCES_ARR < slot5 then
				slot5 = 1
			end

			slot0._loadingLabel:setString(LOADING_SENTENCES_ARR[slot5])

			LOADING_SENTENCES_ARR.__oldIndex = slot5

			if not slot2 then
				LOADING_SENTENCES_ARR.__oldT = slot3
			end
		end
	end
end

LoginCcsView.checkSpine = function (slot0)
	if not _loginSpine then
		slot2 = "res/gameres/animation/spine/dengluJM/dengluJM.atlas"
		slot3 = "res/gameres/animation/spine/dengluJM/dengluJM.png"

		if not cc.FileUtils:getInstance():isFileExist("res/gameres/animation/spine/dengluJM/dengluJM.json") then
			return
		end

		if not cc.FileUtils:getInstance():isFileExist(slot2) then
			return
		end

		if not cc.FileUtils:getInstance():isFileExist(slot3) then
			return
		end

		_loginSpine = sp.SkeletonAnimation:create(slot1, slot2)

		_loginSpine:setAnimation(0, "animation", true)
		_loginSpine:setPosition(667, 0)
	end

	if _loginSpine then
		_loginSpine:retain()
		_loginSpine:removeFromParent()

		if not IS_IOS_VERIFY then
			slot0:setClippingEnabled(not (slot0.bg:getContentSize().width == 1624))

			if slot0.bg.getContentSize().width == 1624 then
				uiMgr:adjustSlimWidth(_loginSpine, UIConfig.ALIGN_LEFT)
				uiMgr:adjustSlimWidth(slot0.bg, UIConfig.ALIGN_LEFT)
			end
		end

		slot0.nodeSpine:addChild(_loginSpine)
		_loginSpine:release()
	end
end

LoginCcsView.onRootViewHide = function (slot0)
	slot0.model:setIsShowingLoadingPane(false)
end

LoginCcsView.onRootViewShow = function (slot0)
	slot1 = IS_CHANGE_BG_IN_VERIFY and slot0.bgVerify ~= nil and IS_IOS_VERIFY

	if slot0.bgVerify then
		if slot1 then
			if cc.FileUtils:getInstance():isFileExist("res/gameres/animation/spine/dengluJM/dengluJM_bg3.jpg") then
				slot0.bgVerify:setTexture(cc.Director:getInstance():getTextureCache():addImage(slot2))
			else
				print("文件不存在")
			end
		end

		slot0.bgVerify:setVisible(slot1)
		slot0.bg:setVisible(not slot1)
	end

	slot0:checkSpine()
	slot0.layerLoading.bgTxt:setVisible(not IS_IOS_VERIFY)
	slot0.layerLoading.txtLoadingTips:setVisible(not IS_IOS_VERIFY)

	if not IS_IOS_VERIFY then
		slot0.layerLoading.txtLoadingTips:setString(slot0.model:getRandomLoadingBottomTip())
	end

	mainMgr:requestCheckUpdate()
end

LoginCcsView.getServerTxt = function (slot0)
	if slot0._serverInput then
		return slot0._serverInput:getText()
	else
		return SOCKET_IP .. ":" .. tostring(SOCKET_PORT)
	end
end

LoginCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerBtns.btnYouKe or slot1 == slot0.layerBtnsIosVerify.btnYouKe or slot1 == slot0.layerBtnsPotato.btnYouKe then
		slot0.controller:requestLoginGuest(true)
		trackMgr:recordTracks(TRACK_LOGIN_YKDL)
	elseif slot1 == slot0.layerBtns.btnZhangHao or slot1 == slot0.layerBtnsNewIosVerify.btnZhangHao or slot1 == slot0.layerBtnsPotato.btnZhangHao then
		slot0.model:setIsAccountShowing(true)
		trackMgr:recordTracks(TRACK_LOGIN_ZHDL)
	elseif slot1 == slot0.layerBtns.btnZhuCe or slot1 == slot0.layerBtnsNewIosVerify.btnZhuCe or slot1 == slot0.layerBtnsPotato.btnZhuCe then
		if IS_IOS_VERIFY and IS_REGISTER_BY_PHONE_NUM == false then
			slot0.model:setIsAccountRegByAccShowing(true)
		else
			slot0.model:setIsAccountRegShowing(true)
		end
	elseif slot1 == slot0.btnKf then
		popupMgr:showOnlineServicePopup()
		trackMgr:recordTracks(TRACK_LOGIN_KF)
	elseif slot1 == slot0.layerBtns.btnWeiXin or slot1 == slot0.layerBtnsPotato.btnWeiXin then
		if shengsTest then
			slot0.controller:finishLogin()
		end

		slot0.controller:reqAuthWechat()
	elseif slot1 == slot0.layerBtnsPotato.btnPotato then
		slot0.controller:reqAuthPotato()
	elseif slot1 == slot0.layerYYB.btnWeiXin or slot1 == slot0.layerYYBNoGuest.btnWeiXin then
		slot0.controller:requestYybWXLogin()
	elseif slot1 == slot0.layerYYB.btnYouKe then
		slot0.controller:requestYYBGuestLogin()
	elseif slot1 == slot0.layerYYB.btnQQ or slot1 == slot0.layerYYBNoGuest.btnQQ then
		slot0.controller:requestYybQQLogin()
	elseif slot1 == slot0.layerSdk.btnYouke then
	elseif slot1 == slot0.layerSdk.btnSdk then
		slot0.controller:requestSDKLogin()
	end
end

LoginCcsView.onLoadingPercentChanged = function (slot0)
	slot0.layerLoading.bar.setPercent(slot2, slot0.model:getLoadingPercent() * 100)
	slot0.layerLoading.txtLoadingPercent:setString(parseInt(slot0.model.getLoadingPercent() * 100) .. "%")
end

LoginCcsView.onLoadingTextChanged = function (slot0)
	if slot0._loadingLabel and (IS_IOS_VERIFY or not LOADING_SENTENCES_ARR) then
		slot0._loadingLabel:setString(string.gsub(slot0.model:getLoadingText(), "%\n", ""))
	end
end

LoginCcsView.onLoadingPaneShow = function (slot0, slot1, slot2)
	slot3 = slot0.model:getIsShowingLoadingPane()
	slot4 = 0

	if not slot2 and slot3 then
		slot4 = 0.5
	end

	if IS_YYB then
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerYYB:setVisible(not slot3 and not isYYBForbidGuestLogin)
		slot0.layerYYBNoGuest:setVisible(not slot3 and isYYBForbidGuestLogin)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerSdk:setVisible(false)
	elseif CUR_SDK_TYPE then
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerSdk:setVisible(not slot3)
	else
		if PACKAGE_DEVICE_TYPE == 131 then
			slot0.layerBtns:setVisible(not slot3 and not IS_IOS_VERIFY and not isSupportPotatoLogin)
			slot0.layerBtnsPotato:setVisible(not slot3 and not IS_IOS_VERIFY and isSupportPotatoLogin)
			slot0.layerBtnsIosVerify:setVisible(not slot3 and IS_IOS_VERIFY)
		else
			slot0.layerBtns:setVisible(not slot3 and (not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL) and not isSupportPotatoLogin)
			slot0.layerBtnsPotato:setVisible(not slot3 and (not IS_IOS_VERIFY or not not IS_IOS_VERIFY_ALL) and isSupportPotatoLogin)
			slot0.layerBtnsIosVerify:setVisible(not slot3 and IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL)
		end

		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerSdk:setVisible(false)
	end

	if IS_IOS_VERIFY and IS_REGISTER_BY_PHONE_NUM == false then
		slot0.layerYYB:setVisible(false)
		slot0.layerYYBNoGuest:setVisible(false)
		slot0.layerBtns:setVisible(false)
		slot0.layerBtnsIosVerify:setVisible(false)
		slot0.layerBtnsPotato:setVisible(false)
		slot0.layerBtnsNewIosVerify:setVisible(not slot3)
	else
		slot0.layerBtnsNewIosVerify:setVisible(false)
	end

	if slot3 then
		DisplayUtil.setVisible(slot0.layerLoading, false)
		TweenLite.to(slot0.layerLoading, slot4, {
			autoAlpha = 1
		})
		slot0.model:setIsKfShowing(false)
	else
		TweenLite.to(slot0.layerLoading, slot4, {
			autoAlpha = 0
		})
	end
end

LoginCcsView.destroy = function (slot0)
	if _loginSpine then
		if not tolua.isnull(_loginSpine) then
			_loginSpine:removeFromParent()
		end

		_loginSpine = nil
	end

	if slot0._loadingSentencesUpdateScheduleId then
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0._loadingSentencesUpdateScheduleId)

		slot0._loadingSentencesUpdateScheduleId = nil
	end

	TweenLite.killTweensOf(slot0.layerLoading)
	slot0.model.isShowingLoadingPaneChangedSignal:remove(slot0.onLoadingPaneShow, slot0)
	slot0.model.loadingPercentChangedSignal:remove(slot0.onLoadingPercentChanged, slot0)
	slot0.model.loadingTextChangedSignal:remove(slot0.onLoadingTextChanged, slot0)
	destroySomeObj(slot0.layerBtns.btnYouKe)
	destroySomeObj(slot0.layerBtns.btnZhangHao)
	destroySomeObj(slot0.layerBtns.btnZhuCe)
	destroySomeObj(slot0.layerBtns.btnWeiXin)
	destroySomeObj(slot0.layerBtnsIosVerify.btnYouKe)
	destroySomeObj(slot0.layerBtnsNewIosVerify.btnZhangHao)
	destroySomeObj(slot0.layerBtnsNewIosVerify.btnZhuCe)
	destroySomeObj(slot0.layerBtnsPotato.btnYouKe)
	destroySomeObj(slot0.layerBtnsPotato.btnPotato)
	destroySomeObj(slot0.layerBtnsPotato.btnZhangHao)
	destroySomeObj(slot0.layerBtnsPotato.btnWeiXin)
	destroySomeObj(slot0.layerBtnsPotato.btnZhuCe)
	destroySomeObj(slot0.layerYYB.btnYouKe)
	destroySomeObj(slot0.layerYYB.btnWeiXin)
	destroySomeObj(slot0.layerYYB.btnQQ)
	destroySomeObj(slot0.layerYYBNoGuest.btnWeiXin)
	destroySomeObj(slot0.layerYYBNoGuest.btnQQ)
	destroySomeObj(slot0.layerSdk.btnYouke)
	destroySomeObj(slot0.layerSdk.btnSdk)
	destroySomeObj(slot0.txtVersion_tf)
	destroySomeObj(slot0.btnKf)
	slot0:removeFromParent()
end

return
