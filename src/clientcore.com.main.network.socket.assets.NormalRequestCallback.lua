NormalRequestCallback = class("NormalRequestCallback")
slot0 = 5

NormalRequestCallback.ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._onSuccess = slot1
	slot0._onError = slot2
	slot0._onTimeOut = slot4

	if slot0._onTimeOut then
		slot0.timeOutS = os.time() + (slot5 or slot0)
	end

	slot0._isShowLoading = slot3
end

NormalRequestCallback.onSuccess = function (slot0, ...)
	if slot0._onSuccess then
		slot0._onSuccess(...)
	end
end

NormalRequestCallback.onError = function (slot0, ...)
	if slot0._onError then
		slot0._onError(...)
	end
end

NormalRequestCallback.onTimeOut = function (slot0)
	if slot0._onTimeOut then
		slot0._onTimeOut()
	end
end

NormalRequestCallback.destroy = function (slot0)
	if slot0._isShowLoading then
		popupMgr:hideActivityIndicator()
	end

	slot0._onSuccess = nil
	slot0._onError = nil
	slot0._onTimeOut = nil
	slot0._isShowLoading = nil
end

return
