slot2 = "DzpkMatchRewardCcsView"
DzpkMatchRewardCcsView = class(slot1)

DzpkMatchRewardCcsView.onCreationComplete = function (slot0)
	slot8 = slot0.view

	ClassUtil.extends(slot2, slot0, ZoomPopUpChildView, true, slot0, slot0.bg)

	slot3 = slot0.view.des_tf
	slot0.des_pos = slot0.view.des_tf.getPositionY(slot2)
	slot3 = slot0.view.des_tf
	slot0.des_posX = slot0.view.des_tf.getPositionX(slot2)
end

DzpkMatchRewardCcsView.onRootClick = function (slot0)
	slot4 = false

	slot0.model.setIsShowingMatchBuyInfo(slot2, slot0.model)
end

DzpkMatchRewardCcsView.onShow = function (slot0)
	slot3 = slot0.model

	if slot0.model.getMatchRewardInfo(slot2) == nil then
		return
	end

	if slot0.dzpk_bsmc == nil then
		slot5 = "dzpk_bsmc"
		slot0.dzpk_bsmc = slot0.controller.createSpineByPool(slot3, slot0.controller)
		slot5 = "dzpk_bsmcgx"
		slot0.dzpk_bsmcgx = slot0.controller.createSpineByPool(slot3, slot0.controller)
		slot4 = slot0.view.des_tf

		slot0.view.des_tf.stopAllActions(slot3)

		slot5 = 0

		slot0.view.des_tf.setOpacity(slot3, slot0.view.des_tf)

		slot8 = "#dzpk_reward_%s.png"

		slot0.view.des_tf.setHtmlText(slot3, HtmlUtil.createArtNum(slot6, slot1.dwRank))

		slot2 = 1
		slot6 = slot0.des_pos
		slot3 = cc.p(slot0.view.des_tf, slot0.des_posX)

		if slot1.dwRank > 999 then
			slot2 = 0.4
			slot0.des_pos = slot0.des_pos + 60
		elseif slot1.dwRank > 99 then
			slot2 = 0.5
			slot0.des_pos = slot0.des_pos + 50
		elseif slot1.dwRank > 9 then
			slot2 = 0.75
			slot0.des_pos = slot0.des_pos + 30
		end

		slot6 = slot2

		print(slot5)

		slot7 = slot0.des_pos
		slot7 = slot0.view.des_tf
		slot18 = slot2
		slot19 = 255
		slot15 = cc.FadeTo.create(cc.ScaleTo, cc.FadeTo, 0.2)
		slot20 = cc.p(slot5, slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2)
		slot19 = slot2
		slot16 = 1.2
		slot13 = nil

		slot0.view.des_tf.runAction(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, cc.Sequence.create(slot0, cc.Sequence, cc.Spawn.create(slot12, cc.Spawn, cc.ScaleTo.create(slot15, cc.ScaleTo, 0.2), cc.MoveTo.create(cc.FadeTo, cc.MoveTo, 0.2)), cc.EaseOut.create(cc.Spawn, cc.EaseOut, cc.ScaleTo.create(cc.MoveTo.create, cc.ScaleTo, 0.2))))

		slot9 = sp.EventType.ANIMATION_COMPLETE

		slot0.dzpk_bsmc.registerSpineEventHandler(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.dzpk_bsmc, slot4)

		slot8 = slot0.dzpk_bsmc

		slot0.view.spineNode.addChild(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.view.spineNode)

		slot8 = slot0.dzpk_bsmcgx

		slot0.view.spineNode1.addChild(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.view.spineNode1)

		slot10 = false

		slot0.dzpk_bsmc.setAnimation(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.dzpk_bsmc, 0, "start")

		slot9 = 50

		slot0.dzpk_bsmc.setPosition(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.dzpk_bsmc, 40)

		slot9 = 50

		slot0.dzpk_bsmcgx.setPosition(slot0.des_posX + (slot0.getContentSize(slot8).width * (1 - slot2)) / 2, slot0.dzpk_bsmcgx, 40)
	end
end

DzpkMatchRewardCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnBack then
		slot6 = false

		slot0.model.setIsShowingMatchReward(slot4, slot0.model)

		slot6 = nil

		slot0.model.setMatchShareInfo(slot4, slot0.model)
	elseif slot1 == slot0.view.btnShow then
		slot6 = slot0.view.btnShow

		slot0.controller.matchResultshareWechat(slot4, slot0.controller)
	end
end

DzpkMatchRewardCcsView.destroy = function (slot0)
	slot3 = slot0.view.btnBack

	destroySomeObj(slot2)

	slot3 = slot0.view.btnShow

	destroySomeObj(slot2)

	slot3 = slot0.view.des_tf

	destroySomeObj(slot2)

	slot3 = slot0

	ZoomPopUpChildView.destroy(slot2)

	if slot0.dzpk_bsmc ~= nil then
		slot4 = slot0.dzpk_bsmc

		spPoolMgr.put(slot2, spPoolMgr)
	end

	if slot0.dzpk_bsmcgx ~= nil then
		slot4 = slot0.dzpk_bsmcgx

		spPoolMgr.put(slot2, spPoolMgr)
	end
end

return
