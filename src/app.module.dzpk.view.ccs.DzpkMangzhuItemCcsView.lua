slot2 = "DzpkMangzhuItemCcsView"
DzpkMangzhuItemCcsView = class(slot1)

DzpkMangzhuItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

DzpkMangzhuItemCcsView.updateView = function (slot0)
	slot3 = slot0.model
	slot1 = slot0.model.getSelMatchData(slot2)

	if not slot0._data or not slot1 then
		return
	end

	slot5 = slot0._data.wLevel

	slot0.Text_level.setString(slot3, slot0.Text_level)

	slot5 = true

	slot0.icon.setVisible(slot3, slot0.icon)

	if slot1.wRebuyMinLevel <= slot0._data.wLevel and slot0._data.wLevel <= slot1.wRebuyMaxLevel then
		slot4 = slot0.icon
		slot8 = "common/dzpkInfo_icon5.png"

		slot0.icon.setTexture(slot3, slot0.controller.getUIPath(slot6, slot0.controller))
	elseif slot1.wAddOnMinLevel <= slot0._data.wLevel and slot0._data.wLevel <= slot1.wAddOnMaxLevel then
		slot4 = slot0.icon
		slot8 = "common/dzpkInfo_icon6.png"

		slot0.icon.setTexture(slot3, slot0.controller.getUIPath(slot6, slot0.controller))
	else
		slot5 = false

		slot0.icon.setVisible(slot3, slot0.icon)
	end

	slot6 = true
	slot7 = true
	slot7 = slot2 .. "/" .. MathUtil.cookNumWithHansUnits(slot0._data.lSmallBlind, slot0._data.lBigBlind, 2)

	slot0.Text_mangZhu.setString(slot0._data.lBigBlind, slot0.Text_mangZhu)

	slot7 = slot0._data.lAnte

	slot0.Text_qiangZhu.setString(slot0._data.lBigBlind, slot0.Text_qiangZhu)

	slot7 = slot0._data.dwGrowthTime .. "秒"

	slot0.Text_shengMangTime.setString(slot0._data.lBigBlind, slot0.Text_shengMangTime)
end

DzpkMangzhuItemCcsView.destroy = function (slot0)
	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
