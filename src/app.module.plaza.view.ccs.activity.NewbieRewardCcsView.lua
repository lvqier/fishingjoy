NewbieRewardCcsView = class("NewbieRewardCcsView")

NewbieRewardCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	Hero.lGrantScoreCountChangedSignal:add(slot0.initData, slot0)
	Hero.registerRewardChangedSignal:add(slot0.initData, slot0)
	slot0:initData()
end

NewbieRewardCcsView.initData = function (slot0)
	slot0._spineAvatar = sp.SkeletonAnimation:create(slot1, slot2)

	slot0._spineAvatar:setPosition(0, 0)
	slot0._spineAvatar:setAnimation(0, "animation", true)
	slot0.view.spine:addChild(slot0._spineAvatar, 2)
	slot0.view.particle:setLocalZOrder(10)

	slot0.view.limitLabel = cc.Label:createWithSystemFont(string.format("活动说明：正式账号才能参与，活动在%s前有效，届时旧包将不能使用", "0日"), "Arial", 26)

	slot0.view.limitLabel:setAnchorPoint(0.5, 0.5)
	slot0.view.limitLabel:setPosition(cc.p(687, 100))
	slot0.view.limitLabel:setColor(cc.c3b(126, 109, 128))
	slot0.view.newbie2:addChild(slot0.view.limitLabel)
end

NewbieRewardCcsView.onShow = function (slot0)
	slot0.newbieType = slot0.model:getIsShowingNewbieReward()

	slot0.view.newbie1:setVisible(slot0.model:getIsShowingNewbieReward() == 1)
	slot0.view.newbie2:setVisible(slot1 == 2 or slot1 == 3)

	if slot0._spine then
		slot0._spine:removeFromParent()
	end

	if slot0._spineBtn then
		slot0._spineBtn:removeFromParent()
	end

	if slot1 == 3 then
		slot0.view.txt_newbie_reward_2:setPosition(cc.p(779, 363))
		slot0.view.txt_newbie_reward_2:setTexture("res/gameres/ui/txt/txt_newpack_promo.png")
		slot0.view.newbie2.num3_tf:setHtmlText(HtmlUtil.createArtNumWithCustomFormat(Hero:getNewPackagePromotion().UpdateVesionGift, "#plist_font_newbie_reward_%s.png", nil, {
			"hld"
		}))

		slot0._spine = sp.SkeletonAnimation:create(slot3, slot4)

		slot0._spine:setPosition(0, 0)
		slot0._spine:setAnimation(0, "animation", true)
		slot0.view.spine:addChild(slot0._spine, 1)

		slot0._spineBtn = sp.SkeletonAnimation:create(slot5, slot6)

		slot0._spineBtn:setPosition(0, 0)
		slot0._spineBtn:setAnimation(0, "animation", true)
		slot0.view.btnGo.sp:addChild(slot0._spineBtn, 2)
		slot0.view.limitLabel:setString(string.format("活动说明：正式账号才能参与，活动在%s前有效，届时旧包将不能使用", Hero.getNewPackagePromotion().UpdateVesionEndDate))
		slot0.view.limitLabel:setVisible(true)
	else
		slot0.view.txt_newbie_reward_2:setPosition(cc.p(759, 363))
		slot0.view.txt_newbie_reward_2:setTexture("res/gameres/ui/txt/txt_newbie_reward.png")

		slot2 = Hero:getLGrantScoreCount()

		slot0.view.newbie2.num3_tf:setHtmlText(HtmlUtil.createArtNumWithCustomFormat(slot3, "#plist_font_newbie_reward_%s.png", nil, {
			"hld"
		}))

		slot0._spine = sp.SkeletonAnimation:create(slot4, slot5)

		slot0._spine:setPosition(0, 0)
		slot0._spine:setAnimation(0, "animation", true)
		slot0.view.spine:addChild(slot0._spine, 1)

		slot0._spineBtn = sp.SkeletonAnimation:create(slot6, slot7)

		slot0._spineBtn:setPosition(0, 0)
		slot0._spineBtn:setAnimation(0, "animation", true)
		slot0.view.btnGo.sp:addChild(slot0._spineBtn, 2)
		slot0.view.limitLabel:setVisible(false)
	end
end

NewbieRewardCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingNewbieReward(false)

	if slot0.newbieType == 3 then
		popupMgr:pop(POPUP_ID_NEW_PACKAGE)
	else
		popupMgr:pop(POPUP_ID_TOURIST_LOGIN_TIP)
	end
end

NewbieRewardCcsView.onBtnClick = function (slot0, slot1)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingNewbieReward(false)

		if slot0.newbieType == 3 then
			popupMgr:pop(POPUP_ID_NEW_PACKAGE)
		else
			popupMgr:pop(POPUP_ID_TOURIST_LOGIN_TIP)
		end
	elseif slot1 == slot0.view.btnGo then
		slot0.model:setIsShowingNewbieReward(false)

		if slot0.model:getIsShowingNewbieReward() == 1 then
			slot0.controller:try2EnterGame(GameKind_DDZ)
			popupMgr:pop(POPUP_ID_TOURIST_LOGIN_TIP)
		elseif slot2 == 2 then
			requireModule("AccountModule")
			ProxyAccount:show(nil, ACCOUNT_OPEN_ACTION_BIND_PHONE)
		else
			OSUtil.openURL(Hero:getNewPackagePromotion().UpdateVersionUrl)
			popupMgr:pop(POPUP_ID_NEW_PACKAGE)
		end
	end
end

NewbieRewardCcsView.destroy = function (slot0)
	Hero.lGrantScoreCountChangedSignal:remove(slot0.initData, slot0)
	Hero.registerRewardChangedSignal:remove(slot0.initData, slot0)
	slot0.view.newbie1.num1_tf:destroy()
	slot0.view.newbie1.num2_tf:destroy()
	slot0.view.newbie2.num3_tf:destroy()
	slot0.view.btnGo:destroy()
	slot0.view.btnClose:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
