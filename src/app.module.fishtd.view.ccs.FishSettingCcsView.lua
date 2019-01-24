slot0 = class("FishSettingCcsView", function ()
	return cc.CSLoader:createNode("res/gameres/module/fishtd/csb/layer/FishTdSetting.csb")
end)

slot0.ctor = function (slot0)
	slot1 = slot0:getChildByName("Container_Adapt")
	slot0.Button_Close = slot1:getChildByName("Button_Close")
	slot0.Slider_BgMusic = slot1:getChildByName("Container_Background_Setting").getChildByName(slot2, "Position_Slider").getChildByName(slot3, "Slider_BgMusic")

	slot0.Slider_BgMusic:setScale9Enabled(true)

	slot0.Slider_Effect = slot1:getChildByName("Container_Effect_Setting").getChildByName(slot4, "Position_Slider").getChildByName(slot5, "Slider_Effect")

	slot0.Slider_Effect:setScale9Enabled(true)

	slot6 = slot1:getChildByName("Container_Mute_Setting")
	slot0.Image_MusicSwitch = slot6:getChildByName("Image_Switch")
	slot0.Sprite_Title = slot6:getChildByName("Image_Title")
	slot0.root = slot1
end

slot0.loadUIComplete = function (slot0)
	slot0:registerEvent()

	slot1 = cc.SimpleAudioEngine:getInstance()

	slot0.Slider_BgMusic:setPercent(slot1:getMusicVolume() * 100)
	slot0.Slider_Effect:setPercent(slot1:getEffectsVolume() * 100)

	slot0._isMusicStop = slot1.getMusicVolume() <= 0 and slot3 <= 0

	slot0:changeMusicButton(slot0._isMusicStop)

	slot0._bgMusicValue = slot2
	slot0._effectMusicValue = slot3
end

slot0.registerEvent = function (slot0)
	slot0.Slider_BgMusic:addEventListener(c_func(slot0.onSliderEvent_BgMusic, slot0))
	slot0.Slider_Effect:addEventListener(c_func(slot0.onSliderEvent_Effect, slot0))
	slot0.Button_Close:addTouchEventListener(c_func(slot0.onButtonClick_Close, slot0))
	slot0.Image_MusicSwitch:addTouchEventListener(c_func(slot0.onButtonClick_Switch, slot0))
end

slot0.onButtonClick_Close = function (slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)
		slot0.root:runAction(cc.Sequence:create(cc.ScaleTo:create(0.05, 1.1), cc.ScaleTo:create(0.1, 0.85)))
		slot0.root:runAction(cc.Sequence:create(cc.DelayTime:create(0.05), cc.CallFunc:create(function ()
			slot0:removeFromParentAndCleanup(true)
		end)))
	end
end

slot0.onSliderEvent_BgMusic = function (slot0, slot1, slot2)
	if slot2 == ccui.SliderEventType.percentChanged then
		slot0._bgMusicValue = slot1:getPercent() / 100

		cc.SimpleAudioEngine:getInstance().setMusicVolume(slot4, slot1.getPercent() / 100)

		slot0._effectMusicValue = slot0.Slider_Effect:getPercent() / 100

		if slot0._effectMusicValue <= 0 and slot0._bgMusicValue <= 0 then
			slot0._isMusicStop = true

			slot0:changeMusicButton(true)
		elseif slot0._isMusicStop then
			slot0._isMusicStop = false

			slot0:changeMusicButton(false)
		end
	end
end

slot0.onSliderEvent_Effect = function (slot0, slot1, slot2)
	if slot2 == ccui.SliderEventType.percentChanged then
		slot0._effectMusicValue = slot1:getPercent() / 100

		cc.SimpleAudioEngine:getInstance().setEffectsVolume(slot4, slot1.getPercent() / 100)

		slot0._bgMusicValue = slot0.Slider_BgMusic:getPercent() / 100

		if slot0._effectMusicValue <= 0 and slot0._bgMusicValue <= 0 then
			slot0._isMusicStop = true

			slot0:changeMusicButton(true)
		elseif slot0._isMusicStop then
			slot0._isMusicStop = false

			slot0:changeMusicButton(false)
		end
	end
end

slot0.onButtonClick_Switch = function (slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended then
		fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.BUTTON_CLICK)

		slot0._isMusicStop = not slot0._isMusicStop

		slot0:changeMusicButton(slot0._isMusicStop)

		slot3 = cc.SimpleAudioEngine:getInstance()

		if not slot0._isMusicStop then
			slot3:setMusicVolume(slot0._bgMusicValue)
			slot3:setEffectsVolume(slot0._effectMusicValue)
			slot0.Slider_BgMusic:setPercent(slot0._bgMusicValue * 100)
			slot0.Slider_Effect:setPercent(slot0._effectMusicValue * 100)
		else
			slot3:setMusicVolume(0)
			slot3:setEffectsVolume(0)
			slot0.Slider_BgMusic:setPercent(0)
			slot0.Slider_Effect:setPercent(0)
		end
	end
end

slot0.changeMusicButton = function (slot0, slot1)
	if slot1 then
		slot0.Image_MusicSwitch:loadTexture("res/gameres/module/fishtd/ui/common/Sound_Mute_off.png", 0)
	else
		slot0.Image_MusicSwitch:loadTexture("res/gameres/module/fishtd/ui/common/Sound_Mute_on.png", 0)
	end
end

return slot0
