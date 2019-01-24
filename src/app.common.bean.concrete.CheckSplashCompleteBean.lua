slot2 = "CheckSplashCompleteBean"
CheckSplashCompleteBean = class(slot1)

CheckSplashCompleteBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckSplashCompleteBean.start = function (slot0)
	if ProxyClientSplash then
		slot3 = ProxyClientSplash

		if not ProxyClientSplash.isComplete(slot2) then
			slot3 = ProxyClientSplash
			slot7 = slot0.onSplashComplete

			ProxyClientSplash.pushCompleteCallback(slot2, handler(slot5, slot0))
		end
	else
		slot3 = slot0

		slot0.finish(slot2)
	end
end

CheckSplashCompleteBean.onSplashComplete = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

return
