module("LBSUtil", package.seeall)

slot0 = 3.141592653589793
slot1 = 6378245
slot2 = 0.006693421622965943

function wgs84_To_Gcj02(slot0, slot1)
	if outOfChina(slot0, slot1) then
		return slot0, slot1
	end

	return slot0 + (transformLon(slot0 - 105, slot1 - 35) * 180) / (slot2 / math.sqrt(slot5) * math.cos(slot4) * slot0), slot1 + (transformLat(slot0 - 105, slot1 - 35) * 180) / ((slot2 * (1 - slot1)) / ((1 - slot1 * math.sin(slot4) * math.sin(slot4)) * math.sqrt(slot5)) * slot0)
end

function wgs84_To_Bd09(slot0, slot1)
	slot5, slot6 = wgs84_To_Gcj02(slot0, slot1)

	return gcj02_To_Bd09(slot2, slot3)
end

function gcj_To_wgs84(slot0, slot1)
	slot2, slot3 = transform(slot0, slot1)

	return slot2 * 2 - slot2, slot3 * 2 - slot3
end

function gcj02_To_Bd09(slot0, slot1)
	return (math.sqrt(slot0 *  + slot1 * ) + 2e-05 * math.sin(slot1 * slot0)) * math.cos(slot5) + 0.0065, (math.sqrt(slot0 *  + slot1 * ) + 2e-05 * math.sin(slot1 * slot0)) * math.sin(slot5) + 0.006
end

function bd09_To_Gcj02(slot0, slot1)
	return (math.sqrt((slot0 - 0.0065) * () + (slot1 - 0.006) * ()) - 2e-05 * math.sin((slot1 - 0.006) * slot0)) * math.cos(slot5), (math.sqrt((slot0 - 0.0065) * () + (slot1 - 0.006) * ()) - 2e-05 * math.sin((slot1 - 0.006) * slot0)) * math.sin(slot5)
end

function bd09_To_Gps84(slot0, slot1)
	slot6, slot5 = bd09_To_Gcj02(slot0, slot1)
	slot2, slot3 = gcj_To_Gps84(slot3, slot2)

	return slot4, slot5
end

function slot3(slot0, slot1)
	slot3, slot4 = string.find(slot2, "%.")

	if slot3 == nil then
		return slot1
	end

	return tonumber(string.sub(slot2, 1, slot3 + slot0))
end

function outOfChina(slot0, slot1)
	if slot0 < 72.004 or slot0 > 137.8347 then
		return true
	end

	if slot1 < 0.8293 or slot1 > 55.8271 then
		return true
	end

	return false
end

function transform(slot0, slot1)
	if outOfChina(slot0, slot1) then
		return slot0, slot1
	end

	return slot0 + (transformLon(slot0 - 105, slot1 - 35) * 180) / (slot2 / math.sqrt(slot5) * math.cos(slot4) * slot0), slot1 + (transformLat(slot0 - 105, slot1 - 35) * 180) / ((slot2 * (1 - slot1)) / ((1 - slot1 * math.sin(slot4) * math.sin(slot4)) * math.sqrt(slot5)) * slot0)
end

function transformLat(slot0, slot1)
	return -100 + 2 * slot0 + 3 * slot1 + 0.2 * slot1 * slot1 + 0.1 * slot0 * slot1 + 0.2 * math.sqrt(math.abs(slot0)) + ((20 * math.sin(6 * slot0 * slot0) + 20 * math.sin(2 * slot0 * slot0)) * 2) / 3 + ((20 * math.sin(slot1 * slot0) + 40 * math.sin(slot1 / 3 * slot0)) * 2) / 3 + ((160 * math.sin(slot1 / 12 * slot0) + 320 * math.sin((slot1 * slot0) / 30)) * 2) / 3
end

function transformLon(slot0, slot1)
	return 300 + slot0 + 2 * slot1 + 0.1 * slot0 * slot0 + 0.1 * slot0 * slot1 + 0.1 * math.sqrt(math.abs(slot0)) + ((20 * math.sin(6 * slot0 * slot0) + 20 * math.sin(2 * slot0 * slot0)) * 2) / 3 + ((20 * math.sin(slot0 * slot0) + 40 * math.sin(slot0 / 3 * slot0)) * 2) / 3 + ((150 * math.sin(slot0 / 12 * slot0) + 300 * math.sin(slot0 / 30 * slot0)) * 2) / 3
end

slot4 = 6371

function get_distance_hav(slot0, slot1, slot2, slot3)
	return 2 * slot0 * math.asin(math.sqrt(slot4(slot11) + math.cos(slot6) * math.cos(slot7) * slot4(slot10)))
end

function get_distance_hav_ex(slot0, slot1, slot2, slot3)
	return slot0(0, get_distance_hav(slot0, slot1, slot2, slot3) * 1000)
end

function distanceToEast(slot0, slot1)
	return math.deg(2 * math.asin(math.sin(slot0 / (2 * slot0)) / math.cos(slot1)))
end

function distanceToNorth(slot0)
	return math.deg(slot0 / slot0)
end

function getSpecifiedCoordinates(slot0, slot1, slot2)
	return slot1 - slot0(6, math.abs(LBSUtil.distanceToEast(slot0, slot2))), slot2 - slot0(6, LBSUtil.distanceToNorth(slot0)), slot1 + slot0(6, math.abs(LBSUtil.distanceToEast(slot0, slot2))), slot2 + slot0(6, LBSUtil.distanceToNorth(slot0))
end

return
