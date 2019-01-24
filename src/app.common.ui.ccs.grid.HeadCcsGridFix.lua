slot2 = "HeadCcsGridFix"
HeadCcsGridFix = class(slot1)

HeadCcsGridFix.onCreationComplete = function (slot0)
	slot13 = slot0.onUserData

	createSetterGetter(slot2, slot0, "userData", nil, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onIsMine

	createSetterGetter(slot2, slot0, "isMine", false, nil, nil, nil, handler(slot11, slot0))

	slot4 = false

	slot0.mask.setVisible(slot2, slot0.mask)
end

HeadCcsGridFix.onIsMine = function (slot0)
	if slot0._isMine then
		slot5 = slot0

		Hero.cbGenderChangedSignal.add(slot2, Hero.cbGenderChangedSignal, slot0.onMyUserDataChanged)

		slot5 = slot0

		Hero.wFaceIDChangedSignal.add(slot2, Hero.wFaceIDChangedSignal, slot0.onMyUserDataChanged)

		slot3 = slot0

		slot0.onMyUserDataChanged(slot2)
	else
		slot5 = slot0

		Hero.cbGenderChangedSignal.remove(slot2, Hero.cbGenderChangedSignal, slot0.onMyUserDataChanged)

		slot5 = slot0

		Hero.wFaceIDChangedSignal.remove(slot2, Hero.wFaceIDChangedSignal, slot0.onMyUserDataChanged)
	end
end

HeadCcsGridFix.onUserData = function (slot0)
	if slot0._userData then
		slot1 = slot0._userData.wGender ~= 0
		slot0._userData.wFaceID = slot0._userData.wFaceID or 1
		slot4 = slot0.spHead
		slot9 = slot0._userData.wGender

		slot0.spHead.setSpriteFrame(slot0._userData.wFaceID or 1, mainMgr.getHeadPicById(slot6, mainMgr, slot0._userData.wFaceID))

		if slot0.spBgBoy then
			slot5 = slot1

			slot0.spBgBoy.setVisible(slot3, slot0.spBgBoy)
		end

		if slot0.spBgGirl then
			slot5 = not slot1

			slot0.spBgGirl.setVisible(slot3, slot0.spBgGirl)
		end
	end
end

HeadCcsGridFix.onMyUserDataChanged = function (slot0)
	slot4 = Hero
	slot7 = {
		wFaceID = Hero.getWFaceID(slot2),
		wGender = Hero.getCbGender(Hero)
	}

	slot0.setUserData(slot5, slot0)
end

HeadCcsGridFix.destroy = function (slot0)
	slot5 = slot0

	Hero.cbGenderChangedSignal.remove(slot2, Hero.cbGenderChangedSignal, slot0.onMyUserDataChanged)

	slot5 = slot0

	Hero.wFaceIDChangedSignal.remove(slot2, Hero.wFaceIDChangedSignal, slot0.onMyUserDataChanged)
end

return
