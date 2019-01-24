slot2 = "SlwhLoadingCcsView"
SlwhLoadingCcsView = class(slot1)

SlwhLoadingCcsView.onCreationComplete = function (slot0)
	slot4 = BaseGameLoadingCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)
end

SlwhLoadingCcsView.createSpineLogo = function (slot0)
	if not slot0._spineLogo then
		slot4 = slot0.model.spineLogoKeyInLoading

		if StringUtil.isStringValid(slot3) then
			slot5 = slot1
			slot0._spineLogo = slot0.controller.createSpine(slot3, slot0.controller)
			slot4 = slot0._spineLogo

			slot0._spineLogo.retain(slot3)
		end
	end

	if not slot0._spineLogo_2 then
		slot4 = slot0.model.spineLogoKeyInLoading2

		if StringUtil.isStringValid(slot3) then
			slot5 = slot1
			slot0._spineLogo2 = slot0.controller.createSpine(slot3, slot0.controller)
			slot4 = slot0._spineLogo2

			slot0._spineLogo2.retain(slot3)
		end
	end
end

SlwhLoadingCcsView.onShow = function (slot0)
	if slot0._bBattle == true then
		return
	end

	slot4 = true

	slot0.setLoadingViewShowing(slot2, slot0)

	slot3 = slot0

	slot0.createSpineLogo(slot2)

	slot3 = slot0

	slot0.createSpinePoint(slot2)

	if slot0._spineLogo then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._spineLogo, slot0._loadingView.layerSpine)

		slot6 = false

		slot0._spineLogo.setAnimation(slot2, slot0._spineLogo, 0, "start")

		slot6 = true

		slot0._spineLogo.addAnimation(slot2, slot0._spineLogo, 0, "idle")
	end

	if slot0._spineLogo2 then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._spineLogo2, slot0._loadingView.layerSpine)

		slot6 = false

		slot0._spineLogo2.setAnimation(slot2, slot0._spineLogo2, 0, "start")

		slot6 = true

		slot0._spineLogo2.addAnimation(slot2, slot0._spineLogo2, 0, "idle")
	end

	if slot0._spinePoint then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._spinePoint, slot0._loadingView.point)
	end

	slot0._pointIndex = 0
end

SlwhLoadingCcsView.onHide = function (slot0)
	function slot6()
		slot2 = slot0._try2Put2PoolFuc

		applyFunction(slot1)

		applyFunction._try2Put2PoolFuc = nil

		if applyFunction._spineLogo then
			slot2 = slot0._spineLogo

			slot0._spineLogo.clearTracks(slot1)

			slot3 = slot0._spineLogo

			spPoolMgr.put(slot1, spPoolMgr)

			slot2 = spPoolMgr.put._spineLogo

			spPoolMgr.put._spineLogo.removeFromParent(slot1)

			slot2 = spPoolMgr.put._spineLogo.removeFromParent._spineLogo

			spPoolMgr.put._spineLogo.removeFromParent._spineLogo.release(slot1)

			spPoolMgr.put._spineLogo.removeFromParent._spineLogo.release._spineLogo = nil
		end

		slot2 = slot0._try2Put2PoolFuc

		applyFunction(slot1)

		applyFunction._try2Put2PoolFuc = nil

		if applyFunction._spineLogo2 then
			slot2 = slot0._spineLogo2

			slot0._spineLogo2.clearTracks(slot1)

			slot3 = slot0._spineLogo

			spPoolMgr.put(slot1, spPoolMgr)

			slot2 = spPoolMgr.put._spineLogo2

			spPoolMgr.put._spineLogo2.removeFromParent(slot1)

			slot2 = spPoolMgr.put._spineLogo2.removeFromParent._spineLogo2

			spPoolMgr.put._spineLogo2.removeFromParent._spineLogo2.release(slot1)

			spPoolMgr.put._spineLogo2.removeFromParent._spineLogo2.release._spineLogo2 = nil
		end
	end

	slot0.setLoadingViewShowing(slot3, slot0, false)
end

SlwhLoadingCcsView.destroy = function (slot0)
	if slot0._spineLogo2 then
		slot3 = slot0._spineLogo2

		slot0._spineLogo2.clearTracks(slot2)

		slot4 = slot0._spineLogo2

		spPoolMgr.put(slot2, spPoolMgr)

		slot0._spineLogo2 = nil
	end

	slot3 = slot0

	BaseGameLoadingCcsView.destroy(slot2)
end

return
