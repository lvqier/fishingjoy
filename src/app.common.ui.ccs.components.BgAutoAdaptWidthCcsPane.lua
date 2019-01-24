slot2 = "BgAutoAdaptWidthCcsPane"
BgAutoAdaptWidthCcsPane = class(slot1)

BgAutoAdaptWidthCcsPane.onCreationComplete = function (slot0)
	slot10 = 0
	slot9 = false
	slot13 = slot0.onScaleRect

	createSetterGetter(slot2, slot0, "scaleRect", cc.rect(slot6, 0, 0, 0), nil, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onStrTxt

	createSetterGetter(slot2, slot0, "strTxt", "", nil, false, false, handler(slot11, slot0))

	slot5 = 0

	createSetterGetter(slot2, slot0, "strBaseWidth")

	slot8 = false
	slot12 = slot0.onIsAutoHAlignCenter

	createSetterGetter(slot2, slot0, "isAutoHAlignCenter", true, false, false, handler(handler, slot0))

	slot0._newTxt = slot0.txt or slot0.txt_tf
	slot4 = slot0._newTxt
	slot2 = slot0._newTxt.getPositionX(slot3)
	slot0._newTxt._posX = slot2
	slot3 = slot0
	slot0._anchorX = slot0.getAnchorPoint(slot2).x
	slot3 = slot0.bg
	slot0._bgBaseSize = slot0.bg.getContentSize(slot2)
	slot3 = slot0.bg
	slot0._scaleRect = slot0.bg.getCapInsets(slot2)

	if slot0._newTxt.__cname == "TextField" then
		slot3 = slot0._newTxt
		slot0._strBaseWidth = slot0._newTxt.getTextWidth(slot2)
	else
		slot3 = slot0._newTxt

		if tolua.type(slot2) == "ccui.Text" or slot1 == "ccui.TextAtlas" or slot1 == "ccui.TextBMFont" then
			slot4 = slot0._newTxt
			slot0._strBaseWidth = slot0._newTxt.getContentSize(slot3).width
		end
	end

	if slot0.btnAdd then
		slot4 = IS_IOS_VERIFY_BANK or not IS_IOS_VERIFY or IS_IOS_VERIFY_ALL or not IS_YYB_VERIFY or IS_SDK_VERIFY

		DisplayUtil.setVisible(slot2, slot0.btnAdd)
	end

	if slot0.btnAdd then
		slot3 = slot0.btnAdd
		slot0._btnAddPosX = slot0.btnAdd.getPositionX(slot2)
	end

	if slot0.icon then
		slot3 = slot0.icon
		slot0._iconPosX = slot0.icon.getPositionX(slot2)
	end

	slot3 = slot0
	slot7 = slot0.onDisplayListStateChanged

	slot0.registerScriptHandler(slot2, handler(slot5, slot0))
end

BgAutoAdaptWidthCcsPane.onDisplayListStateChanged = function (slot0, slot1)
	if slot1 == "enter" then
		slot0._canUpdate = true
		slot4 = slot0

		slot0.onStrTxt(slot3)
	elseif slot1 == "exit" then
		slot0._canUpdate = false
	end
end

BgAutoAdaptWidthCcsPane.onScaleRect = function (slot0)
	slot4 = slot0._scaleRect

	slot0.bg.setCapInsets(slot2, slot0.bg)
end

BgAutoAdaptWidthCcsPane.onStrTxt = function (slot0)
	if slot0._canUpdate then
		slot1 = 0

		if slot0._newTxt.__cname == "TextField" then
			slot5 = slot0._strTxt

			slot0._newTxt.setHtmlText(slot3, slot0._newTxt)

			slot4 = slot0._newTxt
			slot1 = slot0._newTxt.getTextWidth(slot3)
		else
			slot4 = slot0._newTxt

			if tolua.type(slot3) == "ccui.Text" or slot2 == "ccui.TextAtlas" or slot2 == "ccui.TextBMFont" then
				slot6 = slot0._strTxt

				slot0._newTxt.setString(slot4, slot0._newTxt)

				slot5 = slot0._newTxt
				slot1 = slot0._newTxt.getContentSize(slot4).width
			end
		end

		slot6 = slot0.bg
		slot10 = slot0._bgBaseSize.height

		slot0.bg.setContentSize(slot5, cc.size(slot8, slot0._bgBaseSize.width + ((slot1 - slot0._strBaseWidth <= 0 and 0) or slot2)))

		if slot0.btnAdd then
			slot7 = slot0._btnAddPosX + (1 - slot0._anchorX) * slot3

			slot0.btnAdd.setPositionX(slot5, slot0.btnAdd)
		end

		if slot0.icon then
			slot7 = slot0._iconPosX - slot0._anchorX * slot3

			slot0.icon.setPositionX(slot5, slot0.icon)
		end

		if slot0._isAutoHAlignCenter then
			if slot2 < 0 and slot0._newTxt.__cname == "TextField" then
				slot2 = -slot2

				if slot0._anchorX == 0 then
					slot6 = slot0._newTxt

					if slot0._newTxt.getHAlign(slot5) == TextField.H_LEFT then
						slot7 = slot0._newTxt._posX + slot2 / 2

						slot0._newTxt.setPositionX(slot5, slot0._newTxt)
					end
				elseif slot0._anchorX == 1 then
					slot6 = slot0._newTxt

					if slot0._newTxt.getHAlign(slot5) == TextField.H_RIGHT then
						slot7 = slot0._newTxt._posX - slot2 / 2

						slot0._newTxt.setPositionX(slot5, slot0._newTxt)
					end
				end
			else
				slot7 = slot0._newTxt._posX

				slot0._newTxt.setPositionX(slot5, slot0._newTxt)
			end
		end
	end
end

BgAutoAdaptWidthCcsPane.onIsAutoHAlignCenter = function (slot0)
	if not slot0._isAutoHAlignCenter then
		slot4 = slot0._newTxt._posX

		slot0._newTxt.setPositionX(slot2, slot0._newTxt)
	end
end

BgAutoAdaptWidthCcsPane.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnAdd or slot1 == slot0.btnAdd2 then
		if slot0.controller then
			if slot0.controller.try2OpenBank then
				slot5 = slot0.controller

				slot0.controller.try2OpenBank(slot4)
			elseif slot0.controller.openBankModule then
				slot5 = slot0.controller

				slot0.controller.openBankModule(slot4)
			end
		end
	elseif slot1 == slot0.btnBank and slot0.controller then
		if slot0.controller.try2OpenBank then
			slot5 = slot0.controller

			slot0.controller.try2OpenBank(slot4)
		elseif slot0.controller.openBankModule then
			slot5 = slot0.controller

			slot0.controller.openBankModule(slot4)
		end
	end
end

BgAutoAdaptWidthCcsPane.destroy = function (slot0)
	slot3 = slot0.btnAdd

	destroySomeObj(slot2)

	slot3 = slot0.btnAdd2

	destroySomeObj(slot2)

	slot3 = slot0.btnBank

	destroySomeObj(slot2)

	slot3 = slot0.txt_tf

	destroySomeObj(slot2)
end

return
