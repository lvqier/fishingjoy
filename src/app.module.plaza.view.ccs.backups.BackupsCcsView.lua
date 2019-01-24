BackupsCcsView = class("BackupsCcsView")

BackupsCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._pY = slot0.view.fingerSpr:getPositionY()
end

BackupsCcsView.doHideCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)

	slot2 = TimelineLite.new()

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		y = slot0.layerTitle._initY + 40,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		scale = 0.7,
		ease = Quad.easeInOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		y = slot0._initY + 20,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 0.8,
		ease = Quad.easeInOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		autoAlpha = 0,
		ease = Quad.easeInOut
	}))
end

BackupsCcsView.doShowCustomPopupEffect = function (slot0, slot1)
	TweenLite.killTweensOf(slot0.layerTitle)
	TweenLite.killTweensOf(slot0._zoomLayer)
	DisplayUtil.setVisible(slot0.layerTitle, false)
	slot0.layerTitle:setScale(0.7)

	if not slot0.layerTitle._initY then
		slot0.layerTitle._initY = slot0.layerTitle:getPositionY()

		slot0.layerTitle:setPositionY(slot0.layerTitle._initY + 40)
	end

	slot2 = TimelineLite.new({
		delay = 0.04
	})

	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		y = slot0.layerTitle._initY
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.3, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot2:insert(TweenLite.to(slot0.layerTitle, 0.1, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
	slot0._zoomLayer:setPositionY(slot0._initY + 20)
	DisplayUtil.setVisible(slot0._zoomLayer, false)
	slot0._zoomLayer:setScale(0.8)

	slot3 = TimelineLite.new({
		onComplete = slot1
	})

	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		y = slot0._initY,
		ease = Quad.easeIn
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.21, {
		scale = 1,
		ease = Back.easeOut
	}))
	slot3:insert(TweenLite.to(slot0._zoomLayer, 0.07, {
		autoAlpha = 1,
		ease = Quad.easeInOut
	}))
end

BackupsCcsView.onShow = function (slot0)
	slot0.view.fingerSpr:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.EaseSineIn:create(cc.MoveTo:create(0.5, cc.p(slot0.view.fingerSpr:getPositionX(), slot0._pY + 19))), cc.EaseSineOut:create(cc.MoveTo:create(0.5, cc.p(slot0.view.fingerSpr:getPositionX(), slot0._pY))))))
end

BackupsCcsView.onHide = function (slot0)
	return
end

BackupsCcsView.onZoomShowTweenComplete = function (slot0)
	ZoomPopUpChildView.onZoomShowTweenComplete(slot0)
end

BackupsCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnSave then
		slot0.controller:gotoBackup()
		Hero:setIsBackups(true)
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBackups(false)
	end
end

BackupsCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingBackups(false)
end

BackupsCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnCopy)
	destroySomeObj(slot0.view.btnSave)
	ZoomPopUpChildView.destroy(slot0)
end

return
