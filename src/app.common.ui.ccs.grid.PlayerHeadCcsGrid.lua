slot2 = "PlayerHeadCcsGrid"
PlayerHeadCcsGrid = class(slot1)
slot0 = nil

PlayerHeadCcsGrid.onCreationComplete = function (slot0)
	if B_HEADCLIPPING then
		slot8 = slot0
		slot5 = slot0.getContentSize(slot2).height * slot0:getScaleY()
		slot0._initSize = cc.size(slot0, slot0.getContentSize(slot2).width * slot0.getScaleX(slot6))
	else
		slot1 = slot0.getContentSize(slot2)
		slot0._oldBgSize = slot1
		slot4 = slot0
		slot0._bgScaleX = slot0:getScaleX()
		slot4 = slot0
		slot0._bgScaleY = slot0:getScaleY()
		slot5 = slot1.height * slot0._bgScaleY
		slot0._initbgSize = cc.size(slot0, slot1.width * slot0.getScaleX(slot6))
		slot5 = "mask"
		slot0._mask = slot0:getChildByName(slot0)
		slot2 = slot0._mask.getContentSize(slot0)
		slot0._oldMaskSize = slot2
		slot9 = slot0._mask
		slot6 = slot2.height * slot0._mask.getScaleY(slot0._mask)
		slot0._initSize = cc.size(slot0._mask, slot2.width * slot0._mask.getScaleX(slot0))
	end

	slot13 = slot0.onUserDataChanged

	createSetterGetter(slot2, slot0, "userData", nil, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.checkMask(slot2)
end

PlayerHeadCcsGrid.onUserDataChanged = function (slot0)
	if slot0._userData then
		slot0._userData.wFaceID = slot0._userData.wFaceID or 1

		if B_HEADCLIPPING then
			slot3 = slot0
			slot8 = slot0._userData.wGender

			slot0.setSpriteFrame(slot2, mainMgr.getHeadPicById(slot5, mainMgr, slot0._userData.wFaceID))

			slot3 = slot0
			slot3 = slot0.getTexture(slot2)

			slot0.getTexture(slot2).setAntiAliasTexParameters(slot2)

			slot5 = slot0._initSize.height

			DisplayUtil.scale2Fit(slot2, slot0, slot0._initSize.width)
		else
			slot3 = slot0._mask
			slot8 = slot0._userData.wGender

			slot0._mask.setSpriteFrame(slot2, mainMgr.getHeadPicById(slot5, mainMgr, slot0._userData.wFaceID))

			slot3 = slot0._mask
			slot3 = slot0._mask.getTexture(slot2)

			slot0._mask.getTexture(slot2).setAntiAliasTexParameters(slot2)

			slot8 = slot0

			DisplayUtil.scale2Fit(slot2, slot0._mask, slot0._initSize.width / slot0.getScaleX(mainMgr) * slot0._bgScaleX)

			slot3 = slot0._mask

			slot0._mask.setAnchorPoint(slot2, cc.p(slot0._initSize.height / slot0:getScaleY() * slot0._bgScaleY, 0.5))

			slot3 = slot0._mask
			slot8 = slot0._mask
			slot9 = slot0._mask
			slot9 = slot0._mask.getParent(slot0._mask.getParent(0.5))
			slot7 = slot0._mask.getParent(slot0._mask.getParent(0.5)).getContentSize(slot0._mask.getParent(0.5)).height / 2

			slot0._mask.setPosition(slot2, cc.p(slot0._initSize.height / slot0.getScaleY() * slot0._bgScaleY, slot0._mask.getParent(0.5).getContentSize(0.5).width / 2))
		end
	end

	if slot0._userData.cbUserStatus then
		slot3 = slot0._mask
		slot3 = slot0._mask.getParent(slot2)
		slot4 = "recon"

		if slot0._mask.getParent(slot2).getParent(slot2).getChildByName(slot2, slot0._mask.getParent(slot2).getParent(slot2)) then
			if slot0._userData.cbUserStatus == US_OFFLINE then
				slot5 = true

				slot1.isShow(slot3, slot1)
			else
				slot5 = false

				slot1.isShow(slot3, slot1)
			end
		end
	end
end

PlayerHeadCcsGrid.changeHeadBG = function (slot0, slot1)
	if not slot1 or slot0._frame == slot1 then
		return
	end

	slot0._frame = slot1
	slot5 = slot1

	slot0.setTexture(slot3, slot0)

	slot4 = slot0
	slot4 = slot0.getTexture(slot3)

	slot0.getTexture(slot3).setAntiAliasTexParameters(slot3)

	slot6 = slot0._initbgSize.height

	DisplayUtil.scale2Fit(slot3, slot0, slot0._initbgSize.width)

	slot9 = slot0

	DisplayUtil.scale2Fit(slot3, slot0._mask, slot0._initSize.width / slot0.getScaleX(slot7) * slot0._bgScaleX)

	slot4 = slot0._mask

	slot0._mask.setAnchorPoint(slot3, cc.p(slot0._initSize.height / slot0:getScaleY() * slot0._bgScaleY, 0.5))

	slot4 = slot0._mask
	slot9 = slot0._mask
	slot10 = slot0._mask
	slot10 = slot0._mask.getParent(slot0._mask.getParent(0.5))
	slot8 = slot0._mask.getParent(slot0._mask.getParent(0.5)).getContentSize(slot0._mask.getParent(0.5)).height / 2

	slot0._mask.setPosition(slot3, cc.p(slot0._initSize.height / slot0.getScaleY() * slot0._bgScaleY, slot0._mask.getParent(0.5).getContentSize(0.5).width / 2))
end

PlayerHeadCcsGrid.checkMask = function (slot0)
	if not B_HEADCLIPPING then
		return
	end

	slot4 = "mask"

	if slot0.getChildByName(slot2, slot0) == nil then
		return
	end

	slot4 = cc.Node.create(slot0)
	slot8 = slot1.getScale(slot3) * slot0.getScale(slot1)

	slot1.setScale(cc.Node, slot1)

	slot7 = slot1
	slot7 = slot1.getTexture(cc.Node)

	slot1.getTexture(cc.Node).setAntiAliasTexParameters(cc.Node)

	slot7 = slot1

	slot1.removeFromParent(cc.Node)

	slot9 = 0

	slot1.setPosition(cc.Node, slot1, 0)

	slot8 = slot1

	slot4.addChild(cc.Node, slot4)

	slot8 = slot4
	slot5 = cc.ClippingNode.create(cc.Node, cc.ClippingNode)
	slot9 = 0.8

	slot5.setAlphaThreshold(cc.ClippingNode, slot5)

	slot9 = slot5

	slot5.setPosition(slot0, slot0.getPosition(slot11))

	slot10 = slot0

	slot0:removeFromParent()

	slot11 = slot0

	slot5.addChild(slot0, slot5)

	slot10 = slot0
	slot14 = 0

	slot0:setPosition(cc.p(slot0, 0))

	slot12 = slot0:getLocalZOrder()

	slot0.getParent(cc.ClippingNode).addChild(slot0, slot0.getParent(cc.ClippingNode), slot5)
end

PlayerHeadCcsGrid.checkMask2 = function (slot0, slot1)
	slot5 = "mask"

	if slot1.getChildByName(slot3, slot1) == nil then
		return
	end

	slot5 = cc.Node.create(slot0)
	slot9 = slot2.getScale(slot4) * slot0.getScale(slot2)

	slot2.setScale(cc.Node, slot2)

	slot8 = slot2
	slot8 = slot2.getTexture(cc.Node)

	slot2.getTexture(cc.Node).setAntiAliasTexParameters(cc.Node)

	slot8 = slot2

	slot2.retain(cc.Node)

	slot8 = slot2

	slot2.removeFromParent(cc.Node)

	slot10 = 0

	slot2.setPosition(cc.Node, slot2, 0)

	slot9 = slot2

	slot5.addChild(cc.Node, slot5)

	slot8 = slot2

	slot2.release(cc.Node)

	slot9 = slot5
	slot6 = cc.ClippingNode.create(cc.Node, cc.ClippingNode)
	slot10 = 0.8

	slot6.setAlphaThreshold(cc.ClippingNode, slot6)

	slot10 = slot6

	slot6.setPosition(slot1, slot1.getPosition(slot12))

	slot11 = slot1

	slot1:retain()

	slot11 = slot1

	slot1:removeFromParent()

	slot12 = slot1

	slot6.addChild(slot1, slot6)

	slot11 = slot1

	slot1:release()

	slot11 = slot1
	slot15 = 0

	slot1:setPosition(cc.p(slot1, 0))

	slot13 = slot1:getLocalZOrder()

	slot1.getParent(cc.ClippingNode).addChild(slot1, slot1.getParent(cc.ClippingNode), slot6)
end

PlayerHeadCcsGrid.destroy = function (slot0)
	return
end

return
