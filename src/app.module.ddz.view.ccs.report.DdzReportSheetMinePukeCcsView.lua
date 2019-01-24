slot2 = "DdzReportSheetMinePukeCcsView"
DdzReportSheetMinePukeCcsView = class(slot1)

DdzReportSheetMinePukeCcsView.onCreationComplete = function (slot0)
	slot5 = slot0

	slot0.model.curIdxChangedSignal.add(slot2, slot0.model.curIdxChangedSignal, slot0.onCurIdxChanged)

	slot3 = slot0

	slot0.initPukeNode(slot2)
end

DdzReportSheetMinePukeCcsView.initPukeNode = function (slot0)
	slot3 = slot0.handSheetPukeNode

	slot0.handSheetPukeNode.removeAllChildren(slot2)

	slot3 = slot0.outSheetPukeNode

	slot0.outSheetPukeNode.removeAllChildren(slot2)

	slot0._outPukeNodes = {}
	slot0._pukeNodes = {}
	slot0._outPukeCsbPath = "common/DdzOutPuke.csb"
	slot0._pukeCsbPath = "common/DdzHandPuke.csb"
	slot0._outPukeWidth = 82.5
	slot0._pukeWidth = 165
	slot0._outPukeGap = 38
	slot0._pukeGapMin = 59.5
	slot0._pukeGapMax = 68
	slot3 = slot0

	slot0.resetHandAndOutNodeSize(59.5)

	for slot4 = 1, 20, 1 do
		slot10 = slot0._pukeCsbPath
		slot5 = ResConfig.loadCsNode(slot0.controller.getCsbPathBB(slot8, slot0.controller))
		slot11 = slot0._outPukeCsbPath
		slot6 = ResConfig.loadCsNode(slot0.controller.getCsbPathBB(slot0.controller, slot0.controller))
		slot11 = slot4
		slot12 = slot4
		slot11 = slot5
		slot15 = 0

		slot5.setAnchorPoint(slot0.controller, cc.p(slot13, 0))

		slot11 = slot5
		slot15 = 0

		slot5.setPosition(slot0.controller, cc.p(slot13, slot7))

		slot11 = slot6
		slot15 = 0

		slot6.setAnchorPoint(slot0.controller, cc.p(slot13, 0))

		slot11 = slot6
		slot15 = 0

		slot6.setPosition(slot0.controller, cc.p(slot13, slot0.controller.calSheetPukeNodePosX(slot0.controller, slot0.controller, slot0._outPukeGap)))

		slot12 = slot5

		table.insert(slot0.controller, slot0._pukeNodes)

		slot12 = slot6

		table.insert(slot0.controller, slot0._outPukeNodes)

		slot12 = slot5

		slot0.handSheetPukeNode.addChild(slot0.controller, slot0.handSheetPukeNode)

		slot12 = slot6

		slot0.outSheetPukeNode.addChild(slot0.controller, slot0.outSheetPukeNode)
	end
end

DdzReportSheetMinePukeCcsView.onCurIdxChanged = function (slot0)
	slot3 = slot0.model

	if slot0.model.getCurIdx(slot2) == -1 then
		slot3 = (table.nums(slot0.model) > 17 and slot0._pukeGapMin) or slot0._pukeGapMax
		slot9 = slot2.handcard

		slot0.resetHandAndOutNodeSize(slot0.model.getReportUsersInfoDic(slot3)[DDZ_VIEW_CHAIRID_ME].handcard, slot0, table.nums(1))

		slot7 = false

		slot0.outSheetPukeNode.setVisible(slot0.model.getReportUsersInfoDic(slot3)[DDZ_VIEW_CHAIRID_ME].handcard, slot0.outSheetPukeNode)

		slot7 = false

		slot0.buchu.setVisible(slot0.model.getReportUsersInfoDic(slot3)[DDZ_VIEW_CHAIRID_ME].handcard, slot0.buchu)

		slot6 = slot0._pukeNodes

		for slot7, slot8 in ipairs(slot5) do
			slot12 = slot2.handcard[slot7] ~= nil

			slot8.setVisible(slot10, slot8)

			if slot2.handcard[slot7] ~= nil then
				slot13 = slot7
				slot13 = slot2.handcard[slot7]

				slot8.root.puke.root.setDataInt(slot0.controller, slot8.root.puke.root)

				slot12 = slot8
				slot16 = 0

				slot8.setPosition(slot0.controller, cc.p(slot14, slot0.controller.calSheetPukeNodePosX(slot10, slot0.controller, slot3)))
			end
		end
	elseif slot1 >= 0 then
		slot6 = slot0.model

		if slot1 < table.nums(slot0.model.getReportStepDatasDic(slot5)) then
			slot4 = slot0.model

			if slot0.model.getReportStepDatasDic(slot3)[slot1].chairid ~= slot0.model._viewChairIdDic[DDZ_VIEW_CHAIRID_ME] then
				slot7 = slot0.model

				if slot0.model.getWinnerDic(slot6)[slot1] then
					slot8 = false

					slot0.outSheetPukeNode.setVisible(slot6, slot0.outSheetPukeNode)

					slot8 = false

					slot0.buchu.setVisible(slot6, slot0.buchu)

					return
				else
					return
				end
			end

			slot8 = table.nums(slot9)
			slot11 = slot4.outcard

			slot0.resetHandAndOutNodeSize(slot6, slot0, table.nums(slot4.handcard))

			slot8 = true

			slot0.outSheetPukeNode.setVisible(slot6, slot0.outSheetPukeNode)

			slot7 = slot0.buchu
			slot5 = slot0.buchu.setVisible

			if slot4.outcard ~= nil then
				slot10 = slot4.outcard
				slot8 = table.nums(slot9) == 0

				slot5(slot6, slot7)

				slot7 = slot4.handcard
				slot5 = (table.nums(slot6) > 17 and slot0._pukeGapMin) or slot0._pukeGapMax
				slot8 = slot0._pukeNodes

				for slot9, slot10 in ipairs(slot7) do
					slot14 = slot4.handcard[slot9] ~= nil

					slot10.setVisible(slot12, slot10)

					if slot4.handcard[slot9] ~= nil then
						slot15 = slot9
						slot16 = true

						slot10.root.puke.root.setDataInt(slot0.controller, slot10.root.puke.root, slot4.handcard[slot9])

						slot15 = slot0.controller.calSheetPukeNodePosX(slot12, slot0.controller, slot5)

						slot10.setPositionX(slot0.controller, slot10)
					end
				end

				slot8 = slot0._outPukeNodes

				for slot9, slot10 in ipairs(slot7) do
					slot14 = slot4.outcard[slot9] ~= nil

					slot10.setVisible(slot12, slot10)

					if slot4.outcard[slot9] ~= nil then
						slot15 = slot9
						slot16 = true

						slot10.root.setDataInt(slot0.controller, slot10.root, slot4.outcard[slot9])

						slot15 = slot0.controller.calSheetPukeNodePosX(slot12, slot0.controller, slot0._outPukeGap)

						slot10.setPositionX(slot0.controller, slot10)
					end
				end
			end
		end
	end
end

DdzReportSheetMinePukeCcsView.resetHandAndOutNodeSize = function (slot0, slot1, slot2)
	slot9 = ((slot1 or 20) > 17 and slot0._pukeGapMin) or slot0._pukeGapMax
	slot8 = slot0.handSheetPukeNode
	slot14 = slot0.handSheetPukeNode
	slot12 = slot0.handSheetPukeNode.getContentSize(slot13).height

	slot0.handSheetPukeNode.setContentSize(slot0.controller, cc.size(slot0._outPukeGap, slot4))

	slot8 = slot0.outSheetPukeNode
	slot14 = slot0.outSheetPukeNode
	slot12 = slot0.outSheetPukeNode.getContentSize(slot13).height

	slot0.outSheetPukeNode.setContentSize(slot0.controller, cc.size(slot0._outPukeGap, slot0.controller.calSheetPukeNodeWidth(slot0.controller, slot0.controller, slot2 or 20, slot0._outPukeWidth)))
end

return
