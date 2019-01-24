slot2 = "BaseRankUserCcsPane"
BaseRankUserCcsPane = class(slot1)

BaseRankUserCcsPane.onCreationComplete = function (slot0)
	slot0._userInfos = {}
	slot0._btns = {}
	slot5 = slot0

	for slot4, slot5 in pairs(slot0.getChildren(slot4)) do
		slot9 = slot5

		table.insert(slot7, slot0._userInfos)
	end

	slot0._maxIndex = #slot0._userInfos
	slot0._canUpdate = true
	slot3 = slot0
	slot7 = slot0.onDisplayListStateChanged

	slot0.registerScriptHandler(slot2, handler(slot5, slot0))

	slot5 = slot0

	gameMgr.sortedUsersChangedSignal.add(slot2, gameMgr.sortedUsersChangedSignal, slot0.onSortedUserChange)

	slot3 = slot0

	slot0.onSortedUserChange(slot2)
end

BaseRankUserCcsPane.onDisplayListStateChanged = function (slot0, slot1)
	if slot1 == "enter" then
		slot0._canUpdate = true
		slot4 = slot0

		slot0.onSortedUserChange(slot3)
	elseif slot1 == "exit" then
		slot0._canUpdate = false
	end
end

BaseRankUserCcsPane.onSortedUserChange = function (slot0)
	if not slot0._canUpdate then
		return
	end

	slot4 = {}
	slot7 = Hero

	table.insert(slot3, Hero.getDwUserID(slot6))

	if slot0.model.getWCurrentBanker then
		slot6 = slot0.model.getWCurrentBanker(slot3)
		slot3 = gameMgr.getUserDataByChairId(slot0.model, gameMgr)

		if slot0.model.getWCurrentBanker(slot3) ~= 65535 and slot3 ~= nil then
			slot7 = slot3.dwUserID

			table.insert(slot5, slot1)
		end
	end

	slot6 = #slot0._userInfos
	slot0.list = gameMgr.getSortedUsers(slot3, gameMgr, slot1)
	slot4 = slot0._userInfos

	for slot5, slot6 in ipairs(slot3) do
		if slot0.list[slot5] ~= nil then
			slot10 = true

			slot6.head.setVisible(slot8, slot6.head)

			slot13 = slot0.list[slot5].wGender

			slot0.controller.setHeadBg(slot6.head, slot0.controller, slot6.head, GAME_STATE.BATTLE)

			slot11 = slot0.list[slot5]

			slot6.head.setUserData(slot6.head, slot6.head)

			if slot6.txt_tf then
				slot11 = true

				slot6.txt_tf.setVisible(slot9, slot6.txt_tf)

				slot10 = slot6.txt_tf
				slot16 = 1.5

				slot6.txt_tf.setHtmlText(slot9, StringUtil.truncate(slot12, slot7.szNickName, 6, ".."))
			end
		else
			slot10 = false

			slot6.head.setVisible(slot8, slot6.head)

			if slot6.txt_tf then
				slot10 = false

				slot6.txt_tf.setVisible(slot8, slot6.txt_tf)
			end
		end
	end
end

BaseRankUserCcsPane.onBtnClick = function (slot0, slot1, slot2)
	slot5 = slot0._userInfos

	for slot6, slot7 in ipairs(slot4) do
		if slot7.btnClick == slot1 then
			if slot0.list[slot6] and slot0.list[slot6].dwUserID then
				slot12 = slot0._userInfos[slot6]

				popupMgr.showUserInfoPopup(slot9, popupMgr, slot0.list[slot6].dwUserID)
			end

			break
		end
	end
end

BaseRankUserCcsPane.checkBetUser = function (slot0, slot1)
	if slot0.list then
		for slot5 = 1, slot0._maxIndex, 1 do
			if slot0.list[slot5] and slot0.list[slot5].wChairID == slot1 then
				return slot5
			end
		end
	end

	return 0
end

BaseRankUserCcsPane.getRankItemNode = function (slot0, slot1)
	return slot0._userInfos[slot1]
end

BaseRankUserCcsPane.destroy = function (slot0)
	slot3 = slot0._userInfos

	for slot4, slot5 in ipairs(slot2) do
		if slot5 and slot5.btnClick then
			slot8 = slot5.btnClick

			slot5.btnClick.destroy(slot7)
		end
	end

	slot5 = slot0

	gameMgr.sortedUsersChangedSignal.remove(slot2, gameMgr.sortedUsersChangedSignal, slot0.onSortedUserChange)
end

return
