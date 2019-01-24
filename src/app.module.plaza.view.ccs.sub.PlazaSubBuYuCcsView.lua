PlazaSubBuYuCcsView = class("PlazaSubBuYuCcsView")

PlazaSubBuYuCcsView.onCreationComplete = function (slot0)
	slot0._buttonSubFishTd = ({
		{
			btn = slot0.layerTabs.gameDaNaoTianGong,
			gameKind = GameKind_DNTG
		},
		{
			btn = slot0.layerTabs.gameDaNaoTianGongLatest,
			gameKind = GameKind_DNTGTEST
		},
		{
			btn = slot0.layerTabs.game3dbuyu,
			gameKind = GameKind_FISHTD
		},
		{
			btn = slot0.layerTabs.gameDaNaoTianGongEx,
			gameKind = GameKind_DNTGLK
		},
		{
			btn = slot0.layerTabs.gameFishingJoy,
			gameKind = GameKind_FISHINGJOY
		}
	})[3]

	ClassUtil.extends(slot0, BasePlazaSubView, true, slot1)

	slot2 = slot0._buttonSubFishTd.btn:getContentSize()

	for slot6 = 1, 4, 1 do
		if device.platform == "windows" then
			slot7 = ccui.Button:create("res/button/backtotopnormal.png", "res/button/backtotoppressed.png")

			slot7:setPosition(cc.p(slot2.width / 2, slot2.height / 2))
			slot7:addTouchEventListener(c_func(slot0.onButtonClick_EnterFishTd, slot0, slot1[slot6].gameKind))
			slot1[slot6].btn:addChild(slot7)
		end
	end

	slot0._test_game_id = slot1[2].gameKind
end

PlazaSubBuYuCcsView.onButtonClick_EnterFishTd = function (slot0, slot1, slot2, slot3)
	if slot3 == ccui.TouchEventType.ended then
		slot0.controller:try2EnterGame(slot1)
	end
end

return
