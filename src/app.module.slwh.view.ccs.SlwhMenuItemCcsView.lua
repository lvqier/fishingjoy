slot2 = "SlwhMenuItemCcsView"
SlwhMenuItemCcsView = class(slot1)

SlwhMenuItemCcsView.onCreationComplete = function (slot0)
	slot4 = CcsListViewItem

	ClassUtil.extends(slot2, slot0)

	slot0._hashValue = -1
	slot0._rewardType = -1
	slot0._zhxType = -1
	slot0._animalIndex = -1
end

SlwhMenuItemCcsView.updateView = function (slot0)
	if not slot0._data then
		return
	end

	slot5 = "spine_menuitem_show"

	if slot0.getChildByName(slot3, slot0) then
		slot6 = slot2

		TreeCacheManager.recycleCocos2dxObject(slot4, TreeCacheManager)
	end

	if slot1._index == 1 then
		slot6 = "spine_menuitem_show"
		slot3 = TreeCacheManager.getCacheObject(slot4, TreeCacheManager)

		slot3.setName(TreeCacheManager, slot3)

		slot6 = slot0.bg
		slot9, slot10 = slot0.bg.getPosition(TreeCacheManager)

		slot3.setPosition("spine_menuitem_show", slot3, slot4)

		slot11 = true

		slot3.setAnimation("spine_menuitem_show", slot3, 0, "animation")

		slot9 = slot3

		slot0.addChild("spine_menuitem_show", slot0)
	end

	if slot0._hashValue == slot1.cbType * 1000 + slot1.cbZHX * 100 + slot1.cbAwardIndex * 10 then
		return
	end

	slot0._hashValue = slot3
	slot5 = "slwh_animal_%d.png"

	if slot1.cbType == Tree.RewardType.RewardType_Normal then
		slot9 = slot1.cbAwardIndex
		slot10 = string.format(slot7, slot5)

		slot0.bg.setSpriteFrame(slot5, slot0.bg)
	else
		slot9 = (slot4 + Tree.CardType.CardType_Max) - 1
		slot10 = string.format(slot7, slot5)

		slot0.bg.setSpriteFrame(slot5, slot0.bg)
	end

	slot9 = slot1.cbZHX
	slot10 = string.format(slot7, slot5)

	slot0.sprite_zxh.setSpriteFrame(slot5, slot0.sprite_zxh)
end

SlwhMenuItemCcsView.onClick = function (slot0)
	return
end

return
