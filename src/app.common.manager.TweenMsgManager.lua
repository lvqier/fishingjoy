slot0 = class(slot1)
slot3 = "ui.msg.TweenMsgTextField"

requireLuaFromCommon("TweenMsgManager")

slot0.ctor = function (slot0)
	slot0._maxMsgNum = 3
	slot0._yGap = 5
	slot0._msgZorder = ZORDER_TWEEN_MSG or 1000000
	slot0._holdDurationMs = 1000
	slot4 = 0
	slot0._msgPostion = cc.p(slot2, 0)
	slot0._curMsgs = {}
	slot7 = slot0.onDisposeAllTimer
	slot7 = false
	slot4 = "TweenMsgManager:_allDisposeTimer"
	slot0._allDisposeTimer = tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0), slot0._holdDurationMs, 1).changeTraceName(slot2, tickMgr.delayedCall(slot2, tickMgr, handler(slot5, slot0), slot0._holdDurationMs, 1))
	slot0._allDisposeTimer.autoDispose = false
	slot0._disposingMsgs = {}
	slot0._parentNode = nil
	slot5 = slot0

	uiMgr.isScreenOrientationRotatedChangedSignal.add(false, uiMgr.isScreenOrientationRotatedChangedSignal, slot0.onIsScreenOrientationRotatedChanged)

	slot3 = slot0

	slot0.onIsScreenOrientationRotatedChanged(false)
end

slot0.initParentLayer = function (slot0)
	if not slot0._parentNode then
		slot0._parentNode = display.newNode()
		slot4 = slot0._msgZorder

		slot0._parentNode.setLocalZOrder(slot2, slot0._parentNode)

		slot6 = uiMgr
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._parentNode, uiMgr.getTopLayerInAllScene(slot5))

		slot3 = slot0

		slot0.onIsScreenOrientationRotatedChanged(slot2)
	end
end

slot0.onIsScreenOrientationRotatedChanged = function (slot0)
	if slot0._parentNode then
		slot3 = uiMgr
		slot2 = nil

		if uiMgr.getIsScreenOrientationRotated(slot2) then
			slot6 = display.cy + 300
			slot2 = cc.p(slot4, display.cx)
		else
			slot6 = display.cy + 100
			slot2 = cc.p(slot4, display.cx)
		end

		slot6 = slot2

		slot0._parentNode.setPosition(slot4, slot0._parentNode)
	end
end

slot0.showWhiteMsg = function (slot0, slot1, slot2, slot3)
	slot9 = slot1
	slot9 = slot3

	slot0.showMsg(slot5, slot0, HtmlUtil.createWhiteTxt(slot8), slot2)
end

slot0.showGreenMsg = function (slot0, slot1)
	slot4 = slot0
	slot7 = slot1

	slot0.showMsg(slot3, HtmlUtil.createGreenTxt(slot6))
end

slot0.showRedMsg = function (slot0, slot1)
	slot4 = slot0
	slot7 = slot1

	slot0.showMsg(slot3, HtmlUtil.createRedTxt(slot6))
end

slot0.showMsg = function (slot0, slot1, slot2, slot3)
	slot6 = slot0

	slot0.initParentLayer(slot5)

	slot2 = slot2 or 32
	slot6 = slot0._allDisposeTimer

	if slot0._allDisposeTimer.getIsRunning(slot5) then
		slot6 = slot0._allDisposeTimer

		slot0._allDisposeTimer.reset(slot5)
	end

	slot10 = slot3
	slot4 = TweenMsgTextField.new(slot5, slot1, slot2, nil, nil)
	slot8 = slot4

	TableUtil.push(slot1, slot0._curMsgs)
	DisplayUtil.setAddOrRemoveChild(slot1, slot4, slot0._parentNode)

	slot7 = slot4
	slot11 = slot0.onTween2ShowComplete

	slot4.show(slot1, handler(true, slot0))

	slot7 = slot0

	slot0.rearrangeTxts(slot1)
end

slot0.rearrangeTxts = function (slot0)
	if slot0._maxMsgNum < #slot0._curMsgs then
		slot3 = slot0._curMsgs
		slot5 = true

		TableUtil.shift(slot2).dispose(slot2, TableUtil.shift(slot2), 0)
	end

	slot1 = slot0._msgPostion.y

	for slot6 = #slot0._curMsgs, 1, -1 do
		slot7 = slot0._curMsgs[slot6]

		if slot6 == slot2 then
			slot10 = slot7
			slot16 = slot7
			slot14 = slot1

			slot7.setPosition(slot9, cc.p(slot12, slot0._msgPostion.x - slot7.getContentSize(slot15).width * 0.5))
		else
			slot12 = {
				y = slot1
			}

			TweenLite.to(slot9, slot7, 0.2)
		end

		slot10 = slot7
		slot1 = slot1 + slot7.getContentSize(slot9).height + slot0._yGap
	end
end

slot0.onDisposeAllTimer = function (slot0)
	slot1 = TimelineLite.new()
	slot4 = slot0._curMsgs

	for slot5, slot6 in ipairs(slot3) do
		slot10 = slot5 * 0.1

		if slot6.dispose(slot8, slot6) then
			slot11 = slot7

			slot1.insert(slot9, slot1)
		end
	end

	slot0._curMsgs = {}
end

slot0.onTween2ShowComplete = function (slot0)
	slot1 = true
	slot4 = slot0._curMsgs

	for slot5, slot6 in ipairs(slot3) do
		slot9 = slot6

		if slot6.getIsTweening(slot8) then
			slot1 = false

			break
		end
	end

	if slot1 then
		slot4 = slot0._allDisposeTimer

		slot0._allDisposeTimer.start(slot3)
	end
end

tweenMsgMgr = slot0.new()

return
