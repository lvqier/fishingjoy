LoginModel = class("LoginModel")

LoginModel.ctor = function (slot0, ...)
	createSetterGetter(slot0, "isShowingLoadingPane", false, true)
	createSetterGetter(slot0, "isAccountShowing", false, true)
	createSetterGetter(slot0, "isAccountForgetShowing", false, true)
	createSetterGetter(slot0, "isAccountRegShowing", false, true)
	createSetterGetter(slot0, "isAccountRegInfoShowing", false, true)
	createSetterGetter(slot0, "isAccountRegByAccShowing", false, true)
	createSetterGetter(slot0, "isAccountResetShowing", false, true)
	createSetterGetter(slot0, "isValidateShowing", false, true)
	createSetterGetter(slot0, "isValidateIDShowing", false, true)
	createSetterGetter(slot0, "isAccountGuestShowing", false, true)
	createSetterGetter(slot0, "isLoginWechatShowing", false, true)
	createSetterGetter(slot0, "isKfShowing", false, true)
	createSetterGetter(slot0, "isKfQQShowing", false, true)
	createSetterGetter(slot0, "isShowingKfQnA", false, true)
	createSetterGetter(slot0, "curSelectedKfQnAData", nil, true)
	createSetterGetter(slot0, "updateKfListViewSignal", SignalAs3.new(), nil, true)
	createSetterGetter(slot0, "loginSuccessCallback", nil)
	createSetterGetter(slot0, "loadingText", "", true)
	createSetterGetter(slot0, "loadingPercent", 0, true)
	createSetterGetter(slot0, "isAgree", true, true)
	createSetterGetter(slot0, "validateType", 0)
	createSetterGetter(slot0, "guestVerifyState", 0, true)
	createSetterGetter(slot0, "yzmIdentityId", nil)
	createSetterGetter(slot0, "verifyVo", nil, true)
	createSetterGetter(slot0, "selectedVerifyDics", {}, true)
	createSetterGetter(slot0, "account", "")
	createSetterGetter(slot0, "pw", "")
	createSetterGetter(slot0, "forgetSmsCode", "")
	createSetterGetter(slot0, "regSmsCode", "")
	createSetterGetter(slot0, "validateSmsCode", "")
	createSetterGetter(slot0, "forgetSmsCd", 0, true)
	createSetterGetter(slot0, "regSmsCd", 0, true)
	createSetterGetter(slot0, "validateSmsCd", 0, true)
	createSetterGetter(slot0, "banHaoConfigDic", {})
	createSetterGetter(slot0, "bindPhone", "")

	slot0._banHaoConfigDic[166] = "批准文号：新广出审【2017】3135号 ISBN：978-7-7979-6542-2 游戏著作权人：深圳市云岭网络科技有限公司 出版单位：华中科技大学电子音像出版社"
	slot0._banHaoConfigDic[167] = "批准文号：新广出审【2017】6308号 ISBN：978-7-7979-9505-4 游戏著作权人：深圳市云岭网络科技有限公司 出版单位：方圆电子音像出版社有限责任公司"
	slot0._banHaoConfigDic[197] = "批准文号：新广出审[2018]1982号 ISBN：978-7-498-05326-8 游戏著作权人：深圳市云游时代网络科技有限公司 \n出版单位：杭州润趣科技有限公司 文网游字备[2018]M-CSG 0376"
	slot0._banHaoConfigDic[500] = "网文证书编号：黑网文[2017]9784-091号 软著编号：软著登字第2492430号\n公司名称：黑龙江省明游网络科技有限公司 公司地址：黑龙江省绥化市北林区胜利街1委5组工商行家属楼厢房栋1层"
	slot0._loadingBottomTip = {
		"提示：充值的欢乐豆需要在银行领取哦",
		"提示：要进行存款和取款操作需要点击“银行”按钮哦",
		"提示：点击个人信息-选择头像即可更换头像"
	}
end

LoginModel.getRandomLoadingBottomTip = function (slot0)
	return slot0._loadingBottomTip[math.random(#slot0._loadingBottomTip)] or ""
end

LoginModel.destroy = function (slot0)
	SignalAs3.clearAllSignal(slot0)

	slot0._loginSuccessCallback = nil
end

return
