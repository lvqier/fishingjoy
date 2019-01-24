HlssmResultFailCcsView = class("HlssmResultFailCcsView")

HlssmResultFailCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, HlssmResultWinCcsView)
	HlssmResultWinCcsView.onCreationComplete(slot0)
end

HlssmResultFailCcsView.onZoomShowTweenComplete = function (slot0)
	return
end

HlssmResultFailCcsView.resetAction = function (slot0)
	return
end

HlssmResultFailCcsView.destroy = function (slot0)
	HlssmResultWinCcsView.destroy(slot0)
end

return
