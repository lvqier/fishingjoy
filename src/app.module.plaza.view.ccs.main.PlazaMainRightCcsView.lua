PlazaMainRightCcsView = class("PlazaMainRightCcsView")

PlazaMainRightCcsView.onCreationComplete = function (slot0)
	slot1 = {
		[5] = {
			cc.p(1282, 602),
			cc.p(1282, 500),
			cc.p(1282, 396),
			cc.p(1282, 295),
			cc.p(1282, 193)
		},
		[4] = {
			cc.p(1282, 585),
			cc.p(1282, 457),
			cc.p(1282, 334),
			cc.p(1282, 210)
		},
		[3] = {
			cc.p(1282, 585),
			cc.p(1282, 457),
			cc.p(1282, 334),
			cc.p(1282, 210)
		},
		[2] = {
			cc.p(1282, 585),
			cc.p(1282, 457),
			cc.p(1282, 334),
			cc.p(1282, 210)
		}
	}
	slot0.btnPaiHangBang._spine = sp.SkeletonAnimation:create("gameres/animation/spine/zsbdt_phbeffect/zsbdt_phbeffect.json", "gameres/animation/spine/zsbdt_phbeffect/zsbdt_phbeffect.atlas")

	slot0.btnPaiHangBang._spine:setAnimation(0, "animation", true)
	slot0.btnPaiHangBang.spine:addChild(slot0.btnPaiHangBang._spine)

	slot0._btns = {
		slot0.btnKefu,
		slot0.btnPaiHangBang,
		slot0.btnYingHang,
		slot0.btnActivity
	}

	if IS_SDK_OFFIIAL_VERIFY then
		slot0._btns = {
			slot0.btnPaiHangBang,
			slot0.btnYingHang
		}
	end

	if slot0.btnBackup then
		if IS_IOS_IN_HOUSE then
			table.insert(slot0._btns, slot0.btnBackup)
		end

		slot0.btnBackup:setVisible(IS_IOS_IN_HOUSE)
	end

	for slot5, slot6 in ipairs(slot0._btns) do
		slot6:setPosition(slot1[#slot0._btns][slot5])
	end

	for slot5, slot6 in ipairs(slot0._btns) do
		slot6._initX = slot6:getPositionX()
		slot6._initScale = slot6:getScale()

		DisplayUtil.setVisible(slot6, false)
	end

	if IS_IOS_VERIFY then
		slot0._btnGroups4IosVerify = ComponentsGroup.new(slot0._btns)
		slot2 = nil

		if IS_IOS_VERIFY_ALL_NO_BANK then
			slot2 = {}

			slot0.bg:setScaleY(0.3)
		else
			slot2 = {
				slot0.btnYingHang
			}

			slot0.bg:setScaleY(0.44)
		end

		slot0._btnGroups4IosVerify:showThese(slot2)

		slot0._btns = slot2
	end

	slot0.btnKefu.datingTishitubiao:setVisible(false)
	slot0.model.hasNewEMailCountChangedSignal:add(slot0.onHasNewEMailCount, slot0)
	uiMgr:adjustSlimWidth(slot0, UIConfig.ALIGN_RIGHT, -77)
	ClassUtil.extends(slot0, BasePlazaTweenComponent, true, 300, nil, nil, nil, 0)

	slot0._spineKFMsg = nil

	slot0:setKfMsgIconShowing(Hero:getNeed2ShowKfMsg())
end

PlazaMainRightCcsView.setKfMsgIconShowing = function (slot0, slot1)
	if slot1 then
		if not slot0._spineKFMsg then
			slot4 = sp.SkeletonAnimation:create(slot2, slot3)

			slot4:setAnimation(0, "animation", true)
			slot4:setPosition(8.66, 48.1)
			slot0.btnKefu:addChild(slot4)

			slot0._spineKFMsg = slot4
		end
	elseif slot0._spineKFMsg then
		slot0._spineKFMsg:removeFromParent()

		slot0._spineKFMsg = nil
	end
end

PlazaMainRightCcsView.doShow = function (slot0, slot1, slot2)
	if slot1 <= 0 then
		slot0:setPosition(slot0._toPos)
		slot0:onShowComplete()

		for slot6, slot7 in ipairs(slot0._btns) do
			TweenLite.killTweensOf(slot7)
			DisplayUtil.setVisible(slot7, true)
			slot7:setScale(slot7._initScale)
		end

		slot0:setOpacity(255)
	else
		slot3 = CustomEase.byName("myShakeEase1")

		for slot7, slot8 in ipairs(slot0._btns) do
			TweenLite.to(slot8, 0.2, {
				autoAlpha = 1,
				scale = slot8._initScale,
				x = slot8._initX,
				delay = slot7 * 0.05 + 0.2
			})
		end

		TweenLite.to(slot0, 1, {
			alpha = 1,
			x = slot0._toPos.x,
			y = slot0._toPos.y,
			onComplete = handler(slot0, slot0.onShowComplete),
			delay = slot2,
			ease = slot3
		})
	end

	if NewbieUI then
		NewbieUI.plazaLeftBtnRank = slot0.btnPaiHangBang
	end

	if IS_SDK_OFFIIAL_VERIFY then
		slot0.btnActivity:setVisible(false)
		slot0.btnKefu:setVisible(false)
	end
end

PlazaMainRightCcsView.onShowComplete = function (slot0)
	BasePlazaTweenComponent.onShowComplete(slot0)
	eventMgr:dispatch(GameEvent.PLAZA_MAIN_RIGHT_SHOW_COMPLETE)
end

PlazaMainRightCcsView.doHide = function (slot0, slot1, slot2)
	eventMgr:dispatch(GameEvent.PLAZA_MAIN_LEFT_HIDE_BEGIN)

	if slot1 <= 0 then
		slot0:setPosition(slot0._fromPos)

		for slot6, slot7 in ipairs(slot0._btns) do
			TweenLite.killTweensOf(slot7)
			DisplayUtil.setVisible(slot7, false)
			slot7:setScale(slot7._initScale * 1.3)
		end

		slot0:onHideComplete()
		slot0:setOpacity(0)
	else
		slot3 = #slot0._btns

		for slot7, slot8 in ipairs(slot0._btns) do
			TweenLite.to(slot8, 0.1, {
				autoAlpha = 0,
				scale = slot8._initScale * 1.3,
				delay = (slot2 or 0) + (slot3 - slot7) * 0.1
			})
		end

		TweenLite.to(slot0, slot1, {
			alpha = 0,
			x = slot0._fromPos.x,
			y = slot0._fromPos.y,
			onComplete = handler(slot0, slot0.onHideComplete),
			delay = slot2
		})
	end

	if NewbieUI then
		NewbieUI.plazaLeftBtnRank = nil
	end
end

PlazaMainRightCcsView.onHasNewEMailCount = function (slot0)
	slot0.btnKefu.datingTishitubiao:setVisible(slot0.model:getHasNewEMailCount() > 0)
	slot0.btnKefu.datingTishitubiao.txtTS:setString(slot1)
end

PlazaMainRightCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnYingHang then
		slot0.controller:openBankModule()
		trackMgr:recordTracks(TRACK_HALL_YH)
	elseif slot1 == slot0.btnPaiHangBang then
		slot0.model:setIsShowingRank(true)
		trackMgr:recordTracks(TRACK_HALL_PHB)
	elseif slot1 == slot0.btnKefu then
		slot0.model:setIsShowingCustomService(true)
		slot0:setKfMsgIconShowing(false)
		Hero:setNeed2ShowKfMsg(false)
		trackMgr:recordTracks(TRACK_HALL_KF)
	elseif slot1 == slot0.btnBackup then
		slot0.controller:gotoBackup()
	elseif slot1 == slot0.btnActivity then
		requireModule("ActivityModule")
		ProxyActivity:show()
	else
		tweenMsgMgr:showWhiteMsg("该功能尚未开放！")
	end
end

return
