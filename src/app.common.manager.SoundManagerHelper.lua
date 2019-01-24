SoundManager.deploy = function (slot0)
	return
end

SoundManager.unloadGameEffect = function (slot0, slot1)
	slot4 = slot0
	slot7 = slot1

	slot0.unloadEffect(slot3, ResConfig.getSoundPath(slot6))
end

SoundManager.preloadGameEffect = function (slot0, slot1)
	slot4 = slot0
	slot7 = slot1

	slot0.preloadEffect(slot3, ResConfig.getSoundPath(slot6))
end

SoundManager.playDefaultBtnClickSound = function (slot0)
	return
end

SoundManager.playGameEffect = function (slot0, slot1, slot2, slot3)
	slot6 = slot1

	if StringUtil.isStringValid(slot5) then
		slot9 = slot1
		slot9 = slot3

		return slot0.playEffect(slot5, slot0, ResConfig.getSoundPath(slot8), slot2)
	end

	return nil
end

return
