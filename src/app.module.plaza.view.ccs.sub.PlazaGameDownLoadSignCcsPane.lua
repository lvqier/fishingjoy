PlazaGameDownLoadSignCcsPane = class("PlazaGameDownLoadSignCcsPane")

PlazaGameDownLoadSignCcsPane.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0, slot0)
	createSetterGetter(slot0, "gameKind", nil, nil, nil, nil, nil, handler(slot0, slot0.onGameKindChanged))

	slot0._curGameState = nil
	slot0._curProgressVo = {
		progress = 0
	}

	slot0.txtPercent_tf:setStyleFunc(TextFieldUtil.makeLbsTextFieldStyle)
	slot0.txtPercent_tf:setLocalZOrder(10)

	slot0._progressTimer = cc.ProgressTimer:create(slot0.layerDown.sp)

	slot0._progressTimer:setPosition(slot0.icon:getPosition())
	slot0._progressTimer:setReverseDirection(true)
	slot0:addChild(slot0._progressTimer)
	slot0.layerDown:removeFromParent()
	slot0:onProgressUpdate()
	eventMgr:add(GameEvent.GAME_PACKAGE_DOWNLOAD_BEGIN, slot0.onGameDownLoadBegin, slot0)
	eventMgr:add(GameEvent.GAME_PACKAGE_DOWNLOAD_FINISH, slot0.onGameDownLoadFinish, slot0)
	eventMgr:add(GameEvent.GAME_PACKAGE_DOWNLOAD_ERROR, slot0.onGameDownLoadError, slot0)
	eventMgr:add(GameEvent.GAME_PACKAGE_INSTALL_BEGIN, slot0.onGameInstallBegin, slot0)
	eventMgr:add(GameEvent.GAME_PACKAGE_INSTALL_FINISH, slot0.onGameInstallFinish, slot0)
	eventMgr:add(GameEvent.GAME_PACKAGE_INSTALL_QUEUE_CHANGE, slot0.onGameInstallQueueChange, slot0)
end

PlazaGameDownLoadSignCcsPane.onGameInstallQueueChange = function (slot0)
	slot0:updateViewState()
	slot0:onProgressUpdate()
end

PlazaGameDownLoadSignCcsPane.checkState = function (slot0)
	if slot0:isInOperating() then
		if gameMgr:getCurInstallerVo().state == PACKAGE_STATE_DOWNLOADING then
			slot0:onGameDownLoadBegin()
		elseif slot1.state == PACKAGE_STATE_INSTALLING then
			slot0:onGameInstallBegin()
		end
	end
end

PlazaGameDownLoadSignCcsPane.onClick = function (slot0)
	slot0.controller:try2EnterGame(slot0._gameKind)
end

PlazaGameDownLoadSignCcsPane.isInOperating = function (slot0)
	return gameMgr:getCurInstallerVo() ~= nil and slot1.gameKind == slot0._gameKind
end

PlazaGameDownLoadSignCcsPane.onGameDownLoadProgress = function (slot0, slot1)
	if slot0:isInOperating() then
		slot0:toProgress(math.max(1, gameMgr:getCurInstallerVo().curSize / gameMgr.getCurInstallerVo().totalSize * 95), 0)
	end
end

PlazaGameDownLoadSignCcsPane.onGameDownLoadBegin = function (slot0)
	if slot0:isInOperating() then
		slot0:toProgress(math.max(1, slot2))
		eventMgr:add(GameEvent.GAME_PACKAGE_DOWNLOAD_PROGRESS, slot0.onGameDownLoadProgress, slot0)
	end
end

PlazaGameDownLoadSignCcsPane.onGameDownLoadError = function (slot0)
	if slot0:isInOperating() then
		slot0:toProgress(0, 1)
		slot0:updateViewState()
		eventMgr:remove(GameEvent.GAME_PACKAGE_DOWNLOAD_PROGRESS, slot0.onGameDownLoadProgress, slot0)
	end
end

PlazaGameDownLoadSignCcsPane.onGameDownLoadFinish = function (slot0)
	if slot0:isInOperating() then
		slot0:toProgress(95, 0.2)
		eventMgr:remove(GameEvent.GAME_PACKAGE_DOWNLOAD_PROGRESS, slot0.onGameDownLoadProgress, slot0)
	end
end

PlazaGameDownLoadSignCcsPane.onGameInstallBegin = function (slot0)
	if slot0:isInOperating() then
		slot0:toProgress(98, 10)
	end
end

PlazaGameDownLoadSignCcsPane.onGameInstallFinish = function (slot0)
	if slot0:isInOperating() then
		slot0:toProgress(100, 0.2, handler(slot0, slot0.updateViewState))
	end
end

PlazaGameDownLoadSignCcsPane.onProgressUpdate = function (slot0)
	slot1 = parseInt(slot0._curProgressVo.progress)

	slot0._progressTimer:setPercentage(100 - slot1)
	slot0.txtPercent_tf:setHtmlText(slot1 .. "%")
	slot0.txtPercent_tf:setVisible(slot1 > 0 or gameMgr:isGameInQueue(slot0._gameKind))
	slot0._progressTimer:setVisible(slot1 > 0 or gameMgr:isGameInQueue(slot0._gameKind))
	slot0.icon:setVisible(slot1 <= 0 and not gameMgr:isGameInQueue(slot0._gameKind))
end

PlazaGameDownLoadSignCcsPane.toProgress = function (slot0, slot1, slot2, slot3)
	TweenLite.killTweensOf(slot0._curProgressVo)

	if slot2 and slot2 > 0 then
		TweenLite.to(slot0._curProgressVo, slot2, {
			progress = slot1,
			onUpdate = handler(slot0, slot0.onProgressUpdate),
			onComplete = slot3
		})
	else
		slot0._curProgressVo.progress = slot1

		slot0:onProgressUpdate()
	end
end

PlazaGameDownLoadSignCcsPane.updateViewState = function (slot0)
	if slot0._gameKind then
		DisplayUtil.setVisible(slot0, gameMgr:checkGamePackageState(slot0._gameKind) ~= GAME_PACKAGE_STATE_AVAILABLE and slot1 ~= GAME_PACKAGE_STATE_UNAVAILABLE)
	else
		DisplayUtil.setVisible(slot0, false)
	end
end

PlazaGameDownLoadSignCcsPane.onGameKindChanged = function (slot0)
	if slot0._gameKind then
		slot0:checkState()
	end

	slot0:updateViewState()
end

return
