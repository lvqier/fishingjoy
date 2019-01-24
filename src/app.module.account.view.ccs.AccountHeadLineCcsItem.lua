AccountHeadLineCcsItem = class("AccountHeadLineCcsItem")

AccountHeadLineCcsItem.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "data", nil, nil, nil, nil, nil, handler(slot0, slot0.onData))
	slot0.model.headSelectedIdChangedSignal:add(slot0.onSelectedChanged, slot0)
	slot0:onData()
end

AccountHeadLineCcsItem.onSelectedChanged = function (slot0)
	if slot0._data then
		slot0.selectedSpr:setVisible(slot0._data.faceId == slot0.model:getHeadSelectedId() and slot0._data.gender == slot0.model:getHeadSelectedGender())
	end
end

AccountHeadLineCcsItem.onData = function (slot0)
	slot0:setVisible(slot0._data ~= nil)

	if slot0._data then
		slot0.bgManSpr:setVisible(Hero:getCbGender() == 1)
		slot0.bgWomanSpr:setVisible(not (Hero.getCbGender() == 1))
		slot0.iconSpr:setSpriteFrame(slot0._data.picName)
		slot0:onSelectedChanged()
	end
end

AccountHeadLineCcsItem.destroy = function (slot0)
	slot0.model.headSelectedIdChangedSignal:remove(slot0.onSelectedChanged, slot0)
end

return
