slot2 = "BaseInfoMineCcsPane"
BaseInfoMineCcsPane = class(slot1)

BaseInfoMineCcsPane.onCreationComplete = function (slot0)
	slot0._canUpdate = false
	slot9 = false
	slot13 = slot0.onStrBaseWidthChanged

	createSetterGetter(slot2, slot0, "strBaseWidth", 0, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onUserScoreChanged

	createSetterGetter(slot2, slot0, "artFileName", nil, false, false, false, handler(slot11, slot0))

	slot9 = false
	slot13 = slot0.onIconSpineNameChanged

	createSetterGetter(slot2, slot0, "iconSpineName", nil, false, false, false, handler(slot11, slot0))

	slot5 = false

	createSetterGetter(slot2, slot0, "isHansUnits")

	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.onPNickName(slot2)

	slot3 = slot0

	slot0.onStrBaseWidthChanged(slot2)
end

BaseInfoMineCcsPane.initSignal = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)
	Hero.pNickNameChangedSignal.add(slot2, Hero.pNickNameChangedSignal, slot0.onPNickName)

	slot3 = slot0
	slot7 = slot0.onDisplayListStateChanged

	slot0.registerScriptHandler(slot2, handler(slot0, slot0))
end

BaseInfoMineCcsPane.onDisplayListStateChanged = function (slot0, slot1)
	if slot1 == "enter" then
		slot0._canUpdate = true
		slot4 = slot0

		slot0.onUserScoreChanged(slot3)
	elseif slot1 == "exit" then
		slot0._canUpdate = false
	end
end

BaseInfoMineCcsPane.onIconSpineNameChanged = function (slot0)
	if slot0._iconSpineName and slot0.scoreInfo.icon then
		slot4 = slot0._iconSpineName
		slot1 = slot0.controller.createSpine(slot2, slot0.controller)
		slot4 = slot1
		slot7 = slot0.scoreInfo.icon

		slot1.setPosition(slot0.controller, slot0.scoreInfo.icon.getPosition(slot6))

		slot7 = true

		slot1.setAnimation(slot0.controller, slot1, 0, "animation")

		slot5 = slot1

		slot0.scoreInfo.addChild(slot0.controller, slot0.scoreInfo)

		slot4 = slot0.scoreInfo.icon

		slot0.scoreInfo.icon.removeFromParent(slot0.controller)

		slot0.scoreInfo.icon = slot1
	end
end

BaseInfoMineCcsPane.onUserScoreChanged = function (slot0)
	if slot0._canUpdate then
		slot1 = ""

		if slot0._artFileName then
			if slot0._isHansUnits then
				slot6 = Hero
				slot5 = slot0._artFileName
				slot1 = HtmlUtil.createArtNumWithHansUnits(slot3, Hero.getUserScore(slot5))
			else
				slot6 = Hero
				slot5 = slot0._artFileName
				slot1 = HtmlUtil.createArtNumDot(slot3, Hero.getUserScore(slot5))
			end
		elseif slot0._isHansUnits then
			slot6 = Hero
			slot1 = MathUtil.cookNumWithHansUnits(Hero.getUserScore(slot5))
		else
			slot6 = Hero
			slot1 = StringUtil.numberStr2FormatNumberStr(Hero.getUserScore(slot5))
		end

		slot6 = true

		slot0.scoreInfo.setStrTxt(slot3, slot0.scoreInfo, slot1)

		slot6 = GAME_STATE.ROOM

		slot0.controller.setHeadBg(slot3, slot0.controller, slot0.head)
	end
end

BaseInfoMineCcsPane.onStrBaseWidthChanged = function (slot0)
	if slot0._strBaseWidth then
		slot4 = slot0._strBaseWidth

		slot0.scoreInfo.setStrBaseWidth(slot2, slot0.scoreInfo)
	end
end

BaseInfoMineCcsPane.onPNickName = function (slot0)
	slot3 = slot0.txtName
	slot8 = Hero
	slot9 = 1.5

	slot0.txtName.setString(slot2, StringUtil.truncate(slot5, Hero.getPNickName(slot7), 10, nil))
end

BaseInfoMineCcsPane.destroy = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.pNickNameChangedSignal.remove(slot2, Hero.pNickNameChangedSignal, slot0.onPNickName)

	slot3 = slot0.head

	destroySomeObj(slot2)

	slot3 = slot0.scoreInfo

	destroySomeObj(slot2)
end

return
