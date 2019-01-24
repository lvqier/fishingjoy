slot2 = "BaseGameModule"
BaseGameModule = class(slot1)

BaseGameModule.ctor = function (slot0)
	slot6 = slot0

	eventMgr.add(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)
end

BaseGameModule.onHideAll2Reglogin = function (slot0)
	slot3 = slot0

	if slot0.isShowing(slot2) then
		slot3 = slot0

		slot0.hide(slot2)
	end
end

BaseGameModule.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot9 = slot0

	slot0.model.setGameProxy(slot7, slot0.model)

	slot8 = slot0

	if slot0.isShowing(slot7) then
		return
	end

	slot8 = slot0.model
	slot0.view.__hideAllViewCaller = slot0
	slot11 = slot0.controller

	slot0.controller.resetLoadingPercent(slot10)

	slot12 = nil

	slot0.model.setCurShowingViewType(slot10, slot0.model)

	slot19 = slot4

	slot0.view.show(slot10, slot0.view, function ()
		slot3 = slot1

		slot0.controller.processAssets(slot1, slot0.controller)

		slot2 = slot0.controller

		applyFunction(slot1)
	end, nil, nil, true, nil, function ()
		if slot0 then
			slot2 = slot1.model
			slot5 = gameMgr

			slot1.model.setRoomKind(slot1, gameMgr.getCurRoomKind(slot4))
		elseif IS_GUAN_VERIFY then
			slot3 = slot1.model

			if GUAN_IGNORE_GAMEKINDS[slot1.model.getGameKind(slot2)] then
				slot3 = true

				slot1.model.setIsShowingLoading(slot1, slot1.model)
			else
				slot2 = slot1.model
				slot5 = gameMgr

				slot1.model.setRoomKind(slot1, gameMgr.getCurRoomKind(slot4))
			end
		end

		function slot0()
			slot2 = slot0.controller

			slot0.controller.checkGameOrientation(slot1)

			slot2 = slot0.controller.checkGameOrientation.view

			slot0.controller.checkGameOrientation.view.locatePosition(slot1)
		end

		if isAndroid then
			slot5 = 100

			tickMgr.delayedCall(slot2, tickMgr, slot0)
		else
			slot0()
		end

		slot3 = slot2

		applyFunction(slot2)
	end, slot3)

	if not slot0.model.getIsUseCommonHall(slot7) and not slot5 then
		slot11 = slot0.controller

		slot0.controller.registerListeners(slot10)
	end
end

BaseGameModule.hide = function (slot0, slot1, slot2)
	slot5 = slot0

	if slot0.isShowing(slot4) then
		slot7 = false

		uiMgr.addOrRemoveShowingModule(slot4, uiMgr, slot0)
		slot0.controller.canceledListeners(slot4)

		slot7 = false

		slot0.model.setIsShowingMenu(slot0.controller, slot0.model)

		slot9 = slot2

		slot0.view.hide(slot0.controller, slot0.view, slot1, function ()
			slot2 = slot0.controller

			slot0.controller.recoverGameOrientation(slot1)

			slot3 = nil

			slot0.controller.recoverGameOrientation.model.setCurShowingViewType(slot1, slot0.controller.recoverGameOrientation.model)
		end)
	end
end

BaseGameModule.isShowing = function (slot0)
	if slot0.view ~= nil then
		slot3 = slot0.view
		slot1 = slot0.view.isShowing(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	return slot1
end

BaseGameModule.destroy = function (slot0)
	slot5 = false

	uiMgr.addOrRemoveShowingModule(slot2, uiMgr, slot0)

	slot6 = slot0

	eventMgr.remove(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

	if slot0.view then
		if slot0.view then
			slot3 = slot0.view

			slot0.view.destroy(slot2)

			slot0.view = nil
		end

		if slot0.controller then
			slot3 = slot0.controller

			slot0.controller.destroy(slot2)

			slot0.controller = nil
		end

		if slot0.model then
			slot3 = slot0.model

			slot0.model.destroy(slot2)

			slot0.model = nil
		end

		return true
	end

	return false
end

return
