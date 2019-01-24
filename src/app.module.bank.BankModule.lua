slot2 = "BankModule"
slot0 = class(slot1)
slot1 = false
slot4 = "bank.model.BankModel"

requireLuaFromModule(slot3)

slot4 = "bank.controller.BankController"

requireLuaFromModule(slot3)

slot4 = "bank.view.BankView"

requireLuaFromModule(slot3)

slot0.ctor = function (slot0)
	slot0.moduleIndex = 105
	slot0._viewTweenType = 68
	slot0._viewItemList = {
		86,
		99,
		35,
		97
	}
end

slot0.initMvc = function (slot0)
	if not slot0.view then
		if (IS_IOS_VERIFY and not slot0) or IS_YYB_VERIFY or IS_SDK_VERIFY then
			slot3 = "bank"

			if #getCSVField(slot2) >= 4 then
				slot5 = 3

				table.remove(slot3, slot1)

				slot5 = 2

				table.remove(slot3, slot1)

				slot4 = slot1

				for slot5, slot6 in ipairs(slot3) do
					slot6.index = slot5
				end

				slot0 = true
			end
		end

		slot0.model = BankModel.new()
		slot3 = slot0.model
		slot0.controller = BankController.new(slot2)
		slot4 = slot0.controller
		slot0.view = BankView.new(slot2, slot0.model)
	end
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4)
	slot7 = slot0

	slot0.initMvc(slot6)

	slot7 = mainMgr

	mainMgr.requestUserInfo(slot6)

	slot7 = mainMgr

	mainMgr.requestModuleState(slot6)

	slot15 = slot4

	slot0.view.show(slot6, slot0.view, slot1, nil, nil, true, nil, slot2, slot3)
end

slot0.hide = function (slot0, slot1, ...)
	function slot6()
		slot2 = mainMgr

		if mainMgr.getIsBankExitRoateScreen(slot1) then
			slot3 = true

			uiMgr.setIsScreenOrientationRotated(slot1, uiMgr)

			slot3 = false

			mainMgr.setIsBankExitRoateScreen(slot1, mainMgr)
		end

		slot2 = applyFunction

		applyFunction(slot1)
	end

	slot0.view.hide(slot4, slot0.view, ...)
end

slot0.isShowing = function (slot0)
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

slot0.destroy = function (slot0)
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

Bbcgaxx = {
	"9ySD"
}

if 1 ~= 4 and slot2 ~= 5 and slot2 ~= 6 and slot2 ~= 7 then
end

ProxyBank = slot0.new()

return ProxyBank
