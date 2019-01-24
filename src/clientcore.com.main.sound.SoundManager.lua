SoundManager = class("SoundManager")

SoundManager.ctor = function (slot0)
	slot0:deleteSandBoxAllSound()

	slot0._soundEngine = cc.SimpleAudioEngine:getInstance()
	slot0._curPlayingBg = nil
	slot0._curMusicVolume = 1
	slot0._musicVolumeBeforeMute = slot0._curMusicVolume
	slot0._curVolumeObj = {
		value = 0
	}
	slot0._timer2ResumeBgMusic = nil

	createSetterGetter(slot0, "canPlayEffect", true, true, false, false, false, handler(slot0, slot0.onCanPlayEffectChanged))
	createSetterGetter(slot0, "canPlayMusic", true, true, false, false, false, handler(slot0, slot0.onCanPlayMusicChanged))
end

SoundManager.fix2SetMusicCanPlayAndDefaultVolume = function (slot0, slot1, slot2)
	if slot1 then
		slot0:setMusicVolume(slot2)
		slot0:setCanPlayMusic(slot1)
	else
		slot0._curMusicVolume = slot2

		slot0:setCanPlayMusic(false, true)
	end
end

SoundManager.onCanPlayMusicChanged = function (slot0)
	if not slot0._canPlayMusic then
		slot0._musicVolumeBeforeMute = slot0._curMusicVolume

		slot0:setMusicVolume(0, nil, nil, true, true)
	else
		slot0:setMusicVolume(slot0._musicVolumeBeforeMute, nil, 0.5, true, true)
	end

	Hero:setCanPlayMusic(slot0._canPlayMusic)
end

SoundManager.endEngine = function (slot0)
	cc.SimpleAudioEngine:destroyInstance()

	slot0._soundEngine = cc.SimpleAudioEngine:getInstance()

	slot0._soundEngine:setEffectsVolume(slot1)
	slot0._soundEngine:setMusicVolume(slot0._soundEngine:getMusicVolume())
end

SoundManager.pauseMusic = function (slot0)
	if slot0._timer2ResumeBgMusic then
		slot0._timer2ResumeBgMusic:destroy()

		slot0._timer2ResumeBgMusic = nil
	end

	slot0._soundEngine:pauseMusic()
end

SoundManager.resumeMusic = function (slot0)
	if slot0._timer2ResumeBgMusic then
		slot0._timer2ResumeBgMusic:destroy()

		slot0._timer2ResumeBgMusic = nil
	end

	slot0._timer2ResumeBgMusic = tickMgr:delayedCall(function ()
		slot0._soundEngine:resumeMusic()
	end, 100)
end

SoundManager.onCanPlayEffectChanged = function (slot0)
	if not slot0._canPlayEffect then
		slot0._soundEngine:stopAllEffects()
	end

	Hero:setCanPlayEffect(slot0._canPlayEffect)
end

SoundManager.stopMusicNotChangedVolumn = function (slot0, slot1)
	slot0._soundEngine:stopMusic(slot1)
end

SoundManager.getMusicVolume = function (slot0)
	return slot0._soundEngine:getMusicVolume()
end

SoundManager.getEffectVolume = function (slot0)
	return slot0._soundEngine:getEffectsVolume()
end

SoundManager.setEffectVolume = function (slot0, slot1, slot2)
	if not slot2 then
		Hero:setEffectVolume(slot1)
	end

	slot0._soundEngine:setEffectsVolume(slot1)
end

SoundManager.setMusicVolume = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0._canPlayMusic or slot4 then
		if not slot5 then
			Hero:setMusicVolume(slot1)
		end

		slot0._curMusicVolume = slot1

		TweenLite.killTweensOf(slot0._curVolumeObj)

		if 0 ~= 0 then
			TweenLite.to(slot0._curVolumeObj, slot3, {
				value = slot1,
				onUpdate = handler(slot0, slot0.onVolumeObjUpdate),
				onComplete = slot2
			})
		else
			slot0._curVolumeObj.value = slot1

			slot0:onVolumeObjUpdate()
			applyFunction(slot2)
		end
	end
end

SoundManager.getCurPlayingMusicUrl = function (slot0)
	return slot0._curPlayingBg
end

SoundManager.replayCurBgMusic = function (slot0)
	if StringUtil.isStringValid(slot0._curPlayingBg) then
		slot0._soundEngine:playMusic(slot0:creatSandBoxSound(slot0._curPlayingBg), true)
	end
end

SoundManager.playMusic = function (slot0, slot1, slot2, slot3, slot4, slot5)
	if (slot0._curPlayingBg ~= slot1 or slot5) and StringUtil.isStringValid(slot1) then
		slot3 = 0
		slot6 = slot0._curMusicVolume

		function slot7()
			slot0 = tickMgr:getTimer()
			slot0._curPlayingBg = slot0

			slot0._soundEngine:playMusic(slot0:creatSandBoxSound(slot0.creatSandBoxSound), slot0._soundEngine.playMusic)

			if isAndroid then
				slot0:setMusicVolume(0, nil, nil, false, true)
				slot0:setMusicVolume(slot0, nil, , false)
			else
				slot0:setMusicVolume(0, nil, nil, true, true)
				slot0:setMusicVolume(slot0, nil, , true, true)
			end
		end

		if slot0._curPlayingBg and slot3 ~= 0 then
			slot0:stopMusic(false, slot7, slot3 * 0.5)
		else
			slot7()
		end
	end
end

SoundManager.getSandBoxSoundUrl = function (slot0, slot1)
	return device.writablePath .. "SandBoxRes/" .. slot1
end

SoundManager.creatSandBoxSound = function (slot0, slot1)
	if not OSUtil.isFileExists(slot1) then
		trace(HtmlUtil.createYellowTxt("音效文件不存在：" .. tostring(slot1)))

		return slot1
	end

	if IS_SOUND_CRYPTO then
		if not OSUtil.isFileExists(slot0:getSandBoxSoundUrl(slot1)) then
			OSUtil.writefile(slot2, io.readfile(slot1))
		end

		return slot2
	else
		return slot1
	end
end

SoundManager.deleteSandBoxAllSound = function (slot0)
	if IS_SOUND_CRYPTO then
		OSUtil.deleteDirectory(slot0:getSandBoxSoundUrl(""))
	end
end

SoundManager.deleteSandBoxSoundByModulePath = function (slot0, slot1)
	if IS_SOUND_CRYPTO then
		OSUtil.deleteDirectory(slot0:getSandBoxSoundUrl(slot1))
	end
end

SoundManager.stopMusic = function (slot0, slot1, slot2, slot3)
	TweenLite.killTweensOf(slot0._curVolumeObj)
	slot0:setMusicVolume(0, function ()
		slot0._soundEngine:stopMusic(slot0._soundEngine)
		applyFunction(slot0._soundEngine)
	end, 0)
end

SoundManager.stopEffect = function (slot0, slot1)
	if slot1 then
		slot0._soundEngine:stopEffect(slot1)
	end
end

SoundManager.stopAllEffect = function (slot0)
	slot0._soundEngine:stopAllEffects()
end

SoundManager.playEffect = function (slot0, slot1, slot2, slot3)
	if slot0._canPlayEffect and StringUtil.isStringValid(slot1) then
		slot4 = slot0:creatSandBoxSound(slot1)
		slot5 = 0

		return (not isAndroid or ((not isAndroidSoundMultiThread or slot0._soundEngine:playEffect(slot4, slot2, 1, 0, 1, slot3)) and slot0._soundEngine:playEffect(slot4, slot2, 1, 0, 1, true))) and slot0._soundEngine:playEffect(slot4, slot2, 1, 0, 1)
	end

	return 0
end

SoundManager.unloadEffect = function (slot0, slot1)
	slot0._soundEngine:unloadEffect(slot0:creatSandBoxSound(slot1))
end

SoundManager.preloadEffect = function (slot0, slot1)
	slot0._soundEngine:preloadEffect(slot0:creatSandBoxSound(slot1))
end

SoundManager.onVolumeObjUpdate = function (slot0)
	slot0._soundEngine:setMusicVolume(slot0._curVolumeObj.value)
end

soundMgr = SoundManager.new()

return
