slot0 = class("PlazaModule")

requireLuaFromModule("plaza.model.PlazaModel")
requireLuaFromModule("plaza.controller.PlazaController")
requireLuaFromModule("plaza.view.PlazaView")

slot0.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseUIModule, true, PlazaModel, PlazaView, PlazaController)
end

slot0.show = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:initMvc()
	uiMgr:showScene(SceneType.scene_plaza, function ()
		if DateUtil.getDateString(nil, 2, true) ~= Hero:getLastLoginDate() and Hero:getIsShowSjbPopup() then
			popupMgr:push(POPUP_ID_WORLD_CUP, function ()
				slot0.model:setIsShowSjbHdts(true)
			end)
			Hero:setLastLoginDate(slot0)
		end

		if Hero:getIsShowDzpkMatchPopup() then
			popupMgr:push(POPUP_ID_DZPK_HDTS, function ()
				slot0.model:setIsShowDzpkMatchHdts(true)
			end)
		end

		applyFunction(applyFunction)
	end, function ()
		slot0.view:show()
		slot0.view.show.controller:gotoView(PLAZA_MAIN, true)
		applyFunction(slot0.view.show.controller)
	end, slot3, nil, slot4, slot5)
	mainMgr:startCheckModuleState()

	slot0._isShowBackup = DateUtil.isNextDay(Hero:getBackupsTime())

	if slot0._isShowBackup and not Hero:getIsBackups() and IS_IOS_IN_HOUSE then
		slot0._scheduleId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(slot0, slot0.updata), 1, false)
	end
end

slot0.updata = function (slot0, slot1)
	if not slot0._isShowBackup then
		return
	end

	slot0.totalTime = (slot0.totalTime or Hero:getOnlineTime()) + slot1

	if slot0.totalTime >= 600 then
		slot0.controller:updateBackupTime()

		slot0._isShowBackup = DateUtil.isNextDay(Hero:getBackupsTime())
	end
end

slot0.hide = function (slot0, slot1)
	BaseUIModule.hide(slot0, nil, function ()
		slot0.controller:gotoView(nil)
		applyFunction(slot0.controller)
	end)

	if slot0._scheduleId then
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0._scheduleId)

		slot0._scheduleId = nil
	end
end

slot0.showWechatGuanZhu = function (slot0)
	slot0.controller:showWechatGuanZhu()
end

slot0.loginEnterGame = function (slot0, slot1)
	if slot0.controller then
		slot0.controller:loginEnterGame(slot1)
	end
end

slot0.gotoMain = function (slot0)
	if slot0.controller then
		slot0.controller:gotoView(PLAZA_MAIN, true)
	end
end

slot0.gotoGameKindRoom = function (slot0, slot1)
	if slot0.controller then
		slot0.model._preShowingViewType = (gameMgr:getGameConfig(slot1).gameType ~= 2 or PLAZA_SUB_DUO_REN) and (slot2 ~= 3 or PLAZA_SUB_XIU_XIAN) and (slot2 ~= 4 or PLAZA_SUB_BU_YU) and PLAZA_SUB_QI_PAI

		slot0.controller:try2EnterGame(slot1)
	end
end

slot0.gotoBank = function (slot0)
	slot0.controller:openBankModule()
end

slot0.showCustomService = function (slot0, slot1)
	slot0.model:setIsShowingCustomService(true)
	slot0.model:setCsTabIndex(slot1 or 1)
end

slot0.getoRank = function (slot0)
	slot0.model:setIsShowingRank(true)
end

slot0.showNewbieReward = function (slot0, slot1)
	slot0.model:setIsShowingNewbieReward(slot1)
end

slot0.requestYydbMyHistory = function (slot0)
	if slot0.controller then
		slot0.controller:requestYydbMyHistory()
	end
end

slot0.requestYydbHistory = function (slot0)
	if slot0.controller then
		slot0.controller:requestYydbHistory()
	end
end

ProxyPlaza = slot0.new()

return ProxyPlaza
