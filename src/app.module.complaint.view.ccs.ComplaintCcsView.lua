ComplaintCcsView = class("ComplaintCcsView")

ComplaintCcsView.onCreationComplete = function (slot0)
	slot0.layerMain.list_lv:setItemResCcsFileName("csb/common/ComplaintItem.csb")

	slot0._inputSuggest = CCSUtil.changeUITextFeildWithCcsTextInput(slot0.layerMain.layout.inputSuggest)

	slot0._inputSuggest:setInputMode(cc.EDITBOX_INPUT_MODE_ANY)
	slot0._inputSuggest:setPlaceHolder([[
发现Bug？功能建议？活动创意统统提过来吧，写
下您的建议一经采纳即可赢取丰厚欢乐豆奖励！字
数请勿超过140字，否则将无法发送，谢谢。





]])
	slot0._inputSuggest:setFontSize(28)

	DisplayUtil.rgb2ccc3("#ffffff").a = 127.5

	slot0._inputSuggest:setPlaceHolderColor(slot1)

	slot0._tabPane = CcsTabPane.new()

	slot0._tabPane:pushTabs(slot2)
	slot0._tabPane.tabClickSignal:add(slot0.onTabSelected, slot0)
	slot0.model.curTabIndexChangedSignal:add(slot0.onTabIndex, slot0)
	slot0.model.notReadedListChangedSignal:add(slot0.onNotReadedListChanged, slot0)
	slot0.model.complaintListChangedSignal:add(slot0.onDateListChanged, slot0)
	slot0.layerMain.list_lv:setScrollType(CcsListView.SCROLL_TYPE_VARY)
	slot0:onTabIndex()
	slot0.layerMain.layout:setVisible(true)
	slot0.layerMain.list_lv:setVisible(false)
	slot0.layerMain.descTf_tf:setIsWrapPrecise(true)
	slot0.layerMain.descTf_tf:setVGap(5)
	slot0.layerMain.descTf_tf:setHtmlText(slot3)
	slot0.layerMain.fontNum_tf:setHtmlText("0/140")
	slot0._inputSuggest:addEditHandler(handler(slot0, slot0.onTxtPwdChanged))
end

ComplaintCcsView.onTxtPwdChanged = function (slot0, slot1, slot2)
	slot4, slot5 = string.gsub(slot3, "[^\\x80-\\xc1]", "")

	slot0.layerMain.fontNum_tf:setHtmlText(((slot5 > 140 and 140) or slot5) .. "/140")

	if slot5 > 140 then
		if slot1 == "changed" then
			tweenMsgMgr:showRedMsg("意见字数过长，请勿超过140字，谢谢。")
		end

		if slot1 == "ended" then
			slot0._inputSuggest:setText(StringUtil.subStringUTF8(slot3, 1, 140))
		end
	end
end

ComplaintCcsView.doHideCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0.layerMain)

	slot2 = TimelineLite.new()

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		y = slot0.layerTitle._initY + 40,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		scale = 0.7,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0.layerMain, 0.21, {
		y = slot0._initY + 20,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0.layerMain, 0.21, {
		scale = 0.8,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0.layerMain, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))
	slot0._inputSuggest:setText("")
end

ComplaintCcsView.doShowCustomPopupEffect = function (slot0, slot1)
	if not slot0._initY then
		slot0._initY = slot0.layerMain:getPositionY()
	end

	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0.layerMain)
	DisplayUtil.setVisible(slot0.layerTitle, false)
	slot0.layerTitle:setScale(0.7)

	if not slot0.layerTitle._initY then
		slot0.layerTitle._initY = slot0.layerTitle:getPositionY()

		slot0.layerTitle:setPositionY(slot0.layerTitle._initY + 40)
	end

	slot2 = TimelineLite.new({
		delay = 0.04
	})

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		y = slot0.layerTitle._initY
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.3, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
	slot0.layerMain:setPositionY(slot0._initY + 20)
	DisplayUtil.setVisible(slot0.layerMain, false)
	slot0.layerMain:setScale(0.8)

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0.layerMain, 0.07, {
		y = slot0._initY,
		ease = Quad.easeIn
	}))
	slot3:insert(TweenLite.to(slot0.layerMain, 0.21, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot3:insert(TweenLite.to(slot0.layerMain, 0.07, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
	slot0:onShow()
end

ComplaintCcsView.onShow = function (slot0)
	slot0.controller:requestComplaintList()
	slot0._inputSuggest:show()
end

ComplaintCcsView.onNotReadedListChanged = function (slot0)
	slot0.layerMain.notReadSprite:setVisible(#slot0.model:getNotReadedList() ~= 0)
	slot0.layerMain.notReadSprite.txtTS:setString(slot1)

	if slot1 ~= 0 then
		Hero:addHd(HERO_COMPLAINT)
	else
		Hero:removeHd(HERO_COMPLAINT)
	end
end

ComplaintCcsView.onTabIndex = function (slot0)
	slot0.layerMain.fontNum_tf:setVisible(slot0.model:getCurTabIndex() == 1)
	slot0._tabPane:setSelectedTabIndex(slot1)
	slot0:checkBgHeight()
end

ComplaintCcsView.checkBgHeight = function (slot0)
	slot2 = 0

	slot0.layerMain.bgRight:setContentSize(cc.size(slot0.layerMain.bgRight:getContentSize().width, (slot0.model:getCurTabIndex() == 1 and 337) or 408))
end

ComplaintCcsView.onTabSelected = function (slot0, slot1)
	slot0.model:setCurTabIndex(slot1)

	if slot1 == 1 then
		slot0.layerMain.layout:setVisible(true)
		slot0.layerMain.list_lv:setVisible(false)
	else
		slot0.layerMain.layout:setVisible(false)
		slot0.layerMain.list_lv:setVisible(true)
		slot0.controller:requestComplaintList()
	end

	slot0:checkBgHeight()
end

ComplaintCcsView.onDateListChanged = function (slot0)
	slot0.layerMain.list_lv:setDatas(slot0.model:getComplaintList())

	if #slot0.model:getNotReadedList() > 0 then
		slot0.controller:requestReadComplaint()
	end
end

ComplaintCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerMain.btnClose then
		ProxyComplaint:hide()
	elseif slot1 == slot0.layerMain.btnReport then
		slot0.controller:gotoReportKefu()
	elseif slot1 == slot0.layerMain.layout.btnSubmit then
		slot0:onSubmitBtn()
	end
end

ComplaintCcsView.onSubmitBtn = function (slot0)
	if slot0._inputSuggest:getText() == "" then
		tweenMsgMgr:showRedMsg("请输入投诉建议")

		return
	end

	slot0.controller:requestComplaintSubmit(slot1, function (slot0)
		slot0._inputSuggest:setText("")
	end)
end

ComplaintCcsView.destroy = function (slot0)
	destroySomeObj(slot0.layerMain.btnClose)
	destroySomeObj(slot0.layerMain.btnSubmit)
	destroySomeObj(slot0.layerMain.btnReport)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0.layerMain)
	slot0._tabPane:destroy()
end

return
