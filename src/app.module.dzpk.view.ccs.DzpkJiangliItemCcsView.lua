slot2 = "DzpkJiangliItemCcsView"
DzpkJiangliItemCcsView = class(slot1)

DzpkJiangliItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

DzpkJiangliItemCcsView.updateView = function (slot0)
	if not slot0._data then
		return
	end

	slot4 = slot0._data.wRank

	slot0.Text_sort.setString(slot2, slot0.Text_sort)

	slot8 = true
	slot4 = MathUtil.cookNumWithHansUnits(slot5, slot0._data.lAward, 2) .. "欢乐豆"

	slot0.Text_jiangli.setString(slot2, slot0.Text_jiangli)

	slot4 = "0"

	slot0.Text_dashifen.setString(slot2, slot0.Text_dashifen)
end

DzpkJiangliItemCcsView.destroy = function (slot0)
	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
