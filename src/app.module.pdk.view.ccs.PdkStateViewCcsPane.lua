slot2 = "PdkStateViewCcsPane"
PdkStateViewCcsPane = class(slot1)

PdkStateViewCcsPane.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.stateViewDicChangedSignal.add(slot2, slot0.model.stateViewDicChangedSignal, slot0.onStateViewDicChanged)

	slot5 = slot0

	slot0.model.currentUserChangedSignal.add(slot2, slot0.model.currentUserChangedSignal, slot0.onCurrentUserChanged)

	slot3 = slot0

	if slot0.getName(slot2) == "rightState" then
		slot0._chairId = PDK_VIEW_CHAIRID_RIGHT
	else
		slot3 = slot0

		if slot0.getName(slot2) == "leftState" then
			slot0._chairId = PDK_VIEW_CHAIRID_LEFT
		else
			slot3 = slot0

			if slot0.getName(slot2) == "mineState" then
				slot0._chairId = PDK_VIEW_CHAIRID_ME
			end
		end
	end

	slot3 = slot0

	slot0.onStateViewDicChanged(slot2)

	slot3 = slot0

	slot0.onCurrentUserChanged(slot2)
end

PdkStateViewCcsPane.onCurrentUserChanged = function (slot0)
	if slot0.clock then
		slot3 = slot0.clock.root

		slot0.clock.root.stop(slot2)

		slot3 = slot0.model

		if slot0.model.getCurrentUser(slot2) == slot0._chairId then
			slot7 = true

			slot0.clock.root.progress.setProgressPlaying(slot0.controller, slot0.clock.root.progress, true, slot1)

			slot7 = "#plist_pdk_font_clock_yellow_1_%s.png"

			slot0.clock.root.start(slot0.controller, slot0.clock.root, slot0.controller.getCurClockTime(slot2), nil)
		end
	end
end

PdkStateViewCcsPane.onStateViewDicChanged = function (slot0)
	slot3 = slot0.model

	if not slot0.model.getLockViewDic(slot2) or not slot1.stateViewDic or not slot1.stateViewDic[slot0._chairId] then
		slot6 = slot0

		for slot5, slot6 in pairs(slot0.getChildren(slot5)) do
			slot10 = false

			slot6.setVisible(slot8, slot6)
		end

		slot4 = slot0.model

		if slot0.model.getStateViewDic(slot3) then
			slot7 = slot2[slot0._chairId] == "ok"

			slot0.txtOk.setVisible(slot5, slot0.txtOk)

			slot7 = slot3 == "yaoBuQi"

			slot0.txtYaoBuQi.setVisible(slot5, slot0.txtYaoBuQi)

			slot7 = slot3 == "woXianChu"

			slot0.txtXianChu.setVisible(slot5, slot0.txtXianChu)

			if slot0.clock then
				slot7 = slot3 == "turnView"

				slot0.clock.setVisible(slot5, slot0.clock)
			end
		end
	end
end

return
