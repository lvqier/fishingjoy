PlazaSubGameCcsPane = class("PlazaSubGameCcsPane")
RED_PACKET_SPINE_TAG = 1000

PlazaSubGameCcsPane.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomCcsBtn, true, slot0, slot0)
	createSetterGetter(slot0, "gameKind", nil, nil, nil, nil, nil, handler(slot0, slot0.onGameKindChanged))
	Hero.firstPayEnableChangedSignal:add(slot0.refreshLockState, slot0)
	Hero.firstPayLockKindsChangedSignal:add(slot0.refreshLockState, slot0)

	slot0._spineFrame = sp.SkeletonAnimation:create(slot1, slot2)

	slot0._spineFrame:setPosition(121, 81.5)
	slot0:addChild(slot0._spineFrame)
	slot0.downloader:setLocalZOrder(2)

	if slot0.icon2 then
		slot0.icon:setVisible(not NEED_CHANGE_SUB_GAME_NAME)
		slot0.icon2:setVisible(NEED_CHANGE_SUB_GAME_NAME)
	end

	slot0.lock:setLocalZOrder(100)
	slot0:refreshLockState()
end

PlazaSubGameCcsPane.setAnimationsPlaying = function (slot0, slot1)
	if slot1 and slot0._gameKind and gameMgr:checkGamePackageState(slot0._gameKind) ~= GAME_PACKAGE_STATE_UNAVAILABLE then
		slot0._spineFrame:setTimeScale(math.random(80, 150) / 100)
		slot0._spineFrame:setAnimation(0, "animation", true)
	else
		slot0._spineFrame:clearTracks()
	end

	if slot0.particle then
		if slot1 then
			slot0.particle:start()
		else
			slot0.particle:stop()
		end
	end
end

PlazaSubGameCcsPane.onGameKindChanged = function (slot0)
	if slot0.spJJKF then
		DisplayUtil.setVisible(slot0.spJJKF, gameMgr:checkGamePackageState(slot0._gameKind) == GAME_PACKAGE_STATE_UNAVAILABLE)
	end

	slot0.downloader.root:setGameKind(slot0._gameKind)
	slot0.downloader.root:updateViewState()
	slot0:refreshLockState()

	slot1 = Hero:getRedPacketGames()

	if not slot0:getChildByTag(RED_PACKET_SPINE_TAG) and TableUtil.IsInTable(tostring(slot0._gameKind), slot1) then
		slot0._spineHB = sp.SkeletonAnimation:create(slot2, slot3)

		slot0._spineHB:setPosition(222, 123)
		slot0._spineHB:setAnimation(0, "animation", true)
		slot0._spineHB:setTag(RED_PACKET_SPINE_TAG)
		slot0:addChild(slot0._spineHB)
	end
end

PlazaSubGameCcsPane.refreshLockState = function (slot0)
	slot2 = Hero:getFirstPayLockKinds()
	slot3 = false

	if Hero:getFirstPayEnable() then
		for slot7, slot8 in ipairs(slot2) do
			if slot0._gameKind and slot0._gameKind == slot8 then
				slot3 = true

				break
			end
		end
	end

	slot0.lock:setVisible(slot3)

	if slot0.icon2 and NEED_CHANGE_SUB_GAME_NAME then
		slot0.icon2:setColor((slot3 and DisplayUtil.rgb2ccc3(11711154)) or DisplayUtil.rgb2ccc3(16777215))
	else
		slot0.icon:setColor((slot3 and DisplayUtil.rgb2ccc3(11711154)) or DisplayUtil.rgb2ccc3(16777215))
	end
end

PlazaSubGameCcsPane.onClick = function (slot0)
	slot0.controller:try2EnterGame(slot0._gameKind)
end

return
