AbstractDnDComponent = class("AbstractDnDComponent")

AbstractDnDComponent.ctor = function (slot0)
	createSetterGetter(slot0, "isDragable", false, nil, nil, true)
	createSetterGetter(slot0, "isDropable", false)
	createSetterGetter(slot0, "touchOffsetX", 0, false, true)
	createSetterGetter(slot0, "touchOffsetY", 0, false, true)
	createSetterGetter(slot0, "oldPosition", nil, false, true)
	createSetterGetter(slot0, "oldParent", nil, false, true)
	createSetterGetter(slot0, "isRollOn", false, false, true)
	createSetterGetter(slot0, "isDraging", false)
	createSetterGetter(slot0, "dndTouchMovePos", nil, false, false, true)
	createSetterGetter(slot0, "dndTouchStartPos", nil, false, false, true)
	createSetterGetter(slot0, "dndTouchEndPos", nil, false, false, true)
	createSetterGetter(slot0, "dropInSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "beginDragSignal", SignalAs3.new(), false, true)
	createSetterGetter(slot0, "isTouchOperationManual", false)
end

AbstractDnDComponent.getIsDragable = function (slot0)
	return slot0._isDragable
end

AbstractDnDComponent.setupDnD = function (slot0, slot1, slot2, slot3)
	if slot1 == nil then
		slot1 = true
	end

	if slot2 == nil then
		slot2 = true
	end

	slot0._oldZorder = slot0:getView():getLocalZOrder()
	slot0._oldPosition = DisplayUtil.ccpCopy(slot0:getView():getPosition())
	slot0._oldParent = slot0:getView():getParent()

	slot0:setIsDragable(slot1)
	slot0:setIsDropable(slot2)
	slot0:setIsTouchOperationManual(slot3)
	dndMgr:handleIt(slot0)
end

AbstractDnDComponent.getView = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

AbstractDnDComponent.getDragView = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

AbstractDnDComponent.getInteractiveObject = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

AbstractDnDComponent.getDragParent = function (slot0)
	errorMgr:throwMethodShouldBeOverwritten()

	return nil
end

AbstractDnDComponent.onDndTouchOperation = function (slot0, slot1, slot2)
	return
end

AbstractDnDComponent.setCanTouch = function (slot0, slot1)
	slot0:getInteractiveObject():setTouchEnabled(slot1)
end

AbstractDnDComponent.canEatThis = function (slot0, slot1)
	return false
end

AbstractDnDComponent.onDndClick = function (slot0)
	return
end

AbstractDnDComponent.onDndRollOut = function (slot0)
	slot0._isRollOn = false
end

AbstractDnDComponent.onDndRollOn = function (slot0)
	slot0._isRollOn = true
end

AbstractDnDComponent.onDndRollOnAndMove = function (slot0, slot1)
	return
end

AbstractDnDComponent.onDndDragingAndMove = function (slot0, slot1)
	return
end

AbstractDnDComponent.onDisposeDrag = function (slot0)
	return
end

AbstractDnDComponent.onDefaultRecoverComplete = function (slot0)
	DisplayUtil.setAddOrRemoveChild(slot0:getDragView(), slot0:getOldParent(), true)
	slot0:getDragView():setPosition(slot0:getOldPosition())
end

AbstractDnDComponent.getDndTouchMovePos = function (slot0)
	return slot0._dndTouchMovePos or slot0:getInteractiveObject():getTouchMovePosition()
end

AbstractDnDComponent.getDndTouchStartPos = function (slot0)
	return slot0._dndTouchStartPos or slot0:getInteractiveObject():getTouchBeganPosition()
end

AbstractDnDComponent.getDndTouchEndPos = function (slot0)
	return slot0._dndTouchEndPos or slot0:getInteractiveObject():getTouchEndPosition()
end

AbstractDnDComponent.onPushDown = function (slot0, slot1)
	slot0._oldZorder = slot0:getDragView():getLocalZOrder()

	slot0:getDragView():setLocalZOrder(200)

	if slot0:getView() == slot0:getDragView() then
		slot0._touchOffsetX = -slot0:getView():convertToNodeSpace(cc.p(slot0:getDndTouchStartPos().x, slot0.getDndTouchStartPos().y)).x
		slot0._touchOffsetY = -slot0.getView().convertToNodeSpace(cc.p(slot0.getDndTouchStartPos().x, slot0.getDndTouchStartPos().y)).y
	else
		slot0._touchOffsetX = 0
		slot0._touchOffsetY = 0
	end

	slot0._beginDragSignal:emit()
end

AbstractDnDComponent.resetOldDndPostion = function (slot0)
	if slot0._oldPosition then
		slot0:getDragView():setPosition(slot0._oldPosition)
	end

	if slot0._oldParent then
		DisplayUtil.setAddOrRemoveChild(slot0:getDragView(), slot0._oldParent, true)
	end
end

AbstractDnDComponent.onReleaseUp = function (slot0)
	slot0:getDragView():setLocalZOrder(slot0._oldZorder)
end

AbstractDnDComponent.destroy = function (slot0)
	slot0:onDefaultRecoverComplete()
	dndMgr:releaseIt(slot0)
	slot0._beginDragSignal:removeAll()
	slot0._dropInSignal:removeAll()

	slot0._dndTouchMovePos = nil
	slot0._dndTouchStartPos = nil
	slot0._dndTouchEndPos = nil
	slot0._isTouchOperationManual = nil
end

return
