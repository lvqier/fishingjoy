slot2 = "SceneSwitcherLoading"
SceneSwitcherLoading = class(slot1)

SceneSwitcherLoading.ctor = function (slot0)
	return
end

SceneSwitcherLoading.switchTo = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot7 = 0
	slot8 = slot8 or 0

	function slot9()
		if slot0 then
			slot0()
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
		slot14 = "LoadingModule"

		requireModule(slot13)

		slot15 = slot9

		ProxyLoading.show(slot13, ProxyLoading)

		function slot17()
			slot2 = slot1

			slot0(slot1)
		end

		ProxyLoading.updatePercent(slot13, ProxyLoading, 0.5, 0.5)
	else
		slot13 = slot6

		slot10(slot12)
		slot9()
	end
end

return
