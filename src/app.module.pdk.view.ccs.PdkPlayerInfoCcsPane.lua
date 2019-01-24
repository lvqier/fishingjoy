slot2 = "PdkPlayerInfoCcsPane"
PdkPlayerInfoCcsPane = class(slot1)

PdkPlayerInfoCcsPane.onCreationComplete = function (slot0)
	slot13 = slot0.onDataChanged

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.onDataChanged(slot2)
end

PdkPlayerInfoCcsPane.onDataChanged = function (slot0)
	if slot0._data then
		slot4 = Hero

		if slot0._data.wChairID == Hero.getWChairID(slot3) then
			slot6 = 2
			slot5 = StringUtil.truncate(slot2, slot0._data.szNickName, 12, nil)

			slot0.txtName.setString(slot0._data.szNickName, slot0.txtName)
		else
			slot4 = "玩家"

			slot0.txtName.setString(slot2, slot0.txtName)
		end

		slot13 = nil
		slot5 = HtmlUtil.createArtNumWithHansUnits(slot2, slot0._data.lScore, "#plist_pdk_font_bean_2_%s.png", nil, nil, nil, nil, nil, nil, nil, 0)

		slot0.autoNode.setStrTxt(slot0._data.lScore, slot0.autoNode)

		slot7 = slot0._data.wGender

		slot0.controller.setHeadBg(slot0._data.lScore, slot0.controller, slot0.head, GAME_STATE.BATTLE)

		slot6 = true

		slot0.head.setUserData(slot0._data.lScore, slot0.head, slot0._data)
	end
end

return
