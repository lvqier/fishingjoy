slot2 = "BaseGameAniamtionView"
BaseGameAniamtionView = class(slot1)

BaseGameAniamtionView.ctor = function (slot0, slot1, slot2)
	slot0._tweeningConfigs = slot1 or {}
	slot0._try2Put2PoolFuc = nil
	slot5 = slot0._tweeningConfigs

	for slot6, slot7 in ipairs(slot4) do
		if not slot7.toPos then
			slot12 = slot7.node
			slot7.toPos = DisplayUtil.ccpCopy(slot7.node.getPosition(slot11))
		end

		if not slot7.fromPos then
			slot12 = slot7.node
			slot7.fromPos = DisplayUtil.ccpCopy(slot7.node.getPosition(slot11))
		end

		if not slot7.fromAlpha then
			slot10 = slot7.node
			slot7.fromAlpha = slot7.node.getOpacity(slot9) / 255
		end

		if not slot7.toAlpha then
			slot10 = slot7.node
			slot7.toAlpha = slot7.node.getOpacity(slot9) / 255
		end

		if IS_GUAN_VERIFY and not slot2 then
			slot7.showDuration = 0
			slot7.hideDuration = 0
			slot7.hideImmediate = true
			slot7.showImmediate = true
			slot7.showDelay = nil
		end

		slot11 = 0.001
		slot7.hideDuration = math.max(slot9, slot7.hideDuration or 0.3)
		slot11 = 0.001
		slot7.showDuration = math.max(slot9, slot7.showDuration or 0.3)
		slot11 = slot7.fromPos

		slot7.node.setPosition(slot9, slot7.node)

		slot7.fadeInEase = slot7.fadeInEase or Quad.easeInOut
		slot7.fadeOutEase = slot7.fadeOutEase or Quad.easeInOut
		slot7.showEase = slot7.showEase or Quad.easeInOut
		slot7.hideEase = slot7.hideEase or Quad.easeInOut

		if not slot7.fromScale then
			slot10 = slot7.node
			slot8 = slot7.node.getScale(slot9)
		end

		slot7.fromScale = slot8

		if not slot7.toScale then
			slot10 = slot7.node
			slot8 = slot7.node.getScale(slot9)
		end

		slot7.toScale = slot8
		slot11 = slot7.fromAlpha * 255

		slot7.node.setOpacity(slot9, slot7.node)

		slot11 = slot7.fromScale

		slot7.node.setScale(slot9, slot7.node)
	end
end

BaseGameAniamtionView._onTabChangedShow = function (slot0, slot1)
	slot6 = true

	DisplayUtil.setAddOrRemoveChild(slot3, slot0, slot1)
end

BaseGameAniamtionView._onTabChangedHide = function (slot0, slot1, slot2)
	slot0._try2Put2PoolFuc = slot2
end

BaseGameAniamtionView.onHideAnimationComplete = function (slot0)
	return
end

BaseGameAniamtionView.onShowAnimationComplete = function (slot0)
	return
end

BaseGameAniamtionView.onHide = function (slot0)
	slot2 = false
	slot6 = false

	uiMgr.setIsWorldTouchable(slot4, uiMgr)

	slot3 = TimelineLite.new(slot4)
	slot6 = slot0._tweeningConfigs

	for slot7, slot8 in ipairs({
		onComplete = function ()
			slot3 = true

			uiMgr.setIsWorldTouchable(slot1, uiMgr)

			slot2 = uiMgr.setIsWorldTouchable

			uiMgr.setIsWorldTouchable.removeFromParent(slot1)

			slot2 = slot0._try2Put2PoolFuc

			applyFunction(slot1)

			applyFunction._try2Put2PoolFuc = nil
			slot2 = applyFunction

			applyFunction.onHideAnimationComplete(nil)
		end
	}) do
		if slot8.hideImmediate then
			slot12 = false

			slot8.node.setVisible(slot10, slot8.node)
		else
			slot2 = true
			slot11 = slot3
			slot16 = {
				alpha = slot8.fromAlpha,
				ease = slot8.fadeInEase or Quad.easeInOut
			}

			slot3.insert(slot10, TweenLite.to(slot13, slot8.node, slot8.hideDuration))

			slot11 = slot3
			slot16 = {
				x = slot8.fromPos.x,
				y = slot8.fromPos.y,
				ease = slot8.hideEase or Quad.easeInOut,
				scaleX = slot8.fromScale,
				scaleY = slot8.fromScale
			}

			slot3.insert(slot10, TweenLite.to(slot13, slot8.node, slot8.hideDuration))
		end
	end

	if not slot2 then
		slot1()
	end
end

BaseGameAniamtionView.onShow = function (slot0)
	uiMgr.setIsWorldTouchable(slot3, uiMgr)

	slot4 = {
		onComplete = function ()
			slot3 = true

			uiMgr.setIsWorldTouchable(slot1, uiMgr)

			slot2 = uiMgr.setIsWorldTouchable

			uiMgr.setIsWorldTouchable.onShowAnimationComplete(slot1)
		end
	}
	slot2 = TimelineLite.new(slot3)
	slot3 = false
	slot6 = slot0._tweeningConfigs

	for slot7, slot8 in ipairs(false) do
		slot12 = true

		slot8.node.setVisible(slot10, slot8.node)

		if slot8.showImmediate then
			slot11 = slot8.onShowStart

			applyFunction(slot10)

			slot12 = slot8.toPos

			slot8.node.setPosition(slot10, slot8.node)

			slot11 = slot8.onShowComplete

			applyFunction(slot10)

			if slot8.toScale then
				slot12 = slot8.toScale

				slot8.node.setScale(slot10, slot8.node)
			end

			if slot8.toAlpha then
				slot12 = slot8.toAlpha * 255

				slot8.node.setOpacity(slot10, slot8.node)
			end
		else
			slot3 = true
			slot11 = slot2
			slot16 = {
				delay = slot8.showDelay,
				x = slot8.toPos.x,
				y = slot8.toPos.y,
				onComplete = slot8.onShowComplete,
				onStart = slot8.onShowStart,
				ease = slot8.showEase or Quad.easeInOut
			}

			slot2.insert(slot10, TweenLite.to(slot13, slot8.node, slot8.showDuration))

			slot11 = slot2
			slot16 = {
				delay = slot8.showDelay,
				alpha = slot8.toAlpha,
				ease = slot8.fadeOutEase or Quad.easeInOut,
				scaleX = slot8.toScale,
				scaleY = slot8.toScale
			}

			slot2.insert(slot10, TweenLite.to(slot13, slot8.node, slot8.fadeInDuration or slot8.showDuration))
		end
	end

	if not slot3 then
		slot6 = slot1

		applyFunction(slot5)
	end
end

BaseGameAniamtionView.destroy = function (slot0)
	slot3 = slot0._tweeningConfigs

	for slot4, slot5 in ipairs(slot2) do
		slot8 = slot5.node

		TweenLite.killTweensOf(slot7)
	end

	slot0._tweeningConfigs = {}
end

return
