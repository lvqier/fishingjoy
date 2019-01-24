slot2 = "CheckLoginBean"
CheckLoginBean = class(slot1)

CheckLoginBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

CheckLoginBean.start = function (slot0)
	slot3 = mainMgr

	mainMgr.updateLoginLoadingInfo(slot2, I18n.get(slot5))

	slot4 = "LoginModule"

	requireModule(tickMgr)

	slot4 = ProxyLogin
	slot8 = slot0.finish

	ProxyLogin.show(tickMgr, handler("c47", slot0))

	slot7 = tickMgr
	slot5 = tickMgr.getTimer("c47") - tickMgr.getTimer(slot2)

	traceLog(tickMgr, "初始化登录界面，耗时:")

	if ProxyClientUpdater then
		slot4 = ProxyClientUpdater

		ProxyClientUpdater.destroy(slot3)

		ProxyClientUpdater = nil
	end
end

return
