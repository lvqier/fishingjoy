slot2 = "TestBean"
TestBean = class(slot1)

TestBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)

	slot4 = TickBase

	ClassUtil.extends(slot2, slot0)
end

TestBean.start = function (slot0)
	if ziXun_Enable == false then
		slot3 = slot0

		slot0.finish(slot2)

		return
	end

	if ziXun_CHECK == 1 then
		slot4 = display.newScene(slot2)

		display.runScene("")

		slot2 = ""

		if isMobile then
			slot5 = cc.FileUtils
			slot5 = cc.FileUtils.getInstance(slot4)
			slot2 = cc.FileUtils.getInstance(slot4).getWritablePath(slot4) .. "updatez/"
			slot5 = cc.FileUtils
			slot7 = true

			cc.FileUtils.getInstance("updatez/").addSearchPath("updatez/", cc.FileUtils.getInstance("updatez/"), "res/webapphtml/")
		end

		slot5 = cc.FileUtils
		slot7 = true

		cc.FileUtils.getInstance(slot4).addSearchPath(slot4, cc.FileUtils.getInstance(slot4), slot2 .. "res/webapphtml/")

		slot5 = "app.common.Webapp"
		slot8 = require(slot4).new()

		slot1.addChild(slot2 .. "res/webapphtml/", slot1)

		return
	end

	slot3 = slot0

	slot0.finish(slot2)
end

TestBean.finish = function (slot0)
	slot3 = slot0

	AbstractBean.finish(slot2)
end

return
