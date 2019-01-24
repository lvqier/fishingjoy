slot0 = class_C("CocosLayerManager")

slot0.ctor = function (slot0, slot1)
	slot0._layers = {}
	slot0._layerRoot = slot1
end

slot0.preloadLayers = function (slot0)
	slot0:registerLayer("BackgroundLayer", 4)
	slot0:registerLayer("FishLayer", 5)
	slot0:registerLayer("BackgroundLayerExchangeLayer", 6)
	slot0:registerLayer("BulletLayer", 7)
	slot0:registerLayer("CannonLayer", 8)
	slot0:registerLayer("EffectLayer", 9)
	slot0:registerLayer("UILayer", 10)
end

slot0.registerLayer = function (slot0, slot1, slot2)
	if not slot0._layerRoot then
		slot0:showErrorMsg("网络错误，请重新开始游戏！")

		return
	end

	slot3 = cc.Layer:create()

	slot3:setName(slot1)
	slot3:setGlobalZOrder(slot2)
	slot0._layerRoot:addChild(slot3, slot2)

	slot0._layers[slot1] = slot3
end

slot0.getLayer = function (slot0, slot1)
	return slot0._layers[slot1]
end

slot0.clear = function (slot0)
	for slot4, slot5 in pairs(slot0._layers) do
		slot5:removeFromParent()
	end

	slot0._layers = {}
end

return slot0
