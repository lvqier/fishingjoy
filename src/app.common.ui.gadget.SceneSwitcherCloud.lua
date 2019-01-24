slot2 = "SceneSwitcherCloud"
SceneSwitcherCloud = class(slot1)

SceneSwitcherCloud.ctor = function (slot0)
	slot0._leftCloud = nil
	slot0._rightCloud = nil
	slot0._leftInitX = 0
	slot0._rightInitX = 0
	slot0._bgWidth = 1400
	slot0._bgHeight = 730
	slot0._fadeInTimeS = 0.3
	slot0._fadeOutTimeS = 0.3
	slot0._hoverTimeS = 1
end

SceneSwitcherCloud.initView = function (slot0)
	if not slot0._loadingLayer then
		slot6 = "main_cloud.plist"

		resMgr.loadTextureAtlas(slot2, resMgr, ResConfig.getSpriteSheetPath(slot5))

		slot3 = cc.Node
		slot0._loadingParentGroup = cc.Node.create(slot2)
		slot3 = slot0._loadingParentGroup

		slot0._loadingParentGroup.retain(slot2)

		slot3 = ccui.Layout
		slot0._loadingLayer = ccui.Layout.create(slot2)
		slot3 = slot0._loadingLayer
		slot7 = CONFIG_DESIGN_HEIGHT

		slot0._loadingLayer.setContentSize(slot2, cc.size(true, CONFIG_DESIGN_WIDTH))

		slot4 = true

		slot0._loadingLayer.setTouchEnabled(slot2, slot0._loadingLayer)
		slot0._loadingLayer.setPosition(slot2, slot0._loadingLayer, (display.width - CONFIG_DESIGN_WIDTH) * 0.5)

		slot3 = "#main_cloud_left.png"
		slot0._leftCloud = display.newSprite(slot2)
		slot3 = slot0._leftCloud
		slot7 = 0.5

		slot0._leftCloud.setAnchorPoint(slot2, cc.p((display.height - CONFIG_DESIGN_HEIGHT) * 0.5, 0))

		slot4 = 1

		slot0._leftCloud.setLocalZOrder(slot2, slot0._leftCloud)

		slot4 = 2

		slot0._leftCloud.setScale(slot2, slot0._leftCloud)

		slot3 = slot0._leftCloud
		slot0._leftInitX = -slot0._leftCloud.getContentSize(slot2).width * 2

		slot0._leftCloud.setPosition(slot2, slot0._leftCloud, slot0._leftInitX)

		slot4 = slot0._leftCloud

		slot0._loadingLayer.addChild(slot2, slot0._loadingLayer)

		slot3 = "#main_cloud_right.png"
		slot0._rightCloud = display.newSprite(slot2)
		slot3 = slot0._rightCloud
		slot7 = 0.5

		slot0._rightCloud.setAnchorPoint(slot2, cc.p(CONFIG_DESIGN_HEIGHT * 0.5, 1))

		slot4 = 2

		slot0._rightCloud.setScale(slot2, slot0._rightCloud)

		slot4 = slot0._rightCloud
		slot0._rightInitX = CONFIG_DESIGN_WIDTH + slot0._rightCloud.getContentSize(slot0._rightCloud).width * 2
		slot5 = CONFIG_DESIGN_HEIGHT * 0.5

		slot0._rightCloud.setPosition(slot0._rightCloud.getContentSize(slot0._rightCloud).width * 2, slot0._rightCloud, slot0._rightInitX)

		slot4 = slot0._rightCloud

		slot0._loadingLayer.addChild(slot0._rightCloud.getContentSize(slot0._rightCloud).width * 2, slot0._loadingLayer)

		slot4 = slot0._loadingLayer

		slot0._loadingParentGroup.addChild(slot0._rightCloud.getContentSize(slot0._rightCloud).width * 2, slot0._loadingParentGroup)
	end
end

SceneSwitcherCloud.switchTo = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot7 = 0
	slot8 = slot8 or 0

	function slot9()
		if slot0 then
			slot0()
		end

		if slot1._loadingParentGroup then
			slot2 = slot1._loadingParentGroup

			slot1._loadingParentGroup.removeFromParent(slot1)

			slot2 = slot1._loadingParentGroup

			slot1._loadingParentGroup.release(slot1)

			slot1._loadingParentGroup = nil
			nil._loadingLayer = nil
			slot2 = resMgr
			slot5 = "main_cloud.plist"

			resMgr.unloadTextureAtlas(nil, ResConfig.getSpriteSheetPath(slot4))
		end
	end

	function slot10(slot0)
		slot3 = slot0

		display.runScene(slot2)

		slot4 = uiMgr.setCurUiLayer

		uiMgr.setCurUiLayer(slot2, uiMgr)

		slot4 = GameEvent.OnSceneChanged

		eventMgr.dispatch(slot2, eventMgr)

		slot3 = slot0

		applyFunction(slot2)
	end

	if slot1 then
		slot14 = slot0

		slot0.initView(slot13)

		slot15 = 50

		slot0._leftCloud.setOpacity(slot13, slot0._leftCloud)

		slot15 = 50

		slot0._rightCloud.setOpacity(slot13, slot0._rightCloud)

		slot16 = ZORDER_SCENE_SWITCHER

		uiMgr.showView(slot13, uiMgr, slot0._loadingParentGroup)

		slot16 = {
			opacity = 255,
			x = 0,
			delay = slot7
		}

		TweenLite.to(slot13, slot0._leftCloud, slot0._fadeOutTimeS)

		slot16 = {
			opacity = 255,
			x = CONFIG_DESIGN_WIDTH,
			onComplete = function ()
				slot2 = slot1

				slot0(slot1)

				slot4 = ZORDER_SCENE_SWITCHER

				uiMgr.showView(slot1, uiMgr, slot2._loadingParentGroup)

				slot4 = {
					opacity = 50,
					x = slot2._leftInitX,
					delay = slot2._hoverTimeS + slot2._fadeOutTimeS
				}

				TweenLite.to(slot1, uiMgr._leftCloud, slot2._fadeOutTimeS)
				TweenLite.to(slot1, uiMgr._leftCloud._rightCloud, slot2._fadeOutTimeS)
			end,
			delay = slot7
		}

		TweenLite.to(slot13, slot0._rightCloud, slot0._fadeOutTimeS)
	else
		slot13 = slot6

		slot10(slot12)
		slot9()
	end
end

return
