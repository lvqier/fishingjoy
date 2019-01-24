slot2 = "CollapseModuleUIView"
CollapseModuleUIView = class(slot1)

CollapseModuleUIView.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot0._hideX = slot4
	slot0._showX = slot5
	slot0._hideY = slot6
	slot0._showY = slot7
	slot0._ease = slot10 or Sine.easeOut
	slot0._showDurationInS = slot8 or 0.3
	slot0._hideDurationInS = slot9 or slot0._showDurationInS
	slot18 = slot3

	ClassUtil.extends(slot12, slot0, BaseModuleUIView, true, slot1, slot2)
end

CollapseModuleUIView.show = function (slot0, slot1)
	slot2 = slot0._isShowing
	slot3 = slot0.view ~= nil
	slot6 = slot0

	BaseModuleUIView.show(slot5)

	if not slot2 then
		slot4 = slot0.view.ccsChildren[1]

		if not slot3 then
			slot7 = slot4
			slot5, slot6 = slot4.getPosition(slot6)
			slot9 = slot4
			slot13 = slot0._hideY or slot6

			slot4.setPosition(slot8, cc.p(slot11, slot0._hideX or slot5))
		end

		slot5 = 0

		if slot1 then
			slot5 = slot0._showDurationInS
		end

		slot10 = {
			x = slot0._showX,
			y = slot0._showY,
			ease = slot0._ease,
			onComplete = handler(slot12, slot0)
		}
		slot14 = slot0.onCollapseShowComplete

		TweenLite.to(slot7, slot4, slot5)
	end
end

CollapseModuleUIView.hide = function (slot0, slot1)
	if slot0._isShowing then
		slot2 = slot0.view.ccsChildren[1]
		slot3 = 0

		if slot1 then
			slot3 = slot0._hideDurationInS
		end

		slot8 = {
			x = slot0._hideX,
			y = slot0._hideY,
			ease = slot0._ease,
			onComplete = handler(slot10, slot0),
			ease = slot0._fadeOutEase
		}
		slot12 = slot0.onCollapseHideComplete

		TweenLite.to(slot5, slot2, slot3)
	end
end

CollapseModuleUIView.onCollapseShowComplete = function (slot0)
	return
end

CollapseModuleUIView.onCollapseHideComplete = function (slot0)
	slot3 = slot0

	BaseModuleUIView.hide(slot2)
end

return
