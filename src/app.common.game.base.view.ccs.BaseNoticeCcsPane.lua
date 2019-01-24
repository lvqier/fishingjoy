slot2 = "BaseNoticeCcsPane"
BaseNoticeCcsPane = class(slot1)

BaseNoticeCcsPane.onCreationComplete = function (slot0)
	slot0._curTrumpMsgVo = nil
	slot0._isShowing = false
	slot0._msgGap = 100
	slot0._curShowingTfs = {}
	slot3 = slot0.bg
	slot0._bgSize = slot0.bg.getContentSize(slot2)
	slot0._hideUiTl = nil
	slot0._isNoticeEnable = true
	slot3 = slot0

	slot0.resetState(slot2)

	slot4 = true

	slot0.contentClipLayer.setClippingEnabled(slot2, slot0.contentClipLayer)
	gameMgr.trumpMsgArrChangedSignal.add(slot2, gameMgr.trumpMsgArrChangedSignal, slot0.onTrumpMsgChanged)

	slot3 = slot0

	slot0.onTrumpMsgChanged(slot2)

	slot3 = slot0
	slot7 = slot0.onDisplayListStateChanged

	slot0.registerScriptHandler(slot2, handler(slot0, slot0))
end

BaseNoticeCcsPane.onDisplayListStateChanged = function (slot0, slot1)
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

BaseNoticeCcsPane.resetState = function (slot0)
	slot3 = slot0.bg

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.icon

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.bg
	slot7 = 3

	slot0.bg.setContentSize(slot2, cc.size(slot5, 0))

	slot4 = false

	DisplayUtil.setVisible(slot2, slot0.icon)

	slot4 = false

	slot0.setVisible(slot2, slot0)
end

BaseNoticeCcsPane.setNoticeEnable = function (slot0, slot1)
	slot0._isNoticeEnable = slot1
end

BaseNoticeCcsPane.setBgContentSize = function (slot0, slot1, slot2)
	slot0._bgSize = slot1
	slot6 = slot1

	slot0.bg.setContentSize(slot4, slot0.bg)

	slot5 = slot0
	slot11 = slot0
	slot9 = slot0.getContentSize(slot10).height

	slot0.setContentSize(slot4, cc.size(slot7, slot1.width + 10))

	slot5 = slot0.contentClipLayer
	slot9 = slot1.height

	slot0.contentClipLayer.setContentSize(slot4, cc.size(slot7, slot1.width - slot2))
end

BaseNoticeCcsPane.hide = function (slot0)
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

			slot0.setVisible(slot1, slot0)

			slot0.setVisible._hideUiTl = nil
		end
	}, TweenLite.to(slot7, slot0.icon, 0.3))

	slot5 = slot2
	slot10 = {
		height = 3
	}

	slot2.insert(, TweenLite.to(slot7, slot0.bg, 0.3))

	slot5 = slot2
	slot10 = {
		width = 0
	}

	slot2.append(, TweenLite.to(slot7, slot0.bg, 0.8))

	slot0._hideUiTl = slot2
end

BaseNoticeCcsPane.onTrumpMsgChanged = function (slot0)
	slot3 = gameMgr
	slot1 = gameMgr.getTrumpMsgArr(slot2)[1]

	if slot0._isNoticeEnable and slot1 then
		if not slot0._isShowing then
			if slot0._hideUiTl then
				slot4 = slot0._hideUiTl

				slot0._hideUiTl.kill(slot3)

				slot0._hideUiTl = nil
			end

			slot0._curTrumpMsgVo = slot1
			slot5 = true

			slot0.setVisible(slot3, slot0)

			slot0._isShowing = true
			slot8 = slot0.checkShowTxt
			slot2 = TimelineLite.new(slot3)
			slot5 = slot2
			slot10 = {
				width = slot0._bgSize.width
			}

			slot2.append({
				onComplete = handler(slot6, slot0)
			}, TweenLite.to(slot0, slot0.bg, 0.8))

			slot5 = slot2
			slot10 = {
				height = slot0._bgSize.height
			}

			slot2.append(, TweenLite.to(slot0, slot0.bg, 0.3))

			slot5 = slot2
			slot10 = {
				autoAlpha = 1
			}

			slot2.append(, TweenLite.to(slot0, slot0.icon, 0.3))
		elseif not slot0._curTrumpMsgVo then
			slot0._curTrumpMsgVo = slot1
			slot4 = slot0

			slot0.checkShowTxt(slot3)
		end
	end
end

BaseNoticeCcsPane.onTfAllComplete = function (slot0, slot1, slot2)
	slot6 = slot1

	table.removebyvalue(slot4, slot0._curShowingTfs)

	slot5 = slot1

	slot1.destroy(slot4)

	if #slot0._curShowingTfs == 0 then
		slot5 = slot0

		slot0.hide(slot4)
	end
end

BaseNoticeCcsPane.checkNext = function (slot0)
	slot4 = slot0._curTrumpMsgVo

	gameMgr.removeTrumpMsg(slot2, gameMgr)

	if slot0._isNoticeEnable then
		slot3 = gameMgr
		slot0._curTrumpMsgVo = gameMgr.getTrumpMsgArr(slot2)[1]
		slot3 = slot0

		slot0.checkShowTxt(slot2)
	else
		slot0._curTrumpMsgVo = nil
	end
end

BaseNoticeCcsPane.checkShowTxt = function (slot0)
	if slot0._curTrumpMsgVo then
		slot6 = ""
		slot6 = ""
		slot11 = 255
		slot9 = cc.c4b((slot0._curTrumpMsgVo.TrumpetColor / 256 / 256) % 256, slot3, slot4, slot5)
		slot7 = DisplayUtil.ccc32RGB(slot3)
		slot9 = "#" .. slot7
		slot10 = slot0._curTrumpMsgVo
		slot13 = TextField.H_LEFT
		slot6 = TextField.new(slot7, CCSKitchen.defaultFontFamily, 23, nil, 20000, nil)
		slot10 = slot6

		table.insert(CCSKitchen.defaultFontFamily, slot0._curShowingTfs)
		slot6.setHtmlText(CCSKitchen.defaultFontFamily, slot6)

		slot9 = slot6
		slot11 = slot0.contentClipLayer
		slot18 = 3

		slot6.setPosition(slot15, slot6, slot9)
		DisplayUtil.setAddOrRemoveChild(slot15, slot6, slot0.contentClipLayer)

		slot20 = slot0.onTfAllComplete
		slot14 = TimelineLite.new(slot15)
		slot17 = slot14
		slot22 = {
			x = slot0.contentClipLayer.getContentSize(slot1).width - (slot6.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap),
			ease = Linear.easeNone,
			onComplete = handler(slot24, slot0)
		}
		slot26 = slot0.checkNext

		slot14.append({
			onComplete = handler(true, slot0),
			onCompleteParams = {
				slot6,
				slot0._curShowingVo
			}
		}, TweenLite.to(slot0, slot6, slot13))

		slot17 = slot14
		slot22 = {
			x = -(slot6.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap),
			ease = Linear.easeNone
		}

		slot14.append(, TweenLite.to(slot0, slot6, (slot6.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap + slot0.contentClipLayer.getContentSize(slot1).width) / 100 - (slot6.getTextWidth(CCSKitchen.defaultFontFamily) + slot0._msgGap) / 100))

		slot6._tl = slot14
	end
end

BaseNoticeCcsPane.destroy = function (slot0)
	slot5 = slot0

	gameMgr.trumpMsgArrChangedSignal.remove(slot2, gameMgr.trumpMsgArrChangedSignal, slot0.onTrumpMsgChanged)

	slot3 = slot0.icon

	TweenLite.killTweensOf(slot2)

	slot3 = slot0.bg

	TweenLite.killTweensOf(slot2)

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
