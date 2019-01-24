slot2 = "DdzSheetOtherPukeCcsView"
DdzSheetOtherPukeCcsView = class(slot1)

DdzSheetOtherPukeCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.outCardsDicChangedSignal.add(slot2, slot0.model.outCardsDicChangedSignal, slot0.updatePlayState)

	slot5 = slot0

	slot0.model.endCardsDicChangedSignal.add(slot2, slot0.model.endCardsDicChangedSignal, slot0.updateEndState)

	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.add(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)

	slot3 = slot0

	if slot0.getName(slot2) == "leftOutPukeSheet" then
		slot0._chairId = DDZ_VIEW_CHAIRID_LEFT
	else
		slot3 = slot0

		if slot0.getName(slot2) == "rightOutPukeSheet" then
			slot0._chairId = DDZ_VIEW_CHAIRID_RIGHT
		end
	end

	slot3 = slot0

	slot0.updatePlayState(slot2)

	slot3 = slot0

	slot0.updateEndState(slot2)

	slot3 = slot0

	slot0.onStateViewDicChanged(slot2)
end

DdzSheetOtherPukeCcsView.onStateViewDicChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getLockViewDic(slot2) or not slot1.stateViewDic or not slot1.stateViewDic[slot0._chairId] then
		slot6 = slot0.model.getStateViewDic(slot0.setVisible) and slot2[slot0._chairId] == "outPukeSheet"

		slot0.setVisible(slot0.model, slot0)
	end
end

DdzSheetOtherPukeCcsView.updateUi = function (slot0, slot1, slot2)
	if slot0._chairId == DDZ_VIEW_CHAIRID_LEFT then
		slot5 = slot1
		slot3 = table.nums(slot4) or 1
		slot8 = slot0

		for slot7, slot8 in pairs(slot0.getChildren(slot7)) do
			slot12 = false

			slot8.setVisible(slot10, slot8)
		end

		slot0._showCount = 0
		slot8 = slot0

		for slot7, slot8 in pairs(slot0.getChildren(slot7)) do
			slot15 = slot8
			slot11 = slot1[parseInt(string.match(slot12, slot8.getName("puke(%d+)")))] ~= nil

			if slot11 then
				slot12 = slot9 == slot3
				slot16 = slot10

				slot8.root.setDataInt(slot14, slot8.root)

				slot0._showCount = slot0._showCount + 1
				slot15 = slot0.model

				if slot0.model.getBankerUser(slot14) == slot0._chairId then
					if slot0._chairId == DDZ_VIEW_CHAIRID_LEFT then
						slot18 = slot1
						slot16 = slot9 == table.nums(slot17)

						slot8.root.setIsShowBanker(slot14, slot8.root)
					elseif slot0._chairId == DDZ_VIEW_CHAIRID_RIGHT then
						slot16 = slot9 == 1

						slot8.root.setIsShowBanker(slot14, slot8.root)
					end
				else
					slot16 = false

					slot8.root.setIsShowBanker(slot14, slot8.root)
				end
			end

			if slot2 then
				slot14 = slot0.model

				if slot0.model.getCurrentUser(slot13) ~= slot0._chairId and slot11 then
					slot14 = slot8
					slot21 = slot9 * 0.1
					slot18 = cc.DelayTime.create(slot19, cc.DelayTime)
					slot21 = cc.Show

					slot8.runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, cc.Show.create(cc.DelayTime)))
				end
			else
				slot15 = slot11

				slot8.setVisible(slot13, slot8)
			end
		end
	end
end

DdzSheetOtherPukeCcsView.updatePlayState = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getOutCardsDic(slot2) or not slot1[slot0._chairId] then
		return
	end

	slot5 = slot1[slot0._chairId]

	slot0.updateUi(slot3, slot0)
end

DdzSheetOtherPukeCcsView.updateEndState = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getEndCardsDic(slot2) or not slot1[slot0._chairId] then
		return
	end

	slot6 = true

	slot0.updateUi(slot3, slot0, slot1[slot0._chairId])
end

DdzSheetOtherPukeCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.outCardsDicChangedSignal.remove(slot2, slot0.model.outCardsDicChangedSignal, slot0.updatePlayState)

	slot5 = slot0

	slot0.model.endCardsDicChangedSignal.remove(slot2, slot0.model.endCardsDicChangedSignal, slot0.updateEndState)

	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.remove(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)
end

return
