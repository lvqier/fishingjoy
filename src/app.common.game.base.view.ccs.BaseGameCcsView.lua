slot2 = "BaseGameCcsView"
BaseGameCcsView = class(slot1)

BaseGameCcsView.onCreationComplete = function (slot0, slot1)
	slot2 = nil

	if slot0.layerLoading then
		slot5 = slot0.layerLoading

		if #slot0.layerLoading.getChildren(slot4) == 0 then
			slot1 = true
		end
	end

	if not slot1 then
		slot2 = slot0.layerLoading
	elseif slot0.layerLoading then
		slot6 = false

		slot0.layerLoading.setTouchEnabled(slot4, slot0.layerLoading)
	end

	slot6 = BaseGameGadegetShowingView

	ClassUtil.extends(slot4, slot0)

	slot7 = true

	ClassUtil.extends(slot4, slot0, BaseGameLoadingCcsView)

	slot7 = slot2

	BaseGameLoadingCcsView.onCreationComplete(slot4, slot0, true)
end

BaseGameCcsView.onRootViewShow = function (slot0)
	if slot0.layerNotice then
		slot4 = true

		slot0.layerNotice.setNoticeEnable(slot2, slot0.layerNotice)
	end

	slot3 = slot0.model
	slot3 = slot0.model.getShowSignal(slot2)

	slot0.model.getShowSignal(slot2).emit(slot2)
end

BaseGameCcsView.onRootViewHide = function (slot0)
	if slot0.layerNotice then
		slot4 = false

		slot0.layerNotice.setNoticeEnable(slot2, slot0.layerNotice)
	end

	slot3 = slot0.model
	slot3 = slot0.model.getHideSignal(slot2)

	slot0.model.getHideSignal(slot2).emit(slot2)
end

BaseGameCcsView.destroy = function (slot0)
	slot3 = slot0.layerNotice

	destroySomeObj(slot2)

	slot3 = slot0

	BaseGameGadegetShowingView.destroy(slot2)

	slot3 = slot0

	BaseGameLoadingCcsView.destroy(slot2)
end

return
