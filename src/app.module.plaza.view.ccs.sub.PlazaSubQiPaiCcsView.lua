PlazaSubQiPaiCcsView = class("PlazaSubQiPaiCcsView")

PlazaSubQiPaiCcsView.onCreationComplete = function (slot0)
	ClassUtil.extends(slot0, BasePlazaSubView, true, {
		{
			btn = slot0.layerTabs.gameHuanLeWuZhang,
			gameKind = GameKind_HLWZ
		},
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
		},
		{
			btn = slot0.layerTabs.gameJDNN,
			gameKind = GameKind_JDNN
		},
		{
			btn = slot0.layerTabs.gameQZNN,
			gameKind = GameKind_QZNNB
		},
		{
			btn = slot0.layerTabs.gameErRenMaJiang,
			gameKind = GameKind_ERMJ
		},
		{
			btn = slot0.layerTabs.gameYingSanZhang,
			gameKind = GameKind_YSZ
		},
		{
			btn = slot0.layerTabs.gameDZPK,
			gameKind = GameKind_DZPK
		},
		{
			btn = slot0.layerTabs.gameQianBianShuangKou,
			gameKind = GameKind_QBSK
		},
		{
			btn = slot0.layerTabs.gameDdz,
			gameKind = GameKind_DDZ_VIRTUAL
		},
		{
			btn = slot0.layerTabs.gameErRenMaJiangEx,
			gameKind = GameKind_ERMJex
		},
		{
			btn = slot0.layerTabs.gamePDK,
			gameKind = GameKind_PDK
		}
	})
end

return
