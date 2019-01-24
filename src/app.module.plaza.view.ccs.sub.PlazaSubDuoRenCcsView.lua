PlazaSubDuoRenCcsView = class("PlazaSubDuoRenCcsView")

PlazaSubDuoRenCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaSubView, true, {
		{
			btn = slot0.layerTabs.gameHuanLeZhiZun,
			gameKind = GameKind_HLZZ
		},
		{
			btn = slot0.layerTabs.gameBaiRenNiuNiu,
			gameKind = GameKind_BRNN
		},
		{
			btn = slot0.layerTabs.gameHuanLe30Miao,
			gameKind = GameKind_HLSSM
		},
		{
			btn = slot0.layerTabs.gameShiDianBan,
			gameKind = GameKind_SDB
		},
		{
			btn = slot0.layerTabs.gameHHDZ,
			gameKind = GameKind_HHDZ
		},
		{
			btn = slot0.layerTabs.gameSjb,
			gameKind = GameKind_SJB
		},
		{
			btn = slot0.layerTabs.gameLHD,
			gameKind = GameKind_LHD
		}
	})
end

return
