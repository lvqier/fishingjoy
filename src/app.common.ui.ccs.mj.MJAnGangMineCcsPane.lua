slot2 = "MJAnGangMineCcsPane"
MJAnGangMineCcsPane = class(slot1)

MJAnGangMineCcsPane.onCreationComplete = function (slot0)
	slot4 = BaseMJCardGroupPane

	ClassUtil.extends(slot2, slot0)
end

MJAnGangMineCcsPane.playAnimation = function (slot0, slot1)
	if IS_NO_CHAPAI_ANIMATION then
		return
	end

	slot1 = slot1 or 0
	slot2 = TimelineLite.new(slot3)
	slot5 = slot0._covers

	for slot6, slot7 in ipairs({
		timeScale = TIME_SCALE_GANG
	}) do
		slot11 = false

		DisplayUtil.setVisible(slot9, slot7)

		slot11 = slot7.initX + 100

		slot7.setPositionX(slot9, slot7)

		slot10 = slot2
		slot15 = {
			autoAlpha = 1,
			x = slot7.initX,
			delay = slot1,
			ease = Back.easeOut
		}

		slot2.insert(slot9, TweenLite.to(slot12, slot7, 0.3))
	end

	slot6 = false

	DisplayUtil.setVisible(slot4, slot0.mj1)

	slot6 = slot0.mj1.initY + 80

	slot0.mj1.setPositionY(slot4, slot0.mj1)

	slot5 = slot2
	slot10 = {
		autoAlpha = 1,
		delay = 0.3 + slot1
	}

	slot2.insert(slot4, TweenLite.to(slot7, slot0.mj1, 0.3))

	slot5 = slot2
	slot10 = {
		y = slot0.mj1.initY,
		delay = 0.3 + slot1,
		ease = Cubic.easeIn
	}

	slot2.insert(slot4, TweenLite.to(slot7, slot0.mj1, 0.3))
end

return
