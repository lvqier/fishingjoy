slot2 = "NewbieApi50002"
NewbieApi50002 = class(slot1)

NewbieApi50002.ctor = function (slot0)
	slot4 = BaseNewbieApi

	ClassUtil.extends(slot2, slot0)
end

NewbieApi50002.start = function (slot0)
	slot1 = display.newNode()
	slot6 = "newbie/newbie_ex_demo_bg.png"
	slot2 = display.newSprite(ResConfig.getUICommonPath(slot5))
	slot6 = slot2

	slot1.addChild(ResConfig.getUICommonPath, slot1)

	slot7 = 20

	slot2.setPosition(ResConfig.getUICommonPath, slot2, 0)

	slot3 = display.newSprite(ResConfig.getUICommonPath(0))
	slot4 = display.newSprite(ResConfig.getUICommonPath("newbie/newbie_ex_demo_text1.png"))
	slot9 = "newbie/newbie_ex_demo_text3.png"
	slot5 = display.newSprite(ResConfig.getUICommonPath("newbie/newbie_ex_demo_text2.png"))
	slot9 = slot3

	slot1.addChild(ResConfig.getUICommonPath, slot1)

	slot9 = slot4

	slot1.addChild(ResConfig.getUICommonPath, slot1)

	slot9 = slot5

	slot1.addChild(ResConfig.getUICommonPath, slot1)

	slot10 = 50

	slot3.setPosition(ResConfig.getUICommonPath, slot3, 460)

	slot10 = -70

	slot4.setPosition(ResConfig.getUICommonPath, slot4, 460)
	slot5.setPosition(ResConfig.getUICommonPath, slot5, 430)

	slot6 = ccui.Button.create(ResConfig.getUICommonPath, ResConfig.getUICommonPath(-130))
	slot10 = slot6

	slot1.addChild(ccui.Button, slot1)

	slot9 = slot6
	slot13 = slot0.onBtnClick

	slot6.addClickEventListener(ccui.Button, handler("newbie/newbie_ex_demo_btn_know.png", slot0))

	slot11 = -280

	slot6.setPosition(ccui.Button, slot6, 0)

	slot10 = slot1

	slot0._maskView.showCustomWidget(ccui.Button, slot0._maskView)
end

NewbieApi50002.onBtnClick = function (slot0)
	slot3 = slot0._maskView

	slot0._maskView.removeALlCustomWidget(slot2)

	slot3 = slot0

	slot0.finish(slot2)
end

NewbieApi50002.destroy = function (slot0)
	slot3 = slot0

	BaseNewbieApi.destroy(slot2)
end

return
