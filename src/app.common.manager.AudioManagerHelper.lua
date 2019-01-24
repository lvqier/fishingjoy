AudioManager.deploy = function (slot0)
	if AudioManager.isUseSimpleAudioEngine then
		slot4 = Hero.getCanPlayMusic(slot5)
		slot7 = Hero

		soundMgr.fix2SetMusicCanPlayAndDefaultVolume(slot2, soundMgr, Hero.getMusicVolume(Hero))
	else
		slot3 = slot0
		slot6 = Hero

		slot0.setMusicVolume(slot2, Hero.getMusicVolume(slot5))

		slot3 = slot0
		slot6 = Hero

		slot0.setMusicCanPlay(slot2, Hero.getCanPlayMusic(slot5))
	end

	slot3 = slot0
	slot6 = Hero

	slot0.setEffectCanPlay(slot2, Hero.getCanPlayEffect(slot5))

	slot3 = slot0
	slot6 = Hero

	slot0.setEffectVolume(slot2, Hero.getEffectVolume(slot5))

	slot0._mainMusic = "bgm/bg_main.mp3"
end

AudioManager.playMjSound = function (slot0, slot1, slot2)
	slot7 = slot1
	slot5 = parseInt(slot6) / 100
	slot5 = "mjsound"

	if getCSVField(slot4)[math.floor(slot4)] then
		slot8 = slot2

		slot0.playGenderSound(slot5, slot0, slot3.file .. ".mp3")
	end
end

AudioManager.playGenderSound = function (slot0, slot1, slot2, slot3)
	slot4 = "wom/"

	if slot2 then
		slot4 = "man/"
	end

	slot5 = "mj/"

	if not slot3 then
		slot8 = Hero

		if Hero.getVoiceLang(slot7) == VOICE_LANG_YueYu then
			slot5 = "mjy/"
		end
	end

	slot9 = "effect/" .. slot5 .. slot4 .. slot1

	slot0.playGameEffect(slot7, slot0)
end

AudioManager.playBattleMusic = function (slot0)
	return
end

AudioManager.isPlayingMainMusic = function (slot0)
	slot5 = slot0._mainMusic

	return string.find(slot0, slot0.getCurPlayingMusicUrl(slot2) or "") ~= nil
end

AudioManager.playMainMusic = function (slot0)
	slot4 = slot0._mainMusic

	slot0.playGameMusic(slot2, slot0)
end

AudioManager.playGameMusic = function (slot0, slot1, slot2)
	slot5 = slot1

	if StringUtil.isStringValid(slot4) then
		slot8 = slot1
		slot7 = slot2

		slot0.playMusic(slot4, slot0, ResConfig.getSoundPath(slot7))
	end
end

AudioManager.playGameEffect = function (slot0, slot1, slot2)
	slot5 = slot1

	if StringUtil.isStringValid(slot4) then
		slot8 = slot1
		slot7 = slot2

		slot0.playEffect(slot4, slot0, ResConfig.getSoundPath(slot7))
	end
end

AudioManager.playDefaultBtnClickSound = function (slot0)
	slot4 = SOUND_DEFINE.BTN_DEFAULT

	slot0.playGameEffect(slot2, slot0)
end

AudioManager.onMusicVolumeChanged = function (slot0, slot1)
	if not slot1 then
		slot4 = Hero
		slot7 = slot0

		Hero.setMusicVolume(slot3, slot0.getMusicVolume(slot6))
	end
end

AudioManager.onEffectVolumeChanged = function (slot0, slot1)
	if not slot1 then
		slot4 = Hero
		slot7 = slot0

		Hero.setEffectVolume(slot3, slot0.getEffectVolume(slot6))
	end
end

AudioManager.onEffectCanPlayChanged = function (slot0)
	slot3 = Hero
	slot6 = slot0

	Hero.setCanPlayEffect(slot2, slot0.canEffectPlay(slot5))
end

AudioManager.onMusicCanPlayChanged = function (slot0)
	slot3 = Hero
	slot6 = slot0

	Hero.setCanPlayMusic(slot2, slot0.canMusicPlay(slot5))
end

return
