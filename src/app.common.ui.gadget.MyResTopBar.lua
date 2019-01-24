function slot3()
	return display.newLayer()
end

MyResTopBar = class(slot1, "MyResTopBar")

MyResTopBar.ctor = function (slot0, slot1)
	slot0._resOrItemPanes = {}
	slot0._curShowingResOrItemPanes = {}
	slot0._resTypesOrItemVos = {}
	slot5 = slot1

	slot0.pushResesOrItemVos(slot3, slot0)

	slot4 = slot0

	slot0.retain(slot3)
end

MyResTopBar.createResOrItemPane = function (slot0, slot1)
	slot2 = nil
	slot5 = slot1

	if type(slot4) == "table" then
		slot8 = slot0
		slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MyItemTopPane.csb", false)
	else
		slot8 = slot0
		slot2 = ccsPoolMgr.get(slot4, ccsPoolMgr, "csb/common/MyResTopPane.csb", false)
	end

	slot6 = slot2

	table.insert(slot4, slot0._resOrItemPanes)

	slot6 = slot2

	slot0.addChild(slot4, slot0)

	if slot2.setType then
		slot6 = slot1

		slot2.setType(slot4, slot2)
	elseif slot2.setItemVo then
		slot6 = slot1

		slot2.setItemVo(slot4, slot2)
	end

	return slot2
end

MyResTopBar.pushResesOrItemVos = function (slot0, slot1)
	slot4 = slot0

	slot0.removeAllPanes(slot3)

	if slot1 and #slot1 > 0 then
		slot4 = slot1

		for slot5, slot6 in ipairs(slot3) do
			slot10 = slot6
			slot11 = false

			DisplayUtil.setVisible(slot0, slot7)

			slot11 = slot6

			table.insert(slot0, slot0._resTypesOrItemVos)
		end
	end
end

MyResTopBar.removeAllPanes = function (slot0)
	slot3 = slot0._resOrItemPanes

	for slot4, slot5 in pairs(slot2) do
		if slot5.getType then
			slot9 = slot5
			slot12 = slot5

			resTweenMgr.removeTempResPane(slot7, resTweenMgr, slot5.getType(slot11))
		end

		slot9 = slot5

		ccsPoolMgr.put(slot7, ccsPoolMgr)
	end

	slot0._resOrItemPanes = {}
	slot0._curShowingResOrItemPanes = {}
	slot0._resTypesOrItemVos = {}
end

MyResTopBar.onHide = function (slot0, slot1)
	slot2 = 0.2

	if slot1 then
		slot2 = 0
	end

	slot5 = slot0._curShowingResOrItemPanes

	for slot6, slot7 in ipairs(slot4) do
		if slot7.getType then
			slot11 = slot7
			slot14 = slot7

			resTweenMgr.removeTempResPane(slot9, resTweenMgr, slot7.getType(slot13))
		end

		slot12 = {
			autoAlpha = 0
		}

		TweenLite.to(slot9, slot7, slot2)
	end
end

MyResTopBar.onShow = function (slot0, slot1)
	slot2 = 0.2

	if slot1 then
		slot2 = 0
	end

	slot0._curShowingResOrItemPanes = {}
	slot5 = slot0._resOrItemPanes

	for slot6, slot7 in ipairs(slot4) do
		slot8 = true

		if slot7.getType then
			slot11 = Hero
			slot14 = slot7
			slot8 = Hero.isMainResOpen(slot10, slot7.getType(slot13))
		end

		slot12 = slot8

		slot7.setVisible(slot10, slot7)

		if slot8 then
			slot12 = slot7

			table.insert(slot10, slot0._curShowingResOrItemPanes)
		end
	end

	slot5 = slot0

	slot0.checkPositions(slot4)

	slot5 = slot0._curShowingResOrItemPanes

	for slot6, slot7 in ipairs(slot4) do
		if slot7.getType then
			slot11 = slot7
			slot14 = slot7

			resTweenMgr.pushTempResPane(slot9, resTweenMgr, slot7.getType(slot13))
		end

		slot12 = {
			autoAlpha = 1
		}

		TweenLite.to(slot9, slot7, slot2)
	end
end

MyResTopBar.checkPositions = function (slot0)
	if #slot0._curShowingResOrItemPanes > 0 then
		slot5 = slot0._curShowingResOrItemPanes[1]
		slot4 = (slot0._curShowingResOrItemPanes[1].getContentSize(slot4).width + 15) * slot1 - 15
		slot7 = slot0._curShowingResOrItemPanes

		for slot8, slot9 in ipairs(slot6) do
			slot17 = slot8 - 1
			slot13 = -0.5 * slot4 + (slot8 - 1) * slot3 + math.max(slot15, 0) * slot2

			slot9.setPositionX(slot11, slot9)
		end
	end
end

MyResTopBar.destroy = function (slot0)
	if slot0._resOrItemPanes then
		slot3 = slot0._resOrItemPanes

		for slot4, slot5 in ipairs(slot2) do
			if slot5.getType then
				slot9 = slot5
				slot12 = slot5

				resTweenMgr.removeTempResPane(slot7, resTweenMgr, slot5.getType(slot11))
			end

			slot9 = slot5

			ccsPoolMgr.put(slot7, ccsPoolMgr)
		end

		slot0._curShowingResOrItemPanes = nil
		slot0._resOrItemPanes = nil
	end

	slot3 = slot0

	slot0.removeFromParent(slot2)

	slot3 = slot0

	slot0.release(slot2)
end

return
