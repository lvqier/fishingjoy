slot2 = "ClientUpdaterView"
ClientUpdaterView = class(slot1)

ClientUpdaterView.ctor = function (slot0, slot1, slot2)
	slot0.model = slot1
	slot0.controller = slot2
	slot0._scene = nil
	slot0._loadingLabel = nil
	slot0._loadingBar = nil
	slot0._view = nil
	slot0._popup = nil
	slot0._btnKf = nil
	slot0._root = nil
	slot0._btnCancelInPopUp = nil
	slot0._btnConfirmInPopUp = nil
	slot0._curPercent = 0
	slot0._headY = 0
	slot0._particleY = 0
	slot7 = slot0

	slot0.model.loadingTxtChangedSignal.add(slot4, slot0.model.loadingTxtChangedSignal, slot0.updateText)

	slot7 = slot0

	slot0.model.curShowLoadingPercentChangedSignal.add(slot4, slot0.model.curShowLoadingPercentChangedSignal, slot0.updateLoadingPercent)
	slot0.model.popupMsgVoChangedSignal.add(slot4, slot0.model.popupMsgVoChangedSignal, slot0.onPopupMsgVo)

	slot5 = cc.Director
	slot5 = cc.Director.getInstance(slot4)
	slot9 = slot0.updateLoadingTxtWithSentenceArr
	slot8 = false
	slot0._loadingSentencesUpdateScheduleId = cc.Director.getInstance(slot4).getScheduler(slot4).scheduleScriptFunc(slot4, cc.Director.getInstance(slot4).getScheduler(slot4), handler(slot0, slot0), 0.08333333333333333)
end

ClientUpdaterView.checkSpine = function (slot0)
	if not _loginSpine then
		slot2 = "res/gameres/animation/spine/dengluJM/dengluJM.atlas"
		slot3 = "res/gameres/animation/spine/dengluJM/dengluJM.png"
		slot6 = cc.FileUtils
		slot7 = "res/gameres/animation/spine/dengluJM/dengluJM.json"

		if not cc.FileUtils.getInstance(slot5).isFileExist(slot5, cc.FileUtils.getInstance(slot5)) then
			return
		end

		slot6 = cc.FileUtils
		slot7 = slot2

		if not cc.FileUtils.getInstance(slot5).isFileExist(slot5, cc.FileUtils.getInstance(slot5)) then
			return
		end

		slot6 = cc.FileUtils
		slot7 = slot3

		if not cc.FileUtils.getInstance(slot5).isFileExist(slot5, cc.FileUtils.getInstance(slot5)) then
			return
		end

		slot8 = slot2
		_loginSpine = sp.SkeletonAnimation.create(slot5, sp.SkeletonAnimation, slot1)
		slot9 = true

		_loginSpine.setAnimation(slot5, _loginSpine, 0, "animation")

		slot8 = 0

		_loginSpine.setPosition(slot5, _loginSpine, 667)
	end

	if _loginSpine then
		slot3 = _loginSpine

		_loginSpine.retain(slot2)

		slot3 = _loginSpine

		_loginSpine.removeFromParent(slot2)

		slot4 = "nodeSpine"
		slot5 = _loginSpine

		slot0._root.getChildByName(slot2, slot0._root).addChild(slot0._root, slot1)

		slot5 = "bg"
		slot5 = slot0._root.getChildByName(slot0._root, slot0._root)
		slot3 = slot0._root.getChildByName(slot0._root, slot0._root).getContentSize(slot0._root).width == 1624 and not _loginSpine.__hasAdjustIphonex

		if slot3 then
			_loginSpine.__hasAdjustIphonex = true
			slot11 = _loginSpine
			slot8 = -(CONFIG_SCREEN_WIDTH - CUR_SELECTED_WIDTH) * 0.5 + _loginSpine.getPositionX(slot10)

			_loginSpine.setPositionX(slot6, _loginSpine)

			slot11 = slot2
			slot8 = -(CONFIG_SCREEN_WIDTH - CUR_SELECTED_WIDTH) * 0.5 + slot2.getPositionX(slot10)

			slot2.setPositionX(slot6, slot2)
		end

		slot6 = _loginSpine

		_loginSpine.release(slot5)
	end
end

ClientUpdaterView.updateLoadingTxtWithSentenceArr = function (slot0, slot1)
	if not IS_IN_IOS_VERIFY_STATE and LOADING_SENTENCES_ARR and slot0._loadingLabel then
		LOADING_SENTENCES_ARR.__curT = (LOADING_SENTENCES_ARR.__curT or 0) + (slot1 or 0)

		if not LOADING_SENTENCES_ARR.__oldT or LOADING_SENTENCES_ARR.__intervalS < slot2 - slot3 then
			if #LOADING_SENTENCES_ARR < (LOADING_SENTENCES_ARR.__oldIndex or 1) + 1 then
				slot4 = 1
			end

			slot9 = LOADING_SENTENCES_ARR[slot4]

			slot0._loadingLabel.setString(slot7, slot0._loadingLabel)

			LOADING_SENTENCES_ARR.__oldIndex = slot4
			LOADING_SENTENCES_ARR.__oldT = slot2
		end
	end
end

ClientUpdaterView.onPopupMsgVo = function (slot0)
	if slot0._popup then
		slot5 = slot0.model.getPopupMsgVo(slot0._popup.setVisible) ~= nil

		slot0._popup.setVisible(slot0.model, slot0._popup)

		if slot0._popupContentTf and slot1 then
			slot5 = slot1.msg

			slot0._popupContentTf.setString(slot3, slot0._popupContentTf)
		end
	end
end

ClientUpdaterView.setBtnTouchState = function (slot0, slot1, slot2)
	if slot1._isPressed ~= slot2 then
		slot1._isPressed = slot2
		slot5 = slot1

		slot1.stopAllActions(slot4)

		slot3 = nil

		if slot2 then
			slot9 = 0.95
			slot3 = cc.ScaleTo.create(slot5, cc.ScaleTo, 0.05, 0.95)
		else
			slot9 = 1
			slot3 = cc.ScaleTo.create(slot5, cc.ScaleTo, 0.05, 1)
		end

		slot7 = slot3

		slot1.runAction(slot5, slot1)
	end
end

ClientUpdaterView.onTouchOperation = function (slot0, slot1, slot2)
	if slot2 == 0 then
		slot7 = true

		slot0.setBtnTouchState(slot4, slot0, slot1)
	elseif slot2 == 2 then
		slot7 = false

		slot0.setBtnTouchState(slot4, slot0, slot1)

		if slot1 == slot0._btnCancelInPopUp then
			slot6 = false

			slot0.controller.onPopupBtnClick(slot4, slot0.controller)
		elseif slot1 == slot0._btnConfirmInPopUp then
			slot6 = true

			slot0.controller.onPopupBtnClick(slot4, slot0.controller)
		elseif slot1 == slot0._btnKf then
			slot5 = slot0.controller

			slot0.controller.showKf(slot4)
		end
	elseif slot2 == 3 then
		slot7 = false

		slot0.setBtnTouchState(slot4, slot0, slot1)
	end
end

ClientUpdaterView.getI18n = function (slot0, slot1)
	slot4 = slot1
	slot2, slot6 = I18n.breakUiText(slot3)
	slot7 = I18n.get(slot5)

	if StringUtil.isStringValid(slot3) then
		slot2 = slot4
	end

	return slot2
end

ClientUpdaterView.initPopUpView = function (slot0)
	if not slot0._popup then
		slot4 = "layerPopup"
		slot0._popup = slot0._root.getChildByName(slot2, slot0._root)
		slot4 = "contentTf"
		slot0._popupContentTf = slot0._popup.getChildByName(slot2, slot0._popup)
		slot4 = "btnConfirm"
		slot0._btnConfirmInPopUp = slot0._popup.getChildByName(slot2, slot0._popup)
		slot4 = "btnCancel"
		slot0._btnCancelInPopUp = slot0._popup.getChildByName(slot2, slot0._popup)
		slot3 = slot0._btnConfirmInPopUp
		slot7 = slot0.onTouchOperation

		slot0._btnConfirmInPopUp.addTouchEventListener(slot2, handler(slot5, slot0))

		slot3 = slot0._btnCancelInPopUp
		slot7 = slot0.onTouchOperation

		slot0._btnCancelInPopUp.addTouchEventListener(slot2, handler(slot5, slot0))

		slot3 = slot0._popupContentTf
		slot6 = slot0
		slot9 = slot0._popupContentTf

		slot0._popupContentTf.setString(slot2, slot0.getI18n(slot5, slot0._popupContentTf.getString(slot8)))

		slot4 = "btnKf"
		slot0._btnKf = slot0._root.getChildByName(slot2, slot0._root)

		if slot0._btnKf then
			slot3 = slot0._btnKf
			slot7 = slot0.onTouchOperation

			slot0._btnKf.addTouchEventListener(slot2, handler(slot5, slot0))
		end

		if IS_SDK_OFFIIAL_VERIFY and slot0._btnKf then
			slot4 = false

			slot0._btnKf.setVisible(slot2, slot0._btnKf)
		end
	end

	slot3 = slot0

	slot0.onPopupMsgVo(slot2)
end

ClientUpdaterView.show = function (slot0)
	slot3 = cc.Scene
	slot0._scene = cc.Scene.create(slot2)
	slot3 = slot0._scene

	slot0._scene.retain(slot2)

	slot3 = cc.FileUtils
	slot4 = "res/gameres/csb/layer/Update.csb"
	slot5 = cc.FileUtils.getInstance(slot2).fullPathForFilename(slot2, cc.FileUtils.getInstance(slot2))
	slot0._view = cc.CSLoader.createNode(cc.FileUtils.getInstance(slot2), cc.CSLoader)
	slot5 = "root"
	slot0._root = slot0._view.getChildByName(cc.FileUtils.getInstance(slot2), slot0._view)
	slot4 = slot0

	slot0.initPopUpView(cc.FileUtils.getInstance(slot2))
	slot0._scene.addChild(cc.FileUtils.getInstance(slot2), slot0._scene)

	slot8 = (CONFIG_SCREEN_HEIGHT - CONFIG_DESIGN_HEIGHT) * 0.5

	slot0._view.setPosition(slot0._view, slot0._view, slot2)

	slot7 = "layerLoading"
	slot4 = slot0._root.getChildByName(slot0._view, slot0._root)
	slot8 = "txtLoading"
	slot0._loadingLabel = slot4.getChildByName(slot0._root, slot4)
	slot8 = "txtLoadingPercent"
	slot0._loadingPercentLabel = slot4.getChildByName(slot0._root, slot4)
	slot8 = "bar"
	slot0._loadingBar = slot4.getChildByName(slot0._root, slot4)
	slot8 = "txtLoadingTips"
	slot0._loadingDetailTxt = slot4.getChildByName(slot0._root, slot4)

	if slot0._loadingDetailTxt then
		slot8 = "     游戏正在启动中，请稍候片刻 ..."

		slot0._loadingDetailTxt.setString(slot6, slot0._loadingDetailTxt)
	end

	slot7 = slot0.controller
	slot10 = "c707"

	slot0.controller.changeLoadingText(slot6, I18n.get(slot9))

	slot7 = slot0

	slot0.updateLoadingPercent(slot6)

	slot8 = "bg"
	slot5 = slot0._root.getChildByName(slot6, slot0._root)
	slot9 = "bgVerify"
	slot7 = IS_CHANGE_BG_IN_VERIFY and slot0._root.getChildByName(slot0._root, slot0._root) ~= nil and IS_IN_IOS_VERIFY_STATE

	if slot6 then
		slot11 = slot7

		slot6.setVisible(slot9, slot6)

		slot11 = not slot7

		slot5.setVisible(slot9, slot5)
	end

	slot0.checkSpine(slot9)

	slot11 = slot0

	slot0:updateLoadingTxtWithSentenceArr()

	function slot12()
		slot3 = cc.Director.getInstance(slot1)

		if cc.Director.getInstance(slot1).getRunningScene(cc.Director) then
			slot4 = slot0._scene

			slot0.replaceScene(slot2, slot0)
		else
			slot4 = slot0._scene

			slot0.runWithScene(slot2, slot0)
		end

		slot0.model.updateScene = slot0._scene
	end

	slot0.controller.checkSplashShowing(slot0, slot0.controller)
end

ClientUpdaterView.updateLoadingPercent = function (slot0)
	if slot0._view then
		slot6 = slot0.model
		slot1 = math.min(slot2, slot0.model.getCurShowLoadingPercent(slot5))
		slot5 = slot0._loadingBar
		slot6 = slot0._loadingBar
		slot3 = slot0._loadingBar.getPositionX(slot0._loadingBar) - slot0._loadingBar.getContentSize(1).width * slot0._loadingBar.getScaleX(slot0._loadingBar) * slot0._loadingBar.getAnchorPoint(slot0._loadingBar).x + slot0._loadingBar.getContentSize(1).width * slot0._loadingBar.getScaleX(slot0._loadingBar) * slot1
		slot7 = slot1 * 100

		slot0._loadingBar.setPercent(slot0._loadingBar, slot0._loadingBar)

		slot9 = slot1 * 100
		slot7 = math.floor(slot8) .. "%"

		slot0._loadingPercentLabel.setString(slot0._loadingBar, slot0._loadingPercentLabel)

		slot0._curPercent = slot1

		if slot0._loadingDetailTxt then
			slot4 = slot0.model.getCurDownloadSize(slot5)
			slot7 = slot0.model

			if slot0.model.getDownloadTotalSize(slot0.model) == 0 and slot4 == 0 then
				slot9 = "     游戏正在启动中，请稍候片刻 ..."

				slot0._loadingDetailTxt.setString(slot7, slot0._loadingDetailTxt)
			else
				slot9 = slot4
				slot9 = slot5
				slot8 = slot0._loadingDetailTxt
				slot13 = slot0.controller.getSizeString(slot7, slot0.controller)

				slot0._loadingDetailTxt.setString(slot7, string.format(slot10, "正在下载最新更新包     %s/%s", slot0.controller.getSizeString(slot7, slot0.controller)))
			end
		end
	end
end

ClientUpdaterView.updateText = function (slot0)
	if slot0._loadingLabel and (IS_IN_IOS_VERIFY_STATE or not LOADING_SENTENCES_ARR) then
		slot6 = slot0.model
		slot4 = slot0.model.getLoadingTxt(slot5) or ""

		slot0._loadingLabel.setString(slot2, slot0._loadingLabel)
	end
end

ClientUpdaterView.destroy = function (slot0)
	if slot0._view then
		slot3 = slot0._view

		slot0._view.removeFromParent(slot2)

		slot0._view = nil
	end

	if slot0._loadingSentencesUpdateScheduleId then
		slot3 = cc.Director
		slot3 = cc.Director.getInstance(slot2)
		slot4 = slot0._loadingSentencesUpdateScheduleId

		cc.Director.getInstance(slot2).getScheduler(slot2).unscheduleScriptEntry(slot2, cc.Director.getInstance(slot2).getScheduler(slot2))

		slot0._loadingSentencesUpdateScheduleId = nil
	end

	slot0.model.updateScene = nil

	if slot0._scene then
		slot3 = slot0._scene

		slot0._scene.release(slot2)
	end

	slot0._loadingLabel = nil
	slot0._loadingBar = nil
end

return
