ResConfig = ResConfig or {}

ResConfig.trumResPath = function (slot0)
	slot4 = "()/res/gameres/"

	if string.match(slot2, slot0) then
		slot5 = slot1 + 1

		return string.sub(slot3, slot0)
	end

	return slot0
end

ResConfig.getUIFittingsPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "fittings/" .. slot0)
end

ResConfig.getUICommonPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "common/" .. slot0)
end

ResConfig.getUITxtPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "txt/" .. slot0)
end

ResConfig.getUICommPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "comm/" .. slot0)
end

ResConfig.getTimeline = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "animation/timeline/" .. slot0)
end

ResConfig.getUIIconFramePath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "iconframe/" .. slot0)
end

ResConfig.getAssetPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getResPath(slot3, "gameres/" .. slot0)
end

ResConfig.getArmaturePath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "armature/" .. slot0)
end

ResConfig.getTexturePath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "textureatlas/" .. slot0)
end

ResConfig.getSpinePath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "animation/spine/" .. slot0)
end

ResConfig.getUIAssetPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, slot0)
end

ResConfig.getSoundPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "sound/" .. slot0)
end

ResConfig.getPartilePlist = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "particle/" .. slot0)
end

ResConfig.getSkillIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "skill/" .. slot0)
end

ResConfig.getHeadKey = function (slot0)
	slot3 = slot0

	return "mapassets_head_" .. ((parseInt(slot2) == 0 and slot0) or slot0 % 8 + 1) .. ".png"
end

ResConfig.getHeadSpriteFrame = function (slot0)
	slot3 = resMgr
	slot6 = slot0

	return resMgr.getTpFrame(slot2, ResConfig.getHeadKey(slot5))
end

ResConfig.getEquipPlaceIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "survivor_place/" .. slot0)
end

ResConfig.getFittingsIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "fittings/" .. slot0)
end

ResConfig.getItemIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "item/" .. slot0)
end

ResConfig.getRTaskIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "reward_task/" .. slot0)
end

ResConfig.getMailIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "mail/" .. slot0)
end

ResConfig.getAchieveIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "achieve/" .. slot0)
end

ResConfig.getIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "icon/" .. slot0)
end

ResConfig.getBuildingIconPath = function (slot0, slot1, slot2)
	slot3 = ""

	if slot1 then
		slot3 = "_mini"
	end

	slot7 = slot2

	return ResConfig.getIconPath(slot5, "building/" .. slot0 .. slot3 .. ".png")
end

ResConfig.getSurvivorTypeIconPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getIconPath(slot3, "survivor_league_1/icon_" .. slot0 .. ".png")
end

ResConfig.getConfigData = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getConfig(slot3, "data/" .. slot0)
end

ResConfig.getConfig = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "config/" .. slot0)
end

ResConfig.getFntPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getFontPath(slot3, "/fnt/" .. slot0)
end

ResConfig.getTtfPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getFontPath(slot3, "/ttf/" .. slot0)
end

ResConfig.getFontPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "font/" .. slot0)
end

ResConfig.getUIPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "ui/" .. slot0)
end

ResConfig.getAvatarTexturePath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "avatar/" .. slot0)
end

ResConfig.getAvatarPath = function (slot0, slot1)
	slot4 = "survivor_avatar/" .. slot0 .. ".png"

	return ResConfig.getIconPath(slot3)
end

ResConfig.getMilitaryRankIconSpriteFramePath = function (slot0, slot1)
	if slot1 then
		return "mapassets_militaryrank_" .. slot0 .. ".png"
	else
		return "#mapassets_militaryrank_" .. slot0 .. ".png"
	end
end

ResConfig.getSpriteSheetPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getAssetPath(slot3, "spritesheet/" .. slot0)
end

ResConfig.getTxtPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "txt/" .. slot0)
end

ResConfig.getBtnPath = function (slot0, slot1)
	slot5 = slot1

	return ResConfig.getUIPath(slot3, "btn/" .. slot0)
end

ResConfig.getCorpsIconSpriteFrame = function (slot0)
	slot5 = "mapassets_icon_cb_" .. slot0 .. ".png"

	return resMgr.getTpFrame(".png", resMgr)
end

ResConfig.loadCsNode = function (slot0, slot1, slot2)
	slot3, slot4 = nil

	if slot1 then
		slot3 = slot1.model
		slot4 = slot1.controller
	end

	slot10 = slot2
	slot10 = slot1

	return CCSKitchen.loadCSNode(slot6, ResConfig.getAssetPath(slot8, slot0), slot3, slot4)
end

ResConfig.loadCsLayout = function (slot0, slot1, slot2)
	slot3, slot4 = nil

	if slot1 then
		slot3 = slot1.model
		slot4 = slot1.controller
	end

	slot10 = slot2
	slot10 = slot1

	return CCSKitchen.loadCSLayout(slot6, ResConfig.getAssetPath(slot8, slot0), slot3, slot4)
end

ResConfig.loadCcsTimeline = function (slot0, slot1)
	slot4 = cc.CSLoader
	slot8 = slot1

	return cc.CSLoader.createTimeline(slot3, ResConfig.getAssetPath(slot6, slot0))
end

return
