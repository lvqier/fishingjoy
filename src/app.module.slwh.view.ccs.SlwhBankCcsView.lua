slot2 = "SlwhBankCcsView"
SlwhBankCcsView = class(slot1)

SlwhBankCcsView.onCreationComplete = function (slot0)
	slot4 = BaseBankTakePopupCcsView

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	BaseBankTakePopupCcsView.onCreationComplete(slot2)

	slot0._originPlaceHolder = slot0._inputPwd._placeHolder
end

SlwhBankCcsView.onZoomShowTweenComplete = function (slot0)
	slot3 = slot0

	BaseBankTakePopupCcsView.onZoomShowTweenComplete(slot2)

	if slot0._inputPwd._editBox then
		slot4 = slot1

		for slot6 = 1, #slot1.getChildren(slot3), 1 do
			if slot2[slot6].getString then
				slot10 = slot7

				if slot7.getString(slot9) == slot0._originPlaceHolder then
					slot11 = cc.WHITE

					slot7.setColor(slot9, slot7)

					break
				end
			end
		end
	end
end

SlwhBankCcsView.onUserInsureChanged = function (slot0)
	slot5 = Hero.getUserInsure(slot2)

	slot0.view.sliderControl.setMaxValue(Hero, slot0.view.sliderControl)

	slot4 = slot0.view.txtDeposit_tf
	slot8 = "#slwh_bank_%s.png"

	slot0.view.txtDeposit_tf.setHtmlText(Hero, HtmlUtil.createArtNumDot(slot6, Hero.getUserInsure(slot2)))
end

SlwhBankCcsView.onUserScoreChanged = function (slot0)
	slot5 = Hero
	slot4 = slot0.view.txtCash_tf
	slot8 = "#slwh_bank_%s.png"

	slot0.view.txtCash_tf.setHtmlText(Hero.getUserScore, HtmlUtil.createArtNumDot(slot6, parseInt(Hero.getUserScore(slot4))))
end

SlwhBankCcsView.destroy = function (slot0)
	slot3 = slot0.view.txtDeposit_tf

	destroySomeObj(slot2)

	slot3 = slot0.view.txtCash_tf

	destroySomeObj(slot2)

	slot3 = slot0

	BaseBankTakePopupCcsView.destroy(slot2)
end

return
