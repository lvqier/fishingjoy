FishTdWikiListItem = class("FishTdWikiListItem")

FishTdWikiListItem.onCreationComplete = function (slot0)
	createSetterGetter(slot0, "data", nil, nil, nil, nil, nil, handler(slot0, slot0.onData))
	slot0:onData()
end

FishTdWikiListItem.onBtnClick = function (slot0, slot1, slot2)
	dump(slot0._data.index)
	slot0.model:setWikiDetailShowDataIndex(slot0._data.index, true)
	dump(slot0.model._wikiDetailShowDataIndex)
	slot0.model:setIsShowingWikiDetail(true)
	fishtdSound:playFishTdGameEffect(Fish3DSound.GameEffect.DIALOG_POPUP)
end

FishTdWikiListItem.handleScrollBtns = function (slot0, slot1)
	slot1:addBtn2HandleTouchOperate(slot0.btnImage)
end

FishTdWikiListItem.onData = function (slot0)
	if slot0._data then
		slot0:setVisible(true)
		slot0.btnImage.Text_FishName:setString("")

		slot2 = "gameres/module/fishtd/ui/common/wiki/fish"

		if cc.Sprite:create(string.format("%s/%s/txt_%s.png", "gameres/module/fishtd/ui/common/wiki/name", slot0._data.type, slot0._data.name)) then
			slot0.btnImage.Text_FishName:removeAllChildren()
			slot0.btnImage.Text_FishName:addChild(slot3)

			if slot3.setCullFace then
				slot3:setCullFace(true)
			end
		end

		if cc.Sprite:create(string.format("%s/%s/yu_%s.png", slot2, slot0._data.type, slot0._data.name)) then
			slot0.btnImage.Node_Position_Image:removeAllChildren()
			slot0.btnImage.Node_Position_Image:addChild(slot4)

			if slot4.setCullFace then
				slot4:setCullFace(true)
			end
		end

		slot5 = string.find(slot0._data.score, "-") or 0
		slot6 = (slot0._data.brief == "" and 0) or 8

		if slot5 > 0 then
			slot0.btnImage.Description_tf:setHtmlText(slot9 .. HtmlUtil.createArtNumWithCustomFormat(slot8, "#beishu_%s.png", nil, {
				"bei",
				slot6
			}, nil, nil, nil, -2, nil, nil, -2, nil) .. slot0._data.brief)
		else
			slot0.btnImage.Description_tf:setHtmlText(slot7 .. slot0._data.brief)
		end
	else
		slot0:setVisible(false)
	end
end

FishTdWikiListItem.destroy = function (slot0)
	destroySomeObj(slot0.btnImage.Description_tf)
	destroySomeObj(slot0.btnImage)
end

return FishTdWikiListItem
