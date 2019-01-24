slot2 = "BaseGameLoadingCcsView"
BaseGameLoadingCcsView = class(slot1)

BaseGameLoadingCcsView.onCreationComplete = function (slot0, slot1, slot2)
	if slot1 then
		slot0._loadingView = slot2
	else
		slot0._loadingView = slot0
	end

	slot0._spineLogo = nil
	slot0._iconLogo = nil

	if slot0._loadingView then
		slot0._iconLogo = slot0._loadingView.icon
		slot5 = slot0._loadingView.loadingBar
		slot0._loadingBarSize = slot0._loadingView.loadingBar.getContentSize(slot4)
		slot5 = slot0._loadingView.loadingBar
		slot0._loadingBarPosX = slot0._loadingView.loadingBar.getPositionX(slot4)

		if slot0._loadingView.point then
			slot6 = slot0._loadingView.loadingBar
			slot0._pointFirstPos = slot0._loadingView.point.getPositionX(slot4) - slot0._loadingView.loadingBar.getPositionX(slot0._loadingView.point)
		end

		if slot1 then
			slot7 = slot0

			slot0.model.isShowingLoadingChangedSignal.add(slot4, slot0.model.isShowingLoadingChangedSignal, slot0.onLoadingShowChanged)

			slot5 = slot0

			slot0.onLoadingShowChanged(slot4)
		end

		slot7 = slot0

		slot0.model.loadingPercentChangedSignal.add(slot4, slot0.model.loadingPercentChangedSignal, slot0.onLoadingPercentChanged)

		slot5 = slot0

		slot0.onLoadingPercentChanged(slot4)

		slot7 = slot0

		slot0.model.bBattleChangedSignal.add(slot4, slot0.model.bBattleChangedSignal, slot0.onEnterBattle)
	end

	if slot0._iconLogo then
		slot5 = slot0._iconLogo
		slot0._iconInitY = slot0._iconLogo.getPositionY(slot4)
		slot0._iconHideY = slot0._iconInitY
		slot6 = slot0._iconHideY

		slot0._iconLogo.setPositionY(slot4, slot0._iconLogo)
	end
end

BaseGameLoadingCcsView._onTabChangedShow = function (slot0, slot1)
	slot6 = true

	DisplayUtil.setAddOrRemoveChild(slot3, slot0, slot1)

	slot4 = slot0

	slot0.checkLoadingTxt(slot3)
end

BaseGameLoadingCcsView._onTabChangedHide = function (slot0, slot1, slot2)
	slot0._try2Put2PoolFuc = slot2
end

BaseGameLoadingCcsView.setLoadingViewShowing = function (slot0, slot1, slot2)
	slot5 = slot0._loadingView

	TweenLite.killTweensOf(slot4)

	if slot0._loadingView.layerSpine then
		slot5 = slot0._loadingView.layerSpine

		TweenLite.killTweensOf(slot4)

		if slot1 then
			slot6 = true

			DisplayUtil.setVisible(slot4, slot0._loadingView.layerSpine)
		end
	end

	if slot1 then
		slot6 = true

		DisplayUtil.setVisible(slot4, slot0._loadingView)
	else
		slot7 = {
			autoAlpha = 0,
			onComplete = slot2
		}

		TweenLite.to(slot4, slot0._loadingView, 0.5)
	end

	slot6 = slot1

	slot0.setIconShowing(slot4, slot0)
end

BaseGameLoadingCcsView.setIconShowing = function (slot0, slot1)
	if slot0._iconLogo then
		slot4 = slot0._iconLogo

		TweenLite.killTweensOf(slot3)

		if slot1 then
			slot5 = true

			DisplayUtil.setVisible(slot3, slot0._iconLogo)
		else
			slot5 = false

			DisplayUtil.setVisible(slot3, slot0._iconLogo)
		end
	end
end

BaseGameLoadingCcsView.checkLoadingTxt = function (slot0)
	if slot0.txtInfo then
		slot1 = "正在加载游戏..."

		if LOADING_SENTENCES_ARR and not IS_IOS_VERIFY then
			slot5 = #LOADING_SENTENCES_ARR
			slot5 = LOADING_SENTENCES_ARR[math.random(slot4)] or slot1

			slot0.txtInfo.setString(slot3, slot0.txtInfo)
		end
	end
end

BaseGameLoadingCcsView.onHide = function (slot0)
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
	end

	slot0.setLoadingViewShowing(slot3, slot0, false)
end

BaseGameLoadingCcsView.onShow = function (slot0)
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

	if slot0._spinePoint then
		slot5 = true

		DisplayUtil.setAddOrRemoveChild(slot2, slot0._spinePoint, slot0._loadingView.point)
	end

	slot0._pointIndex = 0
end

BaseGameLoadingCcsView.createSpineLogo = function (slot0)
	if not slot0._spineLogo then
		slot4 = slot0.model.spineLogoKeyInLoading

		if StringUtil.isStringValid(slot3) then
			slot5 = slot1
			slot0._spineLogo = slot0.controller.createSpine(slot3, slot0.controller)
			slot4 = slot0._spineLogo

			slot0._spineLogo.retain(slot3)
		end
	end
end

BaseGameLoadingCcsView.createSpinePoint = function (slot0)
	if not slot0._spinePoint then
		slot4 = slot0.model.spinePointKeyInLoading

		if StringUtil.isStringValid(slot3) and slot0._loadingView.point then
			slot5 = slot1
			slot0._spinePoint = slot0.controller.createSpine(slot3, slot0.controller)
			slot4 = slot0._spinePoint

			slot0._spinePoint.retain(slot3)
		end
	end
end

BaseGameLoadingCcsView.onLoadingPercentChanged = function (slot0)
	if slot0._loadingView then
		slot3 = slot0.model
		slot2 = slot0._loadingBarSize.width * slot0.model.getLoadingPercent(slot2) / 100

		if slot0._loadingView.txtLoad then
			slot6 = slot0._loadingBarPosX + slot2

			slot0._loadingView.txtLoad.setPositionX(slot4, slot0._loadingView.txtLoad)

			slot5 = slot0._loadingView.txtLoad
			slot10 = slot1 * 100
			slot8 = math.ceil(slot9) .. "%"

			slot0._loadingView.txtLoad.setString(slot4, tostring(slot7))
		elseif slot0._loadingView.txtLoad_tf and slot0.model._loadingPlistName then
			slot7 = slot1 * 100
			slot5 = math.ceil(slot6)
			slot8 = {
				"%"
			}
			slot7 = HtmlUtil.createArtNumWithCustomFormat(slot4, slot5, slot0.model._loadingPlistName, nil)

			slot0._loadingView.txtLoad_tf.setHtmlText(slot5, slot0._loadingView.txtLoad_tf)

			slot10 = slot0._loadingView.txtLoad_tf
			slot7 = (slot0._loadingBarPosX + slot2) - slot0._loadingView.txtLoad_tf.getWidth(slot9) * 0.5

			slot0._loadingView.txtLoad_tf.setPositionX(slot5, slot0._loadingView.txtLoad_tf)
		end

		if slot0._spinePoint then
			if slot0._pointIndex < slot1 then
				slot7 = slot0._loadingBarPosX + slot2 + slot0._pointFirstPos

				slot0._loadingView.point.setPositionX(slot5, slot0._loadingView.point)

				slot0._pointIndex = slot0._pointIndex + 0.05
				slot9 = false

				slot0._spinePoint.setAnimation(slot5, slot0._spinePoint, 0, "animation")

				slot6 = slot0._loadingView.loadingBar
				slot10 = slot0._loadingBarSize.height

				slot0._loadingView.loadingBar.setContentSize(slot5, cc.size("animation", slot0._loadingBarSize.width * slot0._pointIndex))
			end
		elseif slot0._loadingView.loadingBar then
			slot5 = slot0._loadingView.loadingBar
			slot9 = slot0._loadingBarSize.height

			slot0._loadingView.loadingBar.setContentSize(slot4, cc.size(slot7, slot2))
		end
	end
end

BaseGameLoadingCcsView.onLoadingShowChanged = function (slot0)
	if slot0._loadingView then
		slot3 = slot0.model
		slot1 = slot0.model.getIsShowingLoading(slot2)

		if slot0._loadingView.setShowing then
			slot5 = slot1

			slot0._loadingView.setShowing(slot3, slot0._loadingView)
		else
			slot5 = slot1

			slot0.setLoadingViewShowing(slot3, slot0)
		end
	end
end

BaseGameLoadingCcsView.onEnterBattle = function (slot0)
	slot3 = slot0.model

	if slot0.model.getBBattle(slot2) == true then
		slot4 = 0

		slot0.model.setLoadingPercent(slot2, slot0.model)
	else
		slot3 = slot0.model

		if slot0.model.getBBattle(slot2) == false then
			slot4 = 100

			slot0.model.setLoadingPercent(slot2, slot0.model)

			slot6 = 500

			tickMgr.delayedCall(slot0.model, tickMgr, function (slot0)
				slot4 = false

				slot0.model.setIsShowingBattleLoading(slot2, slot0.model)
			end)
		end
	end
end

BaseGameLoadingCcsView.destroy = function (slot0)
	slot5 = slot0

	slot0.model.isShowingLoadingChangedSignal.remove(slot2, slot0.model.isShowingLoadingChangedSignal, slot0.onLoadingShowChanged)

	slot5 = slot0

	slot0.model.loadingPercentChangedSignal.remove(slot2, slot0.model.loadingPercentChangedSignal, slot0.onLoadingPercentChanged)

	slot5 = slot0

	slot0.model.bBattleChangedSignal.remove(slot2, slot0.model.bBattleChangedSignal, slot0.onEnterBattle)

	if slot0._spineLogo then
		slot3 = slot0._spineLogo

		slot0._spineLogo.clearTracks(slot2)

		slot4 = slot0._spineLogo

		spPoolMgr.put(slot2, spPoolMgr)

		slot0._spineLogo = nil
	end

	if slot0._spinePoint then
		slot3 = slot0._spinePoint

		slot0._spinePoint.clearTracks(slot2)

		slot4 = slot0._spinePoint

		spPoolMgr.put(slot2, spPoolMgr)

		slot0._spinePoint = nil
	end

	if slot0._loadingView and slot0._loadingView ~= slot0 and slot0._loadingView.destroy then
		slot3 = slot0._loadingView

		slot0._loadingView.destroy(slot2)
	end

	slot0._loadingView = nil
end

return
