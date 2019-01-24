FishTdExitListItem = class("FishTdExitListItem")

FishTdExitListItem.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "data", nil, nil, nil, nil, nil, handler(slot0, slot0.onData))
end

FishTdExitListItem.handleScrollBtns = function (slot0, slot1)
	slot1:addBtn2HandleTouchOperate(slot0.btnImage)
end

FishTdExitListItem.onData = function (slot0)
	if slot0._data then
		slot0:setVisible(true)

		slot3 = "gameres/module/fishtd/ui/common/wiki/fish"
		slot4 = cc.Sprite:create(string.format("%s/%s/txt_%s.png", "gameres/module/fishtd/ui/common/wiki/name", ClassLoader:aquireSingleton("GameConfig").FishWiki.Map[slot0._data.id].type, ClassLoader.aquireSingleton("GameConfig").FishWiki.Map[slot0._data.id].name))

		slot4:setScale(0.5)

		if slot4 then
			slot0.btnImage.Node_Position_Name:removeAllChildren()
			slot0.btnImage.Node_Position_Name:addChild(slot4)
		end

		slot5 = cc.Sprite:create(string.format("%s/%s/yu_%s.png", slot3, slot1.type, slot1.name))

		if slot1.type == "normal" then
			slot5:setScale(0.74)
		elseif slot1.type == "special" then
			slot5:setScale(0.72)
		elseif slot1.type == "boss" then
			slot5:setScale(0.52)
		end

		if slot5 then
			slot0.btnImage.Node_Position_Image:removeAllChildren()
			slot0.btnImage.Node_Position_Image:addChild(slot5)
		end

		slot0.btnImage.text_number:setString(string.format("x%d", slot0._data.count))
	else
		slot0:setVisible(false)
	end
end

FishTdExitListItem.destroy = function (slot0)
	destroySomeObj(slot0.btnImage)
end

return FishTdExitListItem
