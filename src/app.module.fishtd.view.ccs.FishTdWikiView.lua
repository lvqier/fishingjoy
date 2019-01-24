FishTdWikiView = class("FishTdWikiView")

FishTdWikiView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0.gameConfig = ClassLoader:aquireSingleton("GameConfig")

	slot0.model:setNormalWikiData(TableUtil.cookDataAs2Dimension(slot0.gameConfig.FishWiki.Normal, 6))
	slot0.model:setSpecialWikiData(TableUtil.cookDataAs2Dimension(slot0.gameConfig.FishWiki.Special, 4))
	slot0.model:setBossWikiData(TableUtil.cookDataAs2Dimension(slot0.gameConfig.FishWiki.Boss, 3))
	slot0.model:setWikiShowType("normal")
	slot0.view.normal_lv:setItemResCcsFileName("module/fishtd/csb/common/WikiListRowNormal.csb")
	slot0.view.normal_lv:setDatas(slot0.model._normalWikiData, true)
	slot0.view.special_lv:setItemResCcsFileName("module/fishtd/csb/common/WikiListRowSpecial.csb")
	slot0.view.special_lv:setDatas(slot0.model._specialWikiData, true)
	slot0.view.boss_lv:setItemResCcsFileName("module/fishtd/csb/common/WikiListRowBoss.csb")
	slot0.view.boss_lv:setDatas(slot0.model._bossWikiData, true)
	slot0.model.wikiShowTypeChangedSignal:add(slot0.onWikiShowTypeChanged, slot0)
	slot0:onWikiShowTypeChanged()

	if slot0.view:getChildByName("Image_Background"):getVirtualRenderer() and slot3.setCullFace then
		slot3:setCullFace(true)
	end
end

FishTdWikiView.onShow = function (slot0)
	slot0.model:setWikiShowType("normal")
	slot0.view.normal_lv:jumpToPercent(nil, 0, nil)
	slot0.view.special_lv:jumpToPercent(nil, 0, nil)
	slot0.view.boss_lv:jumpToPercent(nil, 0, nil)
end

FishTdWikiView.onWikiShowTypeChanged = function (slot0)
	if slot0.model._wikiShowType == "normal" then
		slot0.view.btnNormal:setOpacity(255)
		slot0.view.btnSpecial:setOpacity(0)
		slot0.view.btnBoss:setOpacity(0)
		slot0.view.normal_lv:setVisible(true)
		slot0.view.special_lv:setVisible(false)
		slot0.view.boss_lv:setVisible(false)
		slot0.model:setWikiDetailShowData(slot0.gameConfig.FishWiki.Normal)
	elseif slot0.model._wikiShowType == "special" then
		slot0.view.btnNormal:setOpacity(0)
		slot0.view.btnSpecial:setOpacity(255)
		slot0.view.btnBoss:setOpacity(0)
		slot0.view.normal_lv:setVisible(false)
		slot0.view.special_lv:setVisible(true)
		slot0.view.boss_lv:setVisible(false)
		slot0.model:setWikiDetailShowData(slot0.gameConfig.FishWiki.Special)
	elseif slot0.model._wikiShowType == "boss" then
		slot0.view.btnNormal:setOpacity(0)
		slot0.view.btnSpecial:setOpacity(0)
		slot0.view.btnBoss:setOpacity(255)
		slot0.view.normal_lv:setVisible(false)
		slot0.view.special_lv:setVisible(false)
		slot0.view.boss_lv:setVisible(true)
		slot0.model:setWikiDetailShowData(slot0.gameConfig.FishWiki.Boss)
	end
end

FishTdWikiView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnBack then
		slot0.model:setIsShowingRule(false)
	elseif slot1 == slot0.view.btnNormal then
		slot0.model:setWikiShowType("normal")
	elseif slot1 == slot0.view.btnSpecial then
		slot0.model:setWikiShowType("special")
	elseif slot1 == slot0.view.btnBoss then
		slot0.model:setWikiShowType("boss")
	end
end

FishTdWikiView.destroy = function (slot0)
	slot0.model.wikiShowTypeChangedSignal:remove(slot0.onWikiShowTypeChanged, slot0)
	destroySomeObj(slot0.view.btnNormal)
	destroySomeObj(slot0.view.btnSpecial)
	destroySomeObj(slot0.view.btnBoss)
	destroySomeObj(slot0.view.btnBack)
	destroySomeObj(slot0.view.normal_lv)
	destroySomeObj(slot0.view.special_lv)
	destroySomeObj(slot0.view.boss_lv)
	ZoomPopUpChildView.destroy(slot0)
end

return FishTdWikiView
