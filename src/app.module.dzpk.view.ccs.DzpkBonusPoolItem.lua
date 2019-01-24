slot2 = "DzpkBonusPoolItem"
DzpkBonusPoolItem = class(slot1)

DzpkBonusPoolItem.onCreationComplete = function (slot0)
	slot13 = slot0.onData

	createSetterGetter(slot2, slot0, "data", nil, nil, nil, nil, handler(slot11, slot0))

	slot3 = slot0

	slot0.init(slot2)
end

DzpkBonusPoolItem.init = function (slot0)
	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot3 = slot0.Ysz_Battle_dk4
	slot0.infobgWidth = slot0.Ysz_Battle_dk4.getContentSize(slot2).width
	slot3 = slot0.Ysz_Battle_dk4
	slot0.infobgHeight = slot0.Ysz_Battle_dk4.getContentSize(slot2).height
	slot0.offsetWidth = 33
	slot0.toplayer = {}
end

DzpkBonusPoolItem.onData = function (slot0)
	if slot0._data == nil or slot0._data == 0 then
		slot4 = false

		slot0.setVisible(slot2, slot0)

		slot0.toplayer = {}

		return
	end

	slot4 = true

	slot0.setVisible(slot2, slot0)

	slot6, slot2 = slot0.controller.getIScore(slot2, slot0.controller)

	slot0.txt.setString((slot0._data > 0 and slot0._data) or 0, slot0.txt)

	slot5 = slot0.Ysz_Battle_dk4
	slot11 = slot0.txt
	slot9 = slot0.infobgHeight

	slot0.Ysz_Battle_dk4.setContentSize((slot0._data > 0 and slot0._data) or 0, cc.size(slot7, slot0.offsetWidth + slot0.txt.getContentSize(slot10).width + 12))

	slot3 = 1
	slot7 = slot0.model

	if slot0._data <= 10 * slot0.model.getBigRaise(cc.size) then
		slot3 = 1
	else
		slot7 = slot0.model

		if slot0._data <= 50 * slot0.model.getBigRaise(slot6) then
			slot3 = 2
		else
			slot7 = slot0.model

			if slot0._data <= 100 * slot0.model.getBigRaise(slot6) then
				slot3 = 3
			else
				slot7 = slot0.model

				if slot0._data <= 200 * slot0.model.getBigRaise(slot6) then
					slot3 = 4
				else
					slot7 = slot0.model

					if slot0._data > 200 * slot0.model.getBigRaise(slot6) then
						slot3 = 5
					end
				end
			end
		end
	end

	slot6 = slot0.icon
	slot10 = "common/texasHoldem_c" .. slot3 .. ".png"

	slot0.icon.setTexture(slot5, slot0.controller.getUIPath(slot8, slot0.controller))
end

DzpkBonusPoolItem.pushPlayer = function (slot0, slot1)
	if slot1 ~= nil and slot1 > 0 then
		slot5 = slot1

		table.insert(slot3, slot0.toplayer)
	end
end

DzpkBonusPoolItem.popPlayer = function (slot0, slot1)
	if slot1 ~= nil and slot1 > 0 then
		for slot5 = 1, #slot0.toplayer, 1 do
			if slot0.toplayer[slot5] == slot1 then
				slot0.toplayer[slot5] = nil
			end
		end
	end
end

DzpkBonusPoolItem.isPoor = function (slot0)
	return #slot0.toplayer <= 0
end

DzpkBonusPoolItem.reset = function (slot0)
	slot4 = false

	slot0.setVisible(slot2, slot0)

	slot0.toplayer = {}
	slot0._data = nil
end

return
