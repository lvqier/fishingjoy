HlssmOnlineCcsView = class("HlssmOnlineCcsView")

HlssmOnlineCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.list_lv:setItemResCcsFileName("module/hlssm/csb/common/HlssmOnlineItem.csb")
	slot0.view.list_lv:setLeftMargin(20)
end

HlssmOnlineCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingOnline(false)
end

HlssmOnlineCcsView.onZoomHideTweenComplete = function (slot0)
	gameMgr.userDatasDicChangedSignal:remove(slot0.onUserDataChagned, slot0)
end

HlssmOnlineCcsView.onZoomShowTweenComplete = function (slot0)
	gameMgr.userDatasDicChangedSignal:add(slot0.onUserDataChagned, slot0)
	slot0:onUserDataChagned()
end

HlssmOnlineCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingOnline(false)
	end
end

HlssmOnlineCcsView.onUserDataChagned = function (slot0)
	slot1 = TableUtil.toArray(gameMgr:getUserDatasDic())

	slot0.view.txtOnline_tf:setHtmlText(slot2 .. "在线")
	table.sort(slot1, slot3)
	slot0.view.list_lv:setDatas(TableUtil.cookDataAs2Dimension(slot1, 3), true)
end

return
