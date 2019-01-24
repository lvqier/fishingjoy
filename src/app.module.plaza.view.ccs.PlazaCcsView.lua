PlazaCcsView = class("PlazaCcsView")

PlazaCcsView.onCreationComplete = function (slot0)
	slot0._viewsDic = {
		[PLAZA_MAIN] = {
			url = "csb/layer/PlazaMain.csb"
		},
		[PLAZA_SUB_DUO_REN] = {
			gameType = 2,
			url = "csb/layer/PlazaSubDuoRen.csb"
		},
		[PLAZA_SUB_XIU_XIAN] = {
			gameType = 3,
			url = "csb/layer/PlazaSubXiuXian.csb"
		},
		[PLAZA_SUB_BU_YU] = {
			gameType = 4,
			url = "csb/layer/PlazaSubBuYu.csb"
		},
		[PLAZA_SUB_QI_PAI] = {
			gameType = 1,
			url = "csb/layer/PlazaSubQiPai.csb"
		},
		[PLAZA_ROOM] = {
			url = "csb/layer/PlazaRoom.csb"
		}
	}

	slot0:initBgSpine()
	slot0.layerBottom:show()
	slot0.model.curShowingViewTypeChangedSignal:add(slot0.onShowingViewTypeChanged, slot0)
end

PlazaCcsView.onRootViewShow = function (slot0)
	DisplayUtil.switchParentTo2(slot0.layerWinNotice, uiMgr:getTopLayerInAllScene())
end

PlazaCcsView.initBgSpine = function (slot0)
	slot0.layerBg.particleBg:setLocalZOrder(5)
end

PlazaCcsView.onShowingViewTypeChanged = function (slot0)
	slot3 = (((slot0.model:getCurShowingViewType() and slot0._viewsDic[slot1]) or nil) and (slot0.model.getCurShowingViewType() and slot0._viewsDic[slot1]) or nil.view) or nil

	slot0.model:setCurGameType((((slot0.model.getCurShowingViewType() and slot0._viewsDic[slot1]) or nil) and (slot0.model.getCurShowingViewType() and slot0._viewsDic[slot1]) or nil.gameType) or nil)

	if slot2 and not slot3 then
		slot2.view = ccsPoolMgr:get(slot2.url, false, slot0)

		if ccsPoolMgr.get(slot2.url, false, slot0).setViewType then
			slot3:setViewType(slot1)
		end

		slot3:setParentView(slot0.layerMain)
	end

	function slot5()
		slot0.model:setCurShowingView(slot0.model)

		if slot0.model then
			slot1:show()
		end

		if not slot0._curViewType or (slot0._curViewType ~= slot2 and (slot0._curViewType == PLAZA_MAIN or slot2 == PLAZA_MAIN)) then
			slot1 = TimelineLite.new()

			slot1:append(TweenLite.to(slot0.layerNotice, 0.1, {
				alpha = 0,
				onComplete = function ()
					if cc.p(267, 682) == PLAZA_KF then
						slot0 = cc.p(CONFIG_DESIGN_WIDTH * 0.5 - 300, 686)
					elseif slot0 == PLAZA_MAIN then
						slot0 = cc.p(76, 686)
					end

					slot1.layerNotice:setPosition(slot0)
				end
			}))
			slot1:append(TweenLite.to(slot0.layerNotice, 0.3, {
				alpha = 1
			}))
		end

		slot0._curViewType = slot2
	end

	if slot0.model:getCurShowingView() then
		slot6:hide(nil, nil, nil, slot5)
	else
		slot5()
	end
end

PlazaCcsView.onBtnClick = function (slot0, slot1, slot2)
	return
end

return
