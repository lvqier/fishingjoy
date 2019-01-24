AccountSettingCcsView = class("AccountSettingCcsView")

AccountSettingCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:init()
	slot0:initSignal()
end

AccountSettingCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingSetting(false)
end

AccountSettingCcsView.init = function (slot0)
	slot1 = StringUtil.truncate(Hero:getPNickName(), 10, nil, 2)

	slot0.view.switchMusic.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
	slot0.view.switchEffect.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
	slot0.view.switchAuto.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
	slot0.view.switchDaytime.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
	slot0.view.switchNight.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
	slot0.view.switchMute.root:setStatePosX({
		onX = 107.88,
		offX = 29.88
	})
end

AccountSettingCcsView.onShow = function (slot0)
	slot0:checkSwitchersState()
	slot0.view.versionTxt:setString(mainMgr:cookVersionStr())
end

AccountSettingCcsView.initSignal = function (slot0)
	slot0.view.switchEffect.root.isPlayChangedSignal:add(slot0.onEffectPlayChanged, slot0)
	slot0.view.switchMusic.root.isPlayChangedSignal:add(slot0.onMusicPlayChanged, slot0)
	slot0.view.switchAuto.root.isPlayChangedSignal:add(slot0.onAutoNightClickChanged, slot0)
	slot0.view.switchDaytime.root.isPlayChangedSignal:add(slot0.onDayClickChanged, slot0)
	slot0.view.switchNight.root.isPlayChangedSignal:add(slot0.onNightClickChanged, slot0)
	slot0.view.switchMute.root.isPlayChangedSignal:add(slot0.onMuteClickChanged, slot0)
	Hero.isMaskNightChangedSignal:add(slot0.onNightMaskChanged, slot0)
	Hero.isAutoMaskNightChangedSignal:add(slot0.onAutoMaskNightChagned, slot0)
end

AccountSettingCcsView.onAutoMaskNightChagned = function (slot0)
	slot0.view.switchDaytime.root:setIsPlay(not Hero:getIsAutoMaskNight() and not Hero:getIsMaskNight())
	slot0.view.switchNight.root:setIsPlay(not slot1 and Hero.getIsMaskNight())
	slot0.view.switchAuto.root:setIsPlay(slot1)
end

AccountSettingCcsView.onNightMaskChanged = function (slot0)
	slot0.view.switchDaytime.root:setIsPlay(not Hero:getIsAutoMaskNight() and not Hero:getIsMaskNight())
	slot0.view.switchNight.root:setIsPlay(not slot1 and Hero.getIsMaskNight())
end

AccountSettingCcsView.onNightClickChanged = function (slot0, slot1, slot2)
	if slot2 then
		trackMgr:recordTracks(TRACK_SETTING_XZCJMS)
		Hero:setIsMaskNight(slot1)
		Hero:setIsAutoMaskNight(false)
	end
end

AccountSettingCcsView.onDayClickChanged = function (slot0, slot1, slot2)
	if slot2 then
		trackMgr:recordTracks(TRACK_SETTING_XZCJMS)
		Hero:setIsMaskNight(not slot1)
		Hero:setIsAutoMaskNight(false)
	end
end

AccountSettingCcsView.onAutoNightClickChanged = function (slot0, slot1, slot2)
	trackMgr:recordTracks(TRACK_SETTING_XZCJMS)
	Hero:setIsAutoMaskNight(slot1)
end

AccountSettingCcsView.onMuteClickChanged = function (slot0, slot1, slot2)
	audioMgr:setEffectCanPlay(not slot1)
	audioMgr:setMusicCanPlay(not slot1)
	slot0:checkSwitchersState()
end

AccountSettingCcsView.onEffectPlayChanged = function (slot0, slot1)
	trackMgr:recordTracks(TRACK_SETTING_XZYXSZ)
	audioMgr:setEffectCanPlay(slot1)
	slot0:checkSwitchersState()
end

AccountSettingCcsView.onMusicPlayChanged = function (slot0, slot1)
	trackMgr:recordTracks(TRACK_SETTING_XZYYSZ)
	audioMgr:setMusicCanPlay(slot1)
	slot0:checkSwitchersState()
end

AccountSettingCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnExit then
		slot0.model:setIsShowingSetting(false)
	elseif slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingSetting(false)
	end
end

AccountSettingCcsView.checkSwitchersState = function (slot0, slot1)
	slot0.view.switchMusic.root:setIsPlay(Hero:getCanPlayMusic(), true, slot1, true)
	slot0.view.switchEffect.root:setIsPlay(Hero:getCanPlayEffect(), true, slot1, true)
	slot0.view.switchMute.root:setIsPlay(not Hero:getCanPlayMusic() and not Hero:getCanPlayEffect(), true, slot1, true)

	if slot0.view.switchDaytime and slot0.view.switchNight and slot0.view.switchAuto then
		slot0.view.switchDaytime.root:setIsPlay(not Hero:getIsAutoMaskNight() and not Hero:getIsMaskNight(), true, slot1, true)
		slot0.view.switchNight.root:setIsPlay(not slot2 and Hero.getIsMaskNight(), true, slot1, true)
		slot0.view.switchAuto.root:setIsPlay(slot2, true, slot1, true)
	end
end

AccountSettingCcsView.destroy = function (slot0)
	slot0.view.switchEffect.root.isPlayChangedSignal:remove(slot0.onEffectPlayChanged, slot0)
	slot0.view.switchMusic.root.isPlayChangedSignal:remove(slot0.onMusicPlayChanged, slot0)
	slot0.view.switchAuto.root.isPlayChangedSignal:remove(slot0.onAutoNightClickChanged, slot0)
	slot0.view.switchDaytime.root.isPlayChangedSignal:remove(slot0.onDayClickChanged, slot0)
	slot0.view.switchNight.root.isPlayChangedSignal:remove(slot0.onNightClickChanged, slot0)
	slot0.view.switchMute.root.isPlayChangedSignal:remove(slot0.onMuteClickChanged, slot0)
	Hero.isMaskNightChangedSignal:remove(slot0.onNightMaskChanged, slot0)
	Hero.isAutoMaskNightChangedSignal:remove(slot0.onAutoMaskNightChagned, slot0)
	destroySomeObj(slot0.view.btnExit)
	destroySomeObj(slot0.view.btnClose)
	slot0.view.switchEffect.root:destroy()
	slot0.view.switchMusic.root:destroy()
	ZoomPopUpChildView.destroy(slot0)
end

return
