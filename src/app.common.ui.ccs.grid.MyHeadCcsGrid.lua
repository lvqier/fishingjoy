slot2 = "MyHeadCcsGrid"
MyHeadCcsGrid = class(slot1)

MyHeadCcsGrid.onCreationComplete = function (slot0)
	slot4 = PlayerHeadCcsGrid

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	PlayerHeadCcsGrid.onCreationComplete(slot2)

	slot5 = slot0

	Hero.cbGenderChangedSignal.add(slot2, Hero.cbGenderChangedSignal, slot0.updateUserData)

	slot5 = slot0

	Hero.wFaceIDChangedSignal.add(slot2, Hero.wFaceIDChangedSignal, slot0.updateUserData)

	slot3 = slot0

	slot0.updateUserData(slot2)
end

MyHeadCcsGrid.updateUserData = function (slot0)
	slot1 = Hero.getWFaceID(slot2)
	slot4 = Hero
	slot2 = Hero.getCbGender(Hero)

	if slot0.setUserData then
		if slot2 then
			slot6 = {
				wFaceID = slot1,
				wGender = slot2
			}

			slot0.setUserData(slot4, slot0)
		end
	else
		slot7 = slot0

		Hero.cbGenderChangedSignal.remove(slot4, Hero.cbGenderChangedSignal, slot0.updateUserData)

		slot7 = slot0

		Hero.wFaceIDChangedSignal.remove(slot4, Hero.wFaceIDChangedSignal, slot0.updateUserData)
	end
end

MyHeadCcsGrid.destroy = function (slot0)
	slot5 = slot0

	Hero.cbGenderChangedSignal.remove(slot2, Hero.cbGenderChangedSignal, slot0.updateUserData)

	slot5 = slot0

	Hero.wFaceIDChangedSignal.remove(slot2, Hero.wFaceIDChangedSignal, slot0.updateUserData)

	slot3 = slot0

	PlayerHeadCcsGrid.destroy(slot2)
end

return
