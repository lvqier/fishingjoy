AccountSafeCcsView = class("AccountSafeCcsView")

AccountSafeCcsView.onCreationComplete = function (slot0)
	slot0._btnTotals = {
		slot0.btnBdsj,
		slot0.btnBdwx,
		slot0.btnWszl,
		slot0.btnXgdlmm
	}
	slot0._poses = {}

	for slot4, slot5 in ipairs(slot0._btnTotals) do
		table.insert(slot0._poses, DisplayUtil.ccpCopy(slot5:getPosition()))
	end

	Hero.isBindMobileChangedSignal:add(slot0.onMobileBindChanged, slot0)
	Hero.isBindWxChangedSignal:add(slot0.onWxBindChanged, slot0)
	eventMgr:add(GameEvent.ON_BEGIN_GAME, slot0.onShow, slot0)
	slot0:onWxBindChanged()
	slot0:onMobileBindChanged()
end

AccountSafeCcsView.onWxBindChanged = function (slot0)
	slot0.btnBdwx.spBind:setVisible(slot1)
	slot0.btnBdwx.spUnbind:setVisible(not Hero:getIsBindWx())
end

AccountSafeCcsView.onMobileBindChanged = function (slot0)
	slot0.btnBdsj.spBind:setVisible(slot1)
	slot0.btnBdsj.spUnbind:setVisible(not Hero:getIsBindMobile())
end

AccountSafeCcsView.setShowingBtn = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._btnTotals) do
		DisplayUtil.setVisible(slot6, false)
	end

	if IS_YYB_VERIFY or IS_SDK_VERIFY then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		DisplayUtil.setVisible(slot6, true)
		slot6:setPosition(slot0._poses[slot5])
	end
end

AccountSafeCcsView.onShow = function (slot0)
	slot1 = nil

	slot0:setShowingBtn((Hero:getNGuestState() ~= 1 or {
		slot0.btnBdsj,
		slot0.btnBdwx
	}) and (Hero:getIsUserType() ~= 1 or {
		slot0.btnBdsj,
		slot0.btnBdwx
	}) and (Hero:getIsUserType() ~= 4 or {
		slot0.btnBdsj,
		slot0.btnBdwx
	}) and {
		slot0.btnBdsj,
		slot0.btnBdwx,
		slot0.btnXgdlmm
	})
end

AccountSafeCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnXgdlmm then
		slot0.model:setIsShowingPwModify(true)
	elseif slot1 == slot0.btnBdwx then
		slot0.controller:gotoBindWx()
	elseif slot1 == slot0.btnBdsj then
		slot0.controller:gotoBindMobile()
		trackMgr:recordTracks(TRACK_MEMBER_BDSJ)
	end
end

AccountSafeCcsView.destroy = function (slot0)
	eventMgr:remove(GameEvent.ON_BEGIN_GAME, slot0.onShow, slot0)
	Hero.isBindMobileChangedSignal:remove(slot0.onMobileBindChanged, slot0)
	Hero.isBindWxChangedSignal:remove(slot0.onWxBindChanged, slot0)
	destroySomeObj(slot0.btnBdsj)
	destroySomeObj(slot0.btnBdwx)
	destroySomeObj(slot0.btnWszl)
	destroySomeObj(slot0.btnXgdlmm)
end

return
