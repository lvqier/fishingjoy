slot2 = "BaseModuleUIView"
BaseModuleUIView = class(slot1)
slot0 = nil

BaseModuleUIView.ctor = function (slot0, slot1, slot2, slot3)
	slot7 = AbstractTouchBlockView

	ClassUtil.extends(slot5, slot0)

	slot7 = AbstractTopResView

	ClassUtil.extends(slot5, slot0)

	slot7 = BaseUIParentView

	ClassUtil.extends(slot5, slot0)

	slot0._maskOpacity = 255

	if slot1 then
		slot0._jsonFile = slot1
	end

	slot0._is4ConnersShowHideTween = true
	slot0._isCheck4ConnersShowAndHide = slot3
	slot0._isShowMaskBg = true
	slot0._configZOrder = nil
	slot0._tempZOrder = nil
	slot0._isKeepShowingResPane = false
	slot0._alignMode = slot2 or UIConfig.ALIGN_CENTER
	slot0._isAlign2GameAreaOrScreen = UIConfig.uiAlign2GameAreaOrScreen
	slot0._isShowing = false
	slot0._maskBg = nil
	slot0.view = nil

	if not slot0 then
		slot6 = "modal/1.png"
		slot4 = ResConfig.getUICommonPath(slot5)
	end

	slot4._toShowParent = nil
	slot4._fullScreenBg = nil
	slot4._fullScreenBgUrl = nil
	slot4._uiSceneConfigType = nil
	slot4._preSceneType = nil
	slot4._isShowingWithSwitchDefaultAnimation = nil
	slot12 = false
	slot16 = slot4.onRootClickableChanged

	createSetterGetter(slot5, slot4, "rootClickable", true, false, false, false, handler(slot14, slot4))
end

BaseModuleUIView.show = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot0._isShowingWithSwitchDefaultAnimation == nil then
		slot0._isShowingWithSwitchDefaultAnimation = slot4 or false
	else
		slot4 = slot0._isShowingWithSwitchDefaultAnimation
	end

	if not slot0._isShowing then
		slot0._isShowing = true

		if not slot3 then
			slot11 = uiMgr
			slot9 = uiMgr.getCurSceneType(slot10)
		end

		function slot10()
			slot4 = true

			uiMgr.addOrRemoveShowingModule(slot1, uiMgr, slot0.__hideAllViewCaller)

			slot2 = tickMgr
			slot1 = slot0.view == nil

			if not slot0.view then
				slot6 = slot0
				slot3 = ResConfig.loadCsNode(slot4, slot0._jsonFile)
				slot0.view = slot3
				slot4 = slot0.view

				slot0.view.retain(slot3)

				slot7 = slot0.view._ccsRoot

				slot0.changePositionNParent(slot3, slot0, nil, nil)

				slot5 = ZORDER_UI_ROOT_VIEW

				slot0.view._ccsRoot.setLocalZOrder(slot3, slot0.view._ccsRoot)

				slot4 = slot0

				slot0.bindChildrenViews(slot3)
			end

			function slot2()
				slot2 = slot0

				slot0.check2CreateBg(slot1)

				if slot1 then
					slot2 = slot0

					slot0.locatePosition(slot1)

					if slot0.locatePosition.view._ccsRoot.onLocateComplete then
						slot2 = slot0.view._ccsRoot
						slot5 = slot0.view

						slot0.view._ccsRoot.onLocateComplete(slot1, slot0.view.getPosition(slot4))
					end
				end

				slot2 = slot0

				if slot0.hasScene(slot1) and not slot2 then
					slot0._uiSceneConfigType = slot0._uiSceneConfigType or slot0.__cname
					slot8 = slot0._preSceneType

					print(slot2, "要切换的场景场景名字：", slot0._uiSceneConfigType, "当前场景名字：", , "前一个场景名字：")

					if "要切换的场景场景名字：" ~= slot0._uiSceneConfigType then
						slot0._preSceneType = slot3
					end

					slot8 = slot0

					uiMgr.showScene(slot2, uiMgr, slot0, nil, nil, true)

					if slot0._fullScreenBg then
						slot6 = slot0._toShowParent

						uiMgr.showView(slot2, uiMgr, slot0._fullScreenBg, nil)
					end
				end

				slot4 = slot0._tempZOrder or slot0._configZOrder

				AbstractTouchBlockView.show(slot2, slot0._tempZOrder or slot0._configZOrder)

				slot6 = slot0._tempZOrder or slot0._configZOrder._toShowParent

				uiMgr.showView(slot2, uiMgr, slot0._tempZOrder or slot0._configZOrder.view, slot0._tempZOrder or slot0._configZOrder)

				slot0._tempZOrder or slot0._configZOrder._tempZOrder = nil
				slot3 = slot0._tempZOrder or slot0._configZOrder

				slot0._tempZOrder or slot0._configZOrder.onViewAddChild(nil)

				slot3 = slot0._tempZOrder or slot0._configZOrder

				slot0._tempZOrder or slot0._configZOrder.onRootClickableChanged(nil)

				slot3 = slot0._tempZOrder or slot0._configZOrder

				if slot0._tempZOrder or slot0._configZOrder.getRootView(nil) and slot1.onRootViewShow then
					slot4 = slot1

					slot1.onRootViewShow(slot3)
				end

				slot5 = b

				slot0.setTopResPaneShowing(slot3, slot0)

				slot7 = tickMgr
				slot6 = slot0.__cname

				print(slot3, "ui显示消耗：", tickMgr.getTimer(slot6) - )

				if not print then
					slot4 = slot6

					applyFunction(slot3)
				end
			end

			if slot1 and slot4 ~= nil then
				slot2()
			else
				slot2()
			end
		end

		if slot4 then
			slot0._preSceneType = slot9
			slot21 = slot8

			uiMgr.showScene(slot13, uiMgr, slot5 or slot0.__cname, slot1, function ()
				slot0()

				slot2 = slot1

				applyFunction(slot1)
			end, false, nil, slot7)
		else
			slot10()
		end
	end
end

BaseModuleUIView.locatePosition = function (slot0)
	slot9 = slot0._isAlign2GameAreaOrScreen

	uiMgr.locate(slot0.view, uiMgr, slot0._alignMode, slot0.view, slot0.view.getContentSize(slot2).width, slot0.view.getContentSize(slot2).height)
end

BaseModuleUIView.check2CreateBg = function (slot0)
	slot1 = false

	if slot0._fullScreenBgUrl then
		if not slot0._fullScreenBg then
			slot4 = slot0._fullScreenBgUrl
			slot0._fullScreenBg = display.newSprite(slot3)
			slot6 = CONFIG_DESIGN_HEIGHT * 100

			DisplayUtil.scale2Full(slot3, slot0._fullScreenBg, CONFIG_DESIGN_WIDTH * 100)

			slot6 = display.cy

			slot0._fullScreenBg.setPosition(slot3, slot0._fullScreenBg, display.cx)
		end
	elseif slot0._isShowMaskBg and not slot0._maskBg then
		slot1 = true
		slot4 = slot0
		slot0._maskBg = display.newSprite(slot3)
		slot8 = slot0.view
		slot6 = slot0.view.getContentSize(slot0.view).height * 0.5

		slot0._maskBg.setPosition(slot3, slot0._maskBg, slot0.view.getContentSize(slot6).width * 0.5)

		slot5 = slot0._maskBg

		slot0.view.addChild(slot3, slot0.view)

		slot6 = CUR_SELECTED_HEIGHT * 100

		DisplayUtil.scale2Full(slot3, slot0._maskBg, CUR_SELECTED_WIDTH * 100)

		slot5 = slot0._maskOpacity

		slot0._maskBg.setOpacity(slot3, slot0._maskBg)

		slot5 = slot0._maskBg
		slot0._maskBg._showOpacity = slot0._maskBg.getOpacity(slot0._maskBg)
	end

	if slot1 then
		slot4 = slot0.view._ccsRoot

		slot0.view._ccsRoot.removeFromParent(slot3)

		slot5 = slot0.view._ccsRoot

		slot0.view.addChild(slot3, slot0.view)
	end
end

BaseModuleUIView.hasScene = function (slot0)
	return slot0._fullScreenBgUrl ~= nil or slot0._uiSceneConfigType ~= nil
end

BaseModuleUIView.onRootClickableChanged = function (slot0)
	function slot1(slot0, slot1)
		slot5 = slot1

		slot0.setTouchEnabled(slot3, slot0)

		if slot1 then
			slot4 = slot0
			slot8 = slot0.onRootTouchOperation

			slot0.addTouchEventListener(slot3, handler(slot6, slot0))
		end
	end

	slot5 = slot0._rootClickable

	AbstractTouchBlockView.setBlockCanTouch(slot3, slot0)

	if slot0.view then
		slot5 = slot0._rootClickable

		slot1(slot3, slot0.view._ccsRoot)
	end
end

BaseModuleUIView.onRootClick = function (slot0)
	return
end

BaseModuleUIView.onRootTouchOperation = function (slot0, slot1, slot2)
	if slot2 == ccs.TOUCH_EVENT_ENDED then
		slot5 = slot0

		slot0.onRootClick(slot4)
	end
end

BaseModuleUIView.getRootView = function (slot0)
	if slot0.view then
		return slot0.view.ccsChildren[1]
	else
		return nil
	end
end

BaseModuleUIView.onViewRemoveChild = function (slot0)
	return
end

BaseModuleUIView.onViewAddChild = function (slot0)
	slot3 = slot0

	slot0.check2Hide4ConnerViews(slot2)
end

BaseModuleUIView.check2Hide4ConnerViews = function (slot0)
	if slot0._isCheck4ConnersShowAndHide then
	end
end

BaseModuleUIView.check2Show4ConnersViews = function (slot0)
	if slot0._isCheck4ConnersShowAndHide then
	end
end

BaseModuleUIView.hide = function (slot0, slot1, slot2, slot3)
	if slot0._isShowing then
		function slot4()
			slot2 = slot0

			slot0.hideAllPopUp(slot1)

			slot2 = slot1

			applyFunction(slot1)

			applyFunction._isShowing = false
			slot2 = applyFunction.view

			applyFunction.view.removeFromParent(false)

			slot2 = AbstractTouchBlockView.hide

			AbstractTouchBlockView.hide(false)

			slot3 = slot0

			slot0.onViewRemoveChild(AbstractTouchBlockView.hide)

			if AbstractTouchBlockView.hide.getRootView(false) and slot0.onRootViewHide then
				slot3 = slot0

				slot0.onRootViewHide(slot2)
			end

			slot3 = mainMgr

			if not mainMgr.getIsRelogining(slot2) and slot0._preSceneType and not slot0._isShowingWithSwitchDefaultAnimation then
				slot3 = slot0

				if slot0.canReturnPreScene(slot2) then
					slot7 = true

					uiMgr.showScene(slot2, uiMgr, slot0._preSceneType, nil, nil)
				end
			end

			slot0._preSceneType = nil
			slot3 = slot0

			slot0.check2Show4ConnersViews(nil)
		end

		slot7 = mainMgr

		if not mainMgr.getIsRelogining(slot6) and slot0._isShowingWithSwitchDefaultAnimation then
			uiMgr.showScene(slot6, uiMgr, slot0._preSceneType, slot1, slot4, slot3, nil, nil)
		else
			slot4()
		end
	end

	if slot0._fullScreenBg then
		slot6 = slot0._fullScreenBg

		slot0._fullScreenBg.removeFromParent(slot5)

		slot0._fullScreenBg = nil
	end

	slot7 = slot0

	mainMgr.onSomeModuleViewHide(slot5, mainMgr)
end

BaseModuleUIView.canReturnPreScene = function (slot0)

	-- Decompilation error in this vicinity:
	slot3 = mainMgr
	slot3 = uiMgr
	slot4 = slot0._preSceneType
	slot3 = uiMgr
	slot4 = uiMgr

	return uiMgr.getHideAllModulesToSceneType(slot2) == uiMgr.getCurMainSceneType(uiMgr)
end

BaseModuleUIView.isShowing = function (slot0)
	return slot0._isShowing
end

BaseModuleUIView.destroy = function (slot0)
	slot3 = slot0

	AbstractTopResView.destroy(slot2)

	slot3 = slot0

	BaseUIParentView.destroy(slot2)

	if slot0._fullScreenBg then
		slot3 = slot0._fullScreenBg

		slot0._fullScreenBg.removeFromParent(slot2)

		slot0._fullScreenBg = nil
	end

	if slot0.view then
		if slot0.view._ccsRoot and slot1.destroy then
			slot4 = slot1

			slot1.destroy(slot3)
		end

		slot0.view._ccsRoot = nil
		slot4 = slot0.view

		slot0.view.removeFromParent(nil)

		slot4 = slot0.view

		slot0.view.release(nil)

		slot0.view = nil
	end

	if slot0._uiSceneConfigType then
		slot4 = slot0._uiSceneConfigType

		uiMgr.destroyScene(slot2, uiMgr)

		slot0._uiSceneConfigType = nil
	end

	slot3 = slot0

	AbstractTouchBlockView.destroy(slot2)

	slot0._jsonFile = nil
	slot0._is4ConnersShowHideTween = nil
	slot0._isCheck4ConnersShowAndHide = nil
	slot0._isShowMaskBg = nil
	slot0._configZOrder = nil
	slot0._tempZOrder = nil
	slot0._isKeepShowingResPane = nil
	slot0._alignMode = nil
	slot0._isAlign2GameAreaOrScreen = nil
	slot0._isShowing = nil
	slot0._maskBg = nil
	slot0._fullScreenBgUrl = nil
	slot0._preSceneType = nil
end

return
