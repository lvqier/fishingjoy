PlazaRankCcsView = class("PlazaRankCcsView")

PlazaRankCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.list1_lv:setItemResCcsFileName("csb/common/PlazaRankItem.csb")
	slot0.view.list1_lv:setGap(2)
	slot0.view.list2_lv:setItemResCcsFileName("csb/common/PlazaRankItem.csb")
	slot0.view.list2_lv:setGap(2)

	slot0.list = {
		slot0.view.list1_lv,
		slot0.view.list2_lv
	}
	slot0._tabPane = CcsTabPane.new()
	slot0._loadingAnimation = nil

	slot0._tabPane:pushTabs(slot1)
	slot0._tabPane.tabClickSignal:add(slot0.onTabSelected, slot0)
	slot0.model.rankTabIndexChangedSignal:add(slot0.onTabIndex, slot0)
	slot0.model.rankListDataChangedSignal:add(slot0.rankListDataChanged, slot0)

	if NewbieUI then
		NewbieUI.rankViewTab1 = slot0.view.tab1
	end
end

PlazaRankCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	slot0:updateView()
	eventMgr:dispatch(GameEvent.PLAZA_RANK_SHOW_COMPLETE)
end

PlazaRankCcsView.onZoomHideTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
	eventMgr:dispatch(GameEvent.PLAZA_RANK_HIDE_COMPLETE)
end

PlazaRankCcsView.doHideCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)

	slot2 = TimelineLite.new()

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		y = slot0.layerTitle._initY + 40,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		scale = 0.7,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		y = slot0._initY + 20,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 0.8,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))
end

PlazaRankCcsView.doShowCustomPopupEffect = function (slot0, slot1)
	slot0.view.list1_lv:jumpToPercent(0, 0)
	slot0.view.list2_lv:jumpToPercent(0, 0)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)
	DisplayUtil.setVisible(slot0.layerTitle, false)
	slot0.layerTitle:setScale(0.7)

	if not slot0.layerTitle._initY then
		slot0.layerTitle._initY = slot0.layerTitle:getPositionY()

		slot0.layerTitle:setPositionY(slot0.layerTitle._initY + 40)
	end

	slot2 = TimelineLite.new({
		delay = 0.04
	})

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		y = slot0.layerTitle._initY
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.3, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
	slot0._zoomLayer:setPositionY(slot0._initY + 20)
	DisplayUtil.setVisible(slot0._zoomLayer, false)
	slot0._zoomLayer:setScale(0.8)

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		y = slot0._initY,
		ease = Quad.easeIn
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
end

PlazaRankCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingRank(false)
end

PlazaRankCcsView.onTabSelected = function (slot0, slot1)
	slot0.model:setRankTabIndex(slot1, true)
end

PlazaRankCcsView.onTabIndex = function (slot0)
	slot0._tabPane:setSelectedTabIndex(slot1)
	slot0.controller:requestRankDataByTabIndex(slot1)
	slot0:setLoadingShowing(true)

	for slot5, slot6 in ipairs(slot0.list) do
		slot6:setVisible(slot5 == slot1)
	end

	eventMgr:dispatch(GameEvent.PLAZA_RANK_CHANGE_TAB)
end

PlazaRankCcsView.rankListDataChanged = function (slot0)
	slot1 = slot0.model:getRankListData()
	slot2 = slot0.model:getRankTabIndex()

	if not IS_YYB_VERIFY and not IS_SDK_VERIFY then
		slot0.list[slot2]:setDatas(slot1[slot2])
	end

	slot0:setLoadingShowing(false)
end

PlazaRankCcsView.setLoadingShowing = function (slot0, slot1)
	if slot1 then
		if not slot0._loadingAnimation then
			slot0._loadingAnimation = AnimationUtil.createWithSpriteSheetInSprite(slot0.view.layerLoading.spLoading, "plist_gadget_loading_.png", 4, -1)
		else
			slot0._loadingAnimation:gotoAndPlay(1)
		end
	else
		slot0._loadingAnimation:gotoAndStop(1)
	end

	slot0.view.layerLoading:setVisible(slot1)
end

PlazaRankCcsView.updateView = function (slot0)
	slot0:onTabSelected(2)
end

PlazaRankCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingRank(false)
	end
end

PlazaRankCcsView.destroy = function (slot0)
	if NewbieUI then
		NewbieUI.rankViewTab1 = nil
	end

	if slot0._loadingAnimation then
		slot0._loadingAnimation:destroy()

		slot0._loadingAnimation = nil
	end

	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)
	slot0.model.rankTabIndexChangedSignal:remove(slot0.onTabIndex, slot0)
	slot0.model.rankListDataChangedSignal:remove(slot0.rankListDataChanged, slot0)
	slot0._tabPane:destroy()
	slot0.view.list1_lv:destroy()
	slot0.view.list2_lv:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
