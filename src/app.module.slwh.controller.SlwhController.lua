slot2 = "slwh.TreeEventDispatcher"

requireLuaFromModule(slot1)

slot2 = "slwh.func.TreeFunc"

requireLuaFromModule(slot1)

slot2 = "slwh.func.TreeActionManager"

requireLuaFromModule(slot1)

slot2 = "slwh.func.TreeAction"

requireLuaFromModule(slot1)

slot2 = "slwh.SlwhCacheManager"

requireLuaFromModule(slot1)

slot2 = "SlwhController"
SlwhController = class(slot1)

SlwhController.ctor = function (slot0, slot1)
	slot0.model = slot1
	slot5 = BaseGameController

	ClassUtil.extends(slot3, slot0)

	slot5 = {
		onX = 143.14,
		offX = 67.27
	}

	slot0.model.setSwitchStatePos(slot3, slot0.model)

	slot0.battleView = nil
	slot0._isEnterForeground = false
	slot0._msgCaches = {}
	slot4 = mainMgr

	mainMgr.onStopTick2Gc(slot3)

	slot8 = "slwh_jetton_atlas.plist"

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(slot6, slot0))

	slot8 = "slwh_battle_animal_time.plist"
	slot6 = true

	resMgr.loadTextureAtlas(slot3, resMgr, slot0.getSpriteSheetPath(true, slot0))

	slot4 = slot0

	slot0.setPreloadResource(slot3)

	slot4 = slot0

	slot0.initProtocolConfig(slot3)

	slot4 = cc.Director
	slot5 = true

	cc.Director.getInstance(slot3).setDisplayStats(slot3, cc.Director.getInstance(slot3))

	slot4 = TreeCacheManager

	TreeCacheManager.init(slot3)

	slot5 = Tree.CacheTemplate

	TreeCacheManager.registerCocos2dxObject(slot3, TreeCacheManager)

	slot4 = TreeEventDispatcher

	TreeEventDispatcher.init(slot3)
end

SlwhController.setPreloadResource = function (slot0)
	slot0._resProcessConfigs = {
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/slwh_jetton_number"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/slwh_jetton"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/slwh_jetton_small_bet_number"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/bet_numbers"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/slwh_bank_font"
		},
		{
			isForbidUnload = true,
			type = "plist",
			url = "spritesheet/slwh_result_countdown"
		},
		{
			isForbidUnload = true,
			type = "png",
			url = "spritesheet/slwh_jetton_atlas"
		},
		{
			isForbidUnload = true,
			type = "png",
			url = "spritesheet/slwh_battle_animal_time"
		},
		{
			type = "png",
			url = "animation/slwh_cjc/slwh_cjxc"
		},
		{
			type = "png",
			url = "animation/slwh_cjc/slwh_cjxcbg"
		},
		{
			type = "png",
			url = "animation/slwh_cjc/slwh_cjxcgx"
		},
		{
			type = "png",
			url = "animation/slwh_gjc/slwh_gjxc"
		},
		{
			type = "png",
			url = "animation/slwh_gjc/slwh_gjxcbg"
		},
		{
			type = "png",
			url = "animation/slwh_gjc/slwh_gjxcgx"
		},
		{
			type = "png",
			url = "animation/slwh_ptc/slwh_ptxc"
		},
		{
			type = "png",
			url = "animation/slwh_ptc/slwh_ptxcbg"
		},
		{
			type = "png",
			url = "animation/slwh_ptc/slwh_ptxcgx"
		},
		{
			type = "png",
			url = "animation/slwh_tyc/slwh_tycgx"
		},
		{
			type = "png",
			url = "animation/slwh_tyc/slwh_tyxc"
		},
		{
			type = "png",
			url = "animation/slwh_tyc/slwh_tyxcbg"
		},
		{
			type = "png",
			url = "animation/slwh_zjc/slwh_zjxc"
		},
		{
			type = "png",
			url = "animation/slwh_zjc/slwh_zjxcbg"
		},
		{
			type = "png",
			url = "animation/slwh_zjc/slwh_zjxcgx"
		},
		{
			type = "png",
			url = "animation/quickstart/slwh_quickstart"
		},
		{
			type = "jpg",
			url = "common/slwh_xcbg"
		},
		{
			type = "png",
			url = "animation/room/slwh_xcbg_hou"
		},
		{
			type = "png",
			url = "animation/room/slwh_xcbg_qian"
		},
		{
			type = "png",
			url = "animation/room/slwh_xcbg_zhong"
		},
		{
			type = "png",
			url = "model/01_basecolor"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_01"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_02"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_03"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_04"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_0_03"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_0_06"
		},
		{
			type = "png",
			url = "model/light/02_basecolor_0_09"
		},
		{
			type = "png",
			url = "model/03_basecolor"
		},
		{
			type = "png",
			url = "model/04_basecolor"
		},
		{
			type = "png",
			url = "model/05_basecolor"
		},
		{
			type = "png",
			url = "model/06_basecolor_AlphaTest"
		},
		{
			type = "png",
			url = "model/07_basecolor_AlphaTest"
		},
		{
			type = "png",
			url = "model/09_basecolorAlphatest"
		},
		{
			type = "png",
			url = "model/10_basecolorAlphatest"
		},
		{
			type = "png",
			url = "model/10_basecolorAlphatest_03"
		},
		{
			type = "png",
			url = "model/houzi"
		},
		{
			type = "png",
			url = "model/tuzi"
		},
		{
			type = "png",
			url = "model/xiongmao_D"
		},
		{
			type = "png",
			url = "model/shizi_D"
		},
		{
			type = "png",
			url = "model/caijin/caijin_basecolor"
		},
		{
			type = "png",
			url = "model/dasanyuan/dasanyuan_basecolor"
		},
		{
			type = "png",
			url = "model/dasixi/dasixi_basecolor_gree"
		},
		{
			type = "png",
			url = "model/dasixi/dasixi_basecolor_Red"
		},
		{
			type = "png",
			url = "model/dasixi/dasixi_basecolor_Yellow"
		},
		{
			type = "png",
			url = "model/dasixi/dasixi_basecolor_Flow"
		},
		{
			type = "png",
			url = "jetton/image_panel"
		},
		{
			type = "png",
			url = "result/sprite_mask"
		},
		{
			type = "png",
			url = "battle/tips/tip_panel"
		},
		{
			type = "png",
			url = "effect/slwh_xztxlg"
		},
		{
			type = "png",
			url = "effect/slwh_kjjg"
		},
		{
			type = "png",
			url = "effect/slwh_dsy"
		},
		{
			type = "png",
			url = "effect/slwh_dsx"
		},
		{
			type = "png",
			url = "effect/slwh_xiazhumenu"
		},
		{
			type = "png",
			url = "effect/slwh_xztxlg"
		},
		{
			type = "png",
			url = "effect/slwh_yanhuaeffect"
		},
		{
			type = "png",
			url = "effect/slwh_stagewater"
		},
		{
			type = "png",
			url = "effect/slwh_stagewateryy"
		},
		{
			type = "png",
			url = "effect/slwh_dancinggs"
		},
		{
			type = "png",
			url = "effect/slwh_stagegs"
		}
	}
	slot0._cacheResource = {
		{
			path = Tree.root .. "model/shizi.c3b",
			type = Tree.LoadingType.LoadingType_Animation3D,
			key = Tree.ModelType.ModelType_Lion
		}
	}
	slot5 = {
		path = Tree.root .. "model/xiongmao.c3b",
		type = Tree.LoadingType.LoadingType_Animation3D,
		key = Tree.ModelType.ModelType_Panda
	}

	table.insert(, slot0._cacheResource)

	slot5 = {
		path = Tree.root .. "model/houzi.c3b",
		type = Tree.LoadingType.LoadingType_Animation3D,
		key = Tree.ModelType.ModelType_Monkey
	}

	table.insert(, slot0._cacheResource)

	slot5 = {
		path = Tree.root .. "model/tuzi.c3b",
		type = Tree.LoadingType.LoadingType_Animation3D,
		key = Tree.ModelType.ModelType_Rabbit
	}

	table.insert(, slot0._cacheResource)

	slot1 = 5
	slot0._currentIndex = 1
	slot0._preIndex = 0
	slot0._userCallFunc = slot0.loadSpineAndParticle
end

SlwhController.loadSpineAndParticle = function (slot0)
	slot0._preIndex = slot0._preIndex + 1

	if slot0._currentIndex <= #slot0._cacheResource then
		if slot0._cacheResource[slot0._currentIndex].type == Tree.LoadingType.LoadingType_Animation3D then
			slot5 = slot1

			slot0.loadAnimation3D(slot3, slot0)

			slot0._currentIndex = slot0._currentIndex + 1
		elseif slot1.type == Tree.LoadingType.LoadingType_Sprite then
			slot2 = {}

			for slot6 = 1, slot1.fcount, 1 do
				slot9 = slot2
				slot13 = slot1.key

				table.insert(slot8, TreeCacheManager.getCacheObject(slot11, TreeCacheManager))
			end

			for slot6 = 1, slot1.fcount, 1 do
				slot10 = slot2[slot6]

				TreeCacheManager.recycleCocos2dxObject(slot8, TreeCacheManager)
			end

			slot0._currentIndex = slot0._currentIndex + 1
		else
			if not slot1.create_object then
				slot1.create_object = {}
				slot1.cindex = 1
			end

			if slot1.cindex <= slot1.count then
				slot6 = slot1.name
				slot7 = SerialCacheManager.getCacheObject(slot4, SerialCacheManager)

				table.insert(SerialCacheManager, slot1.create_object)

				slot1.cindex = slot2 + 1
			end

			if slot1.count < slot2 then
				for slot6 = 1, slot1.count, 1 do
					slot10 = slot1.create_object[slot6]

					SerialCacheManager.recycleCocos2dxObject(slot8, SerialCacheManager)
				end

				slot1.create_object = nil
				slot1.cindex = nil
				slot0._currentIndex = slot0._currentIndex + 1
				slot6 = slot1.name

				print(slot4, "process-> ")
			end
		end
	end

	return #slot0._cacheResource < slot0._currentIndex
end

SlwhController.loadAnimation3D = function (slot0, slot1)
	slot5 = slot1.path
	slot7 = slot1.key

	TreeCacheManager.putAnimation3D(cc.Animation3D, TreeCacheManager, cc.Animation3D.create(slot3, cc.Animation3D))
end

SlwhController.initProtocolConfig = function (slot0)
	slot0._protocol = {
		[SLWH_SUB_S_GAME_START] = {
			messageName = "SLWH_CMD_S_GameStart",
			func = slot0.onMsgGameStart
		},
		[SLWH_SUB_S_GAME_END] = {
			messageName = "SLWH_CMD_S_GameEnd",
			func = slot0.onMsgGameEnd
		},
		[SLWH_SUB_S_JETTON] = {
			messageName = "SLWH_CMD_S_Jetton",
			func = slot0.onMsgGameBet
		},
		[SLWH_SUB_S_JETTON_CONTINUE] = {
			messageName = "SLWH_CMD_S_Jetton_Continue",
			func = slot0.onMsgGameBetContinue
		},
		[SLWH_SUB_S_REFRESH_STATUS] = {
			messageName = "SLWH_CMD_S_GameStatus",
			func = slot0.onMsgRefreshStatus
		},
		[SLWH_SUB_S_JETTON_FAIL] = {
			messageName = "SLWH_CMD_S_PlaceBetFail",
			func = slot0.onMsgGameFailed
		},
		[SLWH_SUB_S_REQUEST_STATE] = {
			messageName = "SLWH_CMD_S_GameStatus",
			func = slot0.onMsgQueryStatus
		}
	}
end

SlwhController.requestQueryStatus = function (slot0)
	slot0._queryTime = socket.gettime()

	reqSlwhQueryStatus()
end

SlwhController.onMsgQueryStatus = function (slot0, slot1)
	slot1.cbTimeLeave = slot1.cbTimeLeave - socket.gettime() + slot0._queryTime
	slot7 = slot1

	TreeEventDispatcher.dispatchEvent(slot0._queryTime, TreeEventDispatcher, Tree.Event.queryGameStatus)
end

SlwhController.onMsgGameStart = function (slot0, slot1)
	slot5 = slot1.lJettonConfig

	slot0.model.setCellScoreArray(slot3, slot0.model)

	slot4 = slot0

	slot0.dynamicGlobalConfig(slot3)

	slot5 = slot1.nJettonAreaTimes

	slot0.model.setAreaBetMultiplyArray(slot3, slot0.model)

	slot5 = 0

	slot0.model.setAllUserBetNumber(slot3, slot0.model)

	slot5 = {}

	slot0.model.setCurAreaUserBetOrder(slot3, slot0.model)

	slot5 = 0

	slot0.model.setCurSelectdGold(slot3, slot0.model)

	slot5 = true

	slot0.model.setCanJettonContinue(slot3, slot0.model)

	slot2 = {}

	for slot6 = 1, 15, 1 do
		slot2[slot6] = 0
	end

	slot6 = slot2

	slot0.model.setAreaUserBetArray(slot4, slot0.model)

	if SLWH_AFTER_WITHDRAWAL_CAN_BET == false then
		slot5 = slot0.model
		slot8 = Hero

		slot0.model.setSelfBetStartMoney(slot4, Hero.getUserScore(slot7))
	end

	slot7 = slot1

	TreeEventDispatcher.dispatchEvent(slot4, TreeEventDispatcher, Tree.Event.gameStart)
end

slot0 = {
	[Tree.RewardType.RewardType_Normal] = "普通",
	[Tree.RewardType.RewardType_DaSanYuan] = "大三元",
	[Tree.RewardType.RewardType_DaSiXi] = "大四喜",
	[Tree.RewardType.RewardType_SongDeng] = "送灯",
	[Tree.RewardType.RewardType_ShanDian] = "闪电",
	[Tree.RewardType.RewardType_CaiJin] = "彩金"
}

SlwhController.onMsgGameEnd = function (slot0, slot1)
	slot5 = slot1.tAward

	slot0.model.setUserReward(slot3, slot0.model)

	slot5 = slot1.lJettoned

	slot0.model.setUserTotalJetton(slot3, slot0.model)

	slot5 = slot1.lScore

	slot0.model.setUserSessionScore(slot3, slot0.model)

	slot5 = slot1.lCaijin

	slot0.model.setUserSessionCaiJin(slot3, slot0.model)

	slot5 = slot1.tAwardRecord

	slot0.model.setHistoryRewards(slot3, slot0.model)

	slot5 = slot1.lCaijin

	print(slot3, "onMsgGameEnd->Caijin->")

	slot6 = slot1

	TreeEventDispatcher.dispatchEvent(slot3, TreeEventDispatcher, Tree.Event.gameOver)
end

SlwhController.onMsgGameBet = function (slot0, slot1)
	if slot1.cbRet == Tree.JettonRetType.RetType_Success then
		slot4 = Hero

		if Hero.getWChairID(slot3) == slot1.wChairID then
			slot6 = slot0.model
			slot0.model.getAreaUserBetArray(slot5)[slot1.nArea + 1] = slot1.lJetton
			slot7 = slot0.model

			if slot0.model.getCurAreaUserBetOrder(slot1.lJetton)[slot1.nArea + 1] == nil then
				slot5[slot1.nArea + 1] = 0
			end

			slot5[slot1.nArea + 1] = slot1.lJetton
			slot9 = slot5

			slot0.model.setCurAreaUserBetOrder(slot1.lJetton, slot0.model)

			slot9 = false

			slot0.model.setCanJettonContinue(slot1.lJetton, slot0.model)
		end

		slot9 = slot0.model
		slot7 = slot0.model.getAllUserBetNumber(slot8) + slot1.lScore

		slot0.model.setAllUserBetNumber(slot5, slot0.model)

		slot6 = slot0.model
		slot0.model.getAreaTotalBetArray(slot5)[slot1.nArea + 1] = slot1.lTotalJetton
		slot8 = slot0.model.getAreaTotalBetArray(slot5)

		slot0.model.setAreaTotalBetArray(slot1.lTotalJetton, slot0.model)
	end

	slot6 = slot1

	TreeEventDispatcher.dispatchEvent(slot3, TreeEventDispatcher, Tree.Event.gameBet)
end

SlwhController.onMsgGameBetContinue = function (slot0, slot1)
	if slot1.cbRet == Tree.JettonRetType.RetType_Success then
		slot4 = Hero

		if Hero.getWChairID(slot3) == slot1.wChairID then
			slot7 = slot1.lBet

			slot0.model.setAreaUserBetArray(slot5, slot0.model)

			slot7 = slot1.lBet

			slot0.model.setCurAreaUserBetOrder(slot5, slot0.model)
		end

		slot4 = 0

		for slot8 = 1, 15, 1 do
			slot4 = slot4 + slot1.lBet[slot8]
		end

		slot10 = slot0.model
		slot8 = slot0.model.getAllUserBetNumber(slot9) + slot4

		slot0.model.setAllUserBetNumber(slot6, slot0.model)

		slot8 = slot1.lTotalJetton

		slot0.model.setAreaTotalBetArray(slot6, slot0.model)

		slot9 = slot1

		TreeEventDispatcher.dispatchEvent(slot6, TreeEventDispatcher, Tree.Event.gameBetContinue)
	end
end

SlwhController.onMsgRefreshStatus = function (slot0, slot1)
	slot5 = slot1.cbStatus

	slot0.model.setUserGameStatus(slot3, slot0.model)

	slot5 = slot1.cbTimeLeave

	slot0.model.setRemindTime(slot3, slot0.model)

	slot6 = slot1

	TreeEventDispatcher.dispatchEvent(slot3, TreeEventDispatcher, Tree.Event.gameStatusRefresh)

	if slot1.cbStatus == Tree.Status.Wait or slot1.cbStatus == Tree.Status.Over then
		slot2 = {}

		for slot6 = 1, 15, 1 do
			slot2[slot6] = 0
		end

		slot6 = slot2

		slot0.model.setAreaTotalBetArray(slot4, slot0.model)

		slot7 = slot1

		TreeEventDispatcher.dispatchEvent(slot4, TreeEventDispatcher, Tree.Event.closeJettonView)
	end

	if slot1.cbStatus == Tree.Status.Wait then
		slot5 = 0

		slot0.model.setAllUserBetNumber(slot3, slot0.model)

		slot6 = slot1

		TreeEventDispatcher.dispatchEvent(slot3, TreeEventDispatcher, Tree.Event.gameWait)
	end
end

SlwhController.onMsgGameFailed = function (slot0, slot1)
	print(slot3)

	slot5 = Hero

	if slot1.wChairID == Hero.getWChairID("SlwhController:onMsgGameFailed->") then
		slot4 = slot0.model
		slot2 = slot0.model.getAreaUserBetArray(slot3)

		for slot6 = 1, 15, 1 do
			slot2[slot6] = 0
		end

		slot6 = slot2

		slot0.model.setAreaUserBetArray(slot4, slot0.model)

		slot6 = slot1.lPlayerJettoned

		slot0.model.setAreaTotalBetArray(slot4, slot0.model)

		slot6 = {}

		slot0.model.setCurAreaUserBetOrder(slot4, slot0.model)

		slot6 = true

		slot0.model.setCanJettonContinue(slot4, slot0.model)

		slot6 = 0

		slot0.model.setUserTotalJetton(slot4, slot0.model)

		slot3 = 0

		for slot7 = 1, 15, 1 do
			slot3 = slot3 + slot1.lJettonScore[slot7]
		end

		slot8 = Hero.getUserScore(slot5) + slot3

		Hero.setUserScore(Hero, Hero)
	end

	slot2 = 0

	for slot6 = 1, 15, 1 do
		slot2 = slot2 + slot1.lPlayerJettoned[slot6]
	end

	slot6 = slot2

	slot0.model.setAllUserBetNumber(slot4, slot0.model)

	slot7 = slot1

	TreeEventDispatcher.dispatchEvent(slot4, TreeEventDispatcher, Tree.Event.cancelAllBets)
end

SlwhController.onGameSceneByServer = function (slot0, slot1)
	slot6 = "SLWH_CMD_S_GameScene"
	slot2 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)
	slot6 = slot2.lJettonConfig

	slot0.model.setCellScoreArray(ffiMgr, slot0.model)

	slot5 = slot0

	slot0.dynamicGlobalConfig(ffiMgr)

	slot6 = slot2.cbStatus

	slot0.model.setUserGameStatus(ffiMgr, slot0.model)

	slot6 = slot2.cbTimeLeave

	slot0.model.setRemindTime(ffiMgr, slot0.model)

	slot6 = slot2.lPlayerJettoned

	slot0.model.setAreaUserBetArray(ffiMgr, slot0.model)

	slot6 = slot2.nJettonAreaTimes

	slot0.model.setAreaBetMultiplyArray(ffiMgr, slot0.model)

	slot6 = slot2.lJettoned

	slot0.model.setAreaTotalBetArray(ffiMgr, slot0.model)

	slot6 = slot2.tAward

	slot0.model.setUserReward(ffiMgr, slot0.model)

	slot6 = slot2.tAwardRecord

	slot0.model.setHistoryRewards(ffiMgr, slot0.model)

	slot3 = 0

	for slot7 = 1, 15, 1 do
		slot3 = slot3 + slot2.lJettoned[slot7]
	end

	slot7 = slot3

	slot0.model.setAllUserBetNumber(slot5, slot0.model)

	slot4 = 0

	for slot8 = 1, 15, 1 do
		slot4 = slot4 + slot2.lPlayerJettoned[slot8]
	end

	slot9 = Hero.getUserScore(slot6) - slot4

	Hero.setUserScore(Hero, Hero)

	slot10 = slot2

	TreeEventDispatcher.dispatchEvent(Hero, TreeEventDispatcher, Tree.Event.loadScene)
end

SlwhController.onUserStatus = function (slot0, slot1, slot2)
	slot3 = slot1
end

SlwhController.onGameMessage = function (slot0, slot1, slot2)
	slot3 = slot0._protocol[slot2]
	slot4 = true
	slot4 = slot0._isEnterForeground

	if slot3 and slot4 then
		slot5 = slot1

		if slot3.messageName then
			slot10 = slot3.messageName

			if ffiMgr.isSizeEqual(slot7, ffiMgr, slot1) then
				slot10 = slot3.messageName
				slot9 = ffiMgr.castStruct2TableByLuaStr(slot7, ffiMgr, slot1)

				slot3.func(slot7, slot0)
			end
		end
	end
end

SlwhController.resetBattle = function (slot0)
	slot0._currentIndex = 1
	slot0._preIndex = 1
	slot0._isEnterForeground = false
	slot4 = Tree.Sound.roomBgSound

	slot0.playMusic(slot2, slot0)

	slot3 = audioMgr

	audioMgr.stopAllEffects(slot2)

	slot4 = false

	slot0.model.setIsShowingExit(slot2, slot0.model)

	slot4 = false

	slot0.model.setIsShowingJetton(slot2, slot0.model)

	slot4 = {}

	slot0.model.setPreAreaUserBetOrder(slot2, slot0.model)

	slot4 = 0

	slot0.model.setUserTotalJetton(slot2, slot0.model)

	slot4 = 0

	slot0.model.setAllUserBetNumber(slot2, slot0.model)

	slot4 = 0

	slot0.model.setSelfBetStartMoney(slot2, slot0.model)

	slot1 = {}

	for slot5 = 1, 15, 1 do
		slot1[slot5] = 0
	end

	slot5 = slot1

	slot0.model.setAreaTotalBetArray(slot3, slot0.model)

	slot5 = Tree.Event.closeGame

	TreeEventDispatcher.dispatchEvent(slot3, TreeEventDispatcher)
end

SlwhController.exitGame = function (slot0, slot1)
	if cc.ParticleSystemCache then
		slot4 = cc.ParticleSystemCache
		slot4 = cc.ParticleSystemCache.getInstance(slot3)

		cc.ParticleSystemCache.getInstance(slot3).removeAllParticles(slot3)
	end

	if sp.SkeletonAnimation.removeAllSkeletonData then
		slot4 = sp.SkeletonAnimation

		sp.SkeletonAnimation.removeAllSkeletonData(slot3)
	end

	slot4 = audioMgr

	audioMgr.playMainMusic(slot3)

	slot4 = mainMgr

	mainMgr.onRestartTick2Gc(slot3)

	slot4 = TreeCacheManager

	TreeCacheManager.onDestroy(slot3)

	slot5 = slot1

	ProxySlwh.hide(slot3, ProxySlwh)

	slot0._preIndex = 1
	slot0._currentIndex = 1
	slot0._isEnterForeground = false
end

SlwhController.destroy = function (slot0)
	slot0.model = nil
end

SlwhController.processAssets = function (slot0, slot1)
	slot4 = slot0.model

	function slot3()
		if slot0 or slot1 then
			slot3 = VIEW_TYPE_BATTLE

			slot2.model.setCurShowingViewType(slot1, slot2.model)
			slot2.model.registerListeners(slot1)

			slot2 = slot2.model

			slot2.model.recoverServerMsgs(slot1)
		else
			slot3 = {}

			gameMgr.setGameStackMsgs(slot1, gameMgr)

			slot3 = false

			gameMgr.setNeedStoreGameStackMsg(slot1, gameMgr)
		end
	end

	if slot0.model.getIsUseCommonHall(slot3) then
		slot3()
	else
		slot10 = slot0.model
		slot11 = slot3

		slot0.updateLoading(slot5, slot0, 100, slot0.model.getLoadingDuration(slot9), slot1, nil)
	end

	slot6 = mainMgr

	mainMgr.onStopTick2Gc(slot5)

	slot7 = nil

	slot0.processResource(slot5, slot0)
end

SlwhController.onRoomLoginFinish = function (slot0)
	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

SlwhController.onNetMessageCabcelCache = function (slot0)
	slot4 = {}

	gameMgr.setGameStackMsgs(slot2, gameMgr)

	slot4 = false

	gameMgr.setNeedStoreGameStackMsg(slot2, gameMgr)
end

SlwhController.getOrCreateJettonMap = function (slot0, slot1)
	slot6 = slot0.model

	return TableUtil.copyDataDep(slot0.model.getPreAreaUserBetOrder(slot5))
end

SlwhController.savePreJettonMap = function (slot0)
	slot1 = pairs
	slot5 = slot0.model
	slot3 = slot0.model.getCurAreaUserBetOrder(slot4) or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5 and slot5 > 0 then
			slot8 = slot0.model
			slot11 = slot0.model

			slot0.model.setPreAreaUserBetOrder(slot7, slot0.model.getCurAreaUserBetOrder(slot10))

			slot9 = {}

			slot0.model.setCurAreaUserBetOrder(slot7, slot0.model)

			return
		end
	end
end

SlwhController.onEnterBackground = function (slot0)
	slot3 = slot0

	BaseGameController.onEnterBackground(slot2)

	slot4 = Tree.Event.enterBackghround

	TreeEventDispatcher.dispatchEvent(slot2, TreeEventDispatcher)
end

SlwhController.onEnterForeground = function (slot0)
	slot3 = slot0

	BaseGameController.onEnterForeground(slot2)

	slot0._isEnterForeground = true
	slot4 = Tree.Event.enterForeground

	TreeEventDispatcher.dispatchEvent(slot2, TreeEventDispatcher)
end

SlwhController.dynamicGlobalConfig = function (slot0)
	slot4 = slot0.model
	Tree.BetScoreBaseConfig = slot0.model.getCellScoreArray(slot3)
	SLWH_FLY_BET_SP_CONFIG = {
		[Tree.BetScoreBaseConfig[1] * SLWH_BET_SCORE_RATE_DATA] = "slwh_jetton_small_bet_1.png",
		[Tree.BetScoreBaseConfig[2] * SLWH_BET_SCORE_RATE_DATA] = "slwh_jetton_small_bet_2.png",
		[Tree.BetScoreBaseConfig[3] * SLWH_BET_SCORE_RATE_DATA] = "slwh_jetton_small_bet_3.png",
		[Tree.BetScoreBaseConfig[4] * SLWH_BET_SCORE_RATE_DATA] = "slwh_jetton_small_bet_4.png",
		[Tree.BetScoreBaseConfig[5] * SLWH_BET_SCORE_RATE_DATA] = "slwh_jetton_small_bet_5.png"
	}
	SLWH_FLY_BET_SCORE_CONFIG = {
		[Tree.BetScoreBaseConfig[1] * SLWH_BET_SCORE_RATE_DATA] = "#slwh_jetton_bet_small_1_%s.png",
		[Tree.BetScoreBaseConfig[2] * SLWH_BET_SCORE_RATE_DATA] = "#slwh_jetton_bet_small_2_%s.png",
		[Tree.BetScoreBaseConfig[3] * SLWH_BET_SCORE_RATE_DATA] = "#slwh_jetton_bet_small_3_%s.png",
		[Tree.BetScoreBaseConfig[4] * SLWH_BET_SCORE_RATE_DATA] = "#slwh_jetton_bet_small_4_%s.png",
		[Tree.BetScoreBaseConfig[5] * SLWH_BET_SCORE_RATE_DATA] = "#slwh_jetton_bet_small_5_%s.png"
	}
	SLWH_BET_BTN_IDX = {
		[Tree.BetScoreBaseConfig[1] * SLWH_BET_SCORE_RATE_DATA] = 1,
		[Tree.BetScoreBaseConfig[2] * SLWH_BET_SCORE_RATE_DATA] = 2,
		[Tree.BetScoreBaseConfig[3] * SLWH_BET_SCORE_RATE_DATA] = 3,
		[Tree.BetScoreBaseConfig[4] * SLWH_BET_SCORE_RATE_DATA] = 4,
		[Tree.BetScoreBaseConfig[5] * SLWH_BET_SCORE_RATE_DATA] = 5
	}
end

return
