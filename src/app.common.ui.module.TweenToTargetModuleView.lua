slot2 = "TweenToTargetModuleView"
TweenToTargetModuleView = class(slot1)

TweenToTargetModuleView.ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot14 = 0.2

	ClassUtil.extends(slot6, slot0, FadeUIModuleView, true, slot1, slot3, slot4, 0.3)

	slot9 = slot2

	createSetterGetter(slot6, slot0, "triggerTarget")

	slot0._triggerPosition = nil
	slot0._viewPosition = nil
	slot0._viewScale = 1
end

TweenToTargetModuleView.onViewAddChild = function (slot0)
	slot4 = slot0.getRootView(slot2)
	slot2 = slot0.getRootView(slot2).getParent(slot0)

	if slot0._triggerTarget then
		if not slot0._triggerPosition then
			slot7 = slot1
			slot0._viewPosition = DisplayUtil.ccpCopy(slot1.getPosition(slot6))
			slot5 = slot1
			slot0._viewScale = slot1.getScale(slot4)
		end

		slot7 = slot0._triggerTarget
		slot6 = slot2
		slot11 = slot0._triggerTarget
		slot0._triggerPosition = DisplayUtil.getPositionFromTo(slot4, slot0._triggerTarget.getParent(slot6), DisplayUtil.ccpCopy(slot0._triggerTarget.getPosition(slot10)))
	else
		if not slot0._viewPosition then
			slot7 = slot1
			slot0._viewPosition = DisplayUtil.ccpCopy(slot1.getPosition(slot6))
			slot5 = slot1
			slot0._viewScale = slot1.getScale(slot4)
		end

		slot0._triggerTarget = nil
	end
end

TweenToTargetModuleView.tweenToHide = function (slot0, slot1, slot2)
	slot7 = true

	AbstractTopResView.setTopResPaneShowing(slot4, slot0, false)

	slot3, slot4 = nil

	if slot0._triggerTarget then
		slot3 = slot0._triggerPosition.x
		slot4 = slot0._triggerPosition.y
	elseif slot1 then
		slot7 = slot1
		slot3 = slot1.getContentSize(slot6).width * 0.5
		slot4 = slot1.getContentSize(slot6).height * 0.5
	else
		slot3 = CUR_SELECTED_WIDTH * 0.5
		slot4 = CUR_SELECTED_HEIGHT * 0.5
	end

	slot8 = slot2

	slot0.checkBgTweenToHide(slot6, slot0)

	if slot1 and slot1.onRootViewHideBegin then
		slot7 = slot1

		slot1.onRootViewHideBegin(slot6)
	end

	slot8 = slot0.onHideTweenComplete
	slot5 = handler(slot6, slot0)

	if slot1.doHideCustomPopupEffect then
		slot9 = slot5

		slot1.doHideCustomPopupEffect(slot7, slot1)
	else
		slot10 = {
			alpha = 0
		}

		TweenLite.to(slot7, slot1, slot2)

		slot10 = {
			scale = 0.01,
			x = slot3,
			y = slot4,
			onComplete = slot5
		}

		TweenLite.to(slot7, slot1, slot2)
	end
end

TweenToTargetModuleView.tweenToShow = function (slot0, slot1, slot2)
	slot6 = slot2

	slot0.checkBgTweenToShow(slot4, slot0)

	slot5 = slot0

	slot0.check2Hide4ConnerViews(slot4)

	slot3 = CUR_SELECTED_WIDTH
	slot4 = CUR_SELECTED_HEIGHT
	slot5, slot6 = nil

	if slot0._triggerTarget then
		slot5 = slot0._triggerPosition.x
		slot6 = slot0._triggerPosition.y
	elseif slot1 then
		slot9 = slot1
		slot5 = slot1.getContentSize(slot8).width * 0.5
		slot6 = slot1.getContentSize(slot8).height * 0.5
	else
		slot5 = slot3 * 0.5
		slot6 = slot4 * 0.5
	end

	slot10 = 1

	slot1.setScale(slot8, slot1)

	slot10 = slot0._viewPosition

	slot1.setPosition(slot8, slot1)

	slot1._viewPosition = slot0._viewPosition
	slot10 = true

	DisplayUtil.setVisible(slot8, slot1)

	slot9 = slot1

	TweenLite.killTweensOf(slot8)

	slot10 = slot0.onShowTweenComplete
	slot7 = handler(slot8, slot0)

	if slot1.doShowCustomPopupEffect then
		slot11 = slot7

		slot1.doShowCustomPopupEffect(slot9, slot1)
	else
		slot10 = {
			onComplete = slot7
		}
		slot8 = TimelineLite.new(slot9)
		slot13 = slot8
		slot18 = {
			x = ({
				x = (slot0._viewPosition.x - slot3 * 0.5) * 1.1 + slot3 * 0.5,
				y = (slot0._viewPosition.y - slot4 * 0.5) * 1.1 + slot4 * 0.5
			})["x"],
			y = ()["y"],
			scaleX = 1.1,
			scaleY = 1.1
		}

		slot8.append(slot4 * 0.5, TweenLite.to(slot15, slot1, 0.11))

		slot13 = slot8
		slot18 = {
			scaleY = 1,
			scaleX = 1,
			x = slot0._viewPosition.x,
			y = slot0._viewPosition.y
		}

		slot8.append(slot4 * 0.5, TweenLite.to(slot15, slot1, 0.11))
	end
end

TweenToTargetModuleView.destroy = function (slot0)
	slot0._triggerTarget = nil
	slot0._triggerPosition = nil
	slot0._viewPosition = nil
	slot0._viewScale = nil
	slot3 = slot0

	FadeUIModuleView.destroy(slot2)
end

return
