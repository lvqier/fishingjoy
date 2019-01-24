slot2 = "BaseSettingPopupCcsView"
BaseSettingPopupCcsView = class(slot1)

BaseSettingPopupCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0

	slot0.onSwitchStatePosChanged(slot2)

	slot3 = slot0

	slot0.initSignal(slot2)
end

BaseSettingPopupCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingSetting(slot2, slot0.model)
end

BaseSettingPopupCcsView.onSwitchStatePosChanged = function (slot0)
	slot3 = slot0.view.switchMusic
	slot6 = slot0.model

	slot0.view.switchMusic.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))

	slot3 = slot0.view.switchEffect
	slot6 = slot0.model

	slot0.view.switchEffect.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))

	slot3 = slot0.view.switchShock
	slot6 = slot0.model

	slot0.view.switchShock.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))

	if slot0.view.switchDaytime and slot0.view.switchNight and slot0.view.switchAuto then
		slot3 = slot0.view.switchDaytime
		slot6 = slot0.model

		slot0.view.switchDaytime.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))

		slot3 = slot0.view.switchNight
		slot6 = slot0.model

		slot0.view.switchNight.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))

		slot3 = slot0.view.switchAuto
		slot6 = slot0.model

		slot0.view.switchAuto.setStatePosX(slot2, slot0.model.getSwitchStatePos(slot5))
	end
end

BaseSettingPopupCcsView.show = function (slot0, slot1, slot2)
	slot6 = true

	slot0.checkSwitchersState(slot4, slot0)

	slot7 = slot2

	ZoomPopUpChildView.show(slot4, slot0, slot1)
end

BaseSettingPopupCcsView.checkSwitchersState = function (slot0, slot1)
	slot7 = Hero
	slot8 = true

	slot0.view.switchMusic.setIsPlay(slot3, slot0.view.switchMusic, Hero.getCanPlayMusic(slot6), true, slot1)

	slot7 = Hero
	slot8 = true

	slot0.view.switchEffect.setIsPlay(slot3, slot0.view.switchEffect, Hero.getCanPlayEffect(true), true, slot1)

	slot4 = slot0.view.switchShock
	slot2 = slot0.view.switchShock.setIsPlay
	slot7 = Hero

	if not Hero.getCanPlayMusic(true) then
		slot7 = Hero
		slot5 = not Hero.getCanPlayEffect(slot6)
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	slot8 = true

	slot2(slot3, slot4, slot5, true, slot1)

	if slot0.view.switchDaytime and slot0.view.switchNight and slot0.view.switchAuto then
		slot3 = Hero.getIsMaskNight(Hero)
		slot10 = true

		slot0.view.switchDaytime.setIsPlay(Hero, slot0.view.switchDaytime, not Hero.getIsAutoMaskNight(slot3) and not slot3, true, slot1)

		slot10 = true

		slot0.view.switchNight.setIsPlay(Hero, slot0.view.switchNight, not slot2 and slot3, true, slot1)

		slot10 = true

		slot0.view.switchAuto.setIsPlay(Hero, slot0.view.switchAuto, slot2, true, slot1)
	end
end

BaseSettingPopupCcsView.initSignal = function (slot0)
	slot5 = slot0

	slot0.view.switchEffect.isPlayChangedSignal.add(slot2, slot0.view.switchEffect.isPlayChangedSignal, slot0.onEffectPlayChanged)

	slot5 = slot0

	slot0.view.switchMusic.isPlayChangedSignal.add(slot2, slot0.view.switchMusic.isPlayChangedSignal, slot0.onMusicPlayChanged)

	slot5 = slot0

	slot0.view.switchShock.isPlayChangedSignal.add(slot2, slot0.view.switchShock.isPlayChangedSignal, slot0.onIsShockChanged)

	slot5 = slot0

	slot0.model.switchStatePosChangedSignal.add(slot2, slot0.model.switchStatePosChangedSignal, slot0.onSwitchStatePosChanged)

	if slot0.view.switchDaytime and slot0.view.switchNight and slot0.view.switchAuto then
		slot5 = slot0

		slot0.view.switchDaytime.isPlayChangedSignal.add(slot2, slot0.view.switchDaytime.isPlayChangedSignal, slot0.onDayClickChanged)

		slot5 = slot0

		slot0.view.switchNight.isPlayChangedSignal.add(slot2, slot0.view.switchNight.isPlayChangedSignal, slot0.onNightClickChanged)

		slot5 = slot0

		slot0.view.switchAuto.isPlayChangedSignal.add(slot2, slot0.view.switchAuto.isPlayChangedSignal, slot0.onAutoNightClickChanged)

		slot5 = slot0

		Hero.isMaskNightChangedSignal.add(slot2, Hero.isMaskNightChangedSignal, slot0.onNightMaskChanged)

		slot5 = slot0

		Hero.isAutoMaskNightChangedSignal.add(slot2, Hero.isAutoMaskNightChangedSignal, slot0.onAutoMaskNightChagned)
	end
end

BaseSettingPopupCcsView.onEffectPlayChanged = function (slot0, slot1)
	slot5 = slot1

	audioMgr.setEffectCanPlay(slot3, audioMgr)

	slot4 = slot0

	slot0.checkSwitchersState(slot3)
end

BaseSettingPopupCcsView.onMusicPlayChanged = function (slot0, slot1)
	slot5 = slot1

	audioMgr.setMusicCanPlay(slot3, audioMgr)

	slot4 = slot0

	slot0.checkSwitchersState(slot3)
end

BaseSettingPopupCcsView.onIsShockChanged = function (slot0, slot1)
	slot5 = not slot1

	audioMgr.setEffectCanPlay(slot3, audioMgr)

	slot5 = not slot1

	audioMgr.setMusicCanPlay(slot3, audioMgr)

	slot4 = slot0

	slot0.checkSwitchersState(slot3)
end

BaseSettingPopupCcsView.onAutoNightClickChanged = function (slot0, slot1)
	slot5 = slot1

	Hero.setIsAutoMaskNight(slot3, Hero)
end

BaseSettingPopupCcsView.onNightClickChanged = function (slot0, slot1, slot2)
	if slot2 then
		slot6 = slot1

		Hero.setIsMaskNight(slot4, Hero)

		slot6 = false

		Hero.setIsAutoMaskNight(slot4, Hero)
	end
end

BaseSettingPopupCcsView.onDayClickChanged = function (slot0, slot1, slot2)
	if slot2 then
		slot6 = not slot1

		Hero.setIsMaskNight(slot4, Hero)

		slot6 = false

		Hero.setIsAutoMaskNight(slot4, Hero)
	end
end

BaseSettingPopupCcsView.onAutoMaskNightChagned = function (slot0)
	slot2 = Hero.getIsMaskNight(Hero)
	slot6 = not Hero.getIsAutoMaskNight(slot2) and not slot2

	slot0.view.switchDaytime.setIsPlay(Hero, slot0.view.switchDaytime)

	slot6 = not slot1 and slot2

	slot0.view.switchNight.setIsPlay(Hero, slot0.view.switchNight)

	slot6 = slot1

	slot0.view.switchAuto.setIsPlay(Hero, slot0.view.switchAuto)
end

BaseSettingPopupCcsView.onNightMaskChanged = function (slot0)
	slot2 = Hero.getIsMaskNight(Hero)
	slot6 = not Hero.getIsAutoMaskNight(slot2) and not slot2

	slot0.view.switchDaytime.setIsPlay(Hero, slot0.view.switchDaytime)

	slot6 = not slot1 and slot2

	slot0.view.switchNight.setIsPlay(Hero, slot0.view.switchNight)
end

BaseSettingPopupCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose or slot1 == slot0.view.btnSure then
		slot6 = false

		slot0.model.setIsShowingSetting(slot4, slot0.model)
	end
end

BaseSettingPopupCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.view.switchEffect.isPlayChangedSignal.remove(slot2, slot0.view.switchEffect.isPlayChangedSignal, slot0.onEffectPlayChanged)

	slot5 = slot0

	slot0.view.switchMusic.isPlayChangedSignal.remove(slot2, slot0.view.switchMusic.isPlayChangedSignal, slot0.onMusicPlayChanged)

	slot5 = slot0

	slot0.view.switchShock.isPlayChangedSignal.remove(slot2, slot0.view.switchShock.isPlayChangedSignal, slot0.onIsShockChanged)

	slot5 = slot0

	slot0.model.switchStatePosChangedSignal.remove(slot2, slot0.model.switchStatePosChangedSignal, slot0.onSwitchStatePosChanged)

	if slot0.view.switchDaytime and slot0.view.switchNight and slot0.view.switchAuto then
		slot5 = slot0

		slot0.view.switchDaytime.isPlayChangedSignal.remove(slot2, slot0.view.switchDaytime.isPlayChangedSignal, slot0.onDayClickChanged)

		slot5 = slot0

		slot0.view.switchNight.isPlayChangedSignal.remove(slot2, slot0.view.switchNight.isPlayChangedSignal, slot0.onNightClickChanged)

		slot5 = slot0

		slot0.view.switchAuto.isPlayChangedSignal.remove(slot2, slot0.view.switchAuto.isPlayChangedSignal, slot0.onAutoNightClickChanged)

		slot5 = slot0

		Hero.isMaskNightChangedSignal.remove(slot2, Hero.isMaskNightChangedSignal, slot0.onNightMaskChanged)

		slot5 = slot0

		Hero.isAutoMaskNightChangedSignal.remove(slot2, Hero.isAutoMaskNightChangedSignal, slot0.onAutoMaskNightChagned)

		slot3 = slot0.view.switchDaytime

		destroySomeObj(slot2)

		slot3 = slot0.view.switchNight

		destroySomeObj(slot2)

		slot3 = slot0.view.switchAuto

		destroySomeObj(slot2)
	end

	slot3 = slot0.view.btnClose

	destroySomeObj(slot2)

	slot3 = slot0.view.btnSure

	destroySomeObj(slot2)

	slot3 = slot0.view.switchMusic

	destroySomeObj(slot2)

	slot3 = slot0.view.switchEffect

	destroySomeObj(slot2)

	slot3 = slot0.view.switchShock

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)
end

return
