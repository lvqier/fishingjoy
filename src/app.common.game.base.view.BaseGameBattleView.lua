slot2 = "BaseGameBattleView"
BaseGameBattleView = class(slot1)

BaseGameBattleView.ctor = function (slot0, slot1, slot2)
	if not slot2 and slot0.btnMenu then
		slot8 = 80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnMenu, UIConfig.ALIGN_LEFT_UP)
	end

	if not slot2 and slot0.btnMenu1 then
		slot8 = 80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnMenu1, UIConfig.ALIGN_LEFT_UP)
	end

	if not slot2 and slot0.btnMenu2 then
		slot8 = 80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnMenu2, UIConfig.ALIGN_LEFT_UP)
	end

	if not slot1 and slot0.btnChat then
		slot8 = 80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnChat, UIConfig.ALIGN_LEFT_UP)
	end

	if slot0.btnAuto then
		slot8 = -80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnAuto, UIConfig.ALIGN_RIGHT)
	end

	if slot0.btnDisableAuto then
		slot8 = -80

		slot0.controller.adjustSlimWidth(slot4, slot0.controller, slot0.btnDisableAuto, UIConfig.ALIGN_RIGHT)
	end
end

BaseGameBattleView.destroy = function (slot0)
	return
end

return
