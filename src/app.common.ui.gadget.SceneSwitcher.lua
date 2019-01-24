slot2 = "SceneSwitcher"
SceneSwitcher = class(slot1)

SceneSwitcher.ctor = function (slot0)
	slot0._loadingTouchGroup = nil
	slot0._loadingLayer = nil
	slot0._loadingBg = nil
	slot0._bgWidth = 1400
	slot0._bgHeight = 730
	slot0._fadeInTimeS = 0.3
	slot0._fadeOutTimeS = 0.3
	slot0._hoverTimeS = 0.1
end

SceneSwitcher.initView = function (slot0)
	if not slot0._loadingLayer then
		slot3 = cc.Node
		slot0._loadingTouchGroup = cc.Node.create(slot2)
		slot3 = slot0._loadingTouchGroup

		slot0._loadingTouchGroup.retain(slot2)

		slot3 = ccui.Layout
		slot0._loadingLayer = ccui.Layout.create(slot2)
		slot3 = slot0._loadingLayer
		slot7 = CUR_SELECTED_HEIGHT

		slot0._loadingLayer.setContentSize(slot2, cc.size(slot5, CUR_SELECTED_WIDTH))

		slot4 = true

		slot0._loadingLayer.setTouchEnabled(slot2, slot0._loadingLayer)

		slot3 = ccui.ImageView
		slot6 = "banner/4.png"
		slot0._loadingBg = ccui.ImageView.create(slot2, ResConfig.getUICommonPath(slot5))
		slot4 = false

		slot0._loadingBg.ignoreContentAdaptWithSize(slot2, slot0._loadingBg)

		slot3 = slot0._loadingBg
		slot7 = slot0._bgHeight

		slot0._loadingBg.setContentSize(slot2, cc.size(slot5, slot0._bgWidth))

		slot5 = slot0._bgHeight * 0.5

		slot0._loadingBg.setPosition(slot2, slot0._loadingBg, slot0._bgWidth * 0.5)

		slot4 = slot0._loadingBg

		slot0._loadingLayer.addChild(slot2, slot0._loadingLayer)

		slot4 = slot0._loadingLayer

		slot0._loadingTouchGroup.addChild(slot2, slot0._loadingTouchGroup)
	end
end

SceneSwitcher.switchTo = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot7 = slot7 or 0.2
	slot8 = slot8 or 0

	function slot9()
		if slot0 then
			slot0()
		end

		if slot1._loadingTouchGroup then
			slot2 = slot1._loadingTouchGroup

			slot1._loadingTouchGroup.removeFromParent(slot1)

			slot2 = slot1._loadingTouchGroup

			slot1._loadingTouchGroup.release(slot1)

			slot1._loadingTouchGroup = nil
			nil._loadingLayer = nil
			nil._loadingBg = nil
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

		slot16 = display.height * 0.5

		slot0._loadingBg.setPosition(slot13, slot0._loadingBg, CUR_SELECTED_WIDTH + slot0._bgWidth * 0.5)

		slot15 = {
			time = slot0._fadeOutTimeS,
			x = CUR_SELECTED_WIDTH * 0.5,
			onComplete = function ()
				slot2 = slot1

				slot0(slot1)

				slot4 = ZORDER_SCENE_SWITCHER

				uiMgr.showView(slot1, uiMgr, slot2._loadingTouchGroup)
				transition.moveTo(slot1, uiMgr._loadingBg)
			end,
			delay = slot7
		}

		transition.moveTo(slot13, slot0._loadingBg)
	else
		slot13 = slot6

		slot10(slot12)
		slot9()
	end
end

return
