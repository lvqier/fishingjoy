slot2 = "UserInfoPopupView"
UserInfoPopupView = class(slot1)

UserInfoPopupView.ctor = function (slot0)
	ClassUtil.extends(slot2, slot0, AbstractZoomPopupView, true)

	slot4 = true

	slot0._rootView.view.layerDisplay.txtUnderWrite_tf.setIsWrapPrecise(slot2, slot0._rootView.view.layerDisplay.txtUnderWrite_tf)

	slot4 = false

	slot0._rootView.setTouchEnabled(slot2, slot0._rootView)

	slot4 = false

	slot0.setBlockCanTouch(slot2, slot0)

	slot1 = cc.EventListenerTouchOneByOne.create(slot2)
	slot5 = false

	slot1.setSwallowTouches(cc.EventListenerTouchOneByOne, slot1)

	slot8 = slot0.onClick2CloseMenu
	slot6 = cc.Handler.EVENT_TOUCH_BEGAN

	slot1.registerScriptHandler(cc.EventListenerTouchOneByOne, slot1, handler("csb/common/PopUpUserInfo.csb", slot0))

	slot4 = slot0._rootView
	slot6 = slot0._rootView

	slot0._rootView.getEventDispatcher(cc.EventListenerTouchOneByOne).addEventListenerWithSceneGraphPriority(cc.EventListenerTouchOneByOne, slot0._rootView.getEventDispatcher(cc.EventListenerTouchOneByOne), slot1)
end

UserInfoPopupView.onClick2CloseMenu = function (slot0, slot1, slot2)
	if slot0._isMeShowing then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

UserInfoPopupView.show = function (slot0, slot1, slot2)
	slot5 = slot1

	if type(slot4) == "number" then
		slot7 = tonumber(slot4)

		if gameMgr.getUserData(slot1, gameMgr) == nil then
			slot8 = "获取玩家数据失败"

			tweenMsgMgr.showWhiteMsg(slot6, tweenMsgMgr)

			return
		end

		slot8 = slot4

		slot0.setData(slot6, slot0)
	else
		slot5 = slot1

		if type(slot4) == "table" then
			slot7 = {
				wFaceID = slot1.FaceID,
				szNickName = slot1.NickName,
				dwUserID = slot1.UserID,
				szUnderWrite = slot1.UnderWrite,
				dwGameID = slot1.GameID,
				wGender = slot1.Gender,
				wechat = slot1.wechat
			}

			slot0.setData(slot5, slot0)
		else
			slot5 = "只能传入玩家id或者排行榜玩家数据"

			error(slot4)

			return
		end
	end

	if not slot0._isMeShowing then
		yOffset = yOffset or 0
		slot0._isMeShowing = true
		slot5 = slot0

		AbstractPopupView.show(slot4)

		slot5 = slot0

		slot0.onShowBegin(slot4)

		if slot0._isTween2Show then
			slot6 = 0

			slot0._rootView.bg.setOpacity(slot4, slot0._rootView.bg)

			slot6 = 0

			slot0._rootView.view.setOpacity(slot4, slot0._rootView.view)

			if slot0._isZoom2PopUp then
			end

			slot5 = slot0._rootView.bg

			TweenLite.killTweensOf(slot4)

			slot5 = slot0._rootView.view

			TweenLite.killTweensOf(slot4)

			slot7 = slot0._viewLayoutY + yOffset

			slot0._rootView.view.setPosition(slot4, slot0._rootView.view, slot0._viewLayoutX)

			slot7 = {
				delay = 0.1,
				alpha = slot0._bgAlpha
			}

			TweenLite.to(slot4, slot0._rootView.bg, 0.3)

			if slot2 then
				slot5 = slot2

				if DisplayUtil.isInDisplayList(slot4) then
					slot4 = slot0._rootView.view.layerDisplay.getContentSize(slot5)
					slot5 = slot0._rootView.view.getAnchorPoint(slot0._rootView.view.layerDisplay)
					slot10 = slot2
					slot9 = slot0._rootView
					slot14 = slot2
					slot7 = slot2.getContentSize(slot2.getParent(slot9))
					slot8 = slot2:getAnchorPoint()
					slot9 = slot2:getScaleX()
					slot13 = 0
					slot10 = cc.p(slot2, 0)

					if DisplayUtil.getPositionFromTo(slot3, slot2.getParent(slot9), DisplayUtil.ccpCopy(slot2.getPosition(slot13))).x > display.cx - display.gameLeft then
						slot10.x = slot6.x - slot8.x * slot7.width * slot9 - slot4.width * 0.5
					else
						slot10.x = slot6.x + (1 - slot8.x) * slot7.width * slot9 + slot4.width * 0.5
					end

					slot10.y = slot6.y
					slot14 = false

					DisplayUtil.setVisible(slot12, slot3)

					slot14 = slot6

					slot3.setPosition(slot12, slot3)

					slot14 = 0.001

					slot3.setScale(slot12, slot3)

					slot15 = {
						scale = 1,
						autoAlpha = 1,
						x = slot10.x,
						y = slot10.y,
						ease = Back.easeOut,
						onComplete = handler(slot17, slot0)
					}
					slot19 = slot0.onShowComplete

					TweenLite.to(slot12, slot3, 0.2)
				end
			elseif slot0._isZoom2PopUp then
				slot6 = true

				DisplayUtil.setVisible(slot4, slot0._rootView.view)

				slot5 = {
					onComplete = slot6
				}
				slot6 = handler(slot7, slot0)
				slot3 = TimelineLite.new(slot4)
				slot7 = slot3
				slot12 = {
					scaleX = 1 * 1.1,
					scaleY = 1 * 1.1
				}

				slot3.append(slot6, TweenLite.to(slot0.onShowComplete, slot0._rootView.view, 0.11))

				slot7 = slot3
				slot12 = {
					scaleY = 1,
					scaleX = 1
				}

				slot3.append(slot6, TweenLite.to(slot0.onShowComplete, slot0._rootView.view, 0.11))
			else
				slot7 = {
					alpha = 1,
					onComplete = handler(slot9, slot0)
				}
				slot11 = slot0.onShowComplete

				TweenLite.to(slot4, slot0._rootView.view, 0.3)
			end
		else
			slot6 = 255 * slot0._bgAlpha

			slot0._rootView.bg.setOpacity(slot4, slot0._rootView.bg)

			slot5 = slot0

			slot0.onShowComplete(slot4)
		end
	end
end

UserInfoPopupView.setData = function (slot0, slot1)
	if slot1 then
		slot2 = ""
		slot5 = slot0._rootView.view.layerDisplay.spSex
		slot8 = (slot1.wGender == 0 and "pane/b73dt_GrxxZhaq_tb2.png") or "pane/b72dt_GrxxZhaq_tb1.png"

		slot0._rootView.view.layerDisplay.spSex.setTexture(slot4, ResConfig.getUICommonPath(slot7))

		slot8 = 2
		slot7 = StringUtil.truncate(slot4, slot1.szNickName, 14, nil)

		slot0._rootView.view.layerDisplay.txtName_tf.setText(slot1.szNickName, slot0._rootView.view.layerDisplay.txtName_tf)

		slot8 = (StringUtil.isStringValid(slot1.szNickName) and slot1.szUnderWrite) or "这个家伙很懒，什么都没留下"

		slot0._rootView.view.layerDisplay.txtUnderWrite_tf.setText(slot1.szUnderWrite, slot0._rootView.view.layerDisplay.txtUnderWrite_tf)

		if slot1.wechat ~= nil then
			slot7 = slot1.wechat

			if StringUtil.trim(slot6) == "" then
				slot8 = true

				slot0._rootView.view.layerDisplay.txtID_tf.setVisible(slot6, slot0._rootView.view.layerDisplay.txtID_tf)

				slot8 = true

				slot0._rootView.view.layerDisplay.btnCopy.setVisible(slot6, slot0._rootView.view.layerDisplay.btnCopy)

				slot8 = false

				slot0._rootView.view.layerDisplay.btnCopyWetChat.setVisible(slot6, slot0._rootView.view.layerDisplay.btnCopyWetChat)
			else
				slot8 = false

				slot0._rootView.view.layerDisplay.txtID_tf.setVisible(slot6, slot0._rootView.view.layerDisplay.txtID_tf)

				slot8 = false

				slot0._rootView.view.layerDisplay.btnCopy.setVisible(slot6, slot0._rootView.view.layerDisplay.btnCopy)

				slot8 = true

				slot0._rootView.view.layerDisplay.btnCopyWetChat.setVisible(slot6, slot0._rootView.view.layerDisplay.btnCopyWetChat)
			end
		end

		slot8 = "ID:" .. slot1.dwGameID

		slot0._rootView.view.layerDisplay.txtID_tf.setText(slot6, slot0._rootView.view.layerDisplay.txtID_tf)

		slot10 = slot1.wGender
		slot9 = mainMgr.getHeadBgByGameKind(slot6, mainMgr, GameKind_HALL, GAME_STATE.SelfInfo)

		slot0._rootView.view.head.changeHeadBG(mainMgr, slot0._rootView.view.head)

		slot9 = slot1

		slot0._rootView.view.head.setUserData(mainMgr, slot0._rootView.view.head)

		slot0.data = slot1
	end
end

UserInfoPopupView.hide = function (slot0)
	slot3 = slot0

	AbstractZoomPopupView.hide(slot2)
end

UserInfoPopupView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0._rootView.view.btnClose then
		slot5 = slot0

		slot0.hide(slot4)
	elseif slot1 == slot0._rootView.view.layerDisplay.btnCopy then
		if slot0.data then
			slot5 = bridgeMgr
			slot8 = slot0.data.dwGameID

			bridgeMgr.copy2ClipBoard(slot4, tostring(slot7))

			slot6 = "用户ID复制成功"

			tweenMsgMgr.showGreenMsg(slot4, tweenMsgMgr)
		end
	elseif slot1 == slot0._rootView.view.layerDisplay.btnCopyWetChat and slot0.data then
		slot5 = mainMgr
		slot8 = slot0.data.wechat

		mainMgr.gotoWeChat(slot4, tostring(slot7))
	end
end

UserInfoPopupView.destroy = function (slot0)
	slot3 = slot0._rootView.view.layerDisplay.btnCopy

	destroySomeObj(slot2)

	slot3 = slot0

	AbstractZoomPopupView.destroy(slot2)
end

return
