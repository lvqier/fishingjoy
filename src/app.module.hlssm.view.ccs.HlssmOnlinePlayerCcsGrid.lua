HlssmOnlinePlayerCcsGrid = class("HlssmOnlinePlayerCcsGrid")

HlssmOnlinePlayerCcsGrid.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "userData", nil, nil, nil, nil, nil, handler(slot0, slot0.onUserData))
	slot0:onUserData()
end

HlssmOnlinePlayerCcsGrid.onUserData = function (slot0)
	slot0:setVisible(slot0._userData ~= nil)

	if slot0._userData then
		slot0.controller:setHeadBg(slot0.head, GAME_STATE.BATTLE, slot0._userData.wGender)
		slot0.head:setUserData(slot0._userData)
		slot0.txtName_tf:setHtmlText(StringUtil.truncate(slot0._userData.szNickName, 8, nil, 2))
		slot0.txtScore_tf:setHtmlText(MathUtil.cookNumWithHansUnits(slot0._userData.lScore, 0))
	end
end

return
