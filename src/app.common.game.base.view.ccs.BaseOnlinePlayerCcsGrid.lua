slot2 = "BaseOnlinePlayerCcsGrid"
BaseOnlinePlayerCcsGrid = class(slot1)

BaseOnlinePlayerCcsGrid.onCreationComplete = function (slot0)
	slot13 = slot0.onUserData

	createSetterGetter(slot2, slot0, "userData", nil, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.onUserData(slot2)
end

BaseOnlinePlayerCcsGrid.onUserData = function (slot0)
	slot4 = slot0._userData ~= nil

	slot0.setVisible(slot2, slot0)

	if slot0._userData then
		slot6 = slot0._userData.wGender

		slot0.controller.setHeadBg(slot2, slot0.controller, slot0.head, GAME_STATE.BATTLE)

		slot4 = slot0._userData

		slot0.head.setUserData(slot2, slot0.head)

		slot3 = slot0.txtName_tf
		slot9 = 2

		slot0.txtName_tf.setHtmlText(slot2, StringUtil.truncate(GAME_STATE.BATTLE, slot0._userData.szNickName, 8, nil))

		if slot0.head.mask.mask then
			if not B_HEADCLIPPING then
				slot4 = slot0.head.mask

				slot0.head.checkMask2(slot2, slot0.head)
			else
				slot4 = false

				slot0.head.mask.mask.setVisible(slot2, slot0.head.mask.mask)
			end
		end

		slot1 = ""

		if slot0.model.onlineItemScoreNumRes then
			slot6 = 1
			slot1 = HtmlUtil.createArtNumWithHansUnits(slot3, slot0._userData.lScore, slot0.model.onlineItemScoreNumRes)
		else
			slot5 = 1
			slot1 = MathUtil.cookNumWithHansUnits(slot3, slot0._userData.lScore)
		end

		slot5 = slot1

		slot0.txtScore_tf.setHtmlText(slot3, slot0.txtScore_tf)
	end
end

BaseOnlinePlayerCcsGrid.destroy = function (slot0)
	slot3 = slot0.head

	slot0.head.destroy(slot2)

	slot3 = slot0.txtName_tf

	slot0.txtName_tf.destroy(slot2)

	slot3 = slot0.txtScore_tf

	slot0.txtScore_tf.destroy(slot2)
end

return
