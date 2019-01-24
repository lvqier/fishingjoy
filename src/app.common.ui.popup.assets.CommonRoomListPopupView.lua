slot2 = "CommonRoomListPopupView"
CommonRoomListPopupView = class(slot1)

CommonRoomListPopupView.ctor = function (slot0)
	slot6 = "csb/layer/PopupCommonRoomList.csb"

	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot13 = slot0.onDatasChanged

	createSetterGetter(slot2, slot0, "datas", nil, nil, nil, nil, handler(slot11, slot0))

	slot5 = nil

	createSetterGetter(slot2, slot0, "onRoomSelectedCallback")

	slot4 = false

	slot0._rootView.setTouchEnabled(slot2, slot0._rootView)

	slot4 = "csb/common/CommonRoomListItem.csb"

	slot0._rootView.view.node.list_lv.setItemResCcsFileName(slot2, slot0._rootView.view.node.list_lv)

	slot4 = -1

	slot0._rootView.view.node.list_lv.setLeftMargin(slot2, slot0._rootView.view.node.list_lv)

	slot4 = 5

	slot0._rootView.view.node.list_lv.setGap(slot2, slot0._rootView.view.node.list_lv)

	slot0._bgAlpha = 1
end

CommonRoomListPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

CommonRoomListPopupView.onDatasChanged = function (slot0)
	slot0._datas = slot0._datas or {}
	slot3 = slot0._datas

	for slot4, slot5 in ipairs(slot2) do
		slot5._dataIndex = slot4
		slot5._onClick = slot0._onRoomSelectedCallback
	end

	slot4 = 2
	slot0._datas = TableUtil.cookDataAs2Dimension(slot2, slot0._datas)
	slot4 = slot0._datas

	slot0._rootView.view.node.list_lv.setDatas(slot2, slot0._rootView.view.node.list_lv)
end

CommonRoomListPopupView.destroy = function (slot0)
	slot3 = slot0._rootView.view.node.list_lv

	destroySomeObj(slot2)

	slot3 = slot0._rootView.btnClose

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
