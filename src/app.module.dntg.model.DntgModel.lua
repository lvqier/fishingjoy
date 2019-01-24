DntgModel = class("DntgModel")

requireLuaFromModule("dntg.model.Dntg_path")
requireLuaFromModule("dntg.model.Dntg_TroopSet")
requireLuaFromModule("dntg.model.Dntg_System")
requireLuaFromModule("dntg.model.Dntg_FishMulti")

DNTG_SUB_S_TIME_SYNC = 100
DNTG_SUB_S_SEND_FISH = 101
DNTG_SUB_S_USER_INFO = 102
DNTG_SUB_S_CHANGE_SCORE = 103
DNTG_SUB_S_CANNON_SET = 104
DNTG_SUB_S_SEND_BULLET = 105
DNTG_SUB_S_KILL_FISH = 106
DNTG_SUB_S_KILL_BULLET = 107
DNTG_SUB_S_SWITCH_SCENE = 108
DNTG_SUB_S_ALLOW_FIRE = 109
DNTG_SUB_S_GAME_CONFIG = 110
DNTG_SUB_S_LOCK_FISH = 111
DNTG_SUB_S_SEND_DES = 112
DNTG_SUB_S_FORCE_TIME_SYNC = 113
DNTG_SUB_S_BULLET_SET = 114
DNTG_SUB_S_ADD_BUFFER = 115
DNTG_SUB_S_FIRE_FAILE = 116
DNTG_SUB_S_ACTIVITY_NOTIFY = 117
DNTG_SUB_S_FISH_MUL = 118
DNTG_SUB_S_SEND_FISHS = 119
DNTG_SUB_S_ANDROID_UPD = 200
DNTG_SUB_S_UPDATE_RANKING = 201
DNTG_SUB_S_CUR_RANKING = 202
DNTG_SUB_S_DIFF_START = 203
DNTG_SUB_S_MATCH_END = 204
DNTG_SUB_S_DIFF_END = 205
DNTG_SUB_S_RANKING_END = 206
DNTG_SUB_S_SCORE_SYNC = 207
DNTG_SUB_S_SPEEDUP = 208
DNTG_SUB_C_TIME_SYNC = 500
DNTG_SUB_C_CHANGE_SCORE = 501
DNTG_SUB_C_CHANAGE_CANNON = 502
DNTG_SUB_C_FIRE = 503
DNTG_SUB_C_LOCK_FISH = 504
DNTG_SUB_C_NETCAST = 505
DNTG_SUB_C_CHANGE_CANNONSET = 506
DNTG_SUB_C_ENDGAME = 550
DNTG_SUB_C_BREADY = 551
DNTG_SUB_C_TREASURE_END = 552
DNTG_SUB_C_LOCK_SOME_FISH = 553
DNTG_SUB_C_SPEEDUP = 554

DntgModel.ctor = function (slot0)
	ClassUtil.extends(slot0, BaseGameModel, true, GameKind_DNTG, nil, nil, false, true)

	slot0._loadingDuration = 3
	slot0.m_NormalPathVector = {}
	slot0.nNormalPathCount = #Dntg_path.FishPath.Path * 16
	slot0.m_TroopPathMap = {}
	slot0.nTroopPathCount = #Dntg_TroopSet.Path

	createSetterGetter(slot0, "fishPlayer", {}, true)
	createSetterGetter(slot0, "gameconfig", {
		nMaxInterval = 90,
		nFireInterval = 0.2,
		nMaxBulletCount = 80
	}, true)
	createSetterGetter(slot0, "switchingScene", {}, true)
	createSetterGetter(slot0, "allowFire", false, true)
	createSetterGetter(slot0, "isEnergyCannon", "no", true)
	createSetterGetter(slot0, "mirror", false, true)
	createSetterGetter(slot0, "bulletCount", 0, true)
	createSetterGetter(slot0, "playerCannonAnimation", 0, true)
	createSetterGetter(slot0, "bAutoAttack", false, true)
	createSetterGetter(slot0, "bLockFish", false, true)
	createSetterGetter(slot0, "mCurSpeedRate", 1, true)
	createSetterGetter(slot0, "isShowingExit", false, true)
	createSetterGetter(slot0, "bulletDeltaTime", 0.3, true)
	createSetterGetter(slot0, "stopFireByMaxBullet", false, true)
	createSetterGetter(slot0, "addEffectPartical", {}, true)
	createSetterGetter(slot0, "addFishGold", {}, true)
	createSetterGetter(slot0, "addBingo", {}, true)
	createSetterGetter(slot0, "bHandChangeLockFish", false, true)
	createSetterGetter(slot0, "bReqChangeLockFish", false, true)
	createSetterGetter(slot0, "currSceneId", -1)
	createSetterGetter(slot0, "luckPacketEvt", {}, true)

	slot0.musicBg = "bgm/bgm1.mp3"
	slot0.iCostBulletCount = 0
	slot0.iGetGoldCount = 0
	slot0.tKillFish = {}
	slot0._delay2ScloseSocketMs = 1000
end

DntgModel.updateCostBulletCount = function (slot0, slot1)
	slot0.iCostBulletCount = slot0.iCostBulletCount + slot1

	return slot0.iCostBulletCount
end

DntgModel.updateGetGoldCount = function (slot0, slot1)
	slot0.iGetGoldCount = slot0.iGetGoldCount + slot1

	return slot0.iGetGoldCount
end

DntgModel.updateKillFish = function (slot0, slot1)
	if slot0.tKillFish[slot1] == nil then
		slot0.tKillFish[slot1] = {
			iCount = 0,
			iLevel = Dntg_FishMulti[slot1].iLevel,
			iFishID = slot1,
			iScale = Dntg_FishMulti[slot1].iScale
		}
	end

	slot0.tKillFish[slot1].iCount = slot0.tKillFish[slot1].iCount + 1
end

DntgModel.getKillFish = function (slot0)
	return slot0.tKillFish
end

DntgModel.getPlayerByChairID = function (slot0, slot1)
	return slot0:getFishPlayer()[slot1 + 1]
end

DntgModel.setPlayerByChairID = function (slot0, slot1, slot2)
	slot0:getFishPlayer()[slot1 + 1] = slot2

	slot0:setFishPlayer(slot0.getFishPlayer(), true)
end

DntgModel.getNormalPath = function (slot0, slot1)
	if slot0.nNormalPathCount <= slot1 then
		return
	end

	if slot0.m_NormalPathVector[slot1 + 1] ~= nil then
		return slot0.m_NormalPathVector[slot1 + 1]
	end

	slot4 = {
		bit.band(slot3, 8),
		bit.band(slot3, 4),
		bit.band(slot3, 2),
		bit.band(slot3, 1)
	}
	Dntg_path.FishPath.Path[math.modf(slot1 / 16) + 1].nPointCount = 4

	if Dntg_path.FishPath.Path[math.modf(slot1 / 16) + 1].Type == DNTG_PathMoveType.PMT_LINE then
		slot5.nPointCount = 2
	elseif slot5.Type == DNTG_PathMoveType.PMT_BEZIER and slot5.Position[3].x <= 0 and slot5.Position[3].y <= 0 then
		slot5.nPointCount = 3
	end

	slot6 = slot0:ConvertPathPoint(slot5, slot4[1] == 0, slot4[2] == 0, slot4[3] == 0, slot4[4] == 0)
	slot6.Type = slot5.Type
	slot6.nPointCount = slot5.nPointCount
	slot0.m_NormalPathVector[slot1 + 1] = slot6

	return slot0.m_NormalPathVector[slot1 + 1]
end

DntgModel.getTroopPath = function (slot0, slot1)
	if slot0.nTroopPathCount <= slot1 then
		return nil
	end

	if slot0.m_TroopPathMap[slot1] ~= nil then
		return slot0.m_TroopPathMap[slot1]
	end

	Dntg_TroopSet.Path[slot1].nPointCount = 4

	if Dntg_TroopSet.Path[slot1].Type == DNTG_PathMoveType.PMT_LINE then
		slot2.nPointCount = 2
	elseif slot2.Type == DNTG_PathMoveType.PMT_BEZIER and slot2.Position[3].x <= 0 and slot2.Position[3].y <= 0 then
		slot2.nPointCount = 3
	end

	slot3 = slot0:ConvertPathPoint(slot2, false, false, false, false)
	slot3.Type = slot2.Type
	slot3.nPointCount = slot2.nPointCount
	slot0.m_TroopPathMap[slot1] = slot3

	return slot0.m_TroopPathMap[slot1]
end

DntgModel.ConvertPathPoint = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot1
	slot7 = {
		slot1.Position[1].x,
		slot1.Position[2].x,
		slot1.Position[3].x,
		slot1.Position[4].x
	}
	slot8 = {
		slot1.Position[1].y,
		slot1.Position[2].y,
		slot1.Position[3].y,
		slot1.Position[4].y
	}

	if slot2 then
		if slot6.nType == DNTG_PathMoveType.PMT_CIRCLE then
			slot7[1] = 1 - slot7[1]
			slot7[3] = M_PI - slot7[3]
			slot8[3] = -slot8[3]
		else
			for slot12 = 1, slot6.nPointCount, 1 do
				slot7[slot12] = 1 - slot7[slot12]
			end
		end
	end

	if slot3 then
		if slot6.nType == DNTG_PathMoveType.PMT_CIRCLE then
			slot8[1] = 1 - slot8[1]
			slot7[3] = 2 * M_PI - slot7[3]
			slot8[3] = -slot8[3]
		else
			for slot12 = 1, slot6.nPointCount, 1 do
				slot8[slot12] = 1 - slot8[slot12]
			end
		end
	end

	if slot4 then
		if slot6.nType == DNTG_PathMoveType.PMT_CIRCLE then
			slot7[1] = 1 - slot8[1]
			slot8[1] = 1 - slot7[1]
			slot7[3] = slot7[3] + M_PI_2
		else
			for slot12 = 1, slot6.nPointCount, 1 do
				slot8[slot12] = slot7[slot12]
				slot7[slot12] = slot8[slot12]
			end
		end
	end

	if slot5 then
		if slot6.nType == DNTG_PathMoveType.PMT_CIRCLE then
			slot7[3] = slot7[3] + slot8[3]
			slot8[3] = -slot8[3]
		else
			for slot12 = 0, slot6.nPointCount / 2 - 1, 1 do
				slot7[slot6.nPointCount - slot12] = slot7[slot12 + 1]
				slot7[slot12 + 1] = slot7[slot6.nPointCount - slot12]
				slot8[slot12 + 1] = slot8[slot6.nPointCount - slot12]
				slot8[slot6.nPointCount - slot12] = slot8[slot12 + 1]
			end
		end
	end

	for slot12 = 1, slot6.nPointCount, 1 do
		slot7[slot12] = slot7[slot12] * Dntg_System.SystemSet.DefaultScreenSet.width
		slot8[slot12] = slot8[slot12] * Dntg_System.SystemSet.DefaultScreenSet.height

		if slot6.Type == DNTG_PathMoveType.PMT_CIRCLE then
			break
		end
	end

	return {
		xPos = slot7,
		yPos = slot8
	}
end

DntgModel.reset = function (slot0)
	slot0:setFishPlayer({}, nil, true)
	slot0:setGameconfig({
		nMaxInterval = 90,
		nFireInterval = 0.2,
		nMaxBulletCount = 80
	}, nil, true)
	slot0:setSwitchingScene({}, nil, true)
	slot0:setAllowFire(false, nil, true)
	slot0:setMirror(false, nil, true)
	slot0:setBulletCount(0, nil, true)
	slot0:setBAutoAttack(false, nil, true)
	slot0:setBLockFish(false, nil, true)
	slot0:setMCurSpeedRate(1, nil, true)
	slot0:setIsEnergyCannon("no", nil, true)
	slot0:setBHandChangeLockFish(false, nil, true)
	slot0:setBReqChangeLockFish(false, nil, true)

	slot0.iCostBulletCount = 0
	slot0.iGetGoldCount = 0
	slot0.tKillFish = {}
end

DntgModel.destroy = function (slot0)
	return
end

return
