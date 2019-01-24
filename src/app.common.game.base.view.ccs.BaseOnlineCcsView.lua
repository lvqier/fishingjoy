slot2 = "BaseOnlineCcsView"
BaseOnlineCcsView = class(slot1)

BaseOnlineCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot1 = ""

	if slot0.model.onlineItemPath then
		slot1 = slot0.model.onlineItemPath
	end

	if not slot0.view.list_lv then
		slot0.view.list_lv = slot0.view.list.list_lv
	end

	slot5 = slot1

	slot0.view.list_lv.setItemResCcsFileName(slot3, slot0.view.list_lv)

	slot5 = 20

	slot0.view.list_lv.setLeftMargin(slot3, slot0.view.list_lv)

	slot5 = true

	slot0.view.list_lv.setForceUpdateItem(slot3, slot0.view.list_lv)
end

BaseOnlineCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingOnline(slot2, slot0.model)
end

BaseOnlineCcsView.onZoomHideTweenComplete = function (slot0)
	slot5 = slot0

	gameMgr.userDatasDicChangedSignal.remove(slot2, gameMgr.userDatasDicChangedSignal, slot0.onUserDataChagned)
end

BaseOnlineCcsView.onZoomShowTweenComplete = function (slot0)
	slot5 = slot0

	gameMgr.userDatasDicChangedSignal.add(slot2, gameMgr.userDatasDicChangedSignal, slot0.onUserDataChagned)

	slot3 = slot0

	slot0.onUserDataChagned(slot2)
end

BaseOnlineCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose or slot1 == slot0.view.btnSure then
		slot6 = false

		slot0.model.setIsShowingOnline(slot4, slot0.model)
	end
end

BaseOnlineCcsView.onUserDataChagned = function (slot0)
	slot6 = slot2 .. "在线"

	slot0.view.txtOnline_tf.setHtmlText(slot4, slot0.view.txtOnline_tf)

	function slot7(slot0, slot1)
		if slot0.lScore ~= slot1.lScore then
			return slot1.lScore < slot0.lScore
		elseif slot0.dwUserID ~= slot1.dwUserID then
			return slot0.dwUserID < slot1.dwUserID
		else
			return false
		end
	end

	table.sort(slot0.view.txtOnline_tf, TableUtil.toArray(gameMgr.getUserDatasDic(slot4)))

	slot7 = slot0.model.onlineDataCount or 3
	slot8 = true

	slot0.view.list_lv.setDatas(gameMgr, slot0.view.list_lv, TableUtil.cookDataAs2Dimension(gameMgr, TableUtil.toArray(gameMgr.getUserDatasDic(slot4))))
end

BaseOnlineCcsView.destroy = function (slot0)
	slot5 = slot0

	gameMgr.userDatasDicChangedSignal.remove(slot2, gameMgr.userDatasDicChangedSignal, slot0.onUserDataChagned)

	slot3 = slot0.view.btnSure

	destroySomeObj(slot2)

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.txtOnline_tf

	destroySomeObj(slot2)

	slot3 = slot0.view.list_lv

	slot0.view.list_lv.destroy(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
