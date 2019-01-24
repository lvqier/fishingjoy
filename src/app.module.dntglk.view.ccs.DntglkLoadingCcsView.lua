slot2 = "DntglkLoadingCcsView"
DntglkLoadingCcsView = class(slot1)
slot0 = requireLuaFromModule(slot1)
slot1 = requireLuaFromModule("dntglk.dntgLogic.RenderObjectPool")
slot2 = requireLuaFromModule("dntglk.dntgLogic.LuaObjectPool")
slot3 = requireLuaFromModule("dntglk.dntgLogic.FishLayer")
slot4 = requireLuaFromModule("dntglk.controller.DntglkController")
slot7 = "dntglk.objPoolMgr.objPoolMgr"
slot7 = requireLuaFromModule("dntglk.view.ccs.DntglkBattleCcsView")
slot5 = requireLuaFromModule("dntglk.view.ccs.DntglkBattleCcsView").getInstance("dntglk.view.ccs.DntglkBattleCcsView")
DntglkLoadingCcsView.fillState = {
	xiaolvyu = {
		number = 30
	},
	xiaolvyu2 = {
		number = 30
	},
	xiaolanyu = {
		number = 30
	},
	buyu8 = {
		number = 20
	},
	buyu10 = {
		number = 20
	},
	hetun = {
		number = 10
	},
	buyu13 = {
		number = 10
	},
	denglongyu = {
		number = 15
	},
	xiaohaigui = {
		number = 15
	},
	buyu7 = {
		number = 10
	},
	buyu12 = {
		number = 10
	},
	jianyu = {
		number = 4
	},
	shajing = {
		number = 6
	},
	shajinghuangjinban = {
		number = 8
	},
	shayuhuangjinban = {
		number = 12
	},
	yinlong = {
		number = 12
	},
	jinlong = {
		number = 5
	},
	zhangyuguai = {
		number = 15
	},
	haiyao = {
		number = 5
	},
	shenxianchuan = {
		number = 30
	},
	lkby_stqe = {
		number = 3
	},
	likui = {
		number = 3
	},
	lkby_dasixi = {
		number = 5
	},
	lkby_dasanyuan = {
		number = 5
	},
	lkby_wfczdbeffect = {
		number = 5
	},
	lkby_wdfhl_01 = {
		number = 3
	},
	lkby_dpzd = {
		number = 3
	},
	lkby_wfcz = {
		number = 3
	}
}

DntglkLoadingCcsView.onCreationComplete = function (slot0)
	slot5 = nil

	ClassUtil.extends(slot2, slot0, BaseGameLoadingCcsView)

	slot3 = slot0

	BaseGameLoadingCcsView.onCreationComplete(slot2)

	slot0.loaded = false
end

DntglkLoadingCcsView.checkLoadingTxt = function (slot0)
	slot3 = slot0

	BaseGameLoadingCcsView.checkLoadingTxt(slot2)

	if slot0.txtInfo and slot0.bgLoadingTxt then
		slot8 = slot0.bgLoadingTxt
		slot6 = slot0.bgLoadingTxt.getContentSize(slot7).height

		slot0.bgLoadingTxt.setContentSize(slot0.txtInfo, slot0.bgLoadingTxt, slot0.txtInfo.getContentSize(slot2).width + 50)
	end
end

DntglkLoadingCcsView.onShow = function (slot0)
	slot3 = slot0

	BaseGameLoadingCcsView.onShow(slot2)

	if not slot0._logoSpine then
		slot6, slot7 = slot0.controller.getSpineResByName(slot2, slot0.controller)
		slot3 = sp.SkeletonAnimation.create("lkby_loading_logo", sp.SkeletonAnimation, slot1, slot2)
		slot6 = slot3
		slot10 = 380

		slot3.setPosition(sp.SkeletonAnimation, cc.p(1, 660))

		slot7 = slot3

		slot0.addChild(sp.SkeletonAnimation, slot0)

		slot0._logoSpine = slot3
	end

	slot6 = false

	slot0._logoSpine.setAnimation(slot2, slot0._logoSpine, 0, "start")

	slot6 = true

	slot0._logoSpine.addAnimation(slot2, slot0._logoSpine, 0, "idle")
end

return
