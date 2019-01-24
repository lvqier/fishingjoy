PlazaKFWxCcsView = class("PlazaKFWxCcsView")

PlazaKFWxCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
	slot0.model.gzhFileUrlChangedSignal:add(slot0.onGzhErweima, slot0)
	slot0.view.imgErWeiMa:setVisible(false)
end

PlazaKFWxCcsView.onGzhErweima = function (slot0)
	if slot0.model:getGzhFileUrl() then
		slot0.view.imgErWeiMa:setVisible(true)
		slot0.view.imgErWeiMa:loadTexture(slot1)
	else
		slot0.view.imgErWeiMa:setVisible(false)
	end
end

PlazaKFWxCcsView.onShow = function (slot0)
	if not StringUtil.isStringValid(slot0.model:getGzhFileUrl()) then
		slot0.controller:try2GetWechatErWeiMa()
	else
		slot0.model:setGzhFileUrl(slot1, true)
	end
end

PlazaKFWxCcsView.onRootClick = function (slot0)
	slot0.model:setIsShowingKfWx(false)
	popupMgr:pop(POPUP_ID_TOURIST_LOGIN_TIP)
end

PlazaKFWxCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0:onRootClick()
	elseif slot1 == slot0.view.btnBCewm then
		slot0.controller:saveErWeiMa()
	end
end

PlazaKFWxCcsView.destroy = function (slot0)
	slot0.model.gzhFileUrlChangedSignal:remove(slot0.onGzhErweima, slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnBCewm)
	ZoomPopUpChildView.destroy(slot0)
end

return
