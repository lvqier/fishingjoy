PlazaSubXiuXianCcsView = class("PlazaSubXiuXianCcsView")

PlazaSubXiuXianCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaSubView, true, {
		{
			btn = slot0.layerTabs.gameLingDang,
			gameKind = GameKind_SGJ
		},
		{
			btn = slot0.layerTabs.gameBenChiBaoMa,
			gameKind = GameKind_BCBM
		},
		{
			btn = slot0.layerTabs.gameHuHuShengWei,
			gameKind = GameKind_HHSW
		},
		{
			btn = slot0.layerTabs.gameSHZ,
			gameKind = GameKind_SHZ
		},
		{
			btn = slot0.layerTabs.gameJxlw,
			gameKind = GameKind_JXLW
		},
		{
			btn = slot0.layerTabs.gameFqzs,
			gameKind = GameKind_FQZS
		},
		{
			btn = slot0.layerTabs.gameLldb,
			gameKind = GameKind_SERIAL
		},
		{
			btn = slot0.layerTabs.gameTgpd,
			gameKind = GameKind_TGPD
		},
		{
			btn = slot0.layerTabs.gameSlwh,
			gameKind = GameKind_SLWH
		}
	})

	if device.platform == "windows" then
		slot2 = slot1[1].btn:getContentSize()

		for slot6 = 1, #slot1, 1 do
			slot7 = ccui.Button:create("res/button/backtotopnormal.png", "res/button/backtotoppressed.png")

			slot7:setPosition(cc.p(slot2.width / 2, slot2.height / 2))
			slot7:addTouchEventListener(c_func(slot0.onButtonClick_Enter, slot0, slot1[slot6].gameKind))
			slot1[slot6].btn:addChild(slot7)
		end
	end
end

PlazaSubXiuXianCcsView.onButtonClick_Enter = function (slot0, slot1, slot2, slot3)
	if slot3 == ccui.TouchEventType.ended then
		slot0.controller:try2EnterGame(slot1)
	end
end

return
