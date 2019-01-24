slot2 = "NewbieHand"
NewbieHand = class(slot1)

NewbieHand.ctor = function (slot0)
	slot7 = true

	createSetterGetter(slot2, slot0, "view", nil, nil)

	slot0._view = display.newNode()
	slot3 = slot0._view

	slot0._view.retain(slot2)

	slot0._nodeHand = display.newNode()
	slot4 = slot0._nodeHand

	slot0._view.addChild(slot2, slot0._view)

	slot7 = ResConfig.getSpinePath("hldt_handpoint/hldt_handpoint.json")
	slot0._handSpine = sp.SkeletonAnimation.create("hldt_handpoint/hldt_handpoint.atlas", sp.SkeletonAnimation, slot1)
	slot8 = true

	slot0._handSpine.setAnimation("hldt_handpoint/hldt_handpoint.atlas", slot0._handSpine, 0, "animation")

	slot6 = slot0._handSpine

	slot0._nodeHand.addChild("hldt_handpoint/hldt_handpoint.atlas", slot0._nodeHand)
end

NewbieHand.setVisible = function (slot0, slot1)
	slot5 = slot1

	slot0._view.setVisible(slot3, slot0._view)
end

NewbieHand.changeHandRotaion = function (slot0, slot1, slot2)
	slot1 = slot1 or 0
	slot5 = slot0._nodeHand

	TweenLite.killTweensOf(slot4)

	if slot2 then
		slot6 = slot1

		slot0._nodeHand.setRotation(slot4, slot0._nodeHand)
	else
		slot7 = {
			shortRotation = {
				rotation = slot1
			}
		}

		TweenMax.to(slot4, slot0._nodeHand, 0.5)
	end
end

return
