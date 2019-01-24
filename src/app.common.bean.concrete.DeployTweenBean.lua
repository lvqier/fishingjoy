slot2 = "DeployTweenBean"
DeployTweenBean = class(slot1)

DeployTweenBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

DeployTweenBean.start = function (slot0)
	slot3 = mainMgr

	if not mainMgr.getIsRelogining(slot2) then
		slot3 = "plugins.AutoAlphaPlugin"

		requireClientCoreLuaTween(slot2)

		slot3 = "plugins.BezierPlugin"

		requireClientCoreLuaTween(slot2)

		slot3 = "plugins.ShortRotationPlugin"

		requireClientCoreLuaTween(slot2)

		slot3 = "plugins.TintPlugin"

		requireClientCoreLuaTween(slot2)

		slot4 = {
			{
				e = 1.05,
				s = 0,
				cp = 1.14799
			},
			{
				e = 0.988,
				s = 1.05,
				cp = 0.952
			},
			{
				e = 1,
				s = 0.988,
				cp = 1.024
			}
		}

		CustomEase.create(slot2, "myShakeEase1")

		slot4 = {
			{
				e = 1.051,
				s = 0,
				cp = 1.15799
			},
			{
				e = 1,
				s = 1.051,
				cp = 0.944
			}
		}

		CustomEase.create(slot2, "myBackEase1")

		slot4 = {
			{
				e = 0.84,
				s = 0,
				cp = 0.58399
			},
			{
				e = 1.024,
				s = 0.84,
				cp = 1.096
			},
			{
				e = 1,
				s = 1.024,
				cp = 0.952
			}
		}

		CustomEase.create(slot2, "myElasticEaseOut")

		slot3 = {
			AutoAlphaPlugin,
			BezierPlugin,
			ShortRotationPlugin,
			TintPlugin
		}

		TweenPlugin.activate(slot2)
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
