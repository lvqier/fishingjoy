SignInCcsView = class("SignInCcsView")

SignInCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.layerMain)
end

SignInCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
end

SignInCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, slot1, slot2)

	if not slot0._titleSpine then
		slot0._titleSpine = spPoolMgr:get("zsb_qiandao")

		slot0.layerMain.layerTitle:addChild(slot0._titleSpine)
		slot0.layerMain.layerTitle:setPosition(cc.p(-12, 243))
	end

	slot0._titleSpine:setAnimation(0, "animation", true)
	Hero:setIsShowSignin(true)
	slot0:refreshView()
end

SignInCcsView.refreshView = function (slot0)
	for slot4 = 1, 7, 1 do
		slot0:updateItemView(slot0.layerMain["fileNode_" .. slot4], slot4)
	end
end

SignInCcsView.updateItemView = function (slot0, slot1, slot2)
	table.sort(slot4, function (slot0, slot1)
		return slot0.SortIndex < slot1.SortIndex
	end)
	slot1.dayImg:loadTexture(ResConfig.getAssetPath("ui/common/signin/singin_tt" .. slot2 .. ".png"))
	slot1.moneyImg:setTexture(ResConfig.getAssetPath("ui/common/signin/singin_img_item" .. slot2 .. ".png"))
	slot1.gold_tf:setHtmlText(HtmlUtil.createArtNumDot(slot0.model:getSignInData().config[slot2].RewardGlod, "#plist_font_yellow_3_%s.png"))

	if slot2 < slot0.model:getSignInData().data[1].SignInID then
		slot1.alreadyGetSpr:setVisible(slot3.IsMC == 1)
		slot1.selectedSpr:setVisible(false)
	elseif slot2 == slot3.SignInID then
		slot1.alreadyGetSpr:setVisible(false)
		slot1.selectedSpr:setVisible(slot3.IsMC == 1)
	else
		slot1.alreadyGetSpr:setVisible(false)
		slot1.selectedSpr:setVisible(false)
	end

	slot0.layerMain.btnGet:setVisible(slot3.TodaySignIn ~= 1)
	slot0.layerMain.btnGetArea:setVisible(slot3.TodaySignIn ~= 1)
	slot0.layerMain.alreadyGet:setVisible(slot3.TodaySignIn == 1)
	slot0.layerMain.lastTimeNode:setVisible(slot3.IsMC == 1)
	slot0.layerMain.payTips:setVisible(slot3.IsMC ~= 1)
	slot0.layerMain.lastTimeNode.lasttime_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot3.EndDay, "#plist_font_mc_day_%s.png", 0, nil, nil, 0, -2) .. HtmlUtil.createImg(ResConfig.getAssetPath("ui/txt/monthcard_day.png"), nil, nil, 0, -2))
end

SignInCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

SignInCcsView.getMoneyBySignId = function (slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		if slot7.ID == slot1 then
			return slot7.RewardGlod
		end
	end

	return 0
end

SignInCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerMain.btnClose then
		slot0.model:setIsShowingSignIn(false)
	elseif slot1 == slot0.layerMain.btnGet or slot1 == slot0.layerMain.btnGetArea then
		if slot0.model:getSignInData().data[1].IsMC == 1 then
			slot0.controller:requestSignIn(function ()
				popupMgr:showRewardPopup(slot0, slot1.SignInID)
				slot0.controller:requestSignInData(function ()
					slot0:refreshView()
				end)
			end)
		else
			tweenMsgMgr:showRedMsg("请先购买月卡，再领取福利")
		end
	end
end

SignInCcsView.destroy = function (slot0)
	destroySomeObj(slot0.layerMain.btnClose)
	destroySomeObj(slot0.layerMain.btnGet)

	if slot0._titleSpine then
		spPoolMgr:put(slot0._titleSpine)

		slot0._titleSpine = nil
	end

	ZoomPopUpChildView.destroy(slot0)
end

return
