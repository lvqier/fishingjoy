slot2 = "BaseWinNoticeCcsPane"
BaseWinNoticeCcsPane = class(slot1)

BaseWinNoticeCcsPane.onCreationComplete = function (slot0)
	slot1, slot2 = nil
	slot5 = "zsb_firetipskuangeffectyy/zsb_firetipskuangeffectyy.json"
	slot5 = "zsb_firetipskuangeffectyy/zsb_firetipskuangeffectyy.atlas"
	slot0._spineBg = sp.SkeletonAnimation.create(slot4, sp.SkeletonAnimation, slot1)
	slot5 = slot0._spineBg
	slot9 = 0

	slot0._spineBg.setPosition(slot4, cc.p(ResConfig.getSpinePath(slot4), 0))

	slot6 = -1

	slot0._spineBg.setLocalZOrder(slot4, slot0._spineBg)

	slot6 = slot0._spineBg

	slot0.addChild(slot4, slot0)

	slot5 = "zsb_firetipskuangeffect/zsb_firetipskuangeffect.json"
	slot5 = "zsb_firetipskuangeffect/zsb_firetipskuangeffect.atlas"
	slot0._spineFire = sp.SkeletonAnimation.create(slot4, sp.SkeletonAnimation, slot1)
	slot5 = slot0._spineFire
	slot9 = 0

	slot0._spineFire.setPosition(slot4, cc.p(slot2, 0))

	slot6 = -1

	slot0._spineFire.setLocalZOrder(slot4, slot0._spineFire)

	slot6 = slot0._spineFire

	slot0.addChild(slot4, slot0)

	slot0._curTrumpMsgVo = nil
	slot0._isShowing = false
	slot0._msgGap = 6
	slot0._curShowingTfs = {}
	slot0._hideUiTl = nil
	slot0._isNoticeEnable = true
	slot5 = slot0

	slot0.resetState(slot4)

	slot6 = true

	slot0.contentClipLayer.setClippingEnabled(slot4, slot0.contentClipLayer)
	gameMgr.winNoticeMsgArrChangedSignal.add(slot4, gameMgr.winNoticeMsgArrChangedSignal, slot0.onTrumpMsgChanged)

	slot5 = slot0

	slot0.onTrumpMsgChanged(slot4)

	slot5 = slot0
	slot9 = slot0.onDisplayListStateChanged

	slot0.registerScriptHandler(slot4, handler(slot0, slot0))

	slot8 = slot0

	eventMgr.add(slot4, eventMgr, GameEvent.OnSceneChanged, slot0.onSceneChanged)

	slot7 = slot0

	gameMgr.curGameKindChangedSignal.add(slot4, gameMgr.curGameKindChangedSignal, slot0.onGameKindChanged)

	slot5 = slot0

	slot0.onSceneChanged(slot4)
end

BaseWinNoticeCcsPane.onSceneChanged = function (slot0)
	slot3 = uiMgr

	if uiMgr.getCurSceneType(slot2) == SceneType.scene_login then
		slot5 = true

		slot0.forbidNotice(slot3, slot0)
	elseif slot1 == SceneType.scene_plaza then
		slot5 = false

		slot0.forbidNotice(slot3, slot0)
	else
		slot4 = slot0

		slot0.onGameKindChanged(slot3)
	end
end

BaseWinNoticeCcsPane.onGameKindChanged = function (slot0)
	slot3 = uiMgr

	if uiMgr.getCurSceneType(slot2) == SceneType.scene_login or slot1 == SceneType.scene_plaza then
		return
	end

	slot4 = gameMgr

	if not gameMgr.getCurGameKind(slot3) or slot2 == GameKind_JXLW or slot2 == GameKind_SERIAL or slot2 == GameKind_SGJ then
		slot6 = true

		slot0.forbidNotice(slot4, slot0)
	else
		slot6 = false

		slot0.forbidNotice(slot4, slot0)
	end
end

BaseWinNoticeCcsPane.forbidNotice = function (slot0, slot1)
	slot0._forbidNotice = slot1
	slot5 = slot0._isShowing

	slot0.setNoticeVisible(slot3, slot0)
end

BaseWinNoticeCcsPane.setNoticeVisible = function (slot0, slot1)
	slot5 = not slot0._forbidNotice and slot1

	slot0.setVisible(slot3, slot0)
end

BaseWinNoticeCcsPane.onDisplayListStateChanged = function (slot0, slot1)
	if slot1 == "enter" then
		slot5 = true

		slot0.setNoticeEnable(slot3, slot0)

		if not slot0._curTrumpMsgVo then
			slot4 = slot0

			slot0.onTrumpMsgChanged(slot3)
		end
	elseif slot1 == "exit" then
		slot5 = false

		slot0.setNoticeEnable(slot3, slot0)
	end
end

BaseWinNoticeCcsPane.resetState = function (slot0)
	slot4 = false

	slot0._spineBg.setVisible(slot2, slot0._spineBg)

	slot4 = false

	slot0._spineFire.setVisible(slot2, slot0._spineFire)

	slot4 = false

	slot0.setNoticeVisible(slot2, slot0)
end

BaseWinNoticeCcsPane.setNoticeEnable = function (slot0, slot1)
	slot0._isNoticeEnable = slot1
end

BaseWinNoticeCcsPane.setBgContentSize = function (slot0, slot1, slot2)
	return
end

BaseWinNoticeCcsPane.hide = function (slot0)
	slot0._curTrumpMsgVo = nil
	slot0._isShowing = false
	slot2 = TimelineLite.new(slot3)
	slot5 = slot2
	slot10 = {
		autoAlpha = 0
	}

	slot2.insert({
		onComplete = function ()
			slot3 = false

			slot0._spineBg.setVisible(slot1, slot0._spineBg)

			slot3 = false

			slot0._spineBg.setVisible._spineFire.setVisible(slot1, slot0._spineBg.setVisible._spineFire)

			slot3 = false

			slot0._spineBg.setVisible._spineFire.setVisible.setNoticeVisible(slot1, slot0._spineBg.setVisible._spineFire.setVisible)

			slot0._spineBg.setVisible._spineFire.setVisible.setNoticeVisible._hideUiTl = nil
		end
	}, TweenLite.to(slot7, slot0, 0.5))

	slot0._hideUiTl = slot2
	slot5 = slot0

	if slot0.isVisible() then
		slot8 = false

		slot0._spineBg.setAnimation(slot4, slot0._spineBg, 0, "end")

		slot8 = false

		slot0._spineFire.setAnimation(slot4, slot0._spineFire, 0, "end")
	else
		slot6 = false

		slot0._spineBg.setVisible(slot4, slot0._spineBg)

		slot6 = false

		slot0._spineFire.setVisible(slot4, slot0._spineFire)
	end
end

BaseWinNoticeCcsPane.onTrumpMsgChanged = function (slot0)
	slot3 = gameMgr
	slot1 = gameMgr.getWinNoticeMsgArr(slot2)[1]

	if slot0._isNoticeEnable and slot1 then
		if not slot0._isShowing then
			if slot0._hideUiTl then
				slot4 = slot0._hideUiTl

				slot0._hideUiTl.kill(slot3)

				slot0._hideUiTl = nil
			end

			slot0._curTrumpMsgVo = slot1
			slot5 = true

			slot0.setNoticeVisible(slot3, slot0)

			slot0._isShowing = true
			slot8 = slot0.checkShowTxt
			slot5 = TimelineLite.new(slot3)
			slot10 = {
				autoAlpha = (slot0.isVisible(slot12) and 1) or 0
			}
			slot13 = slot0

			TimelineLite.new(slot3).append({
				onComplete = handler(slot6, slot0)
			}, TweenLite.to(slot7, slot0, 0.3))

			slot6 = true

			slot0._spineBg.setVisible(, slot0._spineBg)

			slot6 = true

			slot0._spineFire.setVisible(, slot0._spineFire)

			slot8 = false

			slot0._spineBg.setAnimation(, slot0._spineBg, 0, "start")

			slot8 = true

			slot0._spineBg.addAnimation(, slot0._spineBg, 0, "idle")

			slot8 = false

			slot0._spineFire.setAnimation(, slot0._spineFire, 0, "start")

			slot8 = true

			slot0._spineFire.addAnimation(, slot0._spineFire, 0, "idle")
		elseif not slot0._curTrumpMsgVo then
			slot0._curTrumpMsgVo = slot1
			slot4 = slot0

			slot0.checkShowTxt(slot3)
		end
	end
end

BaseWinNoticeCcsPane.onTfAllComplete = function (slot0, slot1, slot2)
	slot6 = slot1

	table.removebyvalue(slot4, slot0._curShowingTfs)

	slot5 = slot1

	slot1.destroy(slot4)

	if #slot0._curShowingTfs == 0 then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

BaseWinNoticeCcsPane.checkNext = function (slot0, slot1, slot2)
	slot6 = slot0._curTrumpMsgVo

	gameMgr.removeWinNoticeMsg(slot4, gameMgr)

	if slot0._isNoticeEnable then
		slot5 = gameMgr
		slot0._curTrumpMsgVo = gameMgr.getWinNoticeMsgArr(slot4)[1]

		if slot0._curTrumpMsgVo then
			slot5 = slot0

			slot0.checkShowTxt(slot4)
		else
			slot5 = slot1._tl

			slot1._tl.pause(slot4)

			slot7 = slot2

			slot0.onTfAllComplete(slot4, slot0, slot1)
		end
	else
		slot0._curTrumpMsgVo = nil
	end
end

BaseWinNoticeCcsPane.checkShowTxt = function (slot0)
	if slot0._curTrumpMsgVo then
		slot10 = TextField.H_CENTER
		slot3 = TextField.new(slot4, CCSKitchen.defaultFontFamily, 23, nil, slot2, 50)
		slot7 = slot3

		table.insert(CCSKitchen.defaultFontFamily, slot0._curShowingTfs)

		slot7 = slot0._curTrumpMsgVo.content

		slot3.setHtmlText(CCSKitchen.defaultFontFamily, slot3)

		slot7 = slot3
		slot5 = slot3:getTextWidth()
		slot6 = 100
		slot9 = slot0.contentClipLayer
		slot15 = -slot0.contentClipLayer.getContentSize(slot2).height - 25

		slot3.setPosition(slot12, slot3, slot0.contentClipLayer.getContentSize(slot2).width / 2 - 20000 / 2)
		DisplayUtil.setAddOrRemoveChild(slot12, slot3, slot0.contentClipLayer)

		slot17 = slot0.onTfAllComplete
		slot11 = TimelineLite.new(slot12)
		slot14 = slot11
		slot19 = {
			y = slot0.contentClipLayer.getContentSize(slot2).height / 2 - 13,
			ease = Linear.easeNone
		}

		slot11.append({
			onComplete = handler(true, slot0),
			onCompleteParams = {
				slot3,
				slot0._curShowingVo
			}
		}, TweenLite.to(slot0, slot3, slot10))

		slot19 = {
			y = slot0.contentClipLayer.getContentSize(slot2).height + 25,
			ease = Linear.easeNone,
			onStart = handler(slot21, slot0),
			onStartParams = {
				slot3,
				slot0._curShowingVo
			}
		}
		slot23 = slot0.checkNext
		slot16 = 2

		slot11.append(, slot11, TweenLite.to(slot0, slot3, 0.5))

		slot3._tl = slot11
	end
end

BaseWinNoticeCcsPane.destroy = function (slot0)
	slot5 = slot0

	gameMgr.winNoticeMsgArrChangedSignal.remove(slot2, gameMgr.winNoticeMsgArrChangedSignal, slot0.onTrumpMsgChanged)

	if slot0._hideUiTl then
		slot3 = slot0._hideUiTl

		slot0._hideUiTl.kill(slot2)

		slot0._hideUiTl = nil
	end

	slot3 = slot0._curShowingTfs

	for slot4, slot5 in ipairs(slot2) do
		if slot5._tl then
			slot8 = slot5._tl

			slot5._tl.kill(slot7)
		end

		slot5._tl = nil
		slot8 = slot5

		TweenLite.killTweensOf(slot7)

		slot8 = slot5

		slot5.destroy(slot7)
	end

	slot0._curShowingTfs = {}
end

return
