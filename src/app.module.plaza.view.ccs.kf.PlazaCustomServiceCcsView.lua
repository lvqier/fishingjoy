PlazaCustomServiceCcsView = class("PlazaCustomServiceCcsView")

PlazaCustomServiceCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.layerMain)
	ClassUtil.extends(slot0, TweenToTargetModuleView, true, "csb/layer/PlazaCustomService.csb", nil, UIConfig.ALIGN_CENTER, false)

	slot0._tabPane = CcsTabPane.new()
	slot1 = {
		slot0.layerMain.tab1,
		slot0.layerMain.tab2,
		slot0.layerMain.tab3,
		slot0.layerMain.tab4
	}

	if IS_SDK_OFFIIAL_VERIFY then
		slot1 = {
			slot0.layerMain.tab3
		}
	end

	slot0._tabPane:setTabCanSelectChecker(function (slot0)
		if slot0 == 4 then
			return slot0.controller:showWechatGuanZhu()
		end

		return true
	end)
	slot0._tabPane:pushTabs(slot1)
	slot0._tabPane.tabClickSignal:add(slot0.onTabSelected, slot0)
	slot0.model.csTabIndexChangedSignal:add(slot0.onTabIndex, slot0)
	slot0:bindChildrenViews()
	slot0.model:setCsTabIndex((IS_SDK_OFFIIAL_VERIFY and 3) or 1)
	slot0.layerMain.tab1.datingTishitubiao:setVisible(false)
	slot0.model.hasNewEMailCountChangedSignal:add(slot0.onHasNewEMailCount, slot0)
end

PlazaCustomServiceCcsView.bindChildrenViews = function (slot0)
	slot0:bindTabView(slot1, "csb/layer/PlazaEMail.csb", slot2, 1, false)
	slot0:bindTabView(slot1, "csb/layer/PlazaKFQQ.csb", slot2, 2, false)
	slot0:bindTabView(slot1, "csb/layer/PlazaKFQA.csb", slot2, 3, false)
	slot0:bindTabView(slot0.layerMain.layerView, "csb/layer/PlazaKFWX.csb", "csTabIndex", 4, false)
end

PlazaCustomServiceCcsView.show = function (slot0, slot1, slot2)
	ZoomPopUpChildView.show(slot0, slot1, slot2)
	traceLog("当前选项：", "'" .. (slot0.model:getCsTabIndex() or 1) .. "'")
	slot0.model:setCsTabIndex(slot0.model:getCsTabIndex() or 1, true)
	slot0.model.hasNewEMailCountChangedSignal:emit()

	if IS_SDK_OFFIIAL_VERIFY then
		slot0.layerMain.tab1:setVisible(false)
		slot0.layerMain.tab2:setVisible(false)
		slot0.layerMain.tab4:setVisible(false)
		slot0.layerMain.tab3.btnNormal:setTouchEnabled(false)
		slot0.layerMain.tab3.btnSelected:setTouchEnabled(false)
	end
end

PlazaCustomServiceCcsView.onZoomShowTweenComplete = function (slot0)
	traceLog("当前选项1：", "'" .. (slot0.model:getCsTabIndex() or 1) .. "'")
	slot0.model:setCsTabIndex(slot0.model:getCsTabIndex() or 1, true)
end

PlazaCustomServiceCcsView.onTabSelected = function (slot0, slot1)
	slot0.model:setCsTabIndex(slot1)
end

PlazaCustomServiceCcsView.onTabIndex = function (slot0)
	slot1 = slot0.model:getCsTabIndex()

	print("当前选项 onTabIndex:", slot1)
	slot0._tabPane:setSelectedTabIndex(slot1)

	if slot1 == 1 then
		trackMgr:recordTracks(TRACK_HALL_XX)
	elseif slot1 == 3 then
		trackMgr:recordTracks(TRACK_KEFU_CKCJWT)
	end
end

PlazaCustomServiceCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerMain.btnClose then
		slot0.model:setIsShowingCustomService(false)
	end
end

PlazaCustomServiceCcsView.onHasNewEMailCount = function (slot0)
	slot0.layerMain.tab1.datingTishitubiao:setVisible(slot0.model:getHasNewEMailCount() > 0)
	slot0.layerMain.tab1.datingTishitubiao.txtTS:setString(slot1)
end

PlazaCustomServiceCcsView.destroy = function (slot0)
	slot0.model.csTabIndexChangedSignal:remove(slot0.onTabIndex, slot0)
	slot0.model.hasNewEMailCountChangedSignal:remove(slot0.onHasNewEMailCount, slot0)
	slot0.layerMain.btnClose:destroy()
end

return
