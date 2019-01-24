slot2 = "SceneSwitcherFade"
SceneSwitcherFade = class(slot1)

SceneSwitcherFade.ctor = function (slot0)
	slot0._loadingTouchGroup = nil
	slot0._loadingLayer = nil
	slot0._loadingBg = nil
	slot0._bgWidth = 4000
	slot0._bgHeight = 4000
	slot0._fadeInTimeS = 0.2
	slot0._fadeOutTimeS = 0.2
	slot0._hoverTimeS = 0.1
end

SceneSwitcherFade.initView = function (slot0)
	if not slot0._loadingLayer then
		slot3 = cc.Node
		slot0._loadingTouchGroup = cc.Node.create(slot2)
		slot3 = slot0._loadingTouchGroup

		slot0._loadingTouchGroup.retain(slot2)

		slot3 = ccui.Layout
		slot0._loadingLayer = ccui.Layout.create(slot2)
		slot3 = slot0._loadingLayer
		slot7 = CONFIG_SCREEN_HEIGHT

		slot0._loadingLayer.setContentSize(slot2, cc.size(slot5, CONFIG_SCREEN_WIDTH))
		slot0._loadingLayer.setTouchEnabled(slot2, slot0._loadingLayer)

		slot5 = "banner/4.png"
		slot0._loadingBg = display.newSprite(ResConfig.getUICommonPath(true))
		slot5 = slot0._bgHeight

		DisplayUtil.scale2(slot2, slot0._loadingBg, slot0._bgWidth)

		slot5 = CONFIG_SCREEN_HEIGHT * 0.5

		slot0._loadingBg.setPosition(slot2, slot0._loadingBg, CONFIG_SCREEN_WIDTH * 0.5)

		slot4 = slot0._loadingBg

		slot0._loadingLayer.addChild(slot2, slot0._loadingLayer)

		slot4 = slot0._loadingLayer

		slot0._loadingTouchGroup.addChild(slot2, slot0._loadingTouchGroup)
	end
end

SceneSwitcherFade.switchTo = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot7 = slot7 or 0.1
	slot8 = slot8 or 0

	function slot9()
		if slot0._loadingTouchGroup then
			slot2 = slot0._loadingTouchGroup

			slot0._loadingTouchGroup.removeFromParent(slot1)

			slot2 = slot0._loadingTouchGroup.removeFromParent._loadingTouchGroup

			slot0._loadingTouchGroup.removeFromParent._loadingTouchGroup.release(slot1)

			slot0._loadingTouchGroup.removeFromParent._loadingTouchGroup.release._loadingTouchGroup = nil
			slot0._loadingTouchGroup.removeFromParent._loadingTouchGroup.release._loadingLayer = nil
			slot0._loadingTouchGroup.removeFromParent._loadingTouchGroup.release._loadingBg = nil
		end

		if slot1 then
			slot1()
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

		slot16 = ZORDER_SCENE_SWITCHER

		uiMgr.showView(slot13, uiMgr, slot0._loadingTouchGroup)

		slot15 = false

		DisplayUtil.setVisible(slot13, slot0._loadingBg)

		slot16 = {
			autoAlpha = 1,
			onComplete = function ()
				slot2 = slot1

				slot0(slot1)

				slot4 = ZORDER_SCENE_SWITCHER

				uiMgr.showView(slot1, uiMgr, slot2._loadingTouchGroup)
				TweenLite.to(slot1, uiMgr._loadingBg, slot2._fadeOutTimeS)
			end,
			delay = slot7
		}

		TweenLite.to(slot13, slot0._loadingBg, slot0._fadeInTimeS)
	else
		slot13 = slot6

		slot10(slot12)
		slot9()
	end
end

return
