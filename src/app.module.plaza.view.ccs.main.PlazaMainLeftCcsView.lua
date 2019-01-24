PlazaMainLeftCcsView = class("PlazaMainLeftCcsView")

PlazaMainLeftCcsView.onCreationComplete = function (slot0)
	slot0._btns = {
		slot0.btnBuYu,
		slot0.btnQiPai,
		slot0.btnDuoRen,
		slot0.btnXiuxian
	}

	if IS_SDK_OFFIIAL_VERIFY or IS_GAME_VERIFY1 then
		slot0._btns = {
			slot0.btnBuYu
		}
	end

	if NewbieUI then
		NewbieUI.plazaGameTypeBtns = {
			slot0.btnQiPai,
			slot0.btnDuoRen,
			slot0.btnXiuxian,
			slot0.btnBuYu
		}
	else
		xpcall(function ()
			if StringUtil.isStringValid(cc.FileUtils:getInstance():fullPathForFilename("gameres/scripts/app_common.td3guoPackage")) then
				trackToServer(TRACK_SHENGSLOG, string.format("是否初始化过:%s，reuqire:%s，检查appcommon包，大小：%s，路径：%s", tostring(____shengsNebwie), tostring(___shengsnewbierequire), #(io.readfile(slot0) or ""), slot0))
			end
		end, __emptyFunction)
	end

	slot0.btnBuYu:setClickSoundName(SOUND_DEFINE.BTN_GET)
	slot0.btnQiPai:setClickSoundName(SOUND_DEFINE.BTN_GET)
	slot0.btnXiuxian:setClickSoundName(SOUND_DEFINE.BTN_GET)
	slot0.btnDuoRen:setClickSoundName(SOUND_DEFINE.BTN_GET)

	slot0._animationConfigs = {}

	if IS_IOS_VERIFY and PACKAGE_DEVICE_TYPE == 131 then
		slot0.btnXiuxian:setPosition(1008.23, 528)
		slot0.btnDuoRen:setPosition(1009.4, 257)
		slot0.btnBuYu:setPosition(623, 400)
		slot0.btnQiPai:setPosition(227.5, 394.04)
	end

	slot0._spines = {}

	for slot4, slot5 in ipairs(slot0._btns) do
		slot5.__initX = slot5:getPositionX()
	end

	slot0._showTl = nil
	slot0._hideTl = nil
	slot0._spineBuyu = nil
	slot0._spineQiPai = nil
	slot0._spineDuoRen = nil
	slot0._spineXiuXian = nil

	slot0:initSpines()

	slot0._btnHideXOffset = -300

	ClassUtil.extends(slot0, BasePlazaTweenComponent, true, 0, 0, 1, 1)
	eventMgr:add(GameEvent.OnSceneChanged, slot0.onSceneChanged, slot0)
end

PlazaMainLeftCcsView.initSpines = function (slot0)
	slot1("DTbuyu/DTbuyu.json", "DTbuyu/DTbuyu.atlas", slot0.btnBuYu, 153, -39)
	slot1("DTqipai/DTqipai.json", "DTqipai/DTqipai.atlas", slot0.btnQiPai.layerMask, 149, 152)
	slot1("DTqipai_wk/DTqipai_wk.json", "DTqipai_wk/DTqipai_wk.atlas", slot0.btnQiPai, 152, 40)
	slot1("xiuxian/xiuxian.json", "xiuxian/xiuxian.atlas", slot0.btnXiuxian, 111, -41)
	slot1("duoren/duoren.json", "duoren/duoren.atlas", slot0.btnDuoRen, 122, -71)
	slot0.btnDuoRen.particle:setLocalZOrder(1)
	slot0.btnDuoRen.particle:setScale(2)
	slot0.btnDuoRen.particle:setPosition(165, 145)
	slot0.btnQiPai.layerMask:setClippingEnabled(true)
end

PlazaMainLeftCcsView.onSceneChanged = function (slot0)
	slot0:setAllAnimationPlaying(slot0._isShowing and uiMgr:getCurSceneType() == SceneType.scene_plaza)
end

PlazaMainLeftCcsView.setAllAnimationPlaying = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._animationConfigs) do
		if slot1 ~= slot6.view.__isRuningAction then
			slot6.view.__isRuningAction = slot1

			if slot1 then
				if not slot6.animation then
					slot6.animation = cc.CSLoader:createTimeline(ResConfig.getTimeline(string.format(slot7, slot6.key, slot6.key)))

					slot6.animation:retain()
				end

				slot7 = slot6.animation:getCurrentFrame()

				slot6.view:stopAllActions()
				slot6.view:runAction(slot6.animation)
				slot6.animation:gotoFrameAndPlay(0, true)
			else
				slot6.view:stopAllActions()
			end
		end
	end

	for slot5, slot6 in ipairs(slot0._spines) do
		if slot1 ~= slot6.__isRuningAction then
			slot6.__isRuningAction = slot1

			if slot1 then
				slot6:setAnimation(0, "animation", true)
			else
				slot6:clearTracks()
			end
		end
	end

	if slot1 then
		slot0.btnDuoRen.particle:resetSystem()
	else
		slot0.btnDuoRen.particle:stopSystem()
	end
end

PlazaMainLeftCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnBuYu then
		slot0.controller:gotoView(PLAZA_SUB_BU_YU, false)
	elseif slot1 == slot0.btnQiPai then
		slot0.controller:gotoView(PLAZA_SUB_QI_PAI, false)
	elseif slot1 == slot0.btnXiuxian then
		slot0.controller:gotoView(PLAZA_SUB_XIU_XIAN, false)
	elseif slot1 == slot0.btnDuoRen then
		slot0.controller:gotoView(PLAZA_SUB_DUO_REN, false)
	end
end

PlazaMainLeftCcsView.doShow = function (slot0, slot1, slot2)
	slot0:killTweens()

	if slot1 <= 0 then
		for slot6, slot7 in ipairs(slot0._btns) do
			DisplayUtil.setVisible(slot7, true)
			slot7:setPositionX(slot7.__initX)
		end

		slot0:onShowComplete()
	else
		slot3 = CustomEase.byName("myShakeEase1")
		slot0._showTl = TimelineLite.new({
			onComplete = handler(slot0, slot0.onShowComplete)
		})

		for slot7, slot8 in ipairs(slot0._btns) do
			slot0._showTl:insert(TweenLite.to(slot8, 1, {
				x = slot8.__initX,
				ease = slot3
			}))
			slot0._showTl:insert(TweenLite.to(slot8, 0.2, {
				autoAlpha = 1
			}), slot7 * 0.05 + 0.1)
		end
	end

	slot0:setAllAnimationPlaying(true)

	if IS_SDK_OFFIIAL_VERIFY or IS_GAME_VERIFY1 then
		slot0.btnQiPai:setVisible(false)
		slot0.btnDuoRen:setVisible(false)
		slot0.btnXiuxian:setVisible(false)
	end
end

PlazaMainLeftCcsView.onShowComplete = function (slot0)
	BasePlazaTweenComponent.onShowComplete(slot0)
	eventMgr:dispatch(GameEvent.PLAZA_MAIN_LEFT_SHOW_COMPLETE)
	slot0:killTweens()
end

PlazaMainLeftCcsView.onHideComplete = function (slot0)
	BasePlazaTweenComponent.onHideComplete(slot0)
	slot0:killTweens()
end

PlazaMainLeftCcsView.doHide = function (slot0, slot1, slot2)
	eventMgr:dispatch(GameEvent.PLAZA_MAIN_LEFT_HIDE_BEGIN)
	slot0:killTweens()

	if slot1 <= 0 then
		for slot6, slot7 in ipairs(slot0._btns) do
			DisplayUtil.setVisible(slot7, false)
			slot7:setPositionX(slot7.__initX + slot0._btnHideXOffset)
		end

		slot0:onHideComplete()
	else
		slot3 = #slot0._btns
		slot4 = nil
		slot0._hideTl = TimelineLite.new({})

		for slot8, slot9 in ipairs(slot0._btns) do
			slot0._hideTl:insert(TweenLite.to(slot9, 0.5, {
				x = slot9.__initX + slot0._btnHideXOffset,
				ease = slot4
			}))
			slot0._hideTl:insert(TweenLite.to(slot9, 0.1, {
				autoAlpha = 0
			}), (slot8 - 1) * 0.05)
		end

		slot0._hideTl:insert(TweenLite.delayedCall(handler(slot0, slot0.onHide2Switch), 0.1))
	end

	slot0:setAllAnimationPlaying(false)
end

PlazaMainLeftCcsView.killTweens = function (slot0)
	if slot0._showTl then
		slot0._showTl:kill()

		slot0._showTl = nil
	end

	if slot0._hideTl then
		slot0._hideTl:kill()

		slot0._hideTl = nil
	end
end

return
