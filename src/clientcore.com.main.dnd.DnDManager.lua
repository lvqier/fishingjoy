slot0 = class("DnDManager")

requireClientCoreMain("dnd.AbstractDnDComponent")

DnDEvent = {
	ON_RECOVER = "onRecover"
}

slot0.ctor = function (slot0)
	slot0._currentDragingDnd = nil
	slot0._currentMoveOnDnd = nil
	slot0._currentDragPic = nil
	slot0._isHandlingDrop = false
	slot0._dndsInHandle = {}
	slot0._dndLayer = nil
end

slot0.handleIt = function (slot0, slot1)
	if not slot0:isHandling(slot1) then
		slot0._dndsInHandle[slot1:getInteractiveObject()] = slot1

		if not slot1:getIsTouchOperationManual() then
			slot1:getInteractiveObject():setTouchEnabled(true)
			slot1:getInteractiveObject():addTouchEventListener(handler(slot0, slot0.onDnDTouch))
		end
	end
end

slot0.onDnDTouch = function (slot0, slot1, slot2)
	if slot0:getDndByInteractiveObject(slot1) then
		slot3:onDndTouchOperation(slot1, slot2)
	end

	if slot2 == ccs.TOUCH_EVENT_BEGAN then
		slot0:onDnDPushDown(slot1)
	elseif slot2 == ccs.TOUCH_EVENT_ENDED or slot2 == ccs.TOUCH_EVENT_CANCELED then
		slot0:onDnDReleaseUp(slot1, slot2)
	elseif slot2 == ccs.TOUCH_EVENT_MOVED then
		slot0:onDnDMove(slot1)
	end
end

slot0.resetCurrentDrag = function (slot0)
	slot0:onDnDReleaseUp(nil, ccs.TOUCH_EVENT_CANCELED, true)
end

slot0.onDnDPushDown = function (slot0, slot1)
	slot0:resetCurrentDrag()

	if not slot0._currentDragingDnd and slot0:getDndByInteractiveObject(slot1):getIsDragable() and not slot2:onPushDown(DisplayUtil.ccpCopy(slot1:getTouchBeganPosition())) then
		slot0._currentDragingDnd = slot2
		slot0._currentDragPic = slot0._currentDragingDnd:getDragView()

		TweenLite.killTweensOf(slot0._currentDragPic)
	end
end

slot0.onDnDReleaseUp = function (slot0, slot1, slot2, slot3)
	if slot0._currentDragingDnd then
		slot4 = slot0._currentDragingDnd:onReleaseUp()
		slot0._isHandlingDrop = true

		if not slot3 and slot0._currentMoveOnDnd and slot0._currentDragingDnd ~= slot0._currentMoveOnDnd then
			if slot0:canDropIn() then
				slot0:drop(slot0._currentDragingDnd, slot0._currentMoveOnDnd)
			elseif not slot4 then
				slot0:defaultRecover()
			end
		elseif not slot4 then
			slot0:defaultRecover()
		end

		slot0:disposeCurrentDrag()
	end

	if slot0:getDndByInteractiveObject(slot1) then
		if slot2 == ccs.TOUCH_EVENT_ENDED then
			slot4:onDndClick()
		end

		slot4:setIsDraging(false)
	end
end

slot0.onDnDMove = function (slot0, slot1)
	if slot0._currentDragingDnd then
		slot0._currentDragingDnd:setIsDraging(true)
		slot0._currentDragingDnd:onDndDragingAndMove(slot2)
		slot0:checkMoveOnDnD(DisplayUtil.ccpCopy(slot2))
		DisplayUtil.setAddOrRemoveChild(slot0._currentDragPic, slot0._currentDragingDnd:getDragParent(), true)

		(not slot0._currentDragingDnd.getDragParent().convertToNodeSpace or slot3:convertToNodeSpace(slot2)) and slot3:convertToNodeSpace(slot2).x = (not slot0._currentDragingDnd.getDragParent().convertToNodeSpace or slot3.convertToNodeSpace(slot2)) and slot3.convertToNodeSpace(slot2).x + slot0._currentDragingDnd:getTouchOffsetX() + slot0._currentDragPic:getContentSize().width * slot0._currentDragPic:getAnchorPoint().x
		(not slot0._currentDragingDnd.getDragParent().convertToNodeSpace or slot3.convertToNodeSpace(slot2)) and slot3.convertToNodeSpace(slot2).y = (not slot0._currentDragingDnd.getDragParent().convertToNodeSpace or slot3.convertToNodeSpace(slot2)) and slot3.convertToNodeSpace(slot2).y + slot0._currentDragingDnd:getTouchOffsetY() + slot0._currentDragPic.getContentSize().height * slot0._currentDragPic.getAnchorPoint().y

		slot0._currentDragPic:setPosition((not slot0._currentDragingDnd.getDragParent().convertToNodeSpace or slot3.convertToNodeSpace(slot2)) and slot3.convertToNodeSpace(slot2))
	end
end

slot0.checkMoveOnDnD = function (slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0._dndsInHandle) do
		slot8 = slot7:getInteractiveObject()

		if slot7 ~= slot0._currentDragingDnd and DisplayUtil.checkObjShowing(slot7:getView()) and slot8:hitTest(slot1, nil, nil) then
			slot2 = slot7

			break
		end
	end

	if slot2 ~= slot0._currentMoveOnDnd then
		if slot0._currentMoveOnDnd then
			slot0._currentMoveOnDnd:onDndRollOut(slot0._currentDragingDnd)
		end

		slot0._currentMoveOnDnd = slot2

		if slot0._currentMoveOnDnd then
			slot0._currentMoveOnDnd:onDndRollOn(slot0._currentDragingDnd)
		end
	end

	if slot0._currentMoveOnDnd then
		slot0._currentMoveOnDnd:onDndRollOnAndMove(slot1)
	end
end

slot0.deploy = function (slot0, slot1)
	slot0._dndLayer = slot1
end

slot0.drop = function (slot0, slot1, slot2)
	slot1:getDropInSignal():emit(slot1, slot2)
end

slot0.defaultRecover = function (slot0)
	if slot0._currentDragingDnd and slot0._currentDragPic then
		slot0._currentDragingDnd:getInteractiveObject():setTouchEnabled(false)
		TweenLite.to(slot0._currentDragPic, 0.2, {
			alpha = 1,
			x = slot0._currentDragPic:getParent():convertToNodeSpace(slot1).x,
			y = slot0._currentDragPic.getParent().convertToNodeSpace(slot1).y,
			onComplete = handler(slot0, slot0.defaultRecoverComplete),
			onCompleteParams = {
				slot0._currentDragPic,
				slot0._currentDragingDnd
			}
		})
	end
end

slot0.defaultRecoverComplete = function (slot0, slot1, slot2)
	slot2:getInteractiveObject():setTouchEnabled(true)
	slot2:onDefaultRecoverComplete()
end

slot0.disposeCurrentDrag = function (slot0)
	if slot0._currentDragingDnd then
		if slot0._currentMoveOnDnd then
			slot0._currentMoveOnDnd:onDndRollOut(slot0._currentDragingDnd)
		end

		slot0._currentDragingDnd:onDisposeDrag()

		slot0._currentDragingDnd = nil
		slot0._currentMoveOnDnd = nil
		slot0._currentDragPic = nil
	end
end

slot0.releaseIt = function (slot0, slot1)
	if slot0:isHandling(slot1) then
		slot1:getInteractiveObject():setTouchEnabled(false)

		slot0._dndsInHandle[slot1:getInteractiveObject()] = nil
	end
end

slot0.isHandling = function (slot0, slot1)
	return slot0._dndsInHandle[slot1:getInteractiveObject()] ~= nil
end

slot0.canDropIn = function (slot0)
	return slot0._currentMoveOnDnd and slot0._currentDragingDnd ~= slot0._currentMoveOnDnd and slot0._currentMoveOnDnd:getIsDropable() and slot0._currentMoveOnDnd:canEatThis(slot0._currentDragingDnd)
end

slot0.getDndByInteractiveObject = function (slot0, slot1)
	return slot0._dndsInHandle[slot1]
end

dndMgr = slot0.new()

return
