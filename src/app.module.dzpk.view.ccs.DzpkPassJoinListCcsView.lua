slot2 = "DzpkPassJoinListCcsView"
DzpkPassJoinListCcsView = class(slot1)

DzpkPassJoinListCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot5 = slot0

	slot0.model.mySelfPassJoinRankDataChangedSignal.add(slot2, slot0.model.mySelfPassJoinRankDataChangedSignal, slot0.onMySelfPassJoinRankData)

	slot5 = slot0

	slot0.model.passJoinTabChangedSignal.add(slot2, slot0.model.passJoinTabChangedSignal, slot0.onShow)

	slot4 = "module/dzpk/csb/common/TexasHoldemPassJoinItem.csb"

	slot0.view.join_lv.setItemResCcsFileName(slot2, slot0.view.join_lv)

	slot4 = true

	slot0.view.join_lv.setIsScrollableOnlyInNeed(slot2, slot0.view.join_lv)

	slot4 = false

	slot0.view.join_lv.setIsItemClickable(slot2, slot0.view.join_lv)

	slot4 = 5

	slot0.view.join_lv.setLeftMargin(slot2, slot0.view.join_lv)

	slot4 = 10

	slot0.view.join_lv.setGap(slot2, slot0.view.join_lv)

	slot3 = slot0

	slot0.onMySelfPassJoinRankData(slot2)
end

DzpkPassJoinListCcsView.onMySelfPassJoinRankData = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMySelfPassJoinRankData(slot2) then
		slot5 = true

		slot0.view.Sprite_MyRank.setVisible(slot3, slot0.view.Sprite_MyRank)

		slot5 = slot1

		slot0.view.Sprite_MyRank.myRankItem.setData(slot3, slot0.view.Sprite_MyRank.myRankItem)
	else
		slot5 = false

		slot0.view.Sprite_MyRank.setVisible(slot3, slot0.view.Sprite_MyRank)
	end
end

DzpkPassJoinListCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowPassJoinList(slot2, slot0.model)
end

DzpkPassJoinListCcsView.onShow = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getPassJoinTab(slot2) then
		slot5 = false

		slot0.view.join_lv.setVisible(slot3, slot0.view.join_lv)

		return
	end

	slot5 = true

	slot0.view.join_lv.setVisible(slot3, slot0.view.join_lv)

	slot6 = true

	slot0.view.join_lv.setDatas(slot3, slot0.view.join_lv, slot1)
end

DzpkPassJoinListCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btn_close then
		slot6 = false

		slot0.model.setIsShowPassJoinList(slot4, slot0.model)
	end
end

DzpkPassJoinListCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.passJoinTabChangedSignal.remove(slot2, slot0.model.passJoinTabChangedSignal, slot0.onShow)

	slot5 = slot0

	slot0.model.mySelfPassJoinRankDataChangedSignal.remove(slot2, slot0.model.mySelfPassJoinRankDataChangedSignal, slot0.onMySelfPassJoinRankData)

	slot3 = slot0.view.btnSure

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
