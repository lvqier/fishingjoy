slot2 = "DeployLbsBean"
DeployLbsBean = class(slot1)

DeployLbsBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

DeployLbsBean.start = function (slot0)
	slot3 = slot0

	slot0.finish(slot2)
end

return
