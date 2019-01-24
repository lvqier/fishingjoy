QznnbAutoCcsView = class("QznnbAutoCcsView")

QznnbAutoCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, ZoomPopUpChildView, true, slot0, slot0.bg, slot0.view)
end

QznnbAutoCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.view.btnClose then
		slot0.model:setIsShowingAuto(false)
	elseif slot1 == slot0.view.btnBet1 then
		slot0.model:setAutoBetType(1)
		slot0.model:setIsAuto(true)
		slot0.model:setIsShowingAuto(false)
	elseif slot1 == slot0.view.btnBet2 then
		slot0.model:setAutoBetType(2)
		slot0.model:setIsAuto(true)
		slot0.model:setIsShowingAuto(false)
	elseif slot1 == slot0.view.btnBet3 then
		slot0.model:setAutoBetType(3)
		slot0.model:setIsAuto(true)
		slot0.model:setIsShowingAuto(false)
	elseif slot1 == slot0.view.btnBet4 then
		slot0.model:setAutoBetType(4)
		slot0.model:setIsAuto(true)
		slot0.model:setIsShowingAuto(false)
	elseif slot1 == slot0.view.btnRandom then
		slot0.model:setAutoBetType(0)
		slot0.model:setIsAuto(true)
		slot0.model:setIsShowingAuto(false)
	end
end

QznnbAutoCcsView.destroy = function (slot0)
	destroySomeObj(slot0.view.btnClose)
	destroySomeObj(slot0.view.btnBet1)
	destroySomeObj(slot0.view.btnBet2)
	destroySomeObj(slot0.view.btnBet3)
	destroySomeObj(slot0.view.btnBet4)
	destroySomeObj(slot0.view.btnRandom)
	ZoomPopUpChildView.destroy(slot0)
end

return
