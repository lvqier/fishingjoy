PlazaEMailCcsView = class("PlazaEMailCcsView")

PlazaEMailCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.view.listNode.list1_lv:setItemResCcsFileName("csb/common/PlazaEMailItem.csb")
	slot0.view.listNode.list1_lv:setGap(5)

	slot0._loadingAnimation = nil

	slot0.model.eMailListDataChangedSignal:add(slot0.eMailListDataChanged, slot0)
	slot0:eMailListDataChanged()
	slot0.model.bShowEMailDataLoadingChangedSignal:add(slot0.setLoadingShowing, slot0)
	slot0.model.isDeleteAllEmailChangedSignal:add(slot0.isDeleteAllEmailChanged, slot0)
	slot0.view.checkBoxDeleteAll:bindBoolPropertyByName(slot0.model, "isDeleteAllEmail")
	slot0.controller:requestMailData()
	slot0.view.listNode.list1_lv._onPosChangedSignal:add(slot0.onScroll, slot0)
end

PlazaEMailCcsView.onScroll = function (slot0)
	if not slot0:getEMailListData() or next(slot1) == nil then
		return
	end

	if slot0.view.listNode.list1_lv:getInnerContainer():getPositionY() > slot0.view.listNode.list1_lv:getContentSize().height - slot0.view.listNode.list1_lv:getInnerContainer():getContentSize().height then
		slot0.view.emailMaskUp:setVisible(true)
	else
		slot0.view.emailMaskUp:setVisible(false)
	end
end

PlazaEMailCcsView.doHideCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)

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

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		y = slot0._initY + 20,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 0.8,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))
end

PlazaEMailCcsView.onShow = function (slot0)
	slot0.model._isDeleteAllEmail = false

	slot0.view.checkBoxDeleteAll:setIsSelected(false)
	slot0:onScroll()
end

PlazaEMailCcsView.doShowCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)
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
	slot0._zoomLayer:setPositionY(slot0._initY + 20)
	DisplayUtil.setVisible(slot0._zoomLayer, false)
	slot0._zoomLayer:setScale(0.8)

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		y = slot0._initY,
		ease = Quad.easeIn
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
end

PlazaEMailCcsView.setLoadingShowing = function (slot0)
	if slot0.model:getBShowEMailDataLoading() then
		if not slot0._loadingAnimation then
			slot0._loadingAnimation = AnimationUtil.createWithSpriteSheetInSprite(slot0.view.layerLoading.spLoading, "plist_gadget_loading_.png", 4, -1)
		else
			slot0._loadingAnimation:gotoAndPlay(1)
		end
	elseif slot0._loadingAnimation then
		slot0._loadingAnimation:gotoAndPlay(1)
	end

	slot0.view.layerLoading:setVisible(slot1)
end

PlazaEMailCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingEMail(false)
end

PlazaEMailCcsView.isDeleteAllEmailChanged = function (slot0)
	for slot5, slot6 in ipairs(slot1) do
		if slot6.isread == 1 then
			slot6:setIsDelete(slot0.model:getIsDeleteAllEmail())
		end
	end
end

PlazaEMailCcsView.eMailListDataChanged = function (slot0)
	slot0:setLoadingShowing(false)

	slot1 = slot0:getEMailListData()

	if not IS_YYB_VERIFY and not IS_SDK_VERIFY then
		slot0.view.listNode.list1_lv:setDatas(slot1)
	end

	slot0.view.Node_NoEMail:setVisible(not slot1 or next(slot1) == nil)
end

PlazaEMailCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingEMail(false)
	elseif slot1 == slot0.view.btnReadAll then
		slot0:readAllEmail()
	elseif slot1 == slot0.view.btnDelete then
		slot0:deleteMail()
	end
end

PlazaEMailCcsView.readAllEmail = function (slot0)
	slot2 = {}
	slot3 = false

	for slot7, slot8 in ipairs(slot1) do
		if slot8.isread == 0 then
			slot3 = true
		end

		slot8.isread = 1

		table.insert(slot2, slot8)
	end

	function slot4()
		slot0.model:setHasNewEMailCount(0, true)
		slot0.model.setHasNewEMailCount.model:setEMailListData(slot0.model.setHasNewEMailCount.model)
	end

	if slot3 then
		slot0.controller:requestReadAllMailData(slot4)
	end
end

PlazaEMailCcsView.deleteMail = function (slot0)
	slot1 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		if slot8:getIsDelete() then
			table.insert(slot1, slot8.msgid)
		else
			table.insert(slot3, slot8)
		end
	end

	function slot4()
		slot0.model:setEMailListData(slot0.model)
	end

	if #slot1 > 0 then
		slot0.controller:requestDeleteMail(slot1, slot4)
	end
end

PlazaEMailCcsView.getEMailListData = function (slot0)
	for slot5, slot6 in ipairs(slot1) do
		if slot6._isDelete == nil then
			createSetterGetter(slot6, "isDelete", false, true, nil, nil, nil, function ()
				slot0:onItemIsDeleteChanged(slot0)
			end)
		end
	end

	return slot1
end

PlazaEMailCcsView.onItemIsDeleteChanged = function (slot0, slot1)
	if slot1:getIsDelete() == false then
		slot0.model._isDeleteAllEmail = false

		slot0.view.checkBoxDeleteAll:setIsSelected(false)
	end
end

PlazaEMailCcsView.destroy = function (slot0)
	if slot0._loadingAnimation then
		slot0._loadingAnimation:destroy()

		slot0._loadingAnimation = nil
	end

	slot0.view.listNode.list1_lv._onPosChangedSignal:remove(slot0.onScroll, slot0)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)
	slot0.model.eMailListDataChangedSignal:remove(slot0.eMailListDataChanged, slot0)
	slot0.model.isDeleteAllEmailChangedSignal:remove(slot0.isDeleteAllEmailChanged, slot0)
	slot0.model.bShowEMailDataLoadingChangedSignal:remove(slot0.setLoadingShowing, slot0)
	slot0.view.listNode.list1_lv:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
