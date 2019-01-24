slot2 = "BaseUIModule"
BaseUIModule = class(slot1)

BaseUIModule.ctor = function (slot0, slot1, slot2, slot3)
	slot0._modelClass = slot1
	slot0._viewClass = slot2
	slot0._controllerClass = slot3
	slot0._isShowingModule = nil
	slot0.model = nil
	slot0.controller = nil
	slot0.view = nil
end

BaseUIModule.onHideAll2Reglogin = function (slot0)
	slot3 = slot0

	if slot0.isShowing(slot2) then
		slot4 = false

		slot0.hide(slot2, slot0)
	end
end

BaseUIModule.initMvc = function (slot0)
	if not slot0.model then
		slot0.model = slot0._modelClass.new()
		slot3 = slot0.model
		slot0.controller = slot0._controllerClass.new(slot2)
		slot4 = slot0.controller
		slot0.view = slot0._viewClass.new(slot2, slot0.model)
		slot0.view.__hideAllViewCaller = slot0
		slot6 = slot0

		eventMgr.add(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)
	end
end

BaseUIModule.show = function (slot0, slot1, slot2)
	slot5 = slot0

	slot0.initMvc(slot4)

	slot7 = slot2

	slot0.view.show(slot4, slot0.view, slot1)
end

BaseUIModule.isShowing = function (slot0)
	if slot0._isShowingModule ~= nil then
		return slot0._isShowingModule
	else
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
end

BaseUIModule.hide = function (slot0, slot1, slot2)
	slot7 = false

	uiMgr.addOrRemoveShowingModule(slot4, uiMgr, slot0)

	if slot0.view then
		slot5 = slot0.view

		slot0.view.hideAllPopUp(slot4)

		slot7 = slot2

		slot0.view.hide(slot4, slot0.view, slot1)
	end
end

BaseUIModule.canDestroyByGc = function (slot0)
	return true
end

BaseUIModule.destroy = function (slot0)
	if slot0.view then
		slot0._isShowingModule = nil
		slot6 = slot0

		eventMgr.remove(slot2, eventMgr, GameEvent.HideAll2Reglogin, slot0.onHideAll2Reglogin)

		slot3 = slot0.view

		slot0.view.destroy(slot2)

		slot3 = slot0.controller

		slot0.controller.destroy(slot2)

		slot3 = slot0.model

		slot0.model.destroy(slot2)

		slot0.model = nil
		slot0.controller = nil
		slot0.view = nil

		return true
	end

	return false
end

return
