slot2 = "TrackManager"
TrackManager = class(slot1)
TRACK_HALL_GRZX = 10001
TRACK_HALL_YH = 10002
TRACK_HALL_CZ = 10003
TRACK_HALL_JB = 10004
TRACK_HALL_YYDB = 10005
TRACK_HALL_XYDZP = 10006
TRACK_HALL_KF = 10007
TRACK_HALL_XX = 10008
TRACK_HALL_PHB = 10009
TRACK_HALL_SZ = 10010
TRACK_HALL_PMD = 10011
TRACK_HALL_DH = 10012
TRACK_HALL_WZ = 10013
TRACK_HALL_JJJ = 10014
TRACK_MEMBER_BDYHK = 11001
TRACK_MEMBER_GGTX = 11002
TRACK_MEMBER_FZID = 11003
TRACK_MEMBER_BDSJ = 11004
TRACK_MEMBER_BDZFB = 11005
TRACK_BANKER_CQ = 12001
TRACK_BANKER_ZS = 12002
TRACK_BANKER_JL = 12003
TRACK_RECHARGE_ZFB = 13001
TRACK_RECHARGE_QQ = 13002
TRACK_RECHARGE_WX = 13003
TRACK_RECHARGE_YL = 13004
TRACK_RECHARGE_CZK = 13005
TRACK_RECHARGE_JD = 13006
TRACK_RECHARGE_PGNG = 13007
TRACK_RECHARGE_DLCZ = 13008
TRACK_REPORT_FZWXH = 14001
TRACK_YYDB_LJCJ = 15001
TRACK_XYDZP_CJ = 16001
TRACK_KEFU_CKCJWT = 17001
TRACK_KEFU_FK = 17002
TRACK_SETTING_XZCJMS = 18001
TRACK_SETTING_XZQHZH = 18002
TRACK_SETTING_XZYYSZ = 18003
TRACK_SETTING_XZYXSZ = 18004
TRACK_GAME_DNTG1 = 19001
TRACK_GAME_DNTG2 = 19002
TRACK_GAME_DDZ = 19003
TRACK_GAME_ZJH = 19004
TRACK_GAME_ERMJ = 19005
TRACK_GAME_HHDZ = 19006
TRACK_GAME_ERDN = 19007
TRACK_GAME_BRNN = 19008
TRACK_GAME_QZNN = 19009
TRACK_GAME_JDNN = 19010
TRACK_GAME_BJL = 19011
TRACK_EXCHANGE_GB = 11101
TRACK_EXCHANGE_ZFBDH = 11102
TRACK_EXCHANGE_YHKDH = 11103
TRACK_LOGIN_YKDL = 11201
TRACK_LOGIN_ZHDL = 11202
TRACK_LOGIN_KF = 11203
TRACK_HLDBZ_GB = 20001
TRACK_HLDBZ_QCZ = 20002
TRACK_HLDBZ_QYH = 20003
TRACK_JRYX_DNTG1_KSKS = 30001
TRACK_JRYX_DNTG1_DFJ = 30002
TRACK_JRYX_DNTG2_KSKS = 31001
TRACK_JRYX_DNTG2_DFJ = 31002
TRACK_JRYX_DDZ_KSKS = 32001
TRACK_JRYX_DDZ_DFJ = 32002
TRACK_JRYX_ZJH_KSKS = 33001
TRACK_JRYX_ZJH_DFJ = 33002
TRACK_JRYX_ERMJ_KSKS = 34001
TRACK_JRYX_ERMJ_DFJ = 34002
TRACK_JRYX_HHDZ_KSKS = 35001
TRACK_JRYX_HHDZ_DFJ = 35002
TRACK_JRYX_ERDN_KSKS = 36001
TRACK_JRYX_ERDN_DFJ = 36002
TRACK_JRYX_BRNN_KSKS = 37001
TRACK_JRYX_BRNN_DFJ = 37002
TRACK_JRYX_QZNN_KSKS = 38001
TRACK_JRYX_QZNN_DFJ = 38002
TRACK_JRYX_JDNN_KSKS = 39001
TRACK_JRYX_JDNN_DFJ = 39002
TRACK_JRYX_BJL_KSKS = 31101
TRACK_JRYX_BJL_DFJ = 31102
TRACK_TYC_POPUP_GB = 40001
TRACK_TYC_POPUP_QCZ = 40002
TRACK_TYC_POPUP_JXW = 40003
TRACK_GAME_HHDZ_XY = 50001
TRACK_GAME_HHDZ_SZ = 50002
TRACK_GAME_HHDZ_QZ = 50003
TRACK_GAME_HHDZ_QK = 50004
TRACK_GAME_BRNN_XY = 51001
TRACK_GAME_BRNN_SZ = 51002
TRACK_GAME_BRNN_QZ = 51003
TRACK_GAME_BRNN_QK = 51004
TRACK_GAME_BJL_XY = 52001
TRACK_GAME_BJL_SZ = 52002
TRACK_GAME_BJL_QZ = 52003
TRACK_GAME_BJL_QK = 52004
TRACK_GAME_DNTG1_ZDDP = 60001
TRACK_GAME_DNTG1_SD = 60002
TRACK_GAME_DNTG2_ZDDP = 70001
TRACK_GAME_DNTG2_SD = 70002
TRACK_GAME_DNTG2_BJS = 70003
TRACK_GAME_DNTG2_2BS = 70004
TRACK_GAME_DNTG2_4BJS = 70005
TRACK_SJB_GUESS = 80001
TRACK_SJB_MY_BET = 80002
TRACK_SJB_MATCH_OUTS = 80003
TRACK_SJB_MATCH_RESULT = 80004
TRACK_SJB_SHOWING_RULE = 80005
TRACK_SJB_SHOWING_BANK = 80006
TRACK_SJB_EXIT = 80007

TrackManager.ctor = function (slot0)
	slot4 = 300000

	slot0.startTimer(slot2, slot0)
end

TrackManager.recordTracks = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot0._tracksData = slot0._tracksData or {}

	if not slot0._tracksData[slot1] then
		slot0._tracksData[slot1] = {
			count = 1,
			trackId = slot1
		}
	else
		slot0._tracksData[slot1].count = slot0._tracksData[slot1].count + 1
	end
end

TrackManager.formatTracksData = function (slot0)
	if slot0._tracksData then
		slot1 = {
			userId = Hero.getDwUserID(slot3),
			machineCode = bridgeMgr.getPhoneUUId(slot3),
			deviceId = PACKAGE_DEVICE_TYPE
		}
		slot4 = Hero
		slot2 = {}
		slot5 = slot0._tracksData

		for slot6, slot7 in pairs(bridgeMgr) do
			slot10 = slot6
			slot2[tostring(slot9)] = slot7.count
		end

		slot1.infos = slot2

		return slot1
	else
		return nil
	end
end

TrackManager.requestTrackInfoHttp = function (slot0)
	function slot1(slot0)
		slot0._tracksData = nil
		slot3 = "请求埋点成功返回"

		print(nil)

		slot3 = slot0

		print_r(nil)
	end

	function slot2(slot0)
		slot3 = "请求埋点失败返回"

		print(slot2)

		slot3 = slot0

		print_r(slot2)
	end

	function slot3()
		slot2 = "请求埋点超时返回"

		print(slot1)

		slot2 = data

		print_r(slot1)
	end

	slot7 = slot0.formatTracksData(slot5)

	if not TableUtil.isEmpty(slot0) then
		slot7 = TRACK_ACT_URL

		if StringUtil.isStringValid(slot6) then
			slot8 = slot4
			slot9 = TRACK_ACT_URL

			print(slot7, "请求埋点的url和数据是")

			slot8 = {
				data = cjson.encode(slot7)
			}

			print_r(slot7)

			slot13 = true

			requestHttpSign4Php(slot7, TRACK_ACT_URL, , slot1, slot2, slot3)
		end
	end
end

TrackManager.startTimer = function (slot0, slot1)
	if not slot0._timer then
		slot4 = TRACK_ACT_URL

		if StringUtil.isStringValid(slot3) then
			slot8 = slot0.requestTrackInfoHttp
			slot7 = -1
			slot0._timer = tickMgr.delayedCall(slot3, tickMgr, handler(slot6, slot0), slot1)
		end
	end
end

TrackManager.stopTimer = function (slot0)
	if slot0._timer then
		slot3 = slot0._timer

		slot0._timer.destroy(slot2)

		slot0._timer = nil
	end
end

trackMgr = TrackManager.new()

return
