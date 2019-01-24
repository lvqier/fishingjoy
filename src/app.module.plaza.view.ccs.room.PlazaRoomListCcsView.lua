PlazaRoomListCcsView = class("PlazaRoomListCcsView")

PlazaRoomListCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.list_lv:setItemResCcsFileName("csb/common/PlazaRoomListItem.csb")
	slot0.view.list_lv:setLeftMargin(20)
	slot0.view.list_lv:setGap(20)

	slot1 = {}

	for slot5 = 1, 101, 1 do
		slot1[slot5] = slot5
	end

	slot0.view.list_lv:setDatas(TableUtil.cookDataAs2Dimension(slot1, 2))
end

PlazaRoomListCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingRoomList(false)
	end
end

PlazaRoomListCcsView.onBtnClick = function (slot0, slot1, slot2)
	ZoomPopUpChildView.destroy(slot0)
end

return
