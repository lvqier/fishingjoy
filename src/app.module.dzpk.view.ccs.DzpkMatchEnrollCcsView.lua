slot2 = "DzpkMatchEnrollCcsView"
DzpkMatchEnrollCcsView = class(slot1)

DzpkMatchEnrollCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)
end

DzpkMatchEnrollCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMatchEnroll(slot2, slot0.model)
end

DzpkMatchEnrollCcsView.onShow = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getSelMatchData(slot2) then
		return
	end

	slot5 = slot1.szMatchName

	slot0.view.Text_gameName.setString(slot3, slot0.view.Text_gameName)

	slot5 = slot1.lRegistrationFee

	slot0.view.Text_needMoney.setString(slot3, slot0.view.Text_needMoney)

	slot5 = 1
	slot6 = DateUtil.getDateString(slot3, slot1.StartTime)

	slot0.view.Text_time.setString(slot1.StartTime, slot0.view.Text_time)
end

DzpkMatchEnrollCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnSure then
		slot6 = false

		slot0.model.setIsShowingMatchEnroll(slot4, slot0.model)
	end
end

DzpkMatchEnrollCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnSure

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
