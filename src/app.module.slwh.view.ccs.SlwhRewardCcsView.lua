function slot3()
	slot3 = Tree.root .. "csb/layer/SlwhReward.csb"

	return cc.CSLoader.createNode(slot1, cc.CSLoader)
end

SlwhRewardCcsView = class(slot1, "SlwhRewardCcsView")
slot0 = {
	[Tree.RewardType.RewardType_Normal] = "green",
	[Tree.RewardType.RewardType_DaSanYuan] = "red",
	[Tree.RewardType.RewardType_DaSiXi] = "violet",
	[Tree.RewardType.RewardType_SongDeng] = "green",
	[Tree.RewardType.RewardType_ShanDian] = "green",
	[Tree.RewardType.RewardType_CaiJin] = "green"
}
slot1 = {
	[Tree.RewardType.RewardType_Normal] = "res/gameres/module/slwh/result/slwh_reward_neon_green.png",
	[Tree.RewardType.RewardType_DaSanYuan] = "res/gameres/module/slwh/result/slwh_reward_neon_red.png",
	[Tree.RewardType.RewardType_DaSiXi] = "res/gameres/module/slwh/result/slwh_reward_neon_violet.png",
	[Tree.RewardType.RewardType_SongDeng] = "res/gameres/module/slwh/result/slwh_reward_neon_green.png",
	[Tree.RewardType.RewardType_ShanDian] = "res/gameres/module/slwh/result/slwh_reward_neon_green.png",
	[Tree.RewardType.RewardType_CaiJin] = "res/gameres/module/slwh/result/slwh_reward_neon_green.png"
}
slot2 = {
	[Tree.RewardType.RewardType_Normal] = "res/gameres/module/slwh/particle/slwh_reward_particle_green.plist",
	[Tree.RewardType.RewardType_DaSanYuan] = "res/gameres/module/slwh/particle/slwh_reward_particle_red.plist",
	[Tree.RewardType.RewardType_DaSiXi] = "res/gameres/module/slwh/particle/slwh_reward_particle_violet.plist",
	[Tree.RewardType.RewardType_SongDeng] = "res/gameres/module/slwh/particle/slwh_reward_particle_green.plist",
	[Tree.RewardType.RewardType_ShanDian] = "res/gameres/module/slwh/particle/slwh_reward_particle_green.plist",
	[Tree.RewardType.RewardType_CaiJin] = "res/gameres/module/slwh/particle/slwh_reward_particle_green.plist"
}

SlwhRewardCcsView.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot0._rewardType = Tree.RewardType.RewardType_Normal
	slot5 = "root"
	slot0._root = slot0.getChildByName(slot3, slot0)
	slot5 = "center"
	slot0._center = slot0._root.getChildByName(slot3, slot0._root)
	slot5 = 3

	slot0._center.setLocalZOrder(slot3, slot0._center)

	slot5 = "sprite_mask"
	slot0._mask = slot0._root.getChildByName(slot3, slot0._root)
	slot5 = "layer_normal"
	slot0.layer_normal = slot0._center.getChildByName(slot3, slot0._center)
	slot5 = "layer_dasanyuan"
	slot0.layer_dasanyuan = slot0._center.getChildByName(slot3, slot0._center)
	slot5 = "layer_dasixi"
	slot0.layer_dasixi = slot0._center.getChildByName(slot3, slot0._center)
	slot5 = "layer_lighting"
	slot0.layer_lighting = slot0._center.getChildByName(slot3, slot0._center)
	slot5 = "layer_deng"
	slot0.layer_deng = slot0._center.getChildByName(slot3, slot0._center)
	slot5 = "sprite_mask"
	slot0.sprite_mask = slot0._root.getChildByName(slot3, slot0._root)
	slot4 = slot0

	slot0.loadChildCascade(slot3)

	slot4 = cc.EventListenerTouchOneByOne
	slot0._touchListener = cc.EventListenerTouchOneByOne.create(slot3)
	slot6 = cc.Handler.EVENT_TOUCH_BEGAN

	slot0._touchListener.registerScriptHandler(slot3, slot0._touchListener, function ()
		return true
	end)

	slot6 = cc.Handler.EVENT_TOUCH_MOVED

	slot0._touchListener.registerScriptHandler(slot3, slot0._touchListener, function ()
		return
	end)

	slot6 = cc.Handler.EVENT_TOUCH_ENDED

	slot0._touchListener.registerScriptHandler(slot3, slot0._touchListener, function ()
		slot2 = slot0

		slot0.runExitAnimation(slot1)
	end)

	slot5 = true

	slot0._touchListener.setSwallowTouches(slot3, slot0._touchListener)

	slot4 = slot0._touchListener

	slot0._touchListener.retain(slot3)

	slot4 = slot0
	slot5 = slot0._touchListener
	slot9 = "sprite_mask"

	slot0.getEventDispatcher(slot3).addEventListenerWithSceneGraphPriority(slot3, slot0.getEventDispatcher(slot3), slot0._root.getChildByName(slot7, slot0._root))

	slot7 = slot0

	TreeEventDispatcher.addEventListener(slot3, TreeEventDispatcher, Tree.Event.gameWait, slot0.runExitAnimation)

	slot0._rewardCallback = {
		[Tree.RewardType.RewardType_Normal] = slot0.showNormalType,
		[Tree.RewardType.RewardType_DaSanYuan] = slot0.showDaSanYuanType,
		[Tree.RewardType.RewardType_DaSiXi] = slot0.showDaSiXiType,
		[Tree.RewardType.RewardType_SongDeng] = slot0.showLightingType,
		[Tree.RewardType.RewardType_ShanDian] = slot0.showThunderCaiJinType,
		[Tree.RewardType.RewardType_CaiJin] = slot0.showThunderCaiJinType
	}
	slot5 = 7

	slot0.layer_deng.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.layer_deng)

	slot5 = 6

	slot0.layer_lighting.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.layer_lighting)

	slot5 = 5

	slot0.layer_dasixi.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.layer_dasixi)

	slot5 = 4

	slot0.layer_dasanyuan.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.layer_dasanyuan)

	slot5 = 3

	slot0.layer_normal.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.layer_normal)

	slot5 = 0

	slot0.sprite_mask.setLocalZOrder(Tree.RewardType.RewardType_CaiJin, slot0.sprite_mask)

	slot0.layer_deng.ccsChildren = {}
	slot0.layer_lighting.ccsChildren = {}
	slot0.layer_dasixi.ccsChildren = {}
	slot0.layer_dasanyuan.ccsChildren = {}
	slot0.layer_normal.ccsChildren = {}
	slot8 = "skip_tf"
	slot0.layer_deng.skip_tf = CCSUtil.changeUILabelWithTextField(slot0.layer_deng.getChildByName(slot0.runExitAnimation, slot0.layer_deng))
	slot8 = "skip_tf"
	slot0.layer_lighting.skip_tf = CCSUtil.changeUILabelWithTextField(slot0.layer_lighting.getChildByName(slot0.runExitAnimation, slot0.layer_lighting))
	slot8 = "skip_tf"
	slot0.layer_dasixi.skip_tf = CCSUtil.changeUILabelWithTextField(slot0.layer_dasixi.getChildByName(slot0.runExitAnimation, slot0.layer_dasixi))
	slot8 = "skip_tf"
	slot0.layer_dasanyuan.skip_tf = CCSUtil.changeUILabelWithTextField(slot0.layer_dasanyuan.getChildByName(slot0.runExitAnimation, slot0.layer_dasanyuan))
	slot8 = "skip_tf"
	slot0.layer_normal.skip_tf = CCSUtil.changeUILabelWithTextField(slot0.layer_normal.getChildByName(slot0.runExitAnimation, slot0.layer_normal))
	slot5 = slot0[Tree.RewardType.RewardType_SongDeng]
	slot2 = cc.ParticleSystemQuad.create(CCSUtil.changeUILabelWithTextField(slot0.layer_normal.getChildByName(slot0.runExitAnimation, slot0.layer_normal)), cc.ParticleSystemQuad)
	slot5 = slot2
	slot9 = 80

	slot2.setPosition(cc.ParticleSystemQuad, cc.p(slot0.layer_normal, 180))

	slot6 = slot2

	slot0.layer_deng.image_press.addChild(cc.ParticleSystemQuad, slot0.layer_deng.image_press)

	slot6 = slot0[Tree.RewardType.RewardType_Normal]
	slot3 = cc.ParticleSystemQuad.create(cc.ParticleSystemQuad, cc.ParticleSystemQuad)
	slot6 = slot3
	slot10 = 80

	slot3.setPosition(cc.ParticleSystemQuad, cc.p(180, 180))

	slot7 = slot3

	slot0.layer_lighting.image_press.addChild(cc.ParticleSystemQuad, slot0.layer_lighting.image_press)

	slot7 = slot0[Tree.RewardType.RewardType_DaSiXi]
	slot4 = cc.ParticleSystemQuad.create(cc.ParticleSystemQuad, cc.ParticleSystemQuad)
	slot7 = slot4
	slot11 = 80

	slot4.setPosition(cc.ParticleSystemQuad, cc.p(180, 180))

	slot8 = slot4

	slot0.layer_dasixi.image_press.addChild(cc.ParticleSystemQuad, slot0.layer_dasixi.image_press)

	slot8 = slot0[Tree.RewardType.RewardType_DaSanYuan]
	slot5 = cc.ParticleSystemQuad.create(cc.ParticleSystemQuad, cc.ParticleSystemQuad)
	slot8 = slot5
	slot12 = 80

	slot5.setPosition(cc.ParticleSystemQuad, cc.p(180, 180))

	slot9 = slot5

	slot0.layer_dasanyuan.image_press.addChild(cc.ParticleSystemQuad, slot0.layer_dasanyuan.image_press)

	slot9 = slot0[Tree.RewardType.RewardType_Normal]
	slot6 = cc.ParticleSystemQuad.create(cc.ParticleSystemQuad, cc.ParticleSystemQuad)
	slot9 = slot6
	slot13 = 80

	slot6.setPosition(cc.ParticleSystemQuad, cc.p(180, 180))

	slot10 = slot6

	slot0.layer_normal.image_press.addChild(cc.ParticleSystemQuad, slot0.layer_normal.image_press)
end

SlwhRewardCcsView.loadChildCascade = function (slot0)
	slot4 = true

	TreeFunc.loadChildCascade(slot2, slot0.layer_normal)

	slot4 = true

	TreeFunc.loadChildCascade(slot2, slot0.layer_dasanyuan)

	slot4 = true

	TreeFunc.loadChildCascade(slot2, slot0.layer_dasixi)

	slot4 = true

	TreeFunc.loadChildCascade(slot2, slot0.layer_lighting)

	slot4 = true

	TreeFunc.loadChildCascade(slot2, slot0.layer_deng)
end

SlwhRewardCcsView.showRewardType = function (slot0, slot1)
	slot0._exit = false
	slot5 = 255

	slot0._mask.setOpacity(slot3, slot0._mask)

	slot5 = 1

	slot0._center.setScale(slot3, slot0._center)

	slot5 = false

	slot0.layer_normal.setVisible(slot3, slot0.layer_normal)

	slot5 = false

	slot0.layer_dasanyuan.setVisible(slot3, slot0.layer_dasanyuan)

	slot5 = false

	slot0.layer_dasixi.setVisible(slot3, slot0.layer_dasixi)

	slot5 = false

	slot0.layer_lighting.setVisible(slot3, slot0.layer_lighting)

	slot5 = false

	slot0.layer_deng.setVisible(slot3, slot0.layer_deng)

	slot0.reward_type = slot1.tAward.nType

	if slot0._rewardCallback[slot0.reward_type] then
		slot6 = slot1

		slot2(slot4, slot0)
	else
		slot5 = slot0

		slot0.onExit(slot4)
	end

	slot0.score = slot1.lScore + slot1.lJettoned
end

SlwhRewardCcsView.showSkipTxt = function (slot0, slot1)
	slot10 = slot0[slot0.reward_type]
	slot10 = slot0[slot0.reward_type]
	slot7 = slot1
	slot12 = "%s"
	slot10 = slot0[slot0.reward_type]
	slot5 = HtmlUtil.createImg(string.format(string.format, "#slwh_result_%s_right.png"))
	slot7 = "" .. HtmlUtil.createImg(string.format(slot8, "#slwh_result_%s_txt.png")) .. HtmlUtil.createImg(string.format(slot8, "#slwh_result_%s_left.png")) .. HtmlUtil.createArtNum(slot6, string.format("#slwh_result_%s_left.png", "#slwh_result_%s_%s.png", slot0[slot0.reward_type])) .. slot5

	slot0.currentLayer.skip_tf.setHtmlText(slot5, slot0.currentLayer.skip_tf)

	slot7 = slot1[slot0.reward_type]

	slot0.currentLayer.image_press.loadTexture(slot5, slot0.currentLayer.image_press)

	slot7 = 255

	slot0.currentLayer.image_press.setOpacity(slot5, slot0.currentLayer.image_press)

	slot7 = 1

	slot0.currentLayer.image_press.setScale(slot5, slot0.currentLayer.image_press)

	slot6 = slot0.currentLayer.image_press
	slot10 = 154

	slot0.currentLayer.image_press.setContentSize(slot5, cc.size(slot0.reward_type, 359))
end

SlwhRewardCcsView.skipCountdownHandler = function (slot0)
	slot0.currentCountdown = slot0.currentCountdown - 1

	if slot0.currentCountdown == 0 then
		slot3 = slot0

		slot0.runExitAnimation(slot2)
	else
		slot4 = slot0.currentCountdown

		slot0.showSkipTxt(slot2, slot0)
	end
end

SlwhRewardCcsView.runSkipTimer = function (slot0, slot1)
	slot0.currentLayer = slot1
	slot4 = slot0.model
	slot0.currentCountdown = slot0.model.getRemindTime(slot3)
	slot5 = false

	slot0.layer_normal.skip_tf.setTouchEnabled(slot3, slot0.layer_normal.skip_tf)

	slot4 = slot0

	slot0.stopSkipTimer(slot3)

	slot8 = slot0.skipCountdownHandler
	slot7 = -1
	slot0.skipTimer = tickMgr.delayedCall(slot3, tickMgr, handler(slot6, slot0), 1000)
	slot5 = slot0.currentCountdown

	slot0.showSkipTxt(slot3, slot0)
end

SlwhRewardCcsView.stopSkipTimer = function (slot0)
	if slot0.skipTimer then
		slot3 = slot0.skipTimer

		slot0.skipTimer.stop(slot2)

		slot3 = slot0.skipTimer

		slot0.skipTimer.destroy(slot2)

		slot0.skipTimer = nil
	end
end

SlwhRewardCcsView.showNormalType = function (slot0, slot1)
	slot5 = true

	slot0.layer_normal.setVisible(slot3, slot0.layer_normal)

	slot5 = slot0.layer_normal

	slot0.showNormalAnimation(slot3, slot0)

	slot7 = false

	slot0.setComponentVisible(slot3, slot0, slot0.layer_normal, 2)

	slot4 = slot0.layer_normal
	slot11 = 0.5333333333333333
	slot8 = cc.DelayTime.create(slot9, cc.DelayTime)
	slot11 = cc.CallFunc
	slot16 = slot1

	slot0.layer_normal.runAction(slot3, cc.Sequence.create(2, cc.Sequence, cc.CallFunc.create(cc.DelayTime, c_func(slot13, slot0.showNormalType_Continue, slot0))))
end

SlwhRewardCcsView.showNormalType_Continue = function (slot0, slot1)
	slot7 = true

	slot0.setComponentVisible(slot3, slot0, slot0.layer_normal, 2)

	slot5 = 1
	slot8 = slot1.lScore + slot1.lJettoned

	slot0.setJettonAchieveScore(slot1.tAward.nAwardIndex, slot0, slot0.layer_normal.node_xiazhuhuode, slot1.lJettoned)

	slot9 = slot1.tAward.nJettonAreaTimes[TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex)[1]]

	slot0:setLayerIconScore(slot0, slot0.layer_normal.layer_panel_1, slot3)

	slot10 = slot1.tAward.nJettonAreaTimes[TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex)[2]]

	slot0:setLayerIconScore(slot0, slot0.layer_normal.layer_panel_2, TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex)[2])

	slot8 = true

	slot0.layer_normal.image_press.setTouchEnabled(slot0, slot0.layer_normal.image_press)

	slot7 = slot0.layer_normal.image_press
	slot11 = slot0

	slot0.layer_normal.image_press.addTouchEventListener(slot0, c_func(TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex)[2], slot0.onButtonClick))

	slot8 = slot0.layer_normal

	slot0:runSkipTimer(slot0)
end

SlwhRewardCcsView.showDaSanYuanType = function (slot0, slot1)
	slot5 = true

	slot0.layer_dasanyuan.setVisible(slot3, slot0.layer_dasanyuan)

	slot5 = "spine_award_dasanyuan"
	slot2 = TreeCacheManager.getCacheObject(slot3, TreeCacheManager)
	slot8 = false

	slot2.setAnimation(TreeCacheManager, slot2, 0, "start")

	slot8 = true

	slot2.addAnimation(TreeCacheManager, slot2, 0, "idle")

	slot6 = "spine_reward"

	slot2.setName(TreeCacheManager, slot2)

	slot7 = 2

	slot0._center.addChild(TreeCacheManager, slot0._center, slot2)

	slot8 = false

	slot0.setComponentVisible(TreeCacheManager, slot0, slot0.layer_dasanyuan, 4)

	slot6 = 3
	slot4 = 1.0666666666666667
	slot5 = CONFIG_CUR_WIDTH - 300
	slot6 = CONFIG_CUR_HEIGHT - 200

	for slot10 = 1, 3 + math.random(TreeCacheManager, 0), 1 do
		slot14 = slot0.layer_dasanyuan
		slot21 = slot4 + slot10 * 0.033 + math.random() * 0.25
		slot18 = cc.DelayTime.create(slot19, cc.DelayTime)

		function slot22()
			slot3 = "spine_fire"
			slot0 = TreeCacheManager.getCacheObject(slot1, TreeCacheManager)
			slot6 = false

			slot0.setAnimation(TreeCacheManager, slot0, 0, "animation")

			slot7 = 40 + math.random() * slot1

			slot0.setPosition(0, slot0, slot1)

			slot6 = slot0

			slot2.layer_dasanyuan.addChild(0, slot2.layer_dasanyuan)
		end

		slot0.layer_dasanyuan.runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end

	slot9 = slot0.layer_dasanyuan
	slot16 = 2
	slot13 = cc.DelayTime.create(slot14, cc.DelayTime)
	slot16 = cc.CallFunc
	slot21 = slot1

	slot0.layer_dasanyuan.runAction(slot8, cc.Sequence.create(slot11, cc.Sequence, cc.CallFunc.create(cc.DelayTime, c_func(slot18, slot0.showDaSanYuanType_Continue, slot0))))
end

SlwhRewardCcsView.showDaSanYuanType_Continue = function (slot0, slot1)
	slot7 = true

	slot0.setComponentVisible(slot3, slot0, slot0.layer_dasanyuan, 4)

	slot5 = 1
	slot8 = slot1.lScore + slot1.lJettoned

	slot0.setJettonAchieveScore(slot1.tAward.nAwardIndex, slot0, slot0.layer_dasanyuan.node_xiazhuhuode, slot1.lJettoned)

	for slot6 = 1, #TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex), 1 do
		slot13 = slot1.tAward.nJettonAreaTimes[slot2[slot6]]

		slot0.setLayerIconScore(slot9, slot0, slot0.layer_dasanyuan["layer_panel_" .. slot6], slot2[slot6])
	end

	slot6 = true

	slot0.layer_dasanyuan.image_press.setTouchEnabled(slot4, slot0.layer_dasanyuan.image_press)

	slot5 = slot0.layer_dasanyuan.image_press
	slot9 = slot0

	slot0.layer_dasanyuan.image_press.addTouchEventListener(slot4, c_func(slot7, slot0.onButtonClick))

	slot6 = slot0.layer_dasanyuan

	slot0.runSkipTimer(slot4, slot0)
end

SlwhRewardCcsView.showDaSiXiType = function (slot0, slot1)
	slot5 = true

	slot0.layer_dasixi.setVisible(slot3, slot0.layer_dasixi)

	slot5 = "spine_award_dasixi"
	slot2 = TreeCacheManager.getCacheObject(slot3, TreeCacheManager)
	slot8 = false

	slot2.setAnimation(TreeCacheManager, slot2, 0, "start")

	slot8 = true

	slot2.addAnimation(TreeCacheManager, slot2, 0, "idle")

	slot6 = "spine_reward"

	slot2.setName(TreeCacheManager, slot2)

	slot7 = 2

	slot0._center.addChild(TreeCacheManager, slot0._center, slot2)

	slot8 = false

	slot0.setComponentVisible(TreeCacheManager, slot0, slot0.layer_dasixi, 5)

	slot6 = 3
	slot4 = 1.0666666666666667
	slot5 = CONFIG_CUR_WIDTH - 300
	slot6 = CONFIG_CUR_HEIGHT - 200

	for slot10 = 1, 3 + math.random(TreeCacheManager, 0), 1 do
		slot14 = slot0.layer_dasixi
		slot21 = slot4 + slot10 * 0.033 + math.random() * 0.25
		slot18 = cc.DelayTime.create(slot19, cc.DelayTime)

		function slot22()
			slot3 = "spine_fire"
			slot0 = TreeCacheManager.getCacheObject(slot1, TreeCacheManager)
			slot6 = false

			slot0.setAnimation(TreeCacheManager, slot0, 0, "animation")

			slot7 = 40 + math.random() * slot1

			slot0.setPosition(0, slot0, slot1)

			slot6 = slot0

			slot2.layer_dasixi.addChild(0, slot2.layer_dasixi)
		end

		slot0.layer_dasixi.runAction(slot13, cc.Sequence.create(slot16, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))
	end

	slot9 = slot0.layer_dasixi
	slot16 = 2
	slot13 = cc.DelayTime.create(slot14, cc.DelayTime)
	slot16 = cc.CallFunc
	slot21 = slot1

	slot0.layer_dasixi.runAction(slot8, cc.Sequence.create(slot11, cc.Sequence, cc.CallFunc.create(cc.DelayTime, c_func(slot18, slot0.showDaSiXiType_Continue, slot0))))
end

SlwhRewardCcsView.showDaSiXiType_Continue = function (slot0, slot1)
	slot7 = true

	slot0.setComponentVisible(slot3, slot0, slot0.layer_dasixi, 5)

	slot5 = 1
	slot8 = slot1.lScore + slot1.lJettoned

	slot0.setJettonAchieveScore(slot1.tAward.nAwardIndex, slot0, slot0.layer_dasixi.node_xiazhuhuode, slot1.lJettoned)

	for slot6 = 1, #TreeFunc.checkAllIndex(slot3, slot1.tAward.nAwardIndex), 1 do
		slot13 = slot1.tAward.nJettonAreaTimes[slot2[slot6]]

		slot0.setLayerIconScore(slot9, slot0, slot0.layer_dasixi["layer_panel_" .. slot6], slot2[slot6])
	end

	slot6 = true

	slot0.layer_dasixi.image_press.setTouchEnabled(slot4, slot0.layer_dasixi.image_press)

	slot5 = slot0.layer_dasixi.image_press
	slot9 = slot0

	slot0.layer_dasixi.image_press.addTouchEventListener(slot4, c_func(slot7, slot0.onButtonClick))

	slot6 = slot0.layer_dasixi

	slot0.runSkipTimer(slot4, slot0)
end

SlwhRewardCcsView.showLightingType = function (slot0, slot1)
	slot5 = true

	slot0.layer_deng.setVisible(slot3, slot0.layer_deng)

	slot4 = slot0.layer_deng.layer_lv

	slot0.layer_deng.layer_lv.removeAllChildren(slot3)

	slot5 = slot0.layer_deng

	slot0.showNormalAnimation(slot3, slot0)

	slot5 = false

	slot0.layer_deng.layer_panel.setVisible(slot3, slot0.layer_deng.layer_panel)

	slot7 = false

	slot0.setComponentVisible(slot3, slot0, slot0.layer_deng, 0)

	slot4 = slot0.layer_deng
	slot11 = 0.5333333333333333
	slot8 = cc.DelayTime.create(slot9, cc.DelayTime)
	slot11 = cc.CallFunc
	slot16 = slot1

	slot0.layer_deng.runAction(slot3, cc.Sequence.create(0, cc.Sequence, cc.CallFunc.create(cc.DelayTime, c_func(slot13, slot0.showLightingType_Continue, slot0))))
end

SlwhRewardCcsView.showLightingType_Continue = function (slot0, slot1)
	slot7 = true

	slot0.setComponentVisible(slot3, slot0, slot0.layer_deng, 0)

	slot6 = false

	slot0.layer_deng.layer_panel.setVisible(slot0, slot2)

	slot3 = slot0.layer_deng.layer_panel.getContentSize(slot0)
	slot7 = slot0.layer_deng.layer_panel.sprite_demo
	slot5, slot6 = slot0.layer_deng.layer_panel.sprite_demo.getPosition(slot0.layer_deng.layer_lv)
	slot9 = slot0.layer_deng.layer_panel.sprite_xpanel
	slot7, slot8 = slot0.layer_deng.layer_panel.sprite_xpanel.getPosition(slot8)
	slot9 = 3
	slot13 = 1
	slot16 = slot1.lScore + slot1.lJettoned

	slot0.setJettonAchieveScore(slot1.tAward.nAwardIndex, slot0, slot0.layer_deng.node_xiazhuhuode, slot1.lJettoned)

	slot13 = slot0.layer_deng.layer_lv.getContentSize(slot2).width / 7
	slot16 = #TreeFunc.checkAllIndex(slot11, slot1.tAward.nAwardIndex) / 7
	slot14 = math.floor(slot1.lJettoned)
	slot15 = slot0.layer_deng.layer_lv.getContentSize(slot2).height
	slot16 = slot0.layer_deng.layer_lv
	slot17 = 0
	slot18 = 1

	while slot12 < slot11 and slot17 < slot14 do
		slot19 = (slot4.width - slot12 * slot13) * 0.5 + (slot13 - slot3.width) * 0.5

		for slot23 = 1, slot12, 1 do
			slot26 = cc.Node.create(slot27)
			slot31 = slot15 - slot3.height

			slot26.setPosition(cc.Node, slot26, slot19)

			slot30 = slot26

			slot16.addChild(cc.Node, slot16)

			slot29 = cc.Sprite
			slot26.sprite_demo = cc.Sprite.create(cc.Node)
			slot30 = slot26.sprite_demo

			slot26.addChild(cc.Node, slot26)

			slot31 = slot6

			slot26.sprite_demo.setPosition(cc.Node, slot26.sprite_demo, slot5)

			slot30 = Tree.root .. "result/sprite_xpanel.png"
			slot26.sprite_xpanel = cc.Sprite.create(cc.Node, cc.Sprite)
			slot30 = slot26.sprite_xpanel

			slot26.addChild(cc.Node, slot26)

			slot31 = slot8

			slot26.sprite_xpanel.setPosition(cc.Node, slot26.sprite_xpanel, slot7)

			slot32 = slot1.tAward.nJettonAreaTimes[slot10[slot18]]

			slot0.setLayerIconScore(cc.Node, slot0, slot26, slot10[slot18])

			slot16["layer_panel_" .. slot18] = slot26
			slot19 = slot19 + slot13
			slot18 = slot18 + 1
		end

		slot17 = slot17 + 1
		slot15 = slot15 - slot3.height - slot9
	end

	slot15 = (slot12 < slot11 and slot15) or (slot4.height - slot3.height) * 0.5 + slot3.height + 20
	slot20 = (slot4.width - slot13 * (slot11 - slot12 * slot17)) * 0.5 + (slot13 - slot3.width) * 0.5

	for slot24 = 1, slot19, 1 do
		slot27 = cc.Node.create(slot28)
		slot32 = slot15 - slot3.height

		slot27.setPosition(cc.Node, slot27, slot20)

		slot31 = slot27

		slot16.addChild(cc.Node, slot16)

		slot30 = cc.Sprite
		slot27.sprite_demo = cc.Sprite.create(cc.Node)
		slot31 = slot27.sprite_demo

		slot27.addChild(cc.Node, slot27)

		slot32 = slot6

		slot27.sprite_demo.setPosition(cc.Node, slot27.sprite_demo, slot5)

		slot31 = Tree.root .. "result/sprite_xpanel.png"
		slot27.sprite_xpanel = cc.Sprite.create(cc.Node, cc.Sprite)
		slot31 = slot27.sprite_xpanel

		slot27.addChild(cc.Node, slot27)

		slot32 = slot8

		slot27.sprite_xpanel.setPosition(cc.Node, slot27.sprite_xpanel, slot7)

		slot33 = slot1.tAward.nJettonAreaTimes[slot10[slot18]]

		slot0.setLayerIconScore(cc.Node, slot0, slot27, slot10[slot18])

		slot16["layer_panel_" .. slot18] = slot27
		slot20 = slot20 + slot13
		slot18 = slot18 + 1
	end

	slot24 = true

	slot0.layer_deng.image_press.setTouchEnabled(slot22, slot0.layer_deng.image_press)

	slot23 = slot0.layer_deng.image_press
	slot27 = slot0

	slot0.layer_deng.image_press.addTouchEventListener(slot22, c_func(slot25, slot0.onButtonClick))

	slot24 = slot0.layer_deng

	slot0.runSkipTimer(slot22, slot0)
end

SlwhRewardCcsView.showThunderCaiJinType = function (slot0, slot1)
	slot5 = true

	slot0.layer_lighting.setVisible(slot3, slot0.layer_lighting)

	slot5 = slot0.layer_lighting

	slot0.showNormalAnimation(slot3, slot0)

	slot7 = false

	slot0.setComponentVisible(slot3, slot0, slot0.layer_lighting, 3)

	slot4 = slot0.layer_lighting
	slot11 = 0.5333333333333333
	slot8 = cc.DelayTime.create(slot9, cc.DelayTime)
	slot11 = cc.CallFunc
	slot16 = slot1

	slot0.layer_lighting.runAction(slot3, cc.Sequence.create(3, cc.Sequence, cc.CallFunc.create(cc.DelayTime, c_func(slot13, slot0.showThunderCaiJinType_Continue, slot0))))
end

SlwhRewardCcsView.showThunderCaiJinType_Continue = function (slot0, slot1)
	slot7 = true

	slot0.setComponentVisible(slot3, slot0, slot0.layer_lighting, 3)

	slot2 = -1
	slot3 = 17

	if slot1.tAward.nType == Tree.RewardType.RewardType_ShanDian then
		slot2 = slot1.tAward.nTimes
		slot3 = 16
	end

	slot9 = slot2

	slot0.setLayerIconScore(slot5, slot0, slot0.layer_lighting.layer_panel_1, slot3)

	slot7 = 1
	slot10 = slot1.lScore + slot1.lJettoned

	slot0.setJettonAchieveScore(slot1.tAward.nAwardIndex, slot0, slot0.layer_lighting.node_xiazhuhuode, slot1.lJettoned)

	slot11 = slot1.tAward.nJettonAreaTimes[TreeFunc.checkAllIndex(slot5, slot1.tAward.nAwardIndex)[1]]

	slot0:setLayerIconScore(slot0, slot0.layer_lighting.layer_panel_2, slot5)

	slot12 = slot1.tAward.nJettonAreaTimes[TreeFunc.checkAllIndex(slot5, slot1.tAward.nAwardIndex)[2]]

	slot0:setLayerIconScore(slot0, slot0.layer_lighting.layer_panel_3, TreeFunc.checkAllIndex(slot5, slot1.tAward.nAwardIndex)[2])

	slot10 = true

	slot0.layer_lighting.image_press.setTouchEnabled(slot0, slot0.layer_lighting.image_press)

	slot9 = slot0.layer_lighting.image_press
	slot13 = slot0

	slot0.layer_lighting.image_press.addTouchEventListener(slot0, c_func(TreeFunc.checkAllIndex(slot5, slot1.tAward.nAwardIndex)[2], slot0.onButtonClick))

	slot10 = slot0.layer_lighting

	slot0:runSkipTimer(slot0)
end

SlwhRewardCcsView.showNormalAnimation = function (slot0, slot1)
	slot5 = "particle_reward_l"
	slot2 = TreeCacheManager.getCacheObject(slot3, TreeCacheManager)
	slot7 = CONFIG_CUR_HEIGHT * 0.5 + 135

	slot2.setPosition(TreeCacheManager, slot2, CONFIG_CUR_WIDTH * 0.5 - 20)

	slot6 = "particle_reward_l"

	slot2.setName(TreeCacheManager, slot2)

	slot7 = 1

	slot0._root.addChild(TreeCacheManager, slot0._root, slot2)

	slot6 = "particle_reward_r"
	slot3 = TreeCacheManager.getCacheObject(TreeCacheManager, TreeCacheManager)
	slot8 = CONFIG_CUR_HEIGHT * 0.5 + 135

	slot3.setPosition(TreeCacheManager, slot3, CONFIG_CUR_WIDTH * 0.5 + 20)

	slot7 = "particle_reward_r"

	slot3.setName(TreeCacheManager, slot3)

	slot8 = 1

	slot0._root.addChild(TreeCacheManager, slot0._root, slot3)

	slot7 = "spine_award_result"
	slot4 = TreeCacheManager.getCacheObject(TreeCacheManager, TreeCacheManager)
	slot10 = false

	slot4.setAnimation(TreeCacheManager, slot4, 0, "start")

	slot10 = true

	slot4.addAnimation(TreeCacheManager, slot4, 0, "idle")

	slot8 = "spine_reward"

	slot4.setName(TreeCacheManager, slot4)

	slot9 = 2

	slot0._center.addChild(TreeCacheManager, slot0._center, slot4)
end

SlwhRewardCcsView.setJettonAchieveScore = function (slot0, slot1, slot2, slot3)
	slot6 = slot1

	slot1.removeAllChildren(slot5)

	slot7 = Tree.root .. "result/win/sprite_xizzhu.png"
	slot4 = cc.Sprite.create(slot5, cc.Sprite)
	slot8 = slot4

	slot1.addChild(cc.Sprite, slot1)

	slot9 = Tree.root .. "result/win/sprite_huode.png"
	slot6 = cc.Sprite.create(slot4, cc.Sprite)

	slot1.addChild(cc.Sprite, slot1)

	slot9 = slot6
	slot7 = slot6.getContentSize(cc.Sprite)
	slot13 = {}
	slot9 = TreeFunc.createSpriteNumber(slot6, slot2, Tree.root .. "result/win/number_%s.png")
	slot13 = slot9

	slot1.addChild(slot2, slot1)

	slot13 = slot3 / 40
	slot0.__total = slot3
	slot15 = cc.Sprite
	slot0.__scoreNode = cc.Sprite.create(slot14)
	slot16 = slot0.__scoreNode

	slot1.addChild(slot14, slot1)

	slot18 = {}
	slot18 = TreeFunc.createSpriteNumber(slot1, slot12, Tree.root .. "result/win/number_%s.png")

	slot0.__scoreNode.addChild(slot12, slot0.__scoreNode)

	slot17 = slot0.__scoreNode
	slot20 = cc.RepeatForever
	slot27 = 0.025
	slot24 = cc.DelayTime.create(slot25, cc.DelayTime)

	function slot28()
		if slot2 <= slot0 + slot1 then
			slot0 = slot2
			slot2 = slot3.__scoreNode

			slot3.__scoreNode.stopAllActions(slot1)
		end

		slot2 = slot3.__scoreNode

		slot3.__scoreNode.removeAllChildren(slot1)

		slot2 = slot3.__scoreNode
		slot7 = slot4

		slot3.__scoreNode.addChild(slot1, TreeFunc.createSpriteNumber(slot4, slot3.__scoreNode.addChild, Tree.root .. "result/win/number_%s.png"))
	end

	slot0.__scoreNode.runAction(slot12, cc.RepeatForever.create(slot19, cc.Sequence.create(slot22, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc))))

	slot22 = 0

	slot4.setPosition(slot19, slot4, -(slot4.getContentSize(cc.Sprite).width + slot7.width + ()["width"] + ()["width"] + 50 + 2 + 2) * 0.5 + slot7.width * 0.5)

	slot22 = 0

	slot9.setPosition(slot19, slot9, -(slot4.getContentSize(cc.Sprite).width + slot7.width + ()["width"] + ()["width"] + 50 + 2 + 2) * 0.5 + slot4.getContentSize(cc.Sprite).width + 2)

	slot22 = 0

	slot6.setPosition(slot19, slot6, -(slot4.getContentSize(cc.Sprite).width + slot7.width + ()["width"] + ()["width"] + 50 + 2 + 2) * 0.5 + slot4.getContentSize(cc.Sprite).width + 2 + ()["width"] + 50 + slot7.width * 0.5)

	slot22 = 0

	slot0.__scoreNode.setPosition(slot19, slot0.__scoreNode, -(slot4.getContentSize(cc.Sprite).width + slot7.width + ()["width"] + ()["width"] + 50 + 2 + 2) * 0.5 + slot4.getContentSize(cc.Sprite).width + 2 + ()["width"] + 50 + slot7.width + 2)
end

SlwhRewardCcsView.setLayerIconScore = function (slot0, slot1, slot2, slot3)
	slot8 = Tree.root .. "result/animal_" .. slot2 .. ".png"

	slot1.sprite_demo.setTexture(slot6, slot1.sprite_demo)

	if slot3 < 0 then
		slot8 = false

		slot1.sprite_xpanel.setVisible(slot6, slot1.sprite_xpanel)

		return
	end

	slot8 = true

	slot1.sprite_xpanel.setVisible(slot6, slot1.sprite_xpanel)

	slot7 = slot1.sprite_xpanel

	slot1.sprite_xpanel.removeAllChildren(slot6)

	slot9 = Tree.root .. "result/multiply/number_x.png"
	slot6 = cc.Sprite.create(slot1.sprite_xpanel, cc.Sprite)
	slot7 = slot6.getContentSize(cc.Sprite)
	slot11 = slot6

	slot1.sprite_xpanel.addChild(slot6, slot1.sprite_xpanel)

	slot13 = {}
	slot9 = TreeFunc.createSpriteNumber(slot1.sprite_xpanel, slot3, Tree.root .. "result/multiply/number_%s.png")

	slot1.sprite_xpanel.addChild(slot3, slot1.sprite_xpanel)

	slot16 = slot1.sprite_xpanel.getContentSize(slot6).height * 0.5

	slot6.setPosition(slot9, slot6, slot1.sprite_xpanel.getContentSize(slot6).width * 0.5 - (slot7.width + ()["width"]) * 0.5 + slot7.width * 0.5)

	slot16 = slot1.sprite_xpanel.getContentSize(slot6).height * 0.5

	slot9:setPosition(slot9, slot1.sprite_xpanel.getContentSize(slot6).width * 0.5 - (slot7.width + ()["width"]) * 0.5 + slot7.width)
end

SlwhRewardCcsView.setComponentVisible = function (slot0, slot1, slot2, slot3)
	slot7 = slot3

	slot1.node_xiazhuhuode.setVisible(slot5, slot1.node_xiazhuhuode)

	slot7 = 0

	slot1.image_press.setOpacity(slot5, slot1.image_press)

	slot7 = slot3

	slot1.skip_tf.setVisible(slot5, slot1.skip_tf)

	for slot7 = 1, slot2, 1 do
		slot11 = slot3

		slot1["layer_panel_" .. slot7].setVisible(slot7, slot1["layer_panel_" .. slot7])
	end
end

SlwhRewardCcsView.onButtonClick = function (slot0, slot1, slot2)
	if slot2 == ccui.TouchEventType.ended then
		slot5 = slot0

		slot0.runExitAnimation(slot4)
	end
end

SlwhRewardCcsView.onExit = function (slot0)
	slot4 = "spine_reward"

	if slot0._center.getChildByName(slot2, slot0._center) then
		slot5 = slot1

		TreeCacheManager.recycleCocos2dxObject(slot3, TreeCacheManager)
	end

	slot5 = "particle_reward_l"

	if slot0._root.getChildByName(slot3, slot0._root) then
		slot6 = slot2

		TreeCacheManager.recycleCocos2dxObject(slot4, TreeCacheManager)
	end

	slot6 = "particle_reward_r"

	if slot0._root.getChildByName(slot4, slot0._root) then
		slot7 = slot3

		TreeCacheManager.recycleCocos2dxObject(slot5, TreeCacheManager)
	end

	slot7 = "spine_fire"
	slot4 = slot0.layer_dasanyuan.getChildByName(slot5, slot0.layer_dasanyuan)

	while slot4 do
		slot8 = slot4

		TreeCacheManager.recycleCocos2dxObject(slot6, TreeCacheManager)

		slot8 = "spine_fire"
		slot4 = slot0.layer_dasanyuan.getChildByName(slot6, slot0.layer_dasanyuan)
	end

	slot8 = "spine_fire"
	slot5 = slot0.layer_dasixi.getChildByName(slot6, slot0.layer_dasixi)

	while slot5 do
		slot9 = slot5

		TreeCacheManager.recycleCocos2dxObject(slot7, TreeCacheManager)

		slot9 = "spine_fire"
		slot5 = slot0.layer_dasixi.getChildByName(slot7, slot0.layer_dasixi)
	end

	slot8 = slot0

	slot0.stopSkipTimer(slot7)

	slot8 = slot0

	slot0.removeFromParent(slot7)
end

SlwhRewardCcsView.runExitAnimation = function (slot0)
	slot3 = slot0

	if slot0.getParent(slot2) and not slot0._exit then
		slot0._exit = true
		slot3 = slot0._mask

		slot0._mask.runAction(slot2, cc.FadeTo.create(slot5, cc.FadeTo, 0.15))

		slot3 = slot0._center
		slot6 = cc.EaseSineIn
		slot11 = 0

		slot0._center.runAction(slot2, cc.EaseSineIn.create(slot5, cc.ScaleTo.create(0, cc.ScaleTo, 0.15)))

		slot3 = slot0
		slot10 = 0.15
		slot7 = cc.DelayTime.create(0, cc.DelayTime)

		function slot11()
			slot2 = slot0

			slot0.onExit(slot1)
		end

		slot0.runAction(slot2, cc.Sequence.create(slot5, cc.Sequence, cc.CallFunc.create(cc.DelayTime, cc.CallFunc)))

		if slot0.__scoreNode and slot0.score > 0 then
			slot3 = slot0.__scoreNode

			slot0.__scoreNode.removeAllChildren(slot2)

			slot3 = slot0.__scoreNode

			slot0.__scoreNode.stopAllActions(slot2)

			slot3 = cc.Director
			slot3 = cc.Director.getInstance(slot2)
			slot4 = slot0.__total
			slot9 = {}
			slot9 = TreeFunc.createSpriteNumber(slot6, slot0.__total, Tree.root .. "result/win/number_%s.png")

			slot0.__scoreNode.addChild(slot0.__total, slot0.__scoreNode)

			slot9 = slot0
			slot7 = slot0.getParent(slot0.__scoreNode)
			slot16 = slot0.__scoreNode.getChildren(slot0.__total)[1]
			slot12 = slot0.__scoreNode.getChildren(slot0.__total)[1]

			slot0.__scoreNode.getChildren(slot0.__total)[1].retain(slot8)

			slot12 = slot0.__scoreNode.getChildren(slot0.__total)[1]

			slot0.__scoreNode.getChildren(slot0.__total)[1].removeFromParent(slot8)

			slot12 = slot0
			slot13 = slot0.__scoreNode.convertToWorldSpace(slot10, cc.p(slot0.__scoreNode.getChildren(slot0.__total)[1].getPosition(slot15)))
			slot13 = slot0.__scoreNode.getChildren(slot0.__total)[1]

			slot7.addChild(slot8, slot7)

			slot13 = slot0.getParent(slot8).convertToNodeSpace(slot8, slot0.getParent(slot8))

			slot0.__scoreNode.getChildren(slot0.__total)[1].setPosition(slot8, slot6)

			slot12 = slot0.__scoreNode.getChildren(slot0.__total)[1]

			slot0.__scoreNode.getChildren(slot0.__total)[1].release(slot8)

			slot13 = true

			slot0.__scoreNode.getChildren(slot0.__total)[1].setCascadeOpacityEnabled(slot8, slot6)

			slot13 = 999999

			slot0.__scoreNode.getChildren(slot0.__total)[1].setLocalZOrder(slot8, slot6)

			slot12 = slot0.__scoreNode.getChildren(slot0.__total)[1]
			slot25 = 0.3
			slot29 = 44
			slot22 = cc.MoveTo.create(slot23, cc.MoveTo, cc.p(slot27, 250 + ((cc.Director.getInstance(slot2).getVisibleSize(slot2).width > 1334 and 0) or 66)))
			slot27 = 50

			function slot23()
				slot6 = "res/gameres/module/slwh/effect/slwh_userhkeffect.atlas"
				slot2 = sp.SkeletonAnimation.create(slot3, sp.SkeletonAnimation, slot0)
				slot8 = false

				slot2.setAnimation(sp.SkeletonAnimation, slot2, 0, "animation")

				slot5 = slot2
				slot12 = 1.5
				slot9 = cc.DelayTime.create(slot10, cc.DelayTime)

				slot2.runAction(sp.SkeletonAnimation, cc.Sequence.create("animation", cc.Sequence, cc.RemoveSelf.create(cc.DelayTime)))

				slot5 = slot2

				slot2.setPosition(sp.SkeletonAnimation, cc.p("animation", 230 + slot0))

				slot6 = slot2

				slot1.addChild(sp.SkeletonAnimation, slot1)

				slot8 = {}
				slot4 = TreeFunc.createSpriteNumber(slot1, slot2, Tree.root .. "battle/slwh_battle_%s.png")
				slot7 = slot4
				slot11 = 0.5

				slot4.setAnchorPoint(slot2, cc.p(44, 0.5))

				slot7 = slot4
				slot11 = 76

				slot4.setPosition(slot2, cc.p(44, 300 + slot0))

				slot8 = 0.7

				slot4.setScale(slot2, slot4)

				slot8 = slot4

				slot1.addChild(slot2, slot1)

				slot7 = slot4
				slot18 = 255
				slot14 = cc.FadeTo.create(slot15, cc.FadeTo, 0.3)
				slot18 = 0.4
				slot22 = 12
				slot19 = 0
				slot15 = cc.FadeTo.create(cc.FadeTo, cc.FadeTo, 0.3)
				slot19 = 0.3
				slot23 = 9
				slot12 = cc.Spawn.create(cc.Spawn, cc.Spawn, cc.MoveBy.create(cc.FadeTo, cc.MoveBy, cc.p(0, 0)))
				slot15 = cc.RemoveSelf

				slot4.runAction(slot2, cc.Sequence.create(44, cc.Sequence, cc.Spawn.create(cc.RemoveSelf, cc.Spawn, cc.MoveBy.create(cc.FadeTo, cc.MoveBy, cc.p(slot20, 0))), cc.RemoveSelf.create(cc.Spawn)))

				slot8 = "res/gameres/module/slwh/battle/slwh_battle_plus.png"
				slot5 = cc.Sprite.create(slot2, cc.Sprite)
				slot8 = slot5
				slot12 = 0.5

				slot5.setAnchorPoint(cc.Sprite, cc.p(cc.Sequence, 1))

				slot8 = slot5
				slot12 = 0

				slot5.setPosition(cc.Sprite, cc.p(cc.Sequence, -5))

				slot9 = slot5

				slot4.addChild(cc.Sprite, slot4)
			end

			slot23 = cc.RemoveSelf

			slot0.__scoreNode.getChildren(slot0.__total)[1].runAction(slot8, cc.EaseSineIn.create(slot0.__scoreNode.getChildren(slot0.__total)[1].getPosition, cc.Sequence.create(slot17, cc.Sequence, cc.Spawn.create(cc.CallFunc.create(cc.Spawn, cc.CallFunc), cc.Spawn, cc.FadeTo.create(cc.MoveTo, cc.FadeTo, 0.3)), cc.RemoveSelf.create(cc.CallFunc))))

			slot13 = "res/gameres/module/slwh/particle/slwh_jsfenlizi.plist"
			slot10 = cc.ParticleSystemQuad.create(slot8, cc.ParticleSystemQuad)
			slot14 = slot0.getParent(slot8).convertToNodeSpace(slot8, slot0.getParent(slot8))

			slot10.setPosition(cc.ParticleSystemQuad, slot10)

			slot14 = 999998

			slot10.setLocalZOrder(cc.ParticleSystemQuad, slot10)

			slot14 = slot10

			slot7.addChild(cc.ParticleSystemQuad, slot7)

			slot13 = slot10
			slot16 = cc.EaseSineIn
			slot23 = 0.3
			slot27 = 44
			slot20 = cc.MoveTo.create(cc.RemoveSelf.create, cc.MoveTo, cc.p(cc.FadeTo, 250 + ((cc.Director.getInstance(slot2).getVisibleSize(slot2).width > 1334 and 0) or 66)))

			function slot24()
				slot3 = true

				slot0.setAutoRemoveOnFinish(slot1, slot0)

				slot3 = 0

				slot0.setAutoRemoveOnFinish.setDuration(slot1, slot0.setAutoRemoveOnFinish)
			end

			slot10.runAction(cc.ParticleSystemQuad, cc.EaseSineIn.create(cc.EaseSineIn, cc.Sequence.create(cc.Sequence, cc.Sequence, cc.CallFunc.create(cc.MoveTo, cc.CallFunc))))

			slot0.__scoreNode = nil
		end
	end
end

SlwhRewardCcsView.onDestroy = function (slot0)
	slot3 = slot0
	slot4 = slot0._touchListener

	slot0.getEventDispatcher(slot2).removeEventListener(slot2, slot0.getEventDispatcher(slot2))

	slot3 = slot0._touchListener

	slot0._touchListener.release(slot2)
end

return
