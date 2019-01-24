CCSUtil = {}
ccs = ccs or {}
ccs.TOUCH_BEGAN = "began"
ccs.TOUCH_MOVED = "moved"
ccs.TOUCH_ENDED = "ended"
ccs.TOUCH_CANCELLED = "cancelled"

CCSUtil.changeUIScrollViewWithListView = function (slot0, slot1, slot2, slot3)
	return CCSUtil.changeUIScrollViewWithScrollView(slot0, slot1, CcsListView, slot2, slot3)
end

CCSUtil.changeUIScrollViewWithScrollView = function (slot0, slot1, slot2, slot3, slot4)
	slot12 = slot2 or CcsScrollView.new(slot1)
	slot12.model = slot3
	slot12.controller = slot4

	slot12:setContentSize(slot0:getContentSize())
	slot12:setLocalZOrder(slot7)
	slot12:setPosition(cc.p(slot10, slot11))
	slot12:setInnerContainerSize(cc.size(slot0:getInnerContainerSize().width, slot0.getInnerContainerSize().height))

	if slot0:getDirection() == 2 then
		slot12:setScrollPolicy(CcsScrollView.SCROLL_H)
	end

	slot0:getParent():addChild(slot12)
	slot0:setTouchEnabled(false)

	if table.indexof(slot0:getParent().ccsChildren, slot0) then
		slot0:getParent().ccsChildren[slot13] = slot12
	end

	if slot0:getChildByName("vScroller") then
		slot12:setVScrollBar(slot14)
	end

	if slot0:getChildByName("vScrollerTrack") then
		slot12:setVScrollBarTrack(slot15)
	end

	if slot0:getChildByName("vUpdateNode") then
		slot12:setVUpdateNode(slot16)
	end

	slot0:removeFromParent()

	return slot12
end

CCSUtil.changeUIScrollViewWithSliderView = function (slot0, slot1, slot2, slot3)
	slot8 = slot0:getInnerContainerSize()
	slot10 = CcsSliderView.new(slot1)
	slot10.model = slot2
	slot10.controller = slot3

	slot10:setContentSize(slot7)
	slot10:setLocalZOrder(slot6)
	slot10:setPosition(cc.p(DisplayUtil.ccpCopy(slot0:getPosition()).x - slot0:getContentSize().width * slot0:getAnchorPoint().x, DisplayUtil.ccpCopy(slot0.getPosition()).y))
	slot0:getParent():addChild(slot10)
	slot0:setTouchEnabled(false)

	if table.indexof(slot0:getParent().ccsChildren, slot0) then
		slot0:getParent().ccsChildren[slot11] = slot10
	end

	slot0:removeFromParent()

	return slot10
end

CCSUtil.changeUILabelWithTextField = function (slot0, slot1, slot2, slot3)
	if slot3 == nil then
		slot3 = true
	end

	slot4 = slot0:getVirtualRenderer()
	slot5 = CCSKitchen.defaultFontFamily or TextFieldUtil.getFontName(slot4)
	slot6 = slot4:getSystemFontSize()
	slot7 = slot0:getString()
	slot8 = DisplayUtil.ccc32RGB(slot4:getTextColor())
	slot10, slot11 = slot0:getPosition()
	slot12 = slot0:getLocalZOrder()
	slot14 = TextField.H_LEFT
	slot15 = slot10 - slot0:getContentSize().width * slot0:getAnchorPoint().x
	slot16 = slot11 - slot0.getContentSize().height * slot0.getAnchorPoint().y

	if slot9.x == 0.5 then
		slot14 = TextField.H_CENTER
	elseif slot9.x == 1 then
		slot14 = TextField.H_RIGHT
	end

	slot17 = TextField.new(slot5, slot6, slot8, slot13.width, slot13.height, slot14, nil, slot1)

	if slot2 then
		slot17:setText(slot7)
	end

	slot17:setLocalZOrder(slot12)
	slot17:setPosition(slot15, slot16)
	slot0:getParent():addChild(slot17, slot12)

	if table.indexof(slot0:getParent().ccsChildren, slot0) then
		slot0:getParent().ccsChildren[slot18] = slot17
	end

	if slot3 then
		slot0:removeFromParent()
	end

	return slot17
end

CCSUtil.setChildViewShowing = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = slot1

	if slot2 then
		if not slot1 then
			slot8 = ccsPoolMgr:get(slot0, false, slot4)
		end

		slot1._parent = slot5 or uiMgr:getCurUiLayer()

		if slot7 then
			slot1:setLocalZOrder(slot7)
		else
			slot1:setLocalZOrder(ZORDER_UI_FULL)
		end

		if not slot6 then
			uiMgr:centerLocate(slot1)

			if slot5 then
				slot1:setPosition(slot5:convertToNodeSpace(DisplayUtil.ccpCopy(slot1:getPosition())))
			end
		end

		slot1:setIsShowing(true)

		if slot1.onShow then
			slot1:onShow()
		end
	elseif slot1 then
		if slot3 then
			slot8 = nil

			slot1:setIsShowing(false, nil, function ()
				if slot0.onHide then
					slot0:onHide()
				end

				ccsPoolMgr:put(ccsPoolMgr.put)
			end)
		else
			slot1:setIsShowing(false, nil)

			if slot1.onHide then
				slot1:onHide()
			end
		end
	end

	return slot8
end

CCSUtil.changeUITextFeildWithCcsTextInput = function (slot0)
	slot8, slot9 = slot0:getPosition()

	slot0:removeFromParent()

	return CcsTextInput.new(cc.size(slot0:getContentSize().width, slot0.getContentSize().height), slot3, slot4, slot0:getColor(), slot0:getPlaceHolder(), nil, slot0:getParent(), )
end

CCSUtil.setBtnBlock = function (slot0)
	slot0:setCanTouch(false)
	slot0:getClickWhenCantTouchSignal():add(function ()
		tweenMsgMgr:showRedMsg(I18n.get("c955"))
	end)
end

CCSUtil.setBtnEnable = function (slot0, slot1)
	slot0:setBright(slot1)
	slot0:setTouchEnabled(slot1)
end

CCSUtil.playArmature = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot1 = slot1 or "idle"
	slot4 = (slot4 and 1) or 0

	armPoolMgr:get(slot0, slot6).getAnimation(slot9):setMovementEventCallFunc(function (slot0, slot1, slot2)
		if slot1 == ccs.MovementEventType.start then
			if slot0 then
				slot0(slot1, slot1, slot2)
			end
		elseif slot1 == ccs.MovementEventType.complete then
			if slot2 then
				slot2(slot1, slot1, slot2)
			end

			if not slot3 then
				armPoolMgr:put(slot1)
			end
		elseif slot1 == ccs.MovementEventType.loopComplete and slot4 then
			slot4(slot1, slot1, slot2)
		end
	end)

	if slot7 then
		slot10:setFrameEventCallFunc(slot7)
	end

	slot10:play(slot1, -1, slot4)
	slot10:gotoAndPlay(0)

	return slot9, slot10
end

CCSUtil.setArmaturePlaying = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 and slot0.getAnimation and slot0:getAnimation() then
		slot3 = slot3 or 0
		slot2 = (slot2 == false and 0) or 1
		slot1 = slot1 or false

		if slot4 and slot1 then
			slot6:setMovementEventCallFunc(function (slot0, slot1, slot2)
				if slot1 == ccs.MovementEventType.complete and slot0 then
					slot0:setVisible(false)

					if slot1 then
						slot1()
					end
				end
			end)
		end

		slot6:playWithIndex(0, -1, slot2)

		if slot1 then
			slot6:gotoAndPlay(slot3)
		else
			slot6:gotoAndPause(slot3)
		end

		if slot4 then
			slot0:setVisible(slot1)
		end
	end
end

CCSUtil.makeItAsBlockLayer = function (slot0)
	slot0:setTouchEnabled(true)
	slot0:setTouchSwallowEnabled(true)
end

return
