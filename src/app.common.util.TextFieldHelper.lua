TextField.CCNODE_TYPE_SCALE9IMG = "scale9img"
TextField.CCNODE_TYPE_MJ_LAY = "mjLay"
TextField.CCNODE_TYPE_MJ_LAY_GROUP = "mjLayGoup"
TextField.CCNODE_TYPE_MJ_LAY_GROUP_AN_GANG = "mjLayGroupAnGang"
TextField.CCNODE_TYPE_MJ_LAY_GROUP_MING_GANG = "mjLayGroupMingGang"

TextField.CCNodeCreater = function (slot0)
	slot5 = string.split(slot2, slot0.imgSrc)[1]

	if TextField.getCCNodeFromPool("|") then
		if slot2 == TextField.CCNODE_TYPE_MJ_LAY then
			slot8 = parseInt(slot5)

			slot3.setDataInt(slot1[2], slot3)

			slot8 = slot1[3] == "true"

			slot3.setIsGray(slot6, slot3)

			slot8 = slot1[4] == "true"

			slot3.setIsHu(slot6, slot3)
		elseif slot2 == TextField.CCNODE_TYPE_MJ_LAY_GROUP then
			slot7 = ","
			slot8 = string.split(slot5, slot1[2])

			slot3.setData(slot1[2], slot3)
		elseif slot2 == TextField.CCNODE_TYPE_MJ_LAY_GROUP_AN_GANG then
			slot7 = ","
			slot8 = string.split(slot5, slot1[2])

			slot3.setData(slot1[2], slot3)
		elseif slot2 == TextField.CCNODE_TYPE_MJ_LAY_GROUP_MING_GANG then
			slot7 = ","
			slot8 = string.split(slot5, slot1[2])

			slot3.setData(slot1[2], slot3)
		elseif slot2 == TextField.CCNODE_TYPE_SCALE9IMG then
			slot7 = slot1[2]
			slot7 = true

			ccui.ImageView.create(slot5, ccui.ImageView).setScale9Enabled(slot5, slot3)

			slot6 = ccui.ImageView.create(slot5, ccui.ImageView)
			slot10 = slot1[4]

			ccui.ImageView.create(slot5, ccui.ImageView).setContentSize(slot5, cc.size(slot8, slot1[3]))

			slot6 = ccui.ImageView.create(slot5, ccui.ImageView)
			slot12 = slot1[8] or 2

			ccui.ImageView.create(slot5, ccui.ImageView).setCapInsets(slot5, cc.rect(slot8, slot1[5] or 2, slot1[6] or 2, slot1[7] or 2))

			slot7 = false

			slot3.ignoreContentAdaptWithSize(slot5, slot3)

			slot6 = slot3

			slot3.retain(slot5)
		end
	end

	return slot3
end

TextField.onDefaultTextLinkHooker = function (slot0, slot1, slot2)
	slot7 = slot2

	linkMgr.executeLink(slot4, linkMgr, slot1)
end

TextField.getCCNodeFromPool = function (slot0)
	slot1 = nil
	slot2 = false

	if slot0 == TextField.CCNODE_TYPE_MJ_LAY then
		slot7 = false
		slot1, slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MJCardLayPortrait.csb")
	elseif slot0 == TextField.CCNODE_TYPE_MJ_LAY_GROUP then
		slot7 = false
		slot1, slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MJGroupPengUp.csb")
	elseif slot0 == TextField.CCNODE_TYPE_MJ_LAY_GROUP_MING_GANG then
		slot7 = false
		slot1, slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MJGroupGangUp.csb")
	elseif slot0 == TextField.CCNODE_TYPE_MJ_LAY_GROUP_AN_GANG then
		slot7 = false
		slot1, slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MJGroupAnGangUp.csb")
	elseif slot0 == TextField.CCNODE_TYPE_SCALE9IMG then
		slot1 = true
	end

	if slot1 and slot0 ~= TextField.CCNODE_TYPE_SCALE9IMG then
		slot1.__ccsTFType = slot0
	end

	return slot1
end

TextField.try2Cache = function (slot0, slot1)
	slot5 = slot1

	return ccsPoolMgr.put(slot3, ccsPoolMgr)
end

return
