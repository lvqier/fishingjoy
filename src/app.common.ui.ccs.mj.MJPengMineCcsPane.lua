slot2 = "MJPengMineCcsPane"
MJPengMineCcsPane = class(slot1)

MJPengMineCcsPane.onCreationComplete = function (slot0)
	slot4 = BaseMJCardGroupPane

	ClassUtil.extends(slot2, slot0)
end

MJPengMineCcsPane.playAnimation = function (slot0, slot1)
	if IS_NO_CHAPAI_ANIMATION then
		return
	end

	slot1 = slot1 or 0
	slot2 = #slot0._mjs
	slot3 = TimelineLite.new(slot4)
	slot6 = slot0._mjs

	for slot7, slot8 in ipairs({
		timeScale = TIME_SCALE_PENG
	}) do
		slot13 = vars

		TweenLite.killTweensOf(slot10, slot8, nested)

		slot12 = false

		DisplayUtil.setVisible(slot10, slot8)

		if slot7 == slot2 then
			slot12 = slot8.initY + 80

			slot8.setPositionY(slot10, slot8)

			slot11 = slot3
			slot16 = {
				autoAlpha = 1,
				delay = 0.3 + slot1
			}

			slot3.insert(slot10, TweenLite.to(slot13, slot8, 0.3))

			slot11 = slot3
			slot16 = {
				y = slot8.initY,
				delay = 0.3 + slot1,
				ease = Cubic.easeIn
			}

			slot3.insert(slot10, TweenLite.to(slot13, slot8, 0.3))
		else
			slot12 = slot8.initX + 100

			slot8.setPositionX(slot10, slot8)

			slot11 = slot3
			slot16 = {
				autoAlpha = 1,
				x = slot8.initX,
				delay = slot1,
				ease = Back.easeOut
			}

			slot3.insert(slot10, TweenLite.to(slot13, slot8, 0.3))
		end
	end
end

return
