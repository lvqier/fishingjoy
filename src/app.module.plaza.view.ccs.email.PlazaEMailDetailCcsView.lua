PlazaEMailDetailCcsView = class("PlazaEMailDetailCcsView")

PlazaEMailDetailCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)

	slot0._contentTf = slot0.view.Node_nomal.nodeContent.content_tfs

	slot0:setTouchEnabled(false)
	slot0._contentTf:setVAlign(TextField.V_BOTTOM)

	slot0._contentPos = DisplayUtil.ccpCopy(slot0.view.Node_nomal.nodeContent:getPosition())
	slot0.dzpk_contentTf = slot0.view.Node_Dzpk.nodeContent.content_tfs

	slot0:setTouchEnabled(false)
	slot0.dzpk_contentTf:setVAlign(TextField.V_BOTTOM)

	slot0.dzpk_contentPos = DisplayUtil.ccpCopy(slot0.view.Node_Dzpk.nodeContent:getPosition())
end

PlazaEMailDetailCcsView.onShow = function (slot0)
	slot0.model:setCurEMailDetailType(1)

	if slot0.model:getCurEMailDetailType() == 2 or slot0.model:getCurEMailDetailType() == 3 then
		slot0.view.Node_nomal:setVisible(false)
		slot0.view.Node_Dzpk:setVisible(true)
		slot0.dzpk_contentTf:setHtmlText("\t\t" .. slot0.model:getCurEMailDetail())

		slot2 = slot0.dzpk_contentTf:getHeight()

		slot0.view.Node_Dzpk.nodeContent:setPosition((slot0.dzpk_contentPos.x + slot0.dzpk_contentTf:getWidth() * 0.5) - math.min(slot1, slot0.dzpk_contentTf:getTextWidth()) * 0.5, (slot0.dzpk_contentPos.y + slot2 * 0.5) - (slot2 - math.min(slot2, slot0.dzpk_contentTf:getTextHeight()) * 0.5))
		slot0.view.Node_Dzpk.txtTitle1:setTexture(ResConfig.getTxtPath("dzpkEmailTitlle" .. tostring(slot0.model:getCurEMailDetailType() - 1) .. ".png"))
		slot0.view.Node_Dzpk.btnConfirm:setVisible(slot0.model:getCurEMailDetailType() == 2)
		slot0.view.Node_Dzpk.btnEnter:setVisible(slot0.model:getCurEMailDetailType() == 3)
		slot0.view.Node_Dzpk.btnTuisai:setVisible(slot0.model:getCurEMailDetailType() == 3)
	else
		slot0.view.Node_nomal:setVisible(true)
		slot0.view.Node_Dzpk:setVisible(false)
		slot0._contentTf:setHtmlText("\t\t" .. slot0.model:getCurEMailDetail())

		slot2 = slot0._contentTf:getHeight()

		slot0.view.Node_nomal.nodeContent:setPosition((slot0._contentPos.x + slot0._contentTf:getWidth() * 0.5) - math.min(slot1, slot0._contentTf:getTextWidth()) * 0.5, (slot0._contentPos.y + slot2 * 0.5) - (slot2 - math.min(slot2, slot0._contentTf:getTextHeight()) * 0.5))
	end
end

PlazaEMailDetailCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.Node_nomal.btnClose then
		slot0.model:setIsShowingEMailDetail(false)
	elseif slot1 == slot0.view.Node_nomal.btnConfirm then
		slot0:deleteEmail()
	elseif slot1 == slot0.view.Node_Dzpk.btnClose then
		slot0.model:setIsShowingEMailDetail(false)
	elseif slot1 == slot0.view.Node_Dzpk.btnConfirm then
		slot0.model:setIsShowingEMailDetail(false)
	elseif slot1 == slot0.view.Node_Dzpk.btnEnter then
		slot0.model:setIsShowingEMailDetail(false)
	elseif slot1 == slot0.view.Node_Dzpk.btnTuisai then
		slot0.model:setIsShowingEMailDetail(false)
	end
end

PlazaEMailDetailCcsView.deleteEmail = function (slot0)
	slot1 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		if slot8.msgid == slot0.model:getCurEMailMsgId() then
			table.insert(slot1, slot8.msgid)
		else
			table.insert(slot3, slot8)
		end
	end

	function slot4()
		slot0.model:setIsShowingEMailDetail(false)
		slot0.model.setIsShowingEMailDetail.model:setEMailListData(slot0.model.setIsShowingEMailDetail.model)
	end

	if #slot1 > 0 then
		slot0.controller:requestDeleteMail(slot1, slot4)
	end
end

PlazaEMailDetailCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.Node_nomal.btnClose)
	destroySomeObj(slot0.view.Node_nomal.btnConfirm)
	destroySomeObj(slot0.view.Node_Dzpk.btnClose)
	destroySomeObj(slot0.view.Node_Dzpk.btnConfirm)
	destroySomeObj(slot0.view.Node_Dzpk.btnEnter)
	destroySomeObj(slot0.view.Node_Dzpk.btnTuisai)
	ZoomPopUpChildView.destroy(slot0)
end

return
