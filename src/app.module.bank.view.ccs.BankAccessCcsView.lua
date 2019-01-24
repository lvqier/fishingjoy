slot2 = "BankAccessCcsView"
BankAccessCcsView = class(slot1)

BankAccessCcsView.onCreationComplete = function (slot0)
	slot3 = slot0

	slot0.initSignal(slot2)

	slot3 = slot0

	slot0.onUserScoreChanged(slot2)

	slot3 = slot0

	slot0.onUserInsure(slot2)

	slot3 = slot0

	slot0.onBankStateInfoChanged(slot2)

	if NewbieUI then
		NewbieUI.bankViewGetBtn = slot0.btnQK
	end
end

BankAccessCcsView.initSignal = function (slot0)
	slot5 = slot0

	Hero.userScoreChangedSignal.add(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.add(slot2, Hero.userInsureChangedSignal, slot0.onUserInsure)

	slot5 = slot0

	mainMgr.bankStateInfoChangedSignal.add(slot2, mainMgr.bankStateInfoChangedSignal, slot0.onBankStateInfoChanged)
end

BankAccessCcsView.onBankStateInfoChanged = function (slot0)
	slot3 = mainMgr

	if not mainMgr.getBankStateInfo(slot2) or slot1.forceBind or slot1.tips == "" then
		slot5 = "温馨提示:充值、赠送的欢乐豆会存储到银行里"

		slot0.txtTs.setString(slot3, slot0.txtTs)
	else
		slot5 = "温馨提示:" .. slot1.tips

		slot0.txtTs.setString(slot3, slot0.txtTs)
	end
end

BankAccessCcsView.onUserScoreChanged = function (slot0)
	slot4 = slot0.btnCK.txtHld_tf
	slot8 = "#plist_font_yellow_5_%s.png"

	slot0.btnCK.txtHld_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserScore(slot2)))
end

BankAccessCcsView.onUserInsure = function (slot0)
	slot4 = slot0.btnQK.txtHld_tf
	slot8 = "#plist_font_yellow_5_%s.png"

	slot0.btnQK.txtHld_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserInsure(slot2)))
end

BankAccessCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.btnQK then
		slot6 = true

		slot0.model.setIsShowingBankGet(slot4, slot0.model)
	elseif slot1 == slot0.btnCK then
		slot6 = true

		slot0.model.setIsShowingBankSave(slot4, slot0.model)
	end
end

BankAccessCcsView.destroy = function (slot0)
	if NewbieUI then
		NewbieUI.bankViewGetBtn = nil
	end

	slot5 = slot0

	Hero.userScoreChangedSignal.remove(slot2, Hero.userScoreChangedSignal, slot0.onUserScoreChanged)

	slot5 = slot0

	Hero.userInsureChangedSignal.remove(slot2, Hero.userInsureChangedSignal, slot0.onUserInsure)

	slot5 = slot0

	mainMgr.bankStateInfoChangedSignal.remove(slot2, mainMgr.bankStateInfoChangedSignal, slot0.onBankStateInfoChanged)

	slot3 = slot0.btnQK

	destroySomeObj(slot2)

	slot3 = slot0.btnCK

	destroySomeObj(slot2)
end

return
