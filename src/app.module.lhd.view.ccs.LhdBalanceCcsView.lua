LhdBalanceCcsView = class("LhdBalanceCcsView")

LhdBalanceCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0:initMembers()
	slot0.model.balanceHistoryDataChangedSignal:add(slot0.evtBalanceHistoryData, slot0)
	slot0:evtBalanceHistoryData()
end

LhdBalanceCcsView.initMembers = function (slot0)
	slot0.labCount = {}

	for slot4 = 1, 20, 1 do
		slot0.view.layerResult["lab" .. slot4]:setVisible(false)
		table.insert(slot0.labCount, slot0.view.layerResult["lab" .. slot4])
	end

	slot0.firstPos = cc.p(820, 270)
	slot0.curShowPoints = {}
	slot0.imgPointsCache = {}
end

LhdBalanceCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingBalance(false)
	end
end

LhdBalanceCcsView.onShow = function (slot0)
	slot0.bPlayingBlink = false

	slot0:removeAllBalanceHisView()
	slot0:updateBalancePoints_SignelColor()
	slot0:updateBalanceEachWin()
	slot0:updateBalancePercent()
end

LhdBalanceCcsView.onHide = function (slot0)
	slot0.bPlayingBlink = false

	slot0:removeAllBalanceHisView()
end

LhdBalanceCcsView.evtBalanceHistoryData = function (slot0)
	slot0:removeAllBalanceHisView()
	slot0:updateBalancePercent()
	slot0:updateBalancePoints_SignelColor()
	slot0:updateBalanceEachWin()
end

LhdBalanceCcsView.removeAllBalanceHisView = function (slot0)
	for slot4 = #slot0.curShowPoints, 1, -1 do
		if slot0.curShowPoints[slot4] then
			slot0.curShowPoints[slot4]:setVisible(false)
			slot0.curShowPoints[slot4]:stopAllActions()
			slot0.curShowPoints[slot4]:setScale(1)
			table.insert(slot0.imgPointsCache, table.remove(slot0.curShowPoints, slot4))
		end
	end

	slot0.curShowPoints = {}
	slot1 = pairs
	slot2 = slot0.labCount or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5 then
			slot5:setVisible(false)

			slot5.num = 0
		end
	end
end

LhdBalanceCcsView.updateBalancePercent = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = 0
	slot4 = 0
	slot5 = 0

	for slot9 = 100, 101 - 20, -1 do
		if slot1[slot9] == LHD_BALANCE_DRAGON then
			slot3 = slot3 + 1
		elseif slot1[slot9] == LHD_BALANCE_TIGER then
			slot4 = slot4 + 1
		elseif slot1[slot9] == LHD_BALANCE_DRAW then
			slot5 = slot5 + 1
		end
	end

	slot7 = 0
	slot8 = 0

	if slot2 - slot5 <= 0 then
		slot7 = 0
		slot8 = 0
	else
		slot8 = 100 - math.floor(slot3 / slot6 * 100 + 0.5)
	end

	slot0.view.dragon_tf:setHtmlText(slot10)
	slot0.view.tiger_tf:setHtmlText(HtmlUtil.createArtNum(slot8, "#lhd_balance_%s.png", nil, nil, nil, -30) .. slot9)
end

LhdBalanceCcsView.updateBalancePoints_SignelColor = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = {}
	slot4 = 0
	slot5 = nil

	for slot9 = 100, 101 - slot0.model:getBalanceHistoryCount(), -1 do
		if slot5 ~= slot1[slot9] and slot4 + 1 > 20 then
			break
		end

		table.insert(slot3, slot1[slot9])

		slot5 = slot1[slot9]
	end

	slot6 = 20
	slot7 = 1
	slot5 = nil

	for slot11 = #slot3, 1, -1 do
		if slot3[slot11] ~= nil then
			if slot3[slot11] ~= LHD_BALANCE_ERROR and slot5 == nil then
				slot6 = 20
				slot7 = 1
			elseif slot5 == slot3[slot11] then
				slot7 = slot7 + 1
			else
				if slot6 - 1 < 1 then
					break
				end

				slot7 = 1
			end

			slot0:point2Panel_SignelColor(slot3[slot11], slot6, slot7, slot11 == 1)

			slot5 = slot3[slot11]
		else
			break
		end
	end
end

LhdBalanceCcsView.updateBalancePoints_CombaColor = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = 20
	slot4 = 1

	for slot8 = 101 - slot0.model:getBalanceHistoryCount(), 100, 1 do
		if slot1[slot8] ~= nil then
			if slot1[slot8] ~= LHD_BALANCE_ERROR then
				slot0:point2Panel_CombaColor(slot1[slot8], slot3, slot4)

				if slot4 + 1 > 5 then
					slot4 = 1

					if slot3 - 1 < 1 then
						break
					end
				end
			end
		else
			break
		end
	end
end

LhdBalanceCcsView.updateBalanceEachWin = function (slot0)
	slot1 = slot0.model:getBalanceHistoryData()
	slot3 = 0
	slot4 = 0
	slot5 = 0

	for slot9 = 100, 101 - slot0.model:getBalanceHistoryCount(), -1 do
		if slot1[slot9] == LHD_BALANCE_DRAGON then
			slot3 = slot3 + 1
		elseif slot1[slot9] == LHD_BALANCE_TIGER then
			slot4 = slot4 + 1
		elseif slot1[slot9] == LHD_BALANCE_DRAW then
			slot5 = slot5 + 1
		end
	end

	slot0.view.dragonCount:setText(slot3)
	slot0.view.tigerCount:setText(slot4)
	slot0.view.drawCount:setText(slot5)
	slot0.view.balanceCount:setText(slot2)
end

LhdBalanceCcsView.point2Panel_SignelColor = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = nil

	if slot3 > 6 then
		slot6.num = (slot0.labCount[slot2].num or 0) + 1

		slot6:setString("+" .. slot6.num)

		if DisplayUtil.rgb2ccc3(LHD_BALANCE_LABEL_COUNT_RGBA[slot1]) == nil then
			return
		end

		slot6:setTextColor(slot7)
		slot6:setVisible(true)

		slot5 = slot6
	else
		slot0.labCount[slot2]:setVisible(false)

		if slot0:getOneImgPoint(slot1) == nil then
			return
		end

		slot6:setPosition(cc.p(slot0.firstPos.x - (slot2 - 1) * 42, slot0.firstPos.y - (slot3 - 1) * 42))

		slot5 = slot6
	end

	if slot4 == true and slot5 ~= nil then
		slot5:stopAllActions()
		slot5:setScale(1)
		slot5:runAction(cc.Sequence:create(cc.ScaleTo:create(0.5, 1.3), cc.ScaleTo:create(0.5, 1), cc.ScaleTo:create(0.5, 1.3), cc.ScaleTo:create(0.5, 1), cc.ScaleTo:create(0.5, 1.3), cc.ScaleTo:create(0.5, 1), cc.CallFunc:create(function ()
			return
		end)))
	end
end

LhdBalanceCcsView.point2Panel_CombaColor = function (slot0, slot1, slot2, slot3)
	if slot0:getOneImgPoint(slot1) == nil then
		return
	end

	slot4:setPosition(cc.p(slot0.firstPos.x - (slot2 - 1) * 42, slot0.firstPos.y - (slot3 - 1) * 42))
end

LhdBalanceCcsView.getOneImgPoint = function (slot0, slot1)
	if slot1 ~= LHD_BALANCE_ERROR and LHD_BALANCE_POINTS[slot1] then
		slot3 = nil

		if #slot0.imgPointsCache > 0 then
			table.remove(slot0.imgPointsCache, slot2):setTexture(LHD_BALANCE_POINTS[slot1])
		else
			slot0.view.layerResult:addChild(display.newSprite(LHD_BALANCE_POINTS[slot1]))
		end

		slot3:setVisible(true)
		table.insert(slot0.curShowPoints, slot3)

		return slot3
	end
end

LhdBalanceCcsView.destroy = function (slot0)
	slot0.model.balanceHistoryDataChangedSignal:remove(slot0.evtBalanceHistoryData, slot0)
	destroySomeObj(slot0.view.btnClose)
	ZoomPopUpChildView.destroy(slot0)
end

return
