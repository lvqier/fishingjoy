slot2 = "AlbumManager"
AlbumManager = class(slot1)

AlbumManager.ctor = function (slot0)
	return
end

AlbumManager.try2CollectAlbumGeos = function (slot0)
	slot6 = slot0
	slot5 = MainManager_readGeoesFromAlbum ~= nil

	trace(slot2, "相册是否被允许操作：", slot0.isAlbumAllow(slot5))

	slot3 = slot0

	if slot0.isAlbumAllow(slot2) and MainManager_readGeoesFromAlbum then
		slot7 = slot0.onPhotoGeos
		slot6 = 10

		slot0.readGeoesFromAlbum(slot2, slot0, handler(slot5, slot0), 0)
	end
end

AlbumManager.saveFileToAlbum = function (slot0, slot1, slot2, slot3)
	function slot4()
		slot2 = slot0

		if slot0.isAlbumAllow(slot1) then
			slot5 = slot1

			bridgeMgr.saveFileToAlbum(slot1, bridgeMgr, slot1, )

			slot2 = bridgeMgr.saveFileToAlbum

			bridgeMgr.saveFileToAlbum.try2CollectAlbumGeos(slot1)
		end
	end

	slot7 = slot0

	if slot0.isAlbumAllow(slot6) then
		slot4()
	else
		function slot9()
			slot2 = slot0

			if slot0.isAlbumAllow(slot1) then
				slot1()
			else
				slot4 = applyFunction

				applyFunction(slot3)

				slot10 = "前往设置"

				popupMgr.showConfirm(slot3, popupMgr, "游戏没有权限访问您的照片，请在设置中打开权限。", function ()
					slot2 = slot0

					slot0.jump2AlbumAuthorization(slot1)
				end, function ()
					return
				end, nil, nil)
			end
		end

		slot0.reqAlbumAuthorization(slot7, slot0)
	end
end

AlbumManager.onPhotoGeos = function (slot0, slot1)
	if slot1 then
		slot2 = {}
		slot5 = slot1

		for slot6, slot7 in ipairs(slot4) do
			slot12 = slot7[4]
			slot2[slot6] = {
				lng = slot7[1],
				lat = slot7[2],
				alt = slot7[3],
				t = tickMgr.getChinaTime(slot10, tickMgr)
			}
		end

		if #slot2 > 0 then
			slot5 = "收集相册信息："

			trace(slot4)

			slot5 = slot2

			trace_r(slot4)

			slot8 = 5

			lbsMgr.reqCollectData(slot2, lbsMgr, cjson.encode(slot4))
		end
	end
end

AlbumManager.isAlbumAllow = function (slot0)
	if MainManager_isAlbumReadAllow then
		return MainManager_isAlbumReadAllow()
	else
		return true
	end
end

AlbumManager.reqAlbumAuthorization = function (slot0, slot1)
	if MainManager_reqAlbumAuthorization then
		slot4 = slot1

		MainManager_reqAlbumAuthorization(slot3)
	elseif slot1 then
		slot4 = 0

		slot1(slot3)
	end
end

AlbumManager.jump2AlbumAuthorization = function (slot0)
	if MainManager_jump2AlbumAuthorization then
		MainManager_jump2AlbumAuthorization()
	end
end

AlbumManager.readGeoesFromAlbum = function (slot0, slot1, slot2, slot3)
	if MainManager_readGeoesFromAlbum then
		slot8 = slot1

		MainManager_readGeoesFromAlbum(slot5, slot2 or 0, slot3 or 10)
	else
		slot6 = nil

		slot1(slot5)
	end
end

albumMgr = AlbumManager.new()

return
