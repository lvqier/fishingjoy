PlazaReportCcsView = class("PlazaReportCcsView")

PlazaReportCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:init()
end

PlazaReportCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingReport(false)
end

PlazaReportCcsView.init = function (slot0)
	slot0.view.rewardValue_tf:setHtmlText(HtmlUtil.createArtNumWithHansUnits(slot1, "#plist_font_report_d%s.png", nil, nil, nil, nil, -10))

	if Hero:getReportType() == 1 then
		slot0.view.wechatNode.txtWechat:setString(slot3)
		slot0.view.qqNode:setVisible(false)
		slot0.view.wechatNode:setVisible(true)
		slot0.view.reportLineSpr:setVisible(false)
		slot0.view.wechatNode:setPositionX(slot0.view.nodeOnePos:getPositionX())
	elseif Hero:getReportType() == 2 then
		slot0.view.qqNode.txtQQ:setString(slot3)
		slot0.view.qqNode:setVisible(true)
		slot0.view.wechatNode:setVisible(false)
		slot0.view.reportLineSpr:setVisible(false)
		slot0.view.qqNode:setPositionX(slot0.view.nodeOnePos:getPositionX())
	elseif Hero:getReportType() == 3 then
		slot0.view.wechatNode.txtWechat:setString(slot3)
		slot0.view.qqNode.txtQQ:setString(slot4)
		slot0.view.qqNode:setVisible(true)
		slot0.view.wechatNode:setVisible(true)
		slot0.view.reportLineSpr:setVisible(true)
		slot0.view.qqNode:setPositionX(slot0.view.nodeQQPos:getPositionX())
		slot0.view.wechatNode:setPositionX(slot0.view.nodeWechatPos:getPositionX())
	end
end

PlazaReportCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
end

PlazaReportCcsView.hide = function (slot0, slot1, slot2)
	ZoomPopUpChildView.hide(slot0, slot1, slot2)
end

PlazaReportCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingReport(false)
	elseif slot1 == slot0.view.wechatNode.btnConfirm then
		mainMgr:gotoWeChat(Hero:getReportWechatAccout())
		slot0.model:setIsShowingReport(false)
	elseif slot1 == slot0.view.qqNode.btnConfirm then
		mainMgr:gotoQQ(Hero:getReportQQAccout())
		slot0.model:setIsShowingReport(false)
	end
end

PlazaReportCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.wechatNode.btnConfirm)
	destroySomeObj(slot0.view.qqNode.btnConfirm)
	destroySomeObj(slot0.view.rewardValue_tf)
	ZoomPopUpChildView.destroy(slot0)
end

return
