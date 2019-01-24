slot2 = "FishingJoyGameMgr"
slot0 = class(slot1)
slot1 = nil

slot0.getInstance = function (slot0)
	if slot0 == nil then
		slot0 = slot1.new()
	end

	return slot0
end

slot0.ctor = function (slot0)
	slot3 = slot0

	slot0.initLazy(slot2)
end

slot0.initLazy = function (slot0)
	slot3 = "model.FishingJoyModel"

	FishingJoyRequireLua(slot2)

	slot3 = "controller.FishingJoyController"

	FishingJoyRequireLua(slot2)

	slot3 = "controller.FishingJoyControllerNet"

	FishingJoyRequireLua(slot2)

	slot3 = "controller.FishingJoyControllerMath"

	FishingJoyRequireLua(slot2)

	slot3 = "controller.FishingJoyControllerTimer"

	FishingJoyRequireLua(slot2)

	slot3 = "controller.FishingJoyControllerSound"

	FishingJoyRequireLua(slot2)
	FishingJoyRequireLua(slot2)

	slot4 = "view.ccs.FishingJoyRoomCcsView"
	ccs.FishingJoyRoomCcsView = FishingJoyRequireLua("view.FishingJoyView")
	slot4 = "view.ccs.FishingJoyRuleCcsView"
	ccs.FishingJoyRuleCcsView = FishingJoyRequireLua("view.FishingJoyView")
	slot4 = "view.ccs.FishingJoyExitCcsView"
	ccs.FishingJoyExitCcsView = FishingJoyRequireLua("view.FishingJoyView")
	slot4 = "view.ccs.FishingJoyBattleCcsView"
	ccs.FishingJoyBattleCcsView = FishingJoyRequireLua("view.FishingJoyView")
	slot4 = "view.ccs.FishingJoyLoadingCcsView"
	ccs.FishingJoyLoadingCcsView = FishingJoyRequireLua("view.FishingJoyView")
	slot4 = "view.ccs.FishingJoyBattleLoadingCcsView"
	slot2 = FishingJoyRequireLua("view.FishingJoyView")
	ccs.FishingJoyBattleLoadingCcsView = slot2
	slot3 = "component.effect.FishingJoyEffectBase"

	FishingJoyRequireLua(slot2)

	slot3 = "component.buff.FishingJoyBuffBase"

	FishingJoyRequireLua(slot2)

	slot3 = "component.transform.FishingJoyMovePoint"

	FishingJoyRequireLua(slot2)

	slot3 = "component.transform.FishingJoyMoveDirection"

	FishingJoyRequireLua(slot2)

	slot0.gameModel = FishingJoyModel.new()
	slot3 = slot0.gameModel
	slot0.gameController = FishingJoyController.new(slot2)
	slot4 = slot0.gameController
	slot0.gameView = FishingJoyView.new(slot2, slot0.gameModel)
	slot0.fishEntity = nil
	slot0.bulletEntity = nil
	slot3 = "entity.FishingJoyFish"
	slot0.fishEntity = FishingJoyRequireLua(slot2)
	slot3 = "entity.FishingJoyBullet"
	slot0.bulletEntity = FishingJoyRequireLua(slot2)
	slot3 = "entity.FishingJoyPlayer"
	slot0.player = FishingJoyRequireLua(slot2)
	slot3 = "component.effect.FishingJoyEffectKill"
	slot0.effectKill = FishingJoyRequireLua(slot2)
	slot3 = "component.effect.FishingJoyAppendBuffer"
	slot0.effectAppendBuffer = FishingJoyRequireLua(slot2)
	slot3 = "component.effect.FishingJoyAppendMoney"
	slot0.effectAppendMoney = FishingJoyRequireLua(slot2)
	slot3 = "component.effect.FishingJoyEffectCreate"
	slot0.effectCreate = FishingJoyRequireLua(slot2)
	slot3 = "component.effect.FishingJoyEffectFactory"
	slot0.effectFactory = FishingJoyRequireLua(slot2).new()
	slot5 = slot0.effectAppendMoney

	slot0.effectFactory.registerEffectClass(slot2, slot0.effectFactory, FISHINGJOY_EFFECT_TYPE.APPENDMONEY)

	slot5 = slot0.effectKill

	slot0.effectFactory.registerEffectClass(slot2, slot0.effectFactory, FISHINGJOY_EFFECT_TYPE.KILL)

	slot5 = slot0.effectAppendBuffer

	slot0.effectFactory.registerEffectClass(slot2, slot0.effectFactory, FISHINGJOY_EFFECT_TYPE.APPENDBUFF)

	slot5 = slot0.effectCreate

	slot0.effectFactory.registerEffectClass(slot2, slot0.effectFactory, FISHINGJOY_EFFECT_TYPE.CREATE)

	slot1 = CONFIG_DESIGN_WIDTH
	slot2 = CONFIG_DESIGN_HEIGHT
	slot5 = slot0.gameController

	if slot0.gameController.isNeedAdjustIx(FISHINGJOY_EFFECT_TYPE.CREATE) then
		slot5 = slot0.gameController
		slot1, slot2 = slot0.gameController.getIPhoneXScreenPixel(slot4)
	end

	slot5 = "mainLogic.FishingJoyEntityLogic"
	slot9 = 900
	slot0.entityLogic = FishingJoyRequireLua(slot4).new(slot4, slot0.gameController, slot1, slot2, 1440)
	slot5 = "component.entityPool.EntityPoolMgr"
	slot5 = FishingJoyRequireLua(slot4)
	slot0.entityPoolMgr = FishingJoyRequireLua(slot4).getInstance(slot4)
	slot0.gameFinishLoad = false
end

slot0.getEntityPoolMgr = function (slot0)
	return slot0.entityPoolMgr
end

slot0.getEntityLayer = function (slot0)
	return slot0.entityLayer
end

slot0.setEntityLayer = function (slot0, slot1)
	slot0.entityLayer = slot1
end

slot0.getGameModel = function (slot0)
	return slot0.gameModel
end

slot0.getGameController = function (slot0)
	return slot0.gameController
end

slot0.getGameView = function (slot0)
	return slot0.gameView
end

slot0.getFishEntityClass = function (slot0)
	return slot0.fishEntity
end

slot0.getBulletEntityClass = function (slot0)
	return slot0.bulletEntity
end

slot0.getPlayerClass = function (slot0)
	return slot0.player
end

slot0.getEffectFactory = function (slot0)
	return slot0.effectFactory
end

slot0.getEntityLogic = function (slot0)
	return slot0.entityLogic
end

slot0.getMoveDirectionComponent = function (slot0)
	return FishingJoyMoveDirection.new()
end

slot0.getMovePointComponent = function (slot0)
	return FishingJoyMovePoint.new()
end

slot0.setGameFinishLoad = function (slot0, slot1)
	slot0.gameFinishLoad = slot1
end

slot0.checkGameFinishLoad = function (slot0)
	return slot0.gameFinishLoad
end

return slot0
