LhdBankCcsView = class("LhdBankCcsView")

LhdBankCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseBankTakePopupCcsView)
	BaseBankTakePopupCcsView.onCreationComplete(slot0)
end

LhdBankCcsView.onUserInsureChanged = function (slot0)
	slot0.view.sliderControl:setMaxValue(slot1)
	slot0.view.txtDeposit_tf:setHtmlText(HtmlUtil.createArtNumDot(Hero:getUserInsure(), "#lhd_ck_sz_%s.png"))
end

LhdBankCcsView.onUserScoreChanged = function (slot0)
	slot0.view.txtCash_tf:setHtmlText(HtmlUtil.createArtNumDot(Hero:getUserScore(), "#lhd_ck_sz_%s.png"))
end

LhdBankCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.txtDeposit_tf)
	destroySomeObj(slot0.view.txtCash_tf)
	BaseBankTakePopupCcsView.destroy(slot0)
end

return
