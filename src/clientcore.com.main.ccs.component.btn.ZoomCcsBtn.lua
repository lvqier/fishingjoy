ZoomCcsBtn = class("ZoomCcsBtn")

ZoomCcsBtn.ctor = function (slot0, slot1, slot2)
	createSetterGetter(slot0, "isClickZoom", true)

	slot0._pushZoomScale = 1.03
	slot0._zoomLayer = slot2 or slot0

	if slot1 then
		ClassUtil.extends(slot0, BaseCcsBtn, true, slot1)
	end

	slot0:checkScale()
end

ZoomCcsBtn.checkScale = function (slot0)
	slot0._zoomView = slot0:getZoomView()
	slot0._zoomViewScaleX = 1
	slot0._zoomViewScaleY = 1

	if slot0._zoomView then
		slot0._zoomViewScaleX = slot0._zoomView:getScaleX()
		slot0._zoomViewScaleY = slot0._zoomView:getScaleY()
	end
end

ZoomCcsBtn.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BaseCcsBtn, true, slot0)
end

ZoomCcsBtn.onPushingDownChanged = function (slot0, slot1, slot2)
	if slot2 or slot0:getZoomView() then
		if slot0._isPushingDown and slot0._isClickZoom then
			TweenLite.to(slot3, 0.05, {
				scaleX = slot0._zoomViewScaleX * slot0._pushZoomScale,
				scaleY = slot0._zoomViewScaleY * slot0._pushZoomScale
			})
		else
			TweenLite.to(slot3, 0.05, {
				scaleX = slot0._zoomViewScaleX,
				scaleY = slot0._zoomViewScaleY
			})
		end
	end
end

ZoomCcsBtn.setZoomView = function (slot0, slot1)
	slot0._zoomLayer = slot1 or slot0

	slot0:checkScale()
end

ZoomCcsBtn.getZoomView = function (slot0)
	return slot0._zoomLayer
end

ZoomCcsBtn.destroy = function (slot0)
	BaseCcsBtn.destroy(slot0)
end

return
