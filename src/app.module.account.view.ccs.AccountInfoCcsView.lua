slot0 = {
	"pane/b73dt_GrxxZhaq_tb2.png",
	"pane/b72dt_GrxxZhaq_tb1.png"
}
AccountInfoCcsView = class("AccountInfoCcsView")

AccountInfoCcsView.onCreationComplete = function (slot0)
	eventMgr:add(GameEvent.ON_BEGIN_GAME, slot0.onShow, slot0)
	Hero.cbGenderChangedSignal:add(slot0.updateMyHead, slot0)
	Hero.wFaceIDChangedSignal:add(slot0.updateMyHead, slot0)
	Hero.pNickNameChangedSignal:add(slot0.onNameChanged, slot0)
	Hero.isBindMobileChangedSignal:add(slot0.onBindStateChanged, slot0)
	Hero.bindPhoneChangedSignal:add(slot0.onBindStateChanged, slot0)
	Hero.isBindWxChangedSignal:add(slot0.onBindStateChanged, slot0)
end

AccountInfoCcsView.onNameChanged = function (slot0)
	slot0.layerDisplay.txtName_tf:setText(Hero:getPNickName())
end

AccountInfoCcsView.onShow = function (slot0)
	slot0:onNameChanged()
	slot0.layerDisplay.spSex:setTexture(slot1)
	slot0.layerDisplay.txtID_tf:setText(Hero:getDwGameID())

	if not StringUtil.isStringValid(tostring(Hero:getTjr() or "")) then
		slot2 = "无"
	end

	slot0.layerDisplay.txtTJR_tf:setText(slot2)
	slot0.head.root.headEditSprite:setVisible(true)

	if B_HEADCLIPPING == false then
		slot3 = Hero:getUserScore()

		slot0.headd:setVisible(true)
		slot0.head.root.head:setVisible(false)
		slot0.head.root.headFrameBg:setVisible(false)
		slot0.headd:changeHeadBG(slot5)
		slot0.headd:setUserData({
			wFaceID = Hero:getWFaceID(),
			wGender = Hero:getCbGender()
		})
	elseif B_HEADCLIPPING == true then
		slot0.headd:setVisible(false)
		slot0.head:setVisible(true)
		slot0.head.root.headFrameBg:setVisible(true)
	end

	slot0:onBindStateChanged()
	eventMgr:dispatch(GameEvent.PLAZA_ACCOUNT_INFO_SHOW_COMPLETE)
end

AccountInfoCcsView.onBindStateChanged = function (slot0)
	slot0.layerDisplay.btnBindPhone:setVisible(not Hero:getIsBindMobile())
	slot0.layerDisplay.btnBindWechat:setVisible(not Hero:getIsBindWx())
	slot0.layerDisplay.txtPhone:setString((Hero:getIsBindMobile() and Hero:getBindPhone() and mainMgr:removePhoneJeffFormat(Hero:getBindPhone())) or "未绑定")
	slot0.layerDisplay.txtWechat:setString((Hero:getIsBindWx() and "已绑定") or "未绑定")

	if IS_SDK_OFFIIAL_VERIFY then
		slot0.layerDisplay.Text_2:setVisible(false)
		slot0.layerDisplay.txtPhone:setVisible(false)
		slot0.layerDisplay.btnBindPhone:setVisible(false)
		slot0.layerDisplay.Text_2_0:setVisible(false)
		slot0.layerDisplay.txtWechat:setVisible(false)
		slot0.layerDisplay.btnBindWechat:setVisible(false)
	end
end

AccountInfoCcsView.updateMyHead = function (slot0)
	if Hero:getCbGender() then
		if B_HEADCLIPPING == false then
			slot0.headd:setVisible(true)
			slot0.head.root.head:setVisible(false)
			slot0.head.root.headFrameBg:setVisible(false)
			slot0.headd:changeHeadBG(slot2)
			slot0.headd:setUserData({
				wFaceID = Hero:getWFaceID(),
				wGender = slot1
			})
		elseif B_HEADCLIPPING == true then
			slot0.headd:setVisible(false)
			slot0.head:setVisible(true)
			slot0.head.root.headFrameBg:setVisible(true)
		end

		slot0.layerDisplay.spSex:setTexture(ResConfig.getUICommonPath(slot0[Hero:getCbGender() + 1]))
	end
end

AccountInfoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerDisplay.btnCopy then
		bridgeMgr:copy2ClipBoard(tostring(Hero:getDwGameID()))
		tweenMsgMgr:showGreenMsg("用户ID复制成功")
		trackMgr:recordTracks(TRACK_MEMBER_FZID)
	elseif slot1 == slot0.btnHead then
		slot0.model:setIsShowingHeadView(true)
		trackMgr:recordTracks(TRACK_MEMBER_GGTX)
	elseif slot1 == slot0.layerDisplay.btnBindPhone then
		slot0.controller:gotoBindMobile()
		trackMgr:recordTracks(TRACK_MEMBER_BDSJ)
	elseif slot1 == slot0.layerDisplay.btnBindWechat then
		slot0.controller:gotoBindWx()
	elseif slot1 == slot0.layerDisplay.btnSetting then
		slot0.model:setIsShowingSetting(true)
		trackMgr:recordTracks(TRACK_HALL_SZ)
	elseif slot1 == slot0.layerDisplay.btnQHZH then
		slot0.controller:requestExit()
	end
end

AccountInfoCcsView.destroy = function (slot0)
	Hero.userScoreChangedSignal:remove(slot0.updateMyHead, slot0)
	Hero.cbGenderChangedSignal:remove(slot0.updateMyHead, slot0)
	Hero.wFaceIDChangedSignal:remove(slot0.updateMyHead, slot0)
	Hero.isBindMobileChangedSignal:remove(slot0.onBindStateChanged, slot0)
	Hero.bindPhoneChangedSignal:remove(slot0.onBindStateChanged, slot0)
	Hero.isBindWxChangedSignal:remove(slot0.onBindStateChanged, slot0)
	eventMgr:remove(GameEvent.ON_BEGIN_GAME, slot0.onShow, slot0)
	Hero.pNickNameChangedSignal:remove(slot0.onNameChanged, slot0)
	destroySomeObj(slot0.head.root.head)
	destroySomeObj(slot0.layerDisplay.txtUnderWrite_tf)
	destroySomeObj(slot0.layerDisplay.txtTJR_tf)
	destroySomeObj(slot0.layerDisplay.txtID_tf)
	destroySomeObj(slot0.layerDisplay.txtName_tf)
	destroySomeObj(slot0.layerDisplay.btnCopy)
end

return
