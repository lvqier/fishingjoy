slot2 = "BaseMenuCcsView"
BaseMenuCcsView = class(slot1)

BaseMenuCcsView.onCreationComplete = function (slot0)
	slot1 = cc.EventListenerTouchOneByOne.create(slot2)
	slot5 = false

	slot1.setSwallowTouches(cc.EventListenerTouchOneByOne, slot1)

	slot8 = slot0.onClick2CloseMenu
	slot6 = cc.Handler.EVENT_TOUCH_BEGAN

	slot1.registerScriptHandler(cc.EventListenerTouchOneByOne, slot1, handler(slot6, slot0))

	slot4 = slot0
	slot6 = slot0

	slot0.getEventDispatcher(cc.EventListenerTouchOneByOne).addEventListenerWithSceneGraphPriority(cc.EventListenerTouchOneByOne, slot0.getEventDispatcher(cc.EventListenerTouchOneByOne), slot1)

	if (IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_BANK) or IS_YYB_VERIFY or IS_SDK_VERIFY then
		slot2 = {}
		slot3 = {}
		slot6 = slot0.ccsChildren

		for slot7, slot8 in ipairs(slot5) do
			if slot8 ~= slot0.btnClose then
				slot12 = ZoomCcsBtn

				if ClassUtil.is(slot10, slot8) then
					slot12 = slot8

					table.insert(slot10, slot2)

					if slot8 ~= slot0.btnBank then
						slot12 = slot8

						table.insert(slot10, slot3)
					end
				end
			end
		end

		slot6 = slot2
		slot0._btnGroups4IosVerify = ComponentsGroup.new(slot5)
		slot7 = slot3

		slot0._btnGroups4IosVerify.showThese(slot5, slot0._btnGroups4IosVerify)
	end
end

BaseMenuCcsView._onTabChangedShow = function (slot0, slot1)
	if not slot1 then
		slot5 = slot0

		uiMgr.centerLocate(slot3, uiMgr)

		slot6 = ZORDER_UI_FULL + 1

		uiMgr.showView(slot3, uiMgr, slot0)

		slot4 = slot0.model

		if not slot0.model.getIsNotAdjustMenuSlimWidth(slot3) then
			slot7 = 80

			slot0.controller.adjustSlimWidth(slot3, slot0.controller, slot0, UIConfig.ALIGN_LEFT)
		end
	else
		slot4 = slot0.model

		if not slot0.model.getIsNotAdjustMenuSlimWidth(slot3) then
			slot7 = 80

			slot0.controller.adjustSlimWidth(slot3, slot0.controller, slot0, UIConfig.ALIGN_LEFT)
		end

		if not slot0._toPos then
			slot6 = slot0
			slot0._toPos = DisplayUtil.ccpCopy(slot0.getPosition(slot5))
			slot6 = slot0
			slot0._fromPos = DisplayUtil.ccpCopy(slot0.getPosition(slot5))
			slot0._fromPos.y = slot0._fromPos.y + 100
			slot5 = slot0._fromPos

			slot0.setPosition(slot0._fromPos.y + 100, slot0)

			slot5 = false

			DisplayUtil.setVisible(slot0._fromPos.y + 100, slot0)
		end

		slot6 = true

		DisplayUtil.setAddOrRemoveChild(slot3, slot0, slot1)

		slot6 = {
			x = slot0._toPos.x,
			y = slot0._toPos.y,
			ease = Back.easeOut
		}

		TweenLite.to(slot3, slot0, 0.3)

		slot6 = {
			autoAlpha = 1
		}

		TweenLite.to(slot3, slot0, 0.1)
	end
end

BaseMenuCcsView.onClick2CloseMenu = function (slot0, slot1, slot2)
	slot5 = slot0.model

	if slot0.model.getIsShowingMenu(slot4) then
		if slot0.bg then
			slot5 = slot0.bg
			slot8 = slot1

			if not DisplayUtil.hitTestNode(slot4, slot1.getLocation(slot7)) then
				slot6 = false

				slot0.model.setIsShowingMenu(slot4, slot0.model)
			end
		else
			slot6 = false

			slot0.model.setIsShowingMenu(slot4, slot0.model)
		end
	end
end

BaseMenuCcsView.onHideComplete = function (slot0)
	slot3 = slot0

	slot0.removeFromParent(slot2)

	slot3 = slot0._try2Put2PoolFuc

	applyFunction(slot2)

	slot0._try2Put2PoolFuc = nil
end

BaseMenuCcsView._onTabChangedHide = function (slot0, slot1, slot2)
	slot0._try2Put2PoolFuc = slot2

	if slot0._fromPos then
		slot7 = {
			autoAlpha = 0,
			x = slot0._fromPos.x,
			y = slot0._fromPos.y,
			onComplete = handler(slot9, slot0)
		}
		slot11 = slot0.onHideComplete

		TweenLite.to(slot4, slot0, 0.2)
	else
		slot5 = slot0

		slot0.onHideComplete(slot4)
	end
end

BaseMenuCcsView.onBtnClick = function (slot0, slot1, slot2)
	slot6 = false

	slot0.model.setIsShowingMenu(slot4, slot0.model)

	if slot1 == slot0.btnBank then
		slot5 = slot0.controller

		slot0.controller.try2OpenBank(slot4)
	elseif slot1 == slot0.btnClose then
		slot6 = false

		slot0.model.setIsShowingMenu(slot4, slot0.model)
	elseif slot1 == slot0.btnRule then
		slot6 = true

		slot0.model.setIsShowingRule(slot4, slot0.model)
	elseif slot1 == slot0.btnSetting then
		slot6 = true

		slot0.model.setIsShowingSetting(slot4, slot0.model)
	elseif slot1 == slot0.btnBack then
		slot5 = slot0.controller

		slot0.controller.try2ExitBattle(slot4)
	elseif slot1 == slot0.btnChange then
		slot5 = slot0.controller

		slot0.controller.onBtnChangedClick(slot4)
	end
end

BaseMenuCcsView.destroy = function (slot0)
	slot3 = slot0

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.btnBank

	destroySomeObj(slot2)

	slot3 = slot0.btnRule

	destroySomeObj(slot2)

	slot3 = slot0.btnSetting

	destroySomeObj(slot2)

	slot3 = slot0.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.btnChange

	destroySomeObj(slot2)

	slot3 = slot0

	slot0.removeFromParent(slot2)
end

return
