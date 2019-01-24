slot2 = "DzpkPassMatchItemCcsView"
DzpkPassMatchItemCcsView = class(slot1)

DzpkPassMatchItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

DzpkPassMatchItemCcsView.updateView = function (slot0)
	if not slot0._data then
		return
	end

	slot4 = slot0._data.szMatchName

	slot0.txt_gameName.setString(slot2, slot0.txt_gameName)

	slot8 = true
	slot4 = MathUtil.cookNumWithHansUnits(slot5, slot0._data.lAward, 2) .. "欢乐豆"

	slot0.txt_reward.setString(slot2, slot0.txt_reward)

	slot9 = slot0._data.StartTime.wSecond
	slot5 = string.format(slot2, "%d-%d-%d %d:%02d:%02d", slot0._data.StartTime.wYear, slot0._data.StartTime.wMonth, slot0._data.StartTime.wDay, slot0._data.StartTime.wHour, slot0._data.StartTime.wMinute)

	slot0.txt_time.setString("%d-%d-%d %d:%02d:%02d", slot0.txt_time)
end

DzpkPassMatchItemCcsView.onClick = function (slot0)
	if not slot0._data then
		return
	end

	slot4 = slot0._data.dwPeriodID

	slot0.controller.requestPassJoinInfo(slot2, slot0.controller)

	slot4 = true

	slot0.model.setIsShowPassJoinList(slot2, slot0.model)
end

DzpkPassMatchItemCcsView.destroy = function (slot0)
	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
