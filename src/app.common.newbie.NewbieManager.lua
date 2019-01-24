slot2 = "newbie.ui.NewbieUI"

requireLuaFromCommon(slot1)

slot2 = "newbie.ui.NewbieHand"

requireLuaFromCommon(slot1)

slot2 = "newbie.ui.NewbieMask"

requireLuaFromCommon(slot1)

slot2 = "newbie.api.NewbieApiImp"

requireLuaFromCommon(slot1)

slot2 = "NewbieManager"
NewbieManager = class(slot1)
slot0 = true
NEWBIE_TRIGGER_GAME_BGEIN = 1
NEWBIE_TRIGGER_TRY_TIME_OUT = 2
NEWBIE_TRIGGER_CHARGE_COMPLETE = 3
NEWBIE_TRIGGER_OPEN_BANK = 4
NEWBIE_TRIGGER_BANK_GIVE_NEED_BIND_PHONE = 5
NEWBIE_TRIGGER_CONDITION_FINISH_NEWBIE = 1
NEWBIE_TRIGGER_CONDITION_SERVER_ENABLE = 2
NEWBIE_FINISH_FLAG = -1

NewbieManager.ctor = function (slot0)
	____shengsNebwie = true
	slot0._finishData = nil
	slot0._newbieConfig = nil
	slot0._stepConfig = nil
	slot0._introConfig = nil
	slot0._apiImp = nil
	slot0._curId = nil
	slot0._curStep = nil
	slot0._allNewbieFinish = false
end

NewbieManager.isInNewbie = function (slot0)
	slot3 = slot0

	return slot0.isEnable(slot2) and slot0._curId and slot0._curStep
end

NewbieManager.isInNewbieId = function (slot0, slot1)
	slot4 = slot0

	return slot0.isInNewbie(slot3) and slot0._curId == slot1
end

NewbieManager.isEnable = function (slot0)
	return slot0 and not IS_IOS_VERIFY
end

NewbieManager.isNewibeFinish = function (slot0, slot1)
	if slot0._finishData and slot0._finishData[slot1] == NEWBIE_FINISH_FLAG then
		return true
	end

	return false
end

NewbieManager.finishCurStep = function (slot0)
	slot3 = slot0

	if slot0.isInNewbie(slot2) then
		slot4 = slot0._curStep

		slot0.finishStep(slot2, slot0)
	end
end

NewbieManager.finishCurNewbie = function (slot0)
	slot3 = slot0

	if slot0.isInNewbie(slot2) then
		slot4 = slot0._curId

		slot0.finishNewbie(slot2, slot0)
	end
end

NewbieManager.finishStep = function (slot0, slot1)
	slot4 = slot0

	if slot0.isInNewbie(slot3) and slot0._stepConfig[slot1] then
		if slot2.nextId and slot2.nextId ~= 0 then
			slot0._finishData[slot0._curId] = slot1
			slot5 = slot0

			slot0.saveFinishData(slot0._curId)

			slot6 = slot2.nextId

			slot0.gotoAndPlayStep(slot0._curId, slot0)
		else
			slot6 = slot2.newbieId

			slot0.finishNewbie(slot4, slot0)
		end
	end
end

NewbieManager.finishNewbie = function (slot0, slot1)
	slot4 = slot0

	if slot0.isInNewbie(slot3) then
		slot0._finishData[slot1] = NEWBIE_FINISH_FLAG
		slot4 = slot0

		slot0.saveFinishData(NEWBIE_FINISH_FLAG)

		slot4 = slot0

		slot0.destroyNewbie(NEWBIE_FINISH_FLAG)

		slot0._curId = nil
		slot0._curStep = nil
	end
end

NewbieManager.checkBeginNewbie = function (slot0, slot1)
	slot5 = slot1

	print(slot3, "触发检测引导：")

	if slot0._allNewbieFinish then
		return
	end

	slot4 = slot0

	if slot0.isEnable(slot3) and slot0._curId == nil and slot0._curStep == nil then
		slot4 = slot0._newbieConfig

		for slot5, slot6 in pairs(slot3) do
			slot10 = slot6.id

			if not slot0.isNewibeFinish(slot8, slot0) and slot6.trigger == slot1 then
				slot10 = slot6

				if slot0.checkTriggerCondition(slot8, slot0) then
					slot12 = tostring(slot13)
					slot15 = slot6.id

					trace(string.format(slot10, "触发启动引导，触发类型：%s，触发引导：%s", tostring(slot1)))

					slot10 = slot6.id

					slot0.startNewbie(slot8, slot0)

					break
				end
			end
		end
	end
end

NewbieManager.checkTriggerCondition = function (slot0, slot1)
	slot2 = true
	slot5 = slot1.triggerCondition

	if StringUtil.isStringValid(slot4) then
		slot6 = "|"
		slot6 = string.split(slot4, slot1.triggerCondition)

		for slot7, slot8 in ipairs(slot1.triggerCondition) do
			slot12 = ":"

			if #string.split(slot10, slot8) >= 1 then
				slot15 = slot9[1]
				slot14 = slot9[2]

				if not slot0.isMeetCondition(slot11, slot0, tonumber(slot14)) then
					slot2 = false

					break
				end
			end
		end
	end

	return slot2
end

NewbieManager.isMeetCondition = function (slot0, slot1, slot2)
	slot3 = false

	if slot1 == NEWBIE_TRIGGER_CONDITION_FINISH_NEWBIE then
		slot6 = slot0
		slot4 = slot0.isNewibeFinish
		slot9 = slot2
		slot7 = tonumber(slot8) or 0

		if slot4(slot5, slot6) then
			slot3 = true
		end
	elseif slot1 == NEWBIE_TRIGGER_CONDITION_SERVER_ENABLE then
		slot7 = "新手引导触发检测，引导游戏ID：" .. Hero.getNewbie2GameKind(slot5)

		trace(Hero)

		if Hero.getNewbie2GameKind(slot5) and slot4 > 0 then
			slot8 = slot4

			if gameMgr.checkGamePackageState(slot6, gameMgr) ~= nil and slot5 ~= GAME_PACKAGE_STATE_UNAVAILABLE then
				if slot5 == GAME_PACKAGE_STATE_NEED_DOWNLOAD or slot5 == GAME_PACKAGE_STATE_NEED_UPDATE then
					slot9 = slot4

					gameMgr.downloadGame(slot7, gameMgr)

					slot8 = "新手下载游戏：" .. slot4

					trace(slot7)
				end

				slot3 = true
			end
		else
			slot10 = slot4

			trace(string.format(slot8, "新手引导停止，原因，没有标注引导游戏类型，gamekind：%s"))
		end
	end

	return slot3
end

NewbieManager.checkBeginNewbieNextFrame = function (slot0, slot1)
	function slot5()
		slot3 = slot1

		slot0.checkBeginNewbie(slot1, slot0)
	end

	tickMgr.nextFrameCall(slot3, tickMgr)
end

NewbieManager.startNewbie = function (slot0, slot1)
	slot0._curId = slot1
	slot3 = slot0._stepConfig[slot0._finishData[slot1]]

	if slot0._newbieConfig[slot1] then
		if slot3 and slot3.nextId == nil then
			slot8 = slot1

			slot0.finishNewbie(slot6, slot0)
		else
			slot8 = slot4.startStepId

			slot0.gotoAndPlayStep(slot6, slot0)
		end
	else
		slot9 = "未找到引导ID：%s"
		slot12 = slot1

		error(string.format(slot8, tostring(slot11)))
	end
end

NewbieManager.gotoAndPlayStep = function (slot0, slot1)
	slot4 = slot0

	if slot0.isEnable(slot3) and slot0._curStep ~= slot1 then
		slot0._curStep = slot1

		if slot0._stepConfig[slot1] then
			slot6 = slot2

			slot0.callApi(slot4, slot0)
		else
			slot5 = slot0

			slot0.destroyNewbie(slot4)

			slot7 = "未找到引导步骤：%s"
			slot10 = slot1

			error(string.format(slot6, tostring(slot9)))
		end
	end
end

NewbieManager.callApi = function (slot0, slot1)
	slot4 = slot0._apiImp

	slot0._apiImp.hideMask(slot3)

	slot5 = slot1

	slot0._apiImp.callApi(slot3, slot0._apiImp)
end

NewbieManager.destroyNewbie = function (slot0)
	slot3 = slot0._apiImp

	slot0._apiImp.destroyNewbie(slot2)
end

NewbieManager.cookConfig = function (slot0)
	if slot0._newbieConfig then
		return
	end

	slot3 = "c_newbie"
	slot0._newbieConfig = getCSVField(slot2)
	slot3 = "c_newbiestep"
	slot0._stepConfig = getCSVField(slot2)
	slot3 = "c_newbieintro"
	slot0._introConfig = getCSVField(slot2)
end

NewbieManager.getAllStepData = function (slot0)
	return slot0._stepConfig
end

NewbieManager.getIntroData = function (slot0, slot1)
	return slot0._introConfig[slot1]
end

NewbieManager.readFinishData = function (slot0)
	slot1 = {}
	slot5 = Hero.getNewbieData(slot3)

	if StringUtil.isStringValid(Hero) then
		slot6 = cjson.decode(slot4)

		for slot7, slot8 in pairs(slot2) do
			slot11 = slot7
			slot1[tonumber(slot10)] = slot8
		end
	end

	slot0._finishData = slot1
	slot3 = true
	slot6 = slot0._newbieConfig

	for slot7, slot8 in pairs(slot5) do
		if slot0._finishData[slot8.id] ~= NEWBIE_FINISH_FLAG then
			slot3 = false

			break
		end
	end

	slot0._allNewbieFinish = slot3
	slot7 = slot2

	trace(slot5, "新手读取数据：")
end

NewbieManager.saveFinishData = function (slot0)
	slot1 = {}
	slot4 = slot0._finishData

	for slot5, slot6 in pairs(slot3) do
		slot9 = slot5
		slot1[tostring(slot8)] = slot6
	end

	slot4 = slot1

	print_r(slot3)

	slot4 = Hero
	slot7 = slot1

	Hero.setNewbieData(slot3, cjson.encode(slot6))

	slot4 = "新手保存数据："
	slot7 = slot1

	trace(slot3, cjson.encode(slot6))
end

NewbieManager.deploy = function (slot0)
	slot3 = slot0

	slot0.cookConfig(slot2)

	slot3 = slot0

	slot0.readFinishData(slot2)

	if not slot0._apiImp then
		slot0._apiImp = NewbieApiImp.new()
	end
end

newbieMgr = NewbieManager.new()

return
