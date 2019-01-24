DzpkController.onUserStatus = function (slot0, slot1)
	slot4 = "=========DzpkController:onUserStatus==========="

	print(slot3)

	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) and not slot0.isChangingTable then
		slot7 = true

		slot0.model.setMyTableUserData(slot3, slot0.model, {}, true)

		return
	end

	slot4 = slot0.model

	if slot0.model.getBankContentTxt(slot3) ~= nil then
		return
	end

	slot4 = slot0.model
	slot2 = slot0.model.getMyTableUserData(slot3)
	slot6 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot5) then
		if slot2[1] ~= nil then
			slot2[1] = slot1

			if slot2[1].lScore ~= nil then
				slot2[1].lScore = slot3
			end
		else
			slot2[1] = slot1
		end

		if slot1.cbUserStatus == US_FREE and slot0.isChangingTable then
			slot2 = {}
			slot5 = slot0

			slot0.resetBattle(slot4)

			slot6 = false

			gameMgr.setIsStartGame(slot4, gameMgr)

			slot0.isChangingTable = nil
		end

		if slot1.cbUserStatus ~= US_NULL then
			slot6 = Hero.getWTableID(slot7)
			slot9 = Hero
			slot6 = gameMgr.getUserDatasByTableId(slot4, gameMgr, Hero.getDwUserID(Hero))

			for slot7, slot8 in ipairs(gameMgr) do
				slot12 = slot8.wChairID

				if slot2[gameMgr.switchViewChairID(slot10, gameMgr)] ~= nil then
					slot2[slot9] = slot8

					if slot2[slot9].lScore ~= nil then
						slot2[slot9].lScore = slot10
					end
				else
					slot2[slot9] = slot8
				end
			end
		end

		slot8 = true

		slot0.model.setMyTableUserData(slot4, slot0.model, slot2, true)

		slot5 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot4)
	else
		slot6 = Hero

		if slot1.wTableID == Hero.getWTableID(slot5) then
			if slot1.cbUserStatus ~= US_NULL then
				slot6 = slot1.wChairID

				if slot2[gameMgr.switchViewChairID(slot4, gameMgr)] ~= nil then
					slot2[slot3] = slot1

					if slot2[slot3].lScore ~= nil then
						slot2[slot3].lScore = slot4
					end
				else
					slot2[slot3] = slot1
				end

				if slot1.cbUserStatus == US_OFFLINE then
					slot6 = slot0.model

					if slot0.model.getGameState(slot5) == GAME_STATUS_FREE then
						slot2[slot3] = nil
					end
				end

				slot8 = slot0.model

				for slot7, slot8 in pairs(slot0.model.getMyTablePlayingUserData(slot7)) do
					if slot8 ~= nil and slot8.dwUserID == slot1.dwUserID then
						slot9 = slot0.model.getMyTablePlayingUserData(slot10)[slot7]
						slot12 = slot1

						for slot13, slot14 in pairs(slot0.model) do
							if slot13 ~= "lScore" then
								slot9[slot13] = slot14
							end
						end

						if slot8.wChairID == slot1.wChairID then
							slot12 = slot0.model
							slot0.model.getMyTablePlayingUserData(slot11)[slot7] = slot9
						else
							slot12 = slot0.model
							slot0.model.getMyTablePlayingUserData(slot11)[slot7] = nil
							slot12 = slot0.model
							slot0.model.getMyTablePlayingUserData(nil)[slot3] = slot9
						end
					end
				end

				slot9 = true

				slot0.model.setMyTableUserData(slot5, slot0.model, slot2, true)

				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
			end
		else
			slot3 = false
			slot6 = slot2

			for slot7, slot8 in pairs(slot5) do
				if slot8 and slot8.dwUserID == slot1.dwUserID then
					slot2[slot7] = nil
					slot3 = true
				end
			end

			slot8 = slot0.model

			for slot7, slot8 in pairs(slot0.model.getMyTablePlayingUserData(slot7)) do
				if slot8 ~= nil and slot8.dwUserID == slot1.dwUserID then
					slot11 = slot0.model
					slot0.model.getMyTablePlayingUserData(slot10)[slot7] = nil
					slot3 = true
				end
			end

			if slot3 then
				slot9 = true

				slot0.model.setMyTableUserData(slot5, slot0.model, slot2, true)

				slot6 = slot0.model.myTableUserDataChangedSignal

				slot0.model.myTableUserDataChangedSignal.emit(slot5)
			end
		end
	end
end

DzpkController.updataUserData = function (slot0, slot1)
	slot4 = "=========DzpkController:updataUserData==========="

	print(slot3)

	slot4 = slot0.model

	if slot0.model.getBankContentTxt(slot3) ~= nil then
		return
	end

	slot5 = Hero

	if slot1.wTableID == Hero.getWTableID(slot4) then
		slot6 = slot1.wChairID

		if slot0.model.getMyTableUserData(slot3)[gameMgr.switchViewChairID(slot0.model, gameMgr)] == nil then
			slot7 = slot1.wChairID
			slot2[gameMgr.switchViewChairID(slot5, gameMgr)] = slot1
		end

		slot9 = true

		slot0.model.setMyTableUserData(slot5, slot0.model, slot2, true)

		slot6 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot5)

		slot6 = "========updataUserData更新座位==========="

		print(slot5)
	end
end

DzpkController.onUserScore = function (slot0, slot1)
	slot4 = "=========DzpkController:onUserScore==========="

	print(slot3)

	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) then
		return
	end

	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot4 = slot0.model

		if slot0.model.getCbPlayStatus(slot3)[1] ~= 1 then
			slot8 = true

			Hero.setUserFakeScore(slot4, Hero, 0, true)
		end

		slot6 = slot1.lScore

		Hero.setUserScore(slot4, Hero)
	end
end

DzpkController.onUserEnter = function (slot0, slot1)
	slot4 = "=========DzpkController:onUserEnter==========="

	print(slot3)

	slot6 = Hero
	slot5 = 65535

	if numberEqual(slot3, Hero.getWTableID(slot5)) then
		return
	end

	slot5 = Hero

	if slot1.dwUserID == Hero.getDwUserID(slot4) then
		slot6 = true

		slot0.model.setMyTableUserData(slot3, slot0.model, {})

		slot7 = true

		slot0.model.setMyTablePlayingUserData(slot3, slot0.model, {}, true)

		slot4 = slot0.model.myTableUserDataChangedSignal

		slot0.model.myTableUserDataChangedSignal.emit(slot3)
	end

	slot5 = slot1

	slot0.updataUserData(slot3, slot0)
end

return
