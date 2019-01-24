slot2 = "ChargeBankNameSelectCcsView"
ChargeBankNameSelectCcsView = class(slot1)

ChargeBankNameSelectCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot5 = slot0.view.viewName
	slot3 = slot0.view.viewName.getContentSize(ZoomPopUpChildView)
	slot3.height = 1800
	slot8 = slot3

	slot0.view.viewName.setContentSize(slot0, slot2)

	slot8 = slot3

	slot0.view.name_sv.setInnerContainerSize(slot0, slot0.view.name_sv)

	slot8 = slot0.view.viewName

	slot0.view.name_sv.addContentChild(slot0, slot0.view.name_sv)

	slot7 = slot0.view.viewName
	slot11 = 1

	slot0.view.viewName.setAnchorPoint(slot0, cc.p(slot9, 0))

	slot7 = slot0.view.viewName
	slot11 = 1800

	slot0.view.viewName.setPosition(slot0, cc.p(slot9, 0))

	slot5 = 20
	slot6 = 1800 - 20
	slot7 = 315
	slot8 = 72
	slot11 = {
		{
			"中国工商银行",
			"招商银行",
			"中国农业银行",
			"中国建设银行",
			"中国银行",
			"中国民生银行",
			"中国光大银行",
			"中信银行",
			"交通银行",
			"兴业银行",
			"上海浦东发展银行",
			"中国人民银行",
			"华夏银行",
			"深圳发展银行",
			"广东发展银行",
			"国家开发银行",
			"中国邮政储蓄银行",
			"中国进出口银行",
			"中国农业发展银行"
		},
		{
			"中国银行香港分行",
			"北京银行",
			"北京农村商业银行",
			"天津银行",
			"上海银行",
			"上海农村商业银行",
			"南京银行",
			"宁波银行",
			"杭州市商业银行",
			"深圳平安银行",
			"深圳农村商业银行",
			"温州银行",
			"厦门国际银行",
			"济南市商业银行",
			"重庆银行",
			"哈尔滨银行",
			"成都市商业银行",
			"包头市商业银行",
			"南昌市商业银行",
			"贵阳商业银行",
			"兰州市商业银行",
			"常熟农村商业银行",
			"青岛市商业银行",
			"徽商银行"
		},
		{
			"花旗中国银行",
			"汇丰中国银行",
			"渣打中国银行",
			"香港汇丰银行",
			"渣打(香港)银行",
			"中国建设银行(亚洲)",
			"东亚银行中国网站",
			"恒生银行",
			"花旗(台湾)银行",
			"荷兰银行",
			"欧力士银行",
			"巴黎银行",
			"美国运通银行",
			"蒙特利尔银行",
			"满地可银行",
			"瑞士银行",
			"德意志银行"
		}
	}

	for slot12, slot13 in ipairs(0) do
		slot17 = slot6

		slot2["titleNode" .. slot12].setPositionY(slot12, slot2["titleNode" .. slot12])

		slot6 = slot6 - 120
		slot16 = slot13

		for slot17, slot18 in ipairs(slot12) do
			slot23 = false
			slot19 = ccsPoolMgr.get(slot20, ccsPoolMgr, "csb/common/ChargeBankNameSelectItem.csb")
			slot24 = slot18

			slot19.init(ccsPoolMgr, slot19, slot0.model)

			slot26 = (slot17 - 1) / 3
			slot24 = slot6 - MathUtil.ifloor(slot25) * slot8

			slot19.setPosition(ccsPoolMgr, slot19, slot5 + (slot17 - 1) % 3 * slot7)

			slot23 = slot19

			slot2.addChild(ccsPoolMgr, slot2)

			slot23 = slot19.btnName

			slot0.view.name_sv.addBtn2HandleTouchOperate(ccsPoolMgr, slot0.view.name_sv)
		end

		slot16 = (#slot13 - 1) / 3
		slot6 = slot6 - MathUtil.ifloor(slot15) * slot8 - 50
	end

	slot12 = 1

	slot0.view.spMask.setLocalZOrder(slot10, slot0.view.spMask)
end

ChargeBankNameSelectCcsView.onShow = function (slot0)
	slot6 = Hero
	slot5 = true

	slot0.model.setChargeBankName(slot2, slot0.model, Hero.getChargeBankName(slot5))
end

ChargeBankNameSelectCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot6 = false

		slot0.model.setIsShowingBankNameSelect(slot4, slot0.model)
	elseif slot1 == slot0.view.btnConfirm then
		slot6 = false

		slot0.model.setIsShowingBankNameSelect(slot4, slot0.model)

		slot8 = slot0.model
		slot7 = true

		Hero.setChargeBankName(slot4, Hero, slot0.model.getChargeBankName(slot7))
	end
end

ChargeBankNameSelectCcsView.destroy = function (slot0)
	return
end

return
