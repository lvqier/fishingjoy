slot2 = "ClearSanBoxCacheBean"
ClearSanBoxCacheBean = class(slot1)

ClearSanBoxCacheBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

ClearSanBoxCacheBean.start = function (slot0)
	if not HAVE_DELETE_SANBOXCACHE then
		slot5 = {
			slot1 .. "CaptureScreen"
		}

		for slot6, slot7 in pairs("CaptureScreen") do
			slot10 = slot7

			if OSUtil.isFolderExists(slot9) then
				slot10 = slot7

				OSUtil.deleteDirectory(slot9)
			end
		end

		HAVE_DELETE_SANBOXCACHE = true
	end

	slot3 = slot0

	slot0.finish(slot2)
end

return
