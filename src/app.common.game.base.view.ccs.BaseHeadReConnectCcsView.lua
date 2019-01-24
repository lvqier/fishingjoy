slot2 = "BaseHeadReConnectCcsView"
BaseHeadReConnectCcsView = class(slot1)

BaseHeadReConnectCcsView.onCreationComplete = function (slot0)
	slot3 = slot0
	slot0._bgWidth = slot0.getContentSize(slot2).width
	slot3 = slot0
	slot0._bgHeight = slot0.getContentSize(slot2).height
	slot0._imgHeight_1 = 0
	slot0._imgHeight_2 = 0

	if slot0.img_reconnect then
		slot3 = slot0.img_reconnect
		slot0._imgHalfHeight_1 = slot0.img_reconnect.getContentSize(slot2).height / 2
	end

	if slot0.reing then
		slot3 = slot0.reing
		slot0._imgHalfHeight_2 = slot0.reing.getContentSize(slot2).height / 2
	end

	slot0._offHeight = 5
	slot3 = slot0

	slot0.addAni(slot2)

	slot4 = false

	slot0.isShow(slot2, slot0)

	slot4 = false

	slot0.isTouchSwallow(slot2, slot0)
end

BaseHeadReConnectCcsView.addAni = function (slot0)
	if not slot0._ani then
		slot6 = -1
		slot0._ani = AnimationUtil.createWithSpriteSheetInSprite(slot2, slot0.reing, "reconnecting_.png", 4)
	end
end

BaseHeadReConnectCcsView.resetPos = function (slot0)
	if not slot0.img_reconnect or not slot0.reing then
		return
	end

	slot3 = slot0.img_reconnect
	slot7 = 0.5

	slot0.img_reconnect.setAnchorPoint(slot2, cc.p(slot5, 0.5))

	slot3 = slot0.reing
	slot7 = 0.5

	slot0.reing.setAnchorPoint(slot2, cc.p(slot5, 0.5))

	slot3 = slot0.img_reconnect
	slot7 = slot0._bgHeight / 2 - slot0._imgHalfHeight_1 - slot0._offHeight

	slot0.img_reconnect.setPosition(slot2, cc.p(slot5, slot0._bgWidth / 2))

	slot3 = slot0.reing
	slot7 = slot0._bgHeight / 2 + slot0._imgHalfHeight_2 + slot0._offHeight

	slot0.reing.setPosition(slot2, cc.p(slot5, slot0._bgWidth / 2))
end

BaseHeadReConnectCcsView.show = function (slot0)
	if not slot0 then
		return
	end

	if not slot0._ani then
		slot3 = slot0

		slot0.addAni(slot2)
	end

	slot3 = slot0

	slot0.resetPos(slot2)

	slot4 = 100

	slot0.setLocalZOrder(slot2, slot0)

	slot3 = slot0
	slot4 = "bankerFlag"

	if slot0.getParent(slot2).getChildByName(slot2, slot0.getParent(slot2)) then
		slot5 = 200

		slot1.setLocalZOrder(slot3, slot1)
	end

	slot5 = true

	slot0.setVisible(slot3, slot0)

	slot5 = 1

	slot0._ani.gotoAndPlay(slot3, slot0._ani)
end

BaseHeadReConnectCcsView.hide = function (slot0)
	if not slot0 then
		return
	end

	slot4 = false

	slot0.isTouchSwallow(slot2, slot0)

	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot4 = 1

	slot0._ani.gotoAndStop(slot2, slot0._ani)
end

BaseHeadReConnectCcsView.isShow = function (slot0, slot1, slot2)
	if slot1 then
		slot5 = slot0

		slot0.show(slot4)

		slot6 = slot2

		slot0.isTouchSwallow(slot4, slot0)
	else
		slot5 = slot0

		slot0.hide(slot4)
	end
end

BaseHeadReConnectCcsView.isTouchSwallow = function (slot0, slot1)
	slot2 = slot1 or false

	if slot0.swallow then
		slot6 = slot2

		slot0.swallow.setVisible(slot4, slot0.swallow)

		if slot2 == false then
			return
		end

		slot5 = slot0.swallow
		slot8 = slot0

		slot0.swallow.setContentSize(slot4, slot0.getContentSize(slot7))

		slot5 = slot0.swallow
		slot9 = 0

		slot0.swallow.setAnchorPoint(slot4, cc.p(slot7, 0))

		slot5 = slot0.swallow
		slot9 = 0

		slot0.swallow.setPosition(slot4, cc.p(slot7, 0))
	end
end

return
