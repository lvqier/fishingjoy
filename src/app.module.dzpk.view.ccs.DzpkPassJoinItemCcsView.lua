slot2 = "DzpkPassJoinItemCcsView"
DzpkPassJoinItemCcsView = class(slot1)

DzpkPassJoinItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)
end

DzpkPassJoinItemCcsView.updateView = function (slot0)
	if not slot0._data then
		return
	end

	if slot0._data.wRank <= 3 then
		slot4 = false

		slot0.txt_joinRank.setVisible(slot2, slot0.txt_joinRank)

		slot4 = true

		slot0.Sprite_Rank.setVisible(slot2, slot0.Sprite_Rank)

		slot7 = slot0._data.wRank
		slot5 = slot0.controller.getUIPath(slot2, string.format(slot5, "common/dzpkJoinRank%d.png"))

		slot0.Sprite_Rank.setTexture(slot0.controller, slot0.Sprite_Rank)
	else
		slot4 = true

		slot0.txt_joinRank.setVisible(slot2, slot0.txt_joinRank)

		slot4 = false

		slot0.Sprite_Rank.setVisible(slot2, slot0.Sprite_Rank)

		slot4 = slot0._data.wRank

		slot0.txt_joinRank.setString(slot2, slot0.txt_joinRank)
	end

	slot4 = slot0._data.szNickName

	slot0.txt_name.setString(slot2, slot0.txt_name)

	slot8 = true
	slot4 = MathUtil.cookNumWithHansUnits(slot5, slot0._data.lScore, 2) .. "欢乐豆"

	slot0.txt_reward.setString(slot2, slot0.txt_reward)
end

DzpkPassJoinItemCcsView.destroy = function (slot0)
	slot3 = slot0

	CcsListViewItem.destroy(slot2)
end

return
