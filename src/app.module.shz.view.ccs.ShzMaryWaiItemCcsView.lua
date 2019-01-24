ShzMaryWaiItemCcsView = class("ShzMaryWaiItemCcsView")

ShzMaryWaiItemCcsView.onCreationComplete = function (slot0)
	slot0.SpineFile = slot0.controller:createSpineWithEvent("shz_mlkuang", nil, true, true)

	if slot0.SpineFile then
		slot0.SpineFile:setPositionX(0)
		slot0.SpineFile:setPositionY(0)
		slot0.Spine_sel:addChild(slot0.SpineFile)
	end

	createSetterGetter(slot0, "bSel", nil, nil, nil, nil, nil, handler(slot0, slot0.onBSelect))
end

ShzMaryWaiItemCcsView.onBSelect = function (slot0)
	if slot0._bSel then
		function slot1()
			slot0.Spine_sel:setVisible(false)
			slot0.Spine_sel.setVisible.Spine_sel:setOpacity(255)
		end

		if slot0.Spine_sel then
			slot0.Spine_sel:setVisible(true)
			slot0.Spine_sel:setOpacity(255)
			TweenLite.killTweensOf(slot0.Spine_sel)
			TweenLite.to(slot0.Spine_sel, 0.2, {
				alpha = 0,
				delay = 0.1,
				ease = Quad.easeInOut,
				onComplete = slot1
			})
		end
	end
end

ShzMaryWaiItemCcsView.endStopSetSel = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.Spine_sel)
	slot0.Spine_sel:setVisible(slot1)
	slot0.Spine_sel:setOpacity(255)
end

ShzMaryWaiItemCcsView.destroy = function (slot0)
	spPoolMgr:put(slot0.SpineFile)

	if slot0._spineEndTimer then
		slot0._spineEndTimer:stop()

		slot0._spineEndTimer = nil
	end
end

return
