LoginKFQnACcsView = class("LoginKFQnACcsView")

LoginKFQnACcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.list_lv:setLeftMargin(30)
	slot0.view.list_lv:setScrollType(CcsListView.SCROLL_TYPE_VARY)
	slot0.view.list_lv:setItemResCcsFileName("csb/common/LoginKFQAItem.csb")
	slot0.view.list_lv:setGap(25)
	slot0.view.list_lv:setDatas(getCSVField("c_qna"))
	slot0.model:getUpdateKfListViewSignal():add(slot0.onUpdateListView, slot0)
end

LoginKFQnACcsView.onUpdateListView = function (slot0)
	slot0.view.list_lv:setDatas(getCSVField("c_qna"), true)
end

LoginKFQnACcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingKfQnA(false)
end

LoginKFQnACcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0:onRootClick()
	end
end

LoginKFQnACcsView.destroy = function (slot0)
	slot0.model:getUpdateKfListViewSignal():remove(slot0.onUpdateListView, slot0)
	destroySomeObj(slot0.view.list_lv)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
