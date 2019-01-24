slot0 = class(slot1)

function FishingJoyRequireLua(slot0)
	slot3 = "fishingjoy." .. slot0

	return requireLuaFromModule(slot2)
end

slot3 = "config.init"

FishingJoyRequireLua("FishingJoyModule")

slot3 = "mainLogic.FishingJoyGameMgr"
slot3 = FishingJoyRequireLua("FishingJoyModule")
slot1 = FishingJoyRequireLua("FishingJoyModule").getInstance("FishingJoyModule")

slot0.ctor = function (slot0)
	slot5 = true

	ClassUtil.extends(slot2, slot0, BaseGameModule)

	slot3 = slot0
	slot0.model = slot0.getGameModel(slot2)
	slot3 = slot0
	slot0.controller = slot0.getGameController(slot2)
	slot3 = slot0
	slot0.view = slot0.getGameView(slot2)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot13 = slot5

	BaseGameModule.show(slot7, slot0, slot1, slot2, slot3, slot4)
end

ProxyFishingJoy = slot0.new()

return ProxyFishingJoy
