slot2 = "DdzPlayerInfoCcsPane"
DdzPlayerInfoCcsPane = class(slot1)

DdzPlayerInfoCcsPane.onCreationComplete = function (slot0)
	slot13 = slot0.onDataChanged

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot4 = 115

	slot0.autoNode.setStrBaseWidth(slot2, slot0.autoNode)

	slot3 = slot0

	slot0.onDataChanged(slot2)
end

DdzPlayerInfoCcsPane.onDataChanged = function (slot0)
	if slot0._data ~= nil and slot0._data.cbUserStatus ~= US_FREE then
		slot7 = 2
		slot2 = StringUtil.truncate(slot3, slot0._data.szNickName, 12, nil)
		slot6 = Hero

		if slot0._data.wChairID == Hero.getWChairID(12) then
			slot6 = slot2

			slot0.txtName.setString(slot4, slot0.txtName)
		else
			slot6 = "玩家"

			slot0.txtName.setString(slot4, slot0.txtName)
		end

		slot15 = nil
		slot7 = HtmlUtil.createArtNumWithHansUnits(slot4, slot0._data.lScore, "#plist_ddz_font_bean_2_%s.png", nil, nil, nil, nil, nil, nil, nil, 0)

		slot0.autoNode.setStrTxt(slot0._data.lScore, slot0.autoNode)

		slot9 = slot0._data.wGender

		slot0.controller.setHeadBg(slot0._data.lScore, slot0.controller, slot0.head, GAME_STATE.BATTLE)

		slot8 = true

		slot0.head.setUserData(slot0._data.lScore, slot0.head, slot0._data)
	end
end

DdzPlayerInfoCcsPane.destroy = function (slot0)
	slot3 = slot0.autoNode

	slot0.autoNode.destroy(slot2)

	slot3 = slot0.head

	slot0.head.destroy(slot2)
end

return
