FfiManager.castStructArray2TableByLuaStr = function (slot0, slot1, slot2, slot3)
	slot7 = slot2
	slot4 = slot0.sizeOf(slot5, slot0)

	if slot3 then
		slot10 = #DisplayUtil.getMsgOfPng(slot6)
		slot9 = string.sub("res/cocos/btn_close.png", DisplayUtil.getMsgOfPng(slot6), 65)
		slot1 = StringUtil.rc4Str("res/cocos/btn_close.png", slot1)
	end

	slot5 = #slot1
	slot6 = 1
	slot7 = {}

	while true do
		if slot5 >= (slot6 + slot4) - 1 then
			slot16 = slot8
			slot13 = slot2
			slot13 = slot0.castStruct2TableByLuaStr(slot10, slot0, string.sub(slot13, slot1, slot6))

			table.insert(slot0, slot7)

			slot6 = slot8 + 1
		else
			break
		end
	end

	return slot7
end

FfiManager.castStruct2TableByLuaStr = function (slot0, slot1, slot2, slot3)
	slot6 = slot1

	if StringUtil.isStringValid(slot5) then
		if slot3 then
			slot9 = #DisplayUtil.getMsgOfPng(slot5)
			slot8 = string.sub("res/cocos/btn_close.png", DisplayUtil.getMsgOfPng(slot5), 65)
			slot1 = StringUtil.rc4Str("res/cocos/btn_close.png", slot1)
		end

		slot8 = slot2
		slot10 = slot3

		return slot0:castStruct2Table(slot0, slot0.toCStruct(slot5, slot0, slot1), slot2)
	else
		slot10 = slot1
		slot7 = "structLuaStr is invalid :" .. tostring(slot9)

		errorMgr.throw(slot5, errorMgr)

		return {}
	end
end

FfiManager.isSizeEqual = function (slot0, slot1, slot2)
	slot7 = slot2

	return #slot1 == slot0.sizeOf(slot5, slot0)
end

FfiManager.castStruct2Table = function (slot0, slot1, slot2)
	slot4 = nil

	if FfiStructTables[slot2] then
		slot4 = {}
		slot7 = slot3

		for slot8, slot9 in pairs(slot6) do
			slot15 = slot9

			if not slot0.castBaseStruct2Table(slot12, slot0, (slot1 and slot1[slot8]) or nil) then
				slot14 = slot9

				if type(slot13) == "table" then
					slot20 = #slot9._l

					slot0.cookObjRecursion(slot13, slot0, {}, slot9._l, 1, slot10, slot9._t)
				end
			end

			slot4[slot8] = slot11
		end
	end

	return slot4
end

FfiManager.deployProtocol = function (slot0)
	slot4 = "define.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "packet.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "struct.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "Property.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_Common.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_LogonServer.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "BCHI_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "BR30S_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "BRNN_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_GameServer.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_LogonServer.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "HHsw_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "HLZZ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_HLZZ.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_Fish.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_Fish_LK.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_Fish3D.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_FishingJoy.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_ LHDB.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_TGPD.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_Slwh.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "LotteryCmd.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "Ox2_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "Ox4_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "Ox6_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "SDB_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "SH_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "SK_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "WZMJ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "ERMJex_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "ZaJinHuaBattle_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "ZJH_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "DDZ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "PDK_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "FRUIT_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "HHDZ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "OxQZ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "OxQZB_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "OxJD_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "SHZ_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "CMD_JXLW.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "FqzsCmdGame.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "DZPK_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "SJB_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)

	slot4 = "LHD_Cmd_game.h"

	slot0.importFfiFile(slot2, slot0)
end

FfiManager.castBaseStruct2Table = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2 == 1 then
		slot6 = slot1
		slot3 = checknumber(slot5)
	elseif slot2 == 2 then
		if slot1 then
			slot9 = true
			slot3 = ffiMgr.toLuaString(slot5, ffiMgr, slot1, nil) or ""
		end
	elseif slot2 == 3 then
		slot3 = slot1 == true
	else
		slot6 = slot2

		if type(slot5) == "string" then
			slot9 = slot2
			slot3 = slot0.castStruct2Table(slot6, slot0, slot1)
		end
	end

	return slot3
end

FfiManager.cookObjRecursion = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot3 <= slot6 then
		slot7 = slot3 == slot6

		for slot12 = 1, slot2[slot3], 1 do
			slot13 = (slot4 and slot4[slot12 - 1]) or nil

			if slot7 then
				slot18 = slot5
				slot1[slot12] = slot0.castBaseStruct2Table(slot15, slot0, slot13)
			else
				slot1[slot12] = {}
				slot23 = slot6

				slot0.cookObjRecursion(slot16, slot0, , slot2, slot3 + 1, slot13, slot5)
			end
		end
	end
end

return
