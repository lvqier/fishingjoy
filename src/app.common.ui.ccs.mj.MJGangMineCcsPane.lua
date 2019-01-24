slot2 = "MJGangMineCcsPane"
MJGangMineCcsPane = class(slot1)

MJGangMineCcsPane.onCreationComplete = function (slot0)
	slot4 = BaseMJCardGroupPane

	ClassUtil.extends(slot2, slot0)
end

MJGangMineCcsPane.playAnimation = function (slot0, slot1, slot2)
	if IS_NO_CHAPAI_ANIMATION then
		return
	end

	if slot2 then
		slot1 = 0
		slot5 = {
			timeScale = TIME_SCALE_GANG
		}
		slot3 = TimelineLite.new(slot4)
		slot4 = #slot0._mjs
		slot7 = slot0._mjs

		for slot8, slot9 in ipairs(TIME_SCALE_GANG) do
			if slot8 == slot4 then
				slot13 = false

				DisplayUtil.setVisible(slot11, slot9)

				slot13 = slot9.initY + 80

				slot9.setPositionY(slot11, slot9)

				slot12 = slot3
				slot17 = {
					autoAlpha = 1,
					delay = 0.3 + slot1
				}

				slot3.insert(slot11, TweenLite.to(slot14, slot9, 0.3))

				slot12 = slot3
				slot17 = {
					y = slot9.initY,
					delay = 0.3 + slot1,
					ease = Cubic.easeIn
				}

				slot3.insert(slot11, TweenLite.to(slot14, slot9, 0.3))
			end
		end
	else
		slot6 = slot1

		MJPengMineCcsPane.playAnimation(slot4, slot0)
	end
end

return
