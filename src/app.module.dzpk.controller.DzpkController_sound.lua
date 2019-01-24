DzpkController.initSound = function (slot0)
	slot0.soundRes = {
		old_man = {
			{
				"man2_raise.mp3"
			},
			{
				"man2_allin.mp3"
			},
			{
				"man2_call.mp3"
			},
			{
				"man2_fold.mp3"
			}
		},
		young_man = {
			{
				"man1_raise.mp3"
			},
			{
				"man1_allin.mp3"
			},
			{
				"man1_call.mp3"
			},
			{
				"man1_fold.mp3"
			}
		},
		old_woman = {
			{
				"woman2_raise.mp3"
			},
			{
				"woman2_allin.mp3"
			},
			{
				"woman2_call.mp3"
			},
			{
				"woman2_fold.mp3"
			}
		},
		young_woman = {
			{
				"woman1_raise.mp3"
			},
			{
				"woman1_allin.mp3"
			},
			{
				"woman1_call.mp3"
			},
			{
				"woman1_fold.mp3"
			}
		}
	}
end

DzpkController.PlaySound = function (slot0, slot1, slot2, slot3)
	slot6 = slot0.model

	if #slot0.model.getMyTablePlayingUserData(slot5) ~= nil then
		slot6 = slot0.model

		if slot0.model.getMyTablePlayingUserData(slot5)[slot1] == nil then
			return
		end
	end

	slot4 = ""
	slot5 = 0
	slot6 = 1
	slot9 = slot0.model

	if slot0.model.getMyTablePlayingUserData(slot8)[slot1] then
		slot5 = slot7.wGender
		slot6 = slot7.wFaceID
	end

	slot11 = slot6
	slot12 = slot6
	slot4 = (mainMgr.getFacePicGender(slot9, mainMgr, slot5) == 1 and ((mainMgr.getFacePicAge(slot9, mainMgr) == "young" and slot4 .. "young_") or slot4 .. "old_") .. "man") or ((mainMgr.getFacePicAge(slot9, mainMgr) == "young" and slot4 .. "young_") or slot4 .. "old_") .. "woman"

	if slot0.soundRes[slot4][slot2] and slot2 ~= 7 then
		if #slot0.soundRes[slot4][slot2] == 1 then
			slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][1]
		elseif slot3 ~= nil then
			if slot0.soundRes[slot4][slot2][slot3] then
				if #slot0.soundRes[slot4][slot2][slot3] == 1 then
					slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][slot3][1]
				else
					slot11 = #slot0.soundRes[slot4][slot2][slot3]
					slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][slot3][math.random(slot9, 1)]
				end
			else
				slot11 = #slot0.soundRes[slot4][slot2]
				slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][math.random(slot9, 1)]
			end
		else
			slot11 = #slot0.soundRes[slot4][slot2]
			slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][math.random(slot9, 1)]
		end
	else
		if #slot0.soundRes[slot4][slot2] < slot3 then
			return
		end

		slot4 = slot4 .. "/" .. slot0.soundRes[slot4][slot2][slot3]
	end

	slot11 = slot4

	slot0.playGameEffect(slot9, slot0)
end

return
