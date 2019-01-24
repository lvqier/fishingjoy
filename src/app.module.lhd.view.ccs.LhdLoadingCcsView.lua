LhdLoadingCcsView = class("LhdLoadingCcsView")

LhdLoadingCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseGameLoadingCcsView)
	BaseGameLoadingCcsView.onCreationComplete(slot0)
end

LhdLoadingCcsView.onShow = function (slot0)
	if slot0.loadingSpine2 == nil then
		slot0.loadingSpine2 = slot0.controller:createSpine(LHD_SPINE.LoadingSpine2)

		slot0.bgSpineNd:addChild(slot0.loadingSpine2)
		slot0.loadingSpine2:setPosition(0, 0)
		slot0.loadingSpine2:setAnimation(0, LHD_SPINE.LoadingSpine2.PlayName, false)
		slot0.loadingSpine2:addAnimation(0, LHD_SPINE.LoadingSpine2.IdleName, true)
	else
		slot0.loadingSpine2:setVisible(true)
		slot0.loadingSpine2:setAnimation(0, LHD_SPINE.LoadingSpine2.PlayName, false)
		slot0.loadingSpine2:addAnimation(0, LHD_SPINE.LoadingSpine2.IdleName, true)
	end

	if slot0.loadingSpine == nil then
		slot0.loadingSpine = slot0.controller:createSpine(LHD_SPINE.LoadingSpine1)

		slot0.bgSpineNd:addChild(slot0.loadingSpine)
		slot0.loadingSpine:setPosition(0, 0)
		slot0.loadingSpine:setAnimation(0, LHD_SPINE.LoadingSpine1.PlayName, false)
		slot0.loadingSpine:addAnimation(0, LHD_SPINE.LoadingSpine1.IdleName, true)
	else
		slot0.loadingSpine:setVisible(true)
		slot0.loadingSpine:setAnimation(0, LHD_SPINE.LoadingSpine1.PlayName, false)
		slot0.loadingSpine:addAnimation(0, LHD_SPINE.LoadingSpine1.IdleName, true)
	end
end

return
