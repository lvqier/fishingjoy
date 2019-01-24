slot2 = "LrnnPoolListCcsView"
LrnnPoolListCcsView = class(slot1)

LrnnPoolListCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot4 = "module/lrnn/csb/common/LrnnCcListItem.csb"

	slot0.view.list.list_lv.setItemResCcsFileName(slot2, slot0.view.list.list_lv)

	slot4 = 0

	slot0.view.list.list_lv.setGap(slot2, slot0.view.list.list_lv)

	slot5 = slot0

	slot0.model.caijinInfoChangedSignal.add(slot2, slot0.model.caijinInfoChangedSignal, slot0.onCaijinInfo)

	slot5 = slot0

	slot0.model.lAllCaijinChangedSignal.add(slot2, slot0.model.lAllCaijinChangedSignal, slot0.onLastCaijin)

	slot3 = slot0

	slot0.onCaijinInfo(slot2)

	slot3 = slot0

	slot0.onLastCaijin(slot2)
end

LrnnPoolListCcsView.onCaijinInfo = function (slot0)
	slot4 = slot0.model.getCaijinInfo(slot2)

	for slot5, slot6 in ipairs(slot0.model) do
		slot6.index = slot5
	end

	slot6 = true

	slot0.view.list.list_lv.setDatas(slot3, slot0.view.list.list_lv, slot1)
end

LrnnPoolListCcsView.onLastCaijin = function (slot0)
	slot4 = Hero
	slot5 = slot0.model.getLAllCaijin(slot2)[Hero.getWChairID(slot0.model) + 1] or 0
	slot6 = string.format(slot3, "上次彩池发放奖励：%d")

	slot0.view.txtLast_tf.setHtmlText("上次彩池发放奖励：%d", slot0.view.txtLast_tf)
end

LrnnPoolListCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingPoolList(slot4, slot0.model)
	end
end

LrnnPoolListCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingPoolList(slot2, slot0.model)
end

LrnnPoolListCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.caijinInfoChangedSignal.remove(slot2, slot0.model.caijinInfoChangedSignal, slot0.onCaijinInfo)

	slot5 = slot0

	slot0.model.lAllCaijinChangedSignal.remove(slot2, slot0.model.lAllCaijinChangedSignal, slot0.onLastCaijin)

	slot3 = slot0.view.list.list_lv

	slot0.view.list.list_lv.destroy(slot2)

	slot3 = slot0.view.btnClose

	slot0.view.btnClose.destroy(slot2)

	slot3 = slot0.view.txtLast_tf

	slot0.view.txtLast_tf.destroy(slot2)
end

return
