DebugLogView = class("DebugLogView")

DebugLogView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot0._touchLayer = nil
	slot0._viewLayer = nil
	slot0._scrollView = nil
	slot0._logBg = nil
	slot0._btnPauseNewMsg = nil
	slot0._btnLogShowSwitcher = nil
	slot0._btnLogScrollSwitcher = nil
	slot0._btnLogClean = nil
	slot0._btnGc = nil
	slot0._btnExit = nil
	slot0._btnShowError = nil
	slot0._btnCheckTickMgr = nil
	slot0._btnPrintDebugMgr = nil
	slot0._btnRemoveUpdate = nil
	slot0._btnGMCmd = nil
	slot0._btnLockBottomSwitcher = nil
	slot0._trigger = nil
	slot0._triggerClickNum = 0
	slot0._autoHideAssets = {}

	slot0.model.isShowingErrorMsgsChangedSignal:add(slot0.onErrorAndNormalMsgSwitch, slot0)
	slot0.model.isLogEntranceShowChangedSignal:add(slot0.onLogEntranceShowChanged, slot0)
	slot0.model.hasBugChangedSignal:add(slot0.onHasBugChagned, slot0)
	tickMgr:delayedCall(handler(slot0, slot0.onTimer2ClearTirggerNum), 3000, -1):changeTraceName("DebugLogView:onTimer2ClearTirggerNum")
	uiMgr.isScreenOrientationRotatedChangedSignal:add(slot0.onIsScreenOrientationRotatedChanged, slot0)
end

DebugLogView.onIsScreenOrientationRotatedChanged = function (slot0)
	if isAndroid and slot0._scrollView then
		slot0._scrollView:setIsScrollViewForceRotated(uiMgr:getIsScreenOrientationRotated())

		if uiMgr.getIsScreenOrientationRotated() then
			slot0._touchLayer:setRotation(90)
			slot0._touchLayer:setPositionY(CONFIG_CUR_HEIGHT)
		else
			slot0._touchLayer:setRotation(0)
			slot0._touchLayer:setPosition(0, 0)
		end
	end
end

DebugLogView.onHasBugChagned = function (slot0)
	if slot0.model:getIsLogEntranceShow() and not slot0.model:getIsLogShow() and slot0._btnLogShowSwitcher then
		slot0._btnLogShowSwitcher:setString(slot0:getKaiLogTxt())
	end
end

DebugLogView.onTimer2ClearTirggerNum = function (slot0)
	slot0._triggerClickNum = 0
end

DebugLogView.onLogEntranceShowChanged = function (slot0)
	slot0._btnLogShowSwitcher:setVisible(slot0.model:getIsLogEntranceShow())

	if isOutServer and not isOutServerTest and not IS_IOS_VERIFY then
		slot0._trigger:setVisible(false)
		slot0._trigger:setTouchEnabled(false)
	else
		slot0._trigger:setVisible(not slot1)
	end
end

DebugLogView.onErrorAndNormalMsgSwitch = function (slot0)
	slot1 = slot0.model:getLogs()
	slot2 = slot0.model:getErrorLogs()

	if slot0.model:getIsShowingErrorMsgs() then
		slot1 = slot2

		slot0._btnShowError:setString("显示正常log")
		slot0._btnShowError:setColor(cc.c3b(0, 255, 0))
	elseif #slot2 > 0 then
		slot0._btnShowError:setString("显示error(" .. slot3 .. ")")
		slot0._btnShowError:setColor(cc.c3b(255, 0, 0))
	else
		slot0._btnShowError:setString("显示error")
		slot0._btnShowError:setColor(cc.c3b(255, 255, 255))
	end

	slot0._scrollView:setDatas(slot1, true)

	if slot0.model:getIsStick2Bottom() then
		slot0._scrollView:jumpToPercent(0, 1)
	end
end

DebugLogView.onMsgPushed = function (slot0)
	if slot0.model:getIsLogShow() and not slot0.model:getIsPauseNewMsg() then
		slot0:onErrorAndNormalMsgSwitch()
	end
end

DebugLogView.onTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		if slot1 == slot0._btnLogShowSwitcher then
			slot0.model._hasBug = false

			slot0.model:setIsLogShow(not slot0.model:getIsLogShow())
		elseif slot1 == slot0._btnLogClean then
			slot0.controller:clearLogs()
		elseif slot1 == slot0._btnExit then
			quick.exit()
		elseif slot1 == slot0._btnGc then
			mainMgr:gc(true)
		elseif slot1 == slot0._btnPrintDebugMgr then
			DebugUtil.try2PrintMark(true)
			tickMgr:printInfo(true)
			TweenLite.printInfo()
			tickMgr:printDebugInfo(true)
			SignalAs3.printDebugInfo()
		elseif slot1 == slot0._btnCheckSignal then
			if not SignalAs3.getIsDebug() then
				slot0._btnCheckSignal:setString("停止调试Signal")
			else
				slot0._btnCheckSignal:setString("开始调试Signal")
			end

			SignalAs3.setIsDebug(slot3)
		elseif slot1 == slot0._btnCheckTickMgr then
			if not tickMgr:isDebug() then
				slot0._btnCheckTickMgr:setString("停止调试TickMgr")
			else
				slot0._btnCheckTickMgr:setString("开始调试TickMgr")
			end

			tickMgr:setDebug(slot3)
		elseif slot1 == slot0._btnPrintTexture then
			if not isMobile then
				mainMgr:printTextureInfo()
			end
		elseif slot1 == slot0._btnShowError then
			slot0.model:setIsShowingErrorMsgs(not slot0.model:getIsShowingErrorMsgs())
		elseif slot1 == slot0._btnPauseNewMsg then
			slot0.model:setIsPauseNewMsg(not slot0.model:getIsPauseNewMsg())
		elseif slot1 == slot0._btnGMCmd then
			popupMgr:showGMCommandPopup()
			slot0.model:setIsLogShow(false)
		elseif slot1 == slot0._btnRemoveUpdate then
			slot0.controller:removeUpdateFile()
		elseif slot1 == slot0._btnLockBottomSwitcher then
			slot0.model:setIsStick2Bottom(not slot0.model:getIsStick2Bottom())
		elseif slot1 == slot0._btnLogScrollSwitcher then
			slot0.model:setCanLogScroll(not slot0.model:getCanLogScroll())
		end
	end
end

DebugLogView.onIsPauseNewMsgChanged = function (slot0)
	if slot0.model:getIsPauseNewMsg() then
		slot0._btnPauseNewMsg:setString("恢复接收信息")
		slot0._btnPauseNewMsg:setColor(cc.c3b(255, 0, 0))
	else
		slot0._btnPauseNewMsg:setString("暂停接收信息")
		slot0._btnPauseNewMsg:setColor(cc.c3b(255, 255, 255))
		slot0:onMsgPushed()
	end
end

DebugLogView.onIsStick2BottomChanged = function (slot0)
	if slot0.model:getIsStick2Bottom() then
		slot0._scrollView:jumpToPercent(0, 1)
	end

	if not slot1 then
		slot0._btnLockBottomSwitcher:setString("锁定底部")
	else
		slot0._btnLockBottomSwitcher:setString("解除锁定底部")
	end
end

DebugLogView.onLogCanScrollChanged = function (slot0)
	slot0._scrollView:setTouchEnabled(slot0.model:getCanLogScroll())

	if slot0.model.getCanLogScroll() then
		slot0._btnLogScrollSwitcher:setString("log滚动")
	else
		slot0._btnLogScrollSwitcher:setString("log不滚")
	end
end

DebugLogView.onLogShowChanged = function (slot0)
	slot1 = slot0.model:getIsLogShow()

	for slot5, slot6 in ipairs(slot0._autoHideAssets) do
		if slot1 then
			if not slot6:getParent() then
				slot0._viewLayer:addChild(slot6)
			end
		elseif slot6:getParent() then
			slot6:removeFromParent()
		end
	end

	slot0._btnLogShowSwitcher:removeFromParent()

	if slot1 then
		slot0._btnLogShowSwitcher:setString("关log")
		slot0:onMsgPushed()
	else
		slot0._btnLogShowSwitcher:setString(slot0:getKaiLogTxt())
	end

	slot0._viewLayer:addChild(slot0._btnLogShowSwitcher)
end

DebugLogView.getKaiLogTxt = function (slot0)
	if slot0.model:getHasBug() then
		return "(有bug，请告诉客户端)开log"
	else
		return "开log"
	end
end

DebugLogView.onTriggerClick = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0._triggerClickNum = slot0._triggerClickNum + 1
		slot3 = 5

		if false and isOutServer and not isOutServerTest then
			slot3 = 10000
		end

		if slot3 <= slot0._triggerClickNum then
			slot0.model:setIsLogEntranceShow(true)
		end
	end
end

DebugLogView.initView = function (slot0, slot1)
	if not slot0._touchLayer then
		slot0._touchLayer = cc.Node:create()

		slot0._touchLayer:setLocalZOrder(1000000000)
		slot0._touchLayer:setContentSize(slot2)
		slot0._touchLayer:retain()

		slot0._trigger = ccui.Layout:create()

		slot0._trigger:setContentSize(cc.size(50, 50))
		slot0._trigger:setBackGroundColorType(0)
		slot0._trigger:addTouchEventListener(handler(slot0, slot0.onTriggerClick))
		slot0._trigger:setTouchEnabled(true)
		slot0._trigger:setBackGroundColor(cc.c4b(255, 255, 0, 0))
		slot0._trigger:setAnchorPoint(cc.p(1, 1))
		slot0._trigger:setPosition(cc.p(display.width, display.height))
		slot0._touchLayer:addChild(slot0._trigger)

		if isOutServer and not isOutServerTest and not IS_IOS_VERIFY then
			slot0._trigger:setVisible(false)
			slot0._trigger:setTouchEnabled(false)
		end

		slot0._viewLayer = ccui.Layout:create()

		slot0._viewLayer:setTouchEnabled(false)
		slot0._touchLayer:addChild(slot0._viewLayer)

		slot0._logBg = display.newLayer(cc.c4f(0, 0, 0, 0.7843137254901961))

		slot0._logBg:setContentSize(cc.size(display.width, display.height))
		slot0._logBg:retain()
		slot0._viewLayer:addChild(slot0._logBg)
		table.insert(slot0._autoHideAssets, slot0._logBg)

		slot0._scrollView = CcsListView.new()

		slot0._scrollView:setIsScrollViewNotRotated(true)
		slot0._scrollView:setForceUpdateItem(false)
		slot0._scrollView:setCanScrollAlways(true)
		slot0._scrollView:retain()
		slot0._scrollView:setGap(0)

		slot0._scrollView.model = slot0.model
		slot0._scrollView.controller = slot0.controller

		slot0._scrollView:setContentSize(slot2)
		slot0._scrollView:setScrollType(CcsListView.SCROLL_TYPE_VARY)
		slot0._scrollView:setScrollPolicy(CcsScrollView.SCROLL_V)
		slot0._scrollView:setPosition(cc.p(0, 0))
		slot0._scrollView:setInnerContainerSize(slot2)
		slot0._scrollView:setItemResCcsFileName(DebugLogCcsListItem)
		slot0._scrollView:setIsScrollable(slot0.model:getCanLogScroll())
		table.insert(slot0._autoHideAssets, slot0._scrollView)
		slot0._viewLayer:addChild(slot0._scrollView)

		slot0._btnLogShowSwitcher = slot0:createBtn("开log", slot3, nil, cc.c3b(255, 0, 0))

		slot0._btnLogShowSwitcher:setAnchorPoint(cc.p(1, 1))
		slot0._btnLogShowSwitcher:setPosition(cc.p(display.width, display.height))

		slot0._btnPrintDebugMgr = slot0:createBtn("输出调试信息", 30, true)

		slot0._btnPrintDebugMgr:setPosition(cc.p(display.width, 0))

		slot0._btnCheckTickMgr = slot0:createBtn("开始调试TickMgr", 30, true)

		slot0._btnCheckTickMgr:setPosition(cc.p(display.width, 60))

		slot0._btnCheckSignal = slot0:createBtn("开始调试Signal", 30, true)

		slot0._btnCheckSignal:setPosition(cc.p(display.width, 120))

		slot0._btnShowError = slot0:createBtn("显示error", 30, true)

		slot0._btnShowError:setPosition(cc.p(display.width, 180))

		slot0._btnRemoveUpdate = slot0:createBtn("删除更新档案", 30, true)

		slot0._btnRemoveUpdate:setPosition(cc.p(display.width, 240))

		slot0._btnLogScrollSwitcher = slot0:createBtn("log不滚", 30, true)

		slot0._btnLogScrollSwitcher:setPosition(cc.p(display.width, 300))

		slot0._btnPrintTexture = slot0:createBtn("输出纹理信息", 30, true)

		slot0._btnPrintTexture:setPosition(cc.p(display.width, 360))

		slot0._btnGc = slot0:createBtn("游戏GC", 30, true)

		slot0._btnGc:setPosition(cc.p(display.width, 420))

		slot0._btnLogClean = slot0:createBtn("清空log", 30, true)

		slot0._btnLogClean:setPosition(cc.p(display.width, 480))

		slot0._btnLockBottomSwitcher = slot0:createBtn("清空log", 30, true)

		slot0._btnLockBottomSwitcher:setPosition(cc.p(display.width, 540))

		slot0._btnGMCmd = slot0:createBtn("输入gm指令", 30, true)

		slot0._btnGMCmd:setPosition(cc.p(display.width, 600))

		slot0._btnPauseNewMsg = slot0:createBtn("暂停接收后台信息", 30, true)

		slot0._btnPauseNewMsg:setPosition(cc.p(display.width, 660))
		slot0.model.logsChangedSignal:add(slot0.onMsgPushed, slot0)
		slot0.model.isLogShowChangedSignal:add(slot0.onLogShowChanged, slot0)
		slot0.model.canLogScrollChangedSignal:add(slot0.onLogCanScrollChanged, slot0)
		slot0.model.isStick2BottomChangedSignal:add(slot0.onIsStick2BottomChanged, slot0)
		slot0.model.isPauseNewMsgChangedSignal:add(slot0.onIsPauseNewMsgChanged, slot0)
		slot0:onLogCanScrollChanged()
		slot0:onIsStick2BottomChanged()
		slot0:onIsPauseNewMsgChanged()
		slot0:onLogShowChanged()
	end

	slot0._touchLayer:removeFromParent()
	slot1:addChild(slot0._touchLayer)
	slot0:onLogEntranceShowChanged()
	slot0:onIsScreenOrientationRotatedChanged()
end

DebugLogView.createBtn = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = ccui.Text:create()

	slot5:retain()
	slot5:setLocalZOrder(1000000000)
	slot5:setFontSize(slot2)
	slot5:setString(slot1)

	if slot4 then
		slot5:setColor(slot4)
	end

	slot5:setAnchorPoint(cc.p(1, 0))
	slot5:setTouchEnabled(true)
	slot5:addTouchEventListener(handler(slot0, slot0.onTouchOperation))
	slot0._viewLayer:addChild(slot5)

	if slot3 then
		table.insert(slot0._autoHideAssets, slot5)
	end

	return slot5
end

DebugLogView.deployAtScene = function (slot0, slot1)
	slot0:initView(slot1)
end

return
