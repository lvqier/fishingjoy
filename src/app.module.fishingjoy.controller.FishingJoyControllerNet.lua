FishingJoyController.onGameMessage = function (slot0, slot1, slot2)
	if slot2 == FISHINGJOY_SUB_S_TIME_SYNC then
		slot6 = slot1

		slot0.onMsgTimeSync(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SEND_FISH then
		slot6 = slot1

		slot0.onMsgCreateFish(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_USER_INFO then
		slot6 = slot1

		slot0.onMsgPlayerInfo(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_CHANGE_SCORE then
		slot6 = slot1

		slot0.onMsgChangeScore(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_CANNON_SET then
		slot6 = slot1

		slot0.onMsgCannon(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SEND_BULLET then
		slot6 = slot1

		slot0.onMsgCreateBullet(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_KILL_FISH then
		slot6 = slot1

		slot0.onMsgKillFish(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_KILL_BULLET then
		slot6 = slot1

		slot0.onMsgKillBullet(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SWITCH_SCENE then
		slot6 = slot1

		slot0.onMsgSwitchScene(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_ALLOW_FIRE then
		slot6 = slot1

		slot0.onMsgAllowFire(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_GAME_CONFIG then
		slot6 = slot1

		slot0.onMsgGameConfig(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_LOCK_FISH then
		slot6 = slot1

		slot0.onMsgLockFish(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SEND_DES then
		slot6 = slot1

		slot0.onMsgSendDes(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_FORCE_TIME_SYNC then
		slot6 = slot1

		slot0.onMsgForceTimeSync(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_BULLET_SET then
		slot6 = slot1

		slot0.onMsgBulletSet(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_ADD_BUFFER then
		slot6 = slot1

		slot0.onMsgAppendBuff(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_FIRE_FAILE then
		slot6 = slot1

		slot0.onMsgFireFailed(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_ACTIVITY_NOTIFY then
		slot6 = slot1

		slot0.onMsgActivityNotice(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_FISH_MUL then
		slot6 = slot1

		slot0.onMsgFishMul(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SCORE_SYNC then
		slot6 = slot1

		slot0.onMsgScoreSync(slot4, slot0)
	elseif slot2 == FISHINGJOY_SUB_S_SPEEDUP then
		slot6 = slot1

		slot0.onMsgChangeSpeedUp(slot4, slot0)
	end
end

FishingJoyController.onMsgChangeSpeedUp = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SPEEDUP"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SPEEDUP"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgChangeSpeedUp(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgTimeSync = function (slot0, slot1)
	slot6 = "FISH_CMD_S_TIME_SYNC"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_TIME_SYNC"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgTimeSync(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgGameConfig = function (slot0, slot1)
	slot6 = "FISH_CMD_S_GameConfig"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_GameConfig"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgGameConfig(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgCreateFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SendFish"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SendFish"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgCreateFish(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgBulletSet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_BULLET_SET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_BULLET_SET"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgBulletSet(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgPlayerInfo = function (slot0, slot1)
	slot6 = "FISH_CMD_S_USER_INFO"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_USER_INFO"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgPlayerInfo(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgChangeScore = function (slot0, slot1)
	slot6 = "FISH_CMD_S_CHANGE_SCORE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_CHANGE_SCORE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgChangeScore(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgCannon = function (slot0, slot1)
	slot6 = "FISH_CMD_S_CANNON_SET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_CANNON_SET"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgCannon(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgCreateBullet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SEND_BULLET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot2 = nil

		if FISHINGJOY_ANDROID_PLATFORM then
			slot7 = "FISH_CMD_S_SEND_BULLET"
			slot2 = ffiMgr.castStruct2TableByLuaStr(slot4, ffiMgr, slot1)
		else
			slot2 = {
				dwID = slot4.readUInt(slot1, slot4),
				wChairID = slot4.readUShort(slot1, slot4),
				dwCreateTick = slot4.readUInt(slot1, slot4),
				fXpos = slot4.readFloat(slot1, slot4),
				fYPos = slot4.readFloat(slot1, slot4),
				nCannonType = slot4.readInt(slot1, slot4),
				nMultiply = slot4.readInt(slot1, slot4),
				lScore = slot4.readByte2Integer(slot1, slot4, 8, true),
				fDirection = slot4.readFloat(slot1, slot4),
				bNew = slot4.readBool(slot1, slot4),
				dwServerTick = slot4.readUInt(slot1, slot4),
				IsDouble = slot4.readBool(slot1, slot4)
			}
			slot4 = ByteArray.new(slot5)
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
			slot10 = false
			slot8 = true
			slot8 = true
			slot8 = true
			slot8 = true
		end

		slot6 = slot2

		slot0._onMsgCreateBullet(slot4, slot0)
	end
end

FishingJoyController.onMsgKillFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_KILL_FISH"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_KILL_FISH"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgKillFish(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgKillBullet = function (slot0, slot1)
	slot6 = "FISH_CMD_S_KILL_BULLET"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_KILL_BULLET"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgKillBullet(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgSwitchScene = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SWITCH_SCENE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SWITCH_SCENE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgSwitchScene(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgAllowFire = function (slot0, slot1)
	slot6 = "FISH_CMD_S_ALLOW_FIRE"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_ALLOW_FIRE"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgAllowFire(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgLockFish = function (slot0, slot1)
	slot6 = "FISH_CMD_S_LOCK_FISH"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_LOCK_FISH"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgLockFish(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgSendDes = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SEND_DES"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SEND_DES"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgSendDes(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgForceTimeSync = function (slot0, slot1)
	slot4 = {
		wChairID = Hero.getWChairID(slot6),
		dwClientTick = slot0.getClientTick(slot6)
	}
	slot7 = Hero
	slot7 = slot0

	reqFISHINGJOYMsgSyncTime(slot3)
end

FishingJoyController.onMsgAppendBuff = function (slot0, slot1)
	slot6 = "FISH_CMD_S_ADD_BUFFER"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_ADD_BUFFER"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgAppendBuff(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgFireFailed = function (slot0, slot1)
	return
end

FishingJoyController.onMsgActivityNotice = function (slot0, slot1)
	return
end

FishingJoyController.onMsgFishMul = function (slot0, slot1)
	slot6 = "FISH_CMD_S_FISH_MUL"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_FISH_MUL"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgFishMul(ffiMgr, slot0)
	end
end

FishingJoyController.onMsgScoreSync = function (slot0, slot1)
	slot6 = "FISH_CMD_S_SCORE_SYNC"

	if ffiMgr.isSizeEqual(slot3, ffiMgr, slot1) then
		slot6 = "FISH_CMD_S_SCORE_SYNC"
		slot6 = ffiMgr.castStruct2TableByLuaStr(slot3, ffiMgr, slot1)

		slot0._onMsgScoreSync(ffiMgr, slot0)
	end
end

return
