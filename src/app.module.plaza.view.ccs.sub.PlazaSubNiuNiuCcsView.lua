PlazaSubNiuNiuCcsView = class("PlazaSubNiuNiuCcsView")

PlazaSubNiuNiuCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaSubView, true, {
		{
			btn = slot0.layerTabs.gameErRenDouNiu,
			gameKind = GameKind_ERNN
		},
		{
			btn = slot0.layerTabs.gameSiRenDouNiu,
			gameKind = GameKind_SRNN
		},
		{
			btn = slot0.layerTabs.gameTongBiNiuNiu,
			gameKind = GameKind_LRNN
		}
	})
end

PlazaSubNiuNiuCcsView.onBtnClick = function (slot0, slot1, slot2)
	if slot1 == slot0.layerTop.btnBack then
		slot0.controller:gotoView(PLAZA_SUB_QI_PAI, true)
	end
end

return
