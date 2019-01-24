slot2 = "FakeLoadingBean"
FakeLoadingBean = class(slot1)

FakeLoadingBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

FakeLoadingBean.start = function (slot0)
	if IS_IOS_VERIFY and not IS_IOS_VERIFY_ALL and not IS_IOS_VERIFY_ALL_NO_BANK then
		slot3 = slot0

		slot0.finish(slot2)
	else
		slot8 = 0.5

		mainMgr.updateLoginLoadingInfo(slot3, mainMgr, "正在启动游戏", 1, nil)

		slot8 = slot0.finish
		slot6 = 0.5 * 1000

		tickMgr.delayedCall(slot3, tickMgr, handler(1, slot0))
	end
end

return
