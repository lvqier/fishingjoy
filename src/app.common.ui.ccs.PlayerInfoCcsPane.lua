slot2 = "PlayerInfoCcsPane"
PlayerInfoCcsPane = class(slot1)

PlayerInfoCcsPane.onCreationComplete = function (slot0)
	slot13 = slot0.onScoreChanged

	createSetterGetter(slot2, slot0, "score", 0, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onZhuangCountChanged

	createSetterGetter(slot2, slot0, "zhuangCount", 0, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onNameChanged

	createSetterGetter(slot2, slot0, "name", nil, nil, nil, nil, handler(slot11, slot0))

	slot13 = slot0.onIsOnlineChanged

	createSetterGetter(slot2, slot0, "isOnline", true, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.onScoreChanged(slot2)

	slot3 = slot0

	slot0.onZhuangCountChanged(slot2)

	slot3 = slot0

	slot0.onNameChanged(slot2)

	slot3 = slot0

	slot0.onIsOnlineChanged(slot2)
end

PlayerInfoCcsPane.setHeadUrl = function (slot0, slot1)
	return
end

PlayerInfoCcsPane.onIsOnlineChanged = function (slot0)
	if slot0.spOffLine then
		slot4 = not slot0._isOnline

		slot0.spOffLine.setVisible(slot2, slot0.spOffLine)
	end
end

PlayerInfoCcsPane.onNameChanged = function (slot0)
	slot6 = 2
	slot5 = StringUtil.truncate(slot0.name_tf.setHtmlText, slot0._name, 8, nil) or ""

	slot0.name_tf.setHtmlText(slot3, slot0.name_tf)
end

PlayerInfoCcsPane.onZhuangCountChanged = function (slot0)
	slot1 = slot0._zhuangCount ~= nil and slot0._zhuangCount > 0

	if slot0.spZhuang then
		slot5 = slot1

		slot0.spZhuang.setVisible(slot3, slot0.spZhuang)
	end

	slot4 = battleMgr

	if battleMgr.getCurGameType(slot3) == KEY_GT_HuiZhouZhuang then
		slot1 = false
	end

	if slot0.txtZhuang then
		slot5 = slot1

		slot0.txtZhuang.setVisible(slot3, slot0.txtZhuang)

		if slot1 then
			slot5 = "x" .. slot0._zhuangCount

			slot0.txtZhuang.setString(slot3, slot0.txtZhuang)
		end
	end
end

PlayerInfoCcsPane.onScoreChanged = function (slot0)
	if slot0.head.root.txtNum_tf then
		slot5 = slot0._score ~= nil

		slot1.setVisible(slot3, slot1)

		slot4 = slot1
		slot7 = slot0._score or 0

		slot1.setHtmlText(slot3, tostring(slot6))
	end
end

PlayerInfoCcsPane.destroy = function (slot0)
	return
end

return
