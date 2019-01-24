CcsSwitcher = class("CcsSwitcher")

CcsSwitcher.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0)
	createSetterGetter(slot0, "isPlay", false, true, true)
	createSetterGetter(slot0, "statePosX", {})
	DisplayUtil.setVisible(slot0.txtOn, false)
	DisplayUtil.setVisible(slot0.bgOn, false)
end

CcsSwitcher.onClick = function (slot0)
	slot0:setIsPlay(not slot0._isPlay, nil, nil, nil, true)
end

CcsSwitcher.setIsPlay = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0._isPlay ~= slot1 or slot2 then
		slot0._isPlay = slot1
		slot6 = 0
		slot7 = 1
		slot8 = 0

		if slot0._isPlay then
			slot6 = 1
			slot7 = 0
			slot8 = slot0._statePosX.onX
		else
			slot8 = slot0._statePosX.offX
		end

		TweenLite.killTweensOf(slot0.switcheroff)
		TweenLite.killTweensOf(slot0.switcher)
		TweenLite.killTweensOf(slot0.txtOn)
		TweenLite.killTweensOf(slot0.txtOff)
		TweenLite.killTweensOf(slot0.bgOff)
		TweenLite.killTweensOf(slot0.bgOn)

		if slot3 then
			DisplayUtil.setVisible(slot0.txtOn, slot0._isPlay)
			DisplayUtil.setVisible(slot0.txtOff, not slot0._isPlay)
			DisplayUtil.setVisible(slot0.bgOn, slot0._isPlay)
			DisplayUtil.setVisible(slot0.bgOff, not slot0._isPlay)

			if slot0.switcheroff then
				slot0.switcheroff:setVisible(not slot0._isPlay)
				slot0.switcher:setVisible(slot0._isPlay)
				slot0.switcheroff:setPositionX(slot8)
				slot0.switcher:setPositionX(slot8)
			else
				slot0.switcher:setPositionX(slot8)
			end
		else
			if slot0.switcheroff then
				function slot9()
					slot0.switcher:setVisible(slot0._isPlay)
					slot0.switcher.setVisible.switcheroff:setVisible(not slot0._isPlay)
					slot0.switcher.setVisible.switcheroff.setVisible.switcher:setPositionX(slot0.switcher.setVisible.switcheroff.setVisible.switcher)
					slot0.switcher.setVisible.switcheroff.setVisible.switcher.setPositionX.switcheroff:setPositionX(slot0.switcher.setVisible.switcheroff.setVisible.switcher.setPositionX.switcheroff)
				end

				if slot0._isPlay then
					TweenLite.to(slot0.switcheroff, 0.1, {
						x = slot8,
						onComplete = slot9
					})
				else
					TweenLite.to(slot0.switcher, 0.1, {
						x = slot8,
						onComplete = slot9
					})
				end
			else
				TweenLite.to(slot0.switcher, 0.1, {
					x = slot8
				})
			end

			TweenLite.to(slot0.txtOn, 0.1, {
				autoAlpha = slot6
			})
			TweenLite.to(slot0.txtOff, 0.1, {
				autoAlpha = slot7
			})
			TweenLite.to(slot0.bgOn, 0.1, {
				autoAlpha = slot6
			})
			TweenLite.to(slot0.bgOff, 0.1, {
				autoAlpha = slot7
			})
		end

		if not slot4 then
			slot0.isPlayChangedSignal:emit(slot1, slot5)
		end
	end
end

CcsSwitcher.destroy = function (slot0)
	TweenLite.killTweensOf(slot0.switcher)
	TweenLite.killTweensOf(slot0.txtOn)
	TweenLite.killTweensOf(slot0.txtOff)
	TweenLite.killTweensOf(slot0.bgOn)
	TweenLite.killTweensOf(slot0.bgOff)
	ZoomCcsBtn.destroy(slot0)
end

return
