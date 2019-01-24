slot2 = "DeployManagersBean"
DeployManagersBean = class(slot1)

DeployManagersBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

DeployManagersBean.start = function (slot0)
	slot3 = mainMgr

	if not mainMgr.getIsRelogining(slot2) then
		slot3 = popupMgr

		popupMgr.deploy(slot2)

		slot3 = soundMgr

		soundMgr.deploy(slot2)

		slot3 = audioMgr

		audioMgr.deploy(slot2)
	end

	if mainMgr.check2ClearHttpCache then
		slot3 = mainMgr

		mainMgr.check2ClearHttpCache(slot2)
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
