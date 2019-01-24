slot2 = "DzpkPassMatchListCcsView"
DzpkPassMatchListCcsView = class(slot1)

DzpkPassMatchListCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot5 = slot0

	slot0.model.passMatchResponseTabChangedSignal.add(slot2, slot0.model.passMatchResponseTabChangedSignal, slot0.onShow)

	slot4 = "module/dzpk/csb/common/TexasHoldemPassMatchItem.csb"

	slot0.view.passMatch_lv.setItemResCcsFileName(slot2, slot0.view.passMatch_lv)

	slot4 = true

	slot0.view.passMatch_lv.setIsScrollableOnlyInNeed(slot2, slot0.view.passMatch_lv)

	slot4 = 0

	slot0.view.passMatch_lv.setLeftMargin(slot2, slot0.view.passMatch_lv)

	slot4 = 2

	slot0.view.passMatch_lv.setGap(slot2, slot0.view.passMatch_lv)

	slot4 = true

	slot0.view.Text_NoData.setVisible(slot2, slot0.view.Text_NoData)
end

DzpkPassMatchListCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowPassMatchList(slot2, slot0.model)
end

DzpkPassMatchListCcsView.onShow = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getPassMatchResponseTab(slot2) or #slot1 == 0 then
		slot5 = true

		slot0.view.Text_NoData.setVisible(slot3, slot0.view.Text_NoData)

		slot5 = false

		slot0.view.passMatch_lv.setVisible(slot3, slot0.view.passMatch_lv)

		return
	end

	slot6 = false

	slot0.view.Text_NoData.setVisible(slot1, slot0.view.Text_NoData)

	slot6 = true

	slot0.view.passMatch_lv.setVisible(slot1, slot0.view.passMatch_lv)

	slot7 = true

	slot0.view.passMatch_lv.setDatas(slot1, slot0.view.passMatch_lv, TableUtil.reverse(slot3))
end

DzpkPassMatchListCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btn_close then
		slot6 = false

		slot0.model.setIsShowPassMatchList(slot4, slot0.model)
	end
end

DzpkPassMatchListCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.passMatchResponseTabChangedSignal.remove(slot2, slot0.model.passMatchResponseTabChangedSignal, slot0.onShow)

	slot3 = slot0.view.btn_close

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
