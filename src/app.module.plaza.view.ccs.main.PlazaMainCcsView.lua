PlazaMainCcsView = class("PlazaMainCcsView")

PlazaMainCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaTweenComponent, true, 0, 0, 0, 0)
end

PlazaMainCcsView.hide = function (slot0, slot1, slot2, slot3, slot4)
	slot0.layerLeft:hide(function ()
		BasePlazaTweenComponent.hide(BasePlazaTweenComponent.hide, , 0, 0)
	end, nil, nil, slot4)
	slot0.layerRight:hide()
	slot0.layerTop:hide()
end

PlazaMainCcsView.show = function (slot0, slot1, slot2, slot3)
	BasePlazaTweenComponent.show(slot0)
	slot0.layerLeft:show(slot1)
	slot0.layerRight:show()
	slot0.layerTop:show()
end

return
