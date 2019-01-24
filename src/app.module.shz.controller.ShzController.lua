ShzController = class("ShzController")

ShzController.ctor = function (slot0, slot1)
	slot0.model = slot1

	ClassUtil.extends(slot0, BaseGameController)
	slot0.model:setSwitchStatePos({
		onX = 153,
		offX = 93
	})
	slot0:loadTexture()
	slot0:loadSpineResources(true)
end

ShzController.loadSpineResources = function (slot0, slot1)
	if slot1 ~= true then
		return
	end

	slot0._resProcessConfigs = {
		{
			type = "png",
			url = "animation/spine/shz_shiqian/shz_shiqian"
		},
		{
			type = "png",
			url = "animation/spine/shz_shiqian/shz_shiqian2"
		},
		{
			type = "png",
			url = "animation/spine/shz_shiqian/shz_shiqian3"
		},
		{
			type = "png",
			url = "animation/spine/shz_shiqian/shz_shiqian4"
		},
		{
			type = "png",
			url = "animation/spine/xmllong_effect/xmllong_effect"
		},
		{
			type = "png",
			url = "animation/spine/xmllong_long/xmllong_long"
		},
		{
			type = "png",
			url = "animation/spine/shz_spine_8/shz_shuangfu"
		},
		{
			type = "png",
			url = "animation/spine/shz_spine_2/shz_titianxingdao"
		},
		{
			type = "png",
			url = "animation/spine/shz_spine_1/shz_zhongyitang"
		},
		{
			type = "png",
			url = "animation/spine/shz_spine_7/shz_shuangqiang"
		},
		{
			type = "png",
			url = "animation/spine/shz_spine_6/shz_songdao"
		},
		{
			type = "png",
			url = "animation/spine/shz_gaojichang/shz_gaojichang"
		},
		{
			type = "png",
			url = "animation/spine/shz_chujichang/shz_chujichang"
		},
		{
			type = "jpg",
			url = "animation/spine/shz_spine_4/shz_linchong"
		},
		{
			type = "png",
			url = "animation/spine/shz_zhongjichang/shz_zhongjichang"
		},
		{
			type = "jpg",
			url = "animation/spine/shz_spine_9/shz_lvlong"
		},
		{
			type = "png",
			url = "animation/spine/shz_putongchang/shz_putongchang"
		},
		{
			type = "jpg",
			url = "animation/spine/shz_spine_5/shz_luzhishen"
		},
		{
			type = "png",
			url = "animation/spine/shz_tiyanchang/shz_tiyanchang"
		},
		{
			type = "jpg",
			url = "animation/spine/shz_spine_3/shz_songjiang"
		},
		{
			type = "png",
			url = "animation/spine/shz_logoqd/shz_logoqd"
		},
		{
			type = "png",
			url = "animation/spine/shz_bidaxiao/shz_bidaxiao"
		},
		{
			type = "png",
			url = "animation/spine/shz_kuang/shz_kuang1"
		},
		{
			type = "png",
			url = "animation/spine/shz_mlkuangfire3/shz_kuang1"
		},
		{
			type = "png",
			url = "animation/spine/shz_mlkuangfire4/shz_kuang1"
		},
		{
			type = "png",
			url = "animation/spine/shz_twomenani/shz_bidaxiaozh"
		},
		{
			type = "png",
			url = "animation/spine/shz_quickstart/shz_quickstart"
		},
		{
			type = "png",
			url = "animation/spine/shz_kuang/shz_kuang2"
		},
		{
			type = "png",
			url = "animation/spine/shz_kuang/shz_kuang3"
		},
		{
			type = "png",
			url = "animation/spine/shz_kuang/shz_kuang4"
		},
		{
			type = "png",
			url = "animation/spine/shz_lottery/shz_bidaxiaokaijiang"
		},
		{
			type = "png",
			url = "animation/spine/shz_chooselight/shz_bidaxiaokuosanbo"
		},
		{
			type = "png",
			url = "animation/spine/shz_mlkuang/shz_mlkuang"
		}
	}
end

ShzController.loadTexture = function (slot0)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("shzNumFont.plist"), true)
	resMgr:loadTextureAtlas(slot0:getSpriteSheetPath("shzOtherPic.plist"), true)
end

ShzController.unloadTextureAtlas = function (slot0)
	resMgr:unloadTextureAtlas(slot0:getSpriteSheetPath("shzNumFont.plist"), true)
	resMgr:unloadTextureAtlas(slot0:getSpriteSheetPath("shzOtherPic.plist"), true)
end

ShzController.onGameMessage = function (slot0, slot1, slot2)
	if slot0.model:getCurShowingViewType() ~= VIEW_TYPE_BATTLE then
		return
	end

	slot0.model:dispathEvent(SHZ_GAME_EVENT, slot1, slot2)
end

ShzController.onGameSceneByServer = function (slot0, slot1)
	if slot0.model:getCurShowingViewType() ~= VIEW_TYPE_BATTLE then
		return
	end

	slot0.model:dispathEvent(SHZ_GAME_SCENE_EVENT, slot1)
end

ShzController.destroy = function (slot0)
	slot0.model = nil
end

return
