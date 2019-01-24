slot2 = "LoadPicesAsyncBean"
LoadPicesAsyncBean = class(slot1)

LoadPicesAsyncBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
	ClassUtil.extends(slot2, slot0)

	slot5 = "plist_font.plist"
	slot5 = "plist_head.plist"
	slot5 = "plist_rouletee_font.plist"
	slot5 = "plist_notice.plist"
	slot5 = "redpacket/spritesheet/redpacket.plist"
	slot0._plistOrPics = {
		{
			type = "plist",
			percentInFloat = 0.6,
			url = ResConfig.getSpriteSheetPath(TimerBase)
		},
		{
			type = "plist",
			percentInFloat = 0.65,
			url = ResConfig.getSpriteSheetPath(TimerBase)
		},
		{
			type = "plist",
			percentInFloat = 0.65,
			url = ResConfig.getSpriteSheetPath(TimerBase)
		},
		{
			type = "plist",
			percentInFloat = 0.67,
			url = ResConfig.getSpriteSheetPath(TimerBase)
		},
		{
			type = "plist",
			percentInFloat = 0.67,
			url = ResConfig.getUICommonPath(TimerBase)
		}
	}

	if IS_GUAN_VERIFY then
		slot4 = {
			type = "plist",
			percentInFloat = 0.7,
			url = ResConfig.getSpriteSheetPath(slot6)
		}
		slot7 = "guan_roomNum_font.plist"

		table.insert(slot2, slot0._plistOrPics)
	end

	slot0._cachedSprites = {}
	slot0._curIndex = 1
	slot0._totalIndex = #slot0._plistOrPics
end

LoadPicesAsyncBean.start = function (slot0)
	slot3 = mainMgr

	if not mainMgr.getIsRelogining(slot2) then
		slot4 = 45

		slot0.startTick(slot2, slot0)
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

LoadPicesAsyncBean.tick = function (slot0)
	if slot0._curIndex <= slot0._totalIndex then
		if slot0._plistOrPics[slot0._curIndex].type == "plist" then
			slot6 = true

			resMgr.loadTextureAtlas(slot3, resMgr, slot1.url)
		elseif slot1.type == "img" then
			slot4 = cc.Director
			slot4 = cc.Director.getInstance(slot3)
			slot5 = slot1.url

			cc.Director.getInstance(slot3).getTextureCache(slot3).addImageAsync(slot3, cc.Director.getInstance(slot3).getTextureCache(slot3))
		end

		slot6 = slot1.percentInFloat

		mainMgr.updateLoginLoadingInfo(slot3, mainMgr, "正在加载静态素材")

		slot0._curIndex = slot0._curIndex + 1
	else
		slot3 = slot0

		slot0.stopTick(slot2)

		slot3 = slot0

		slot0.finish(slot2)
	end
end

LoadPicesAsyncBean.destroy = function (slot0)
	slot3 = slot0

	TimerBase.destroy(slot2)

	slot3 = slot0

	AbstractBean.destroy(slot2)
end

return
