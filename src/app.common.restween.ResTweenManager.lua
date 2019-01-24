slot0 = class(slot1)
slot3 = "restween.strategy.BaseResTweenStrategy"

requireLuaFromCommon("ResTweenManager")

slot0.ctor = function (slot0)
	slot0._strategyDic = {}
end

slot0.resetState4Relogin = function (slot0)
	slot3 = slot0._strategyDic

	for slot4, slot5 in pairs(slot2) do
		slot8 = slot5

		slot5.resetState4Relogin(slot7)
	end
end

slot0.setIsHold = function (slot0, slot1)
	slot4 = slot0._strategyDic

	for slot5, slot6 in pairs(slot3) do
		slot10 = slot1

		slot6.setIsHold(slot8, slot6)
	end
end

slot0.deploy = function (slot0)
	slot3 = resMgr
	slot6 = "mapassets.plist"

	resMgr.loadTextureAtlas(slot2, ResConfig.getSpriteSheetPath(slot5))

	slot4 = getCSVField(slot2)

	for slot5, slot6 in pairs("c_res") do
		if slot0._strategyDic[slot5] then
			slot10 = slot7

			slot7.resetData(slot9)
		else
			slot10 = slot6.property
			slot12 = slot6.property
			slot10 = Hero["get" .. StringUtil.upperFirstChar(slot11)]
			slot11 = Hero[StringUtil.lowerFirstChar(slot9) .. "ChangedSignal"]
			slot15 = "mapassets_icon_res_" .. slot5 .. ".png"
			slot13 = resMgr.getTpFrame(slot13, resMgr) or slot6.icon

			if slot10 and slot11 then
				slot19 = slot10
				slot19 = slot5
				slot14 = BaseResTweenStrategy.new(slot15, handler(slot17, Hero), slot11, slot13)
				slot0._strategyDic[slot5] = slot14
				slot17 = slot14

				slot14.deploy(handler(slot17, Hero))
			end
		end
	end
end

slot0.clearAllTrigger = function (slot0, slot1)
	slot4 = slot0._strategyDic[slot1]

	slot0._strategyDic[slot1].clearTriggers(slot3)
end

slot0.clearAllTriggers = function (slot0)
	slot3 = slot0._strategyDic

	for slot4, slot5 in pairs(slot2) do
		slot9 = slot4

		slot0.clearAllTrigger(slot7, slot0)
	end
end

slot0.removeTrigger = function (slot0, slot1, slot2)
	if slot1 then
		slot6 = slot1

		slot0._strategyDic[slot2].removeTrigger(slot4, slot0._strategyDic[slot2])
	end
end

slot0.removeAllTrigger = function (slot0, slot1)
	if slot1 then
		slot4 = slot0._strategyDic

		for slot5, slot6 in pairs(slot3) do
			slot10 = slot1

			slot6.removeTrigger(slot8, slot6)
		end
	end
end

slot0.pushAllTrigger = function (slot0, slot1)
	if slot1 then
		slot4 = slot0._strategyDic

		for slot5, slot6 in pairs(slot3) do
			slot11 = slot5

			slot0.pushTrigger(slot8, slot0, slot1)
		end
	end
end

slot0.pushTrigger = function (slot0, slot1, slot2)
	if slot1 then
		slot6 = slot1

		slot0._strategyDic[slot2].pushTrigger(slot4, slot0._strategyDic[slot2])
	end
end

slot0.setResPaneByType = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0._strategyDic[slot2].setResAddPane(slot4, slot0._strategyDic[slot2])
end

slot0.removeTempResPane = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0._strategyDic[slot2].removeTempResPane(slot4, slot0._strategyDic[slot2])
end

slot0.pushTempResPane = function (slot0, slot1, slot2)
	slot6 = slot1

	slot0._strategyDic[slot2].pushTempResPane(slot4, slot0._strategyDic[slot2])
end

slot0.setResPanes = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot11 = ResType.money

	slot0.setResPaneByType(slot8, slot0, slot2)

	slot11 = ResType.diamond

	slot0.setResPaneByType(slot8, slot0, slot1)

	slot11 = ResType.food

	slot0.setResPaneByType(slot8, slot0, slot3)

	slot11 = ResType.steel

	slot0.setResPaneByType(slot8, slot0, slot5)

	slot11 = ResType.knowledge

	slot0.setResPaneByType(slot8, slot0, slot4)

	slot11 = ResType.drug

	slot0.setResPaneByType(slot8, slot0, slot6)
end

resTweenMgr = slot0.new()

return
