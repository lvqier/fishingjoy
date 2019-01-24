slot2 = "GaoFangBean"
GaoFangBean = class(slot1)

GaoFangBean.ctor = function (slot0)
	slot4 = AbstractBean

	ClassUtil.extends(slot2, slot0)
end

needCheckIpSkipBeanInIos = true

GaoFangBean.start = function (slot0)
	if IS_IOS_VERIFY then
		slot3 = slot0

		slot0.finish(slot2)

		return
	end

	function slot7()
		slot2 = "高防请求失败，跳过"

		trace_r(slot1)

		slot2 = trace_r

		trace_r.finish(slot1)
	end

	mainMgr.reqServerState(slot4, mainMgr, function (slot0)
		if isMobile and (isAndroid or not IS_IOS_VERIFY) and IS_LAUNCH_GAOFANG and MainManager_initGaoFangNewLink then
			needCheckIpSkipBeanInIos = false

			function slot6(slot0)
				needCheckIpSkipBeanInIos = true
				slot3 = slot0

				print(slot2, debug.traceback())

				slot3 = slot0

				slot0.finish(slot2)
			end

			xpcall(slot4, function ()
				slot3 = slot0.gaofang

				trace_r(slot2)

				slot3 = slot0.gaofang.laba

				if type(slot2) == "string" then
					slot3 = slot0.laba

					if StringUtil.isStringValid(slot2) then
						SOCKET_IP_TRUMPET = slot0.laba
					end
				end

				if not isAndroid and isMobile and isOutServer and not isOutServerTest then
					IS_IOS_VERIFY_FORCE = slot0.isexamine == 1
				end

				function slot1(slot0)
					if slot0 then
						slot3 = slot0.logon.iplist

						for slot4, slot5 in pairs(slot2) do
							slot10 = slot5.ip

							table.insert(slot7, SOCKET_IP_ARR, 1)
						end

						SOCKET_IP = SOCKET_IP_ARR[1]
					end

					slot3 = slot1

					slot1.finish(slot2)
				end

				slot5 = slot0.isapplepay

				print(slot3, "##是否开启苹果支付：")

				if slot0.isapplepay and slot0.isapplepay == 1 then
					slot5 = true

					Hero.setIsOpenApplePay(slot3, Hero)
				else
					slot5 = false

					Hero.setIsOpenApplePay(slot3, Hero)
				end

				if slot0.gfverify and slot0.gfverify.status == 1 and slot0.gfverify.iplist then
					slot2 = {}
					slot5 = slot0.gfverify.iplist

					for slot6, slot7 in pairs(slot4) do
						slot11 = slot7.ip

						table.insert(slot9, slot2)
					end

					slot7 = slot1

					MainManager_initGaoFangNewLink(slot4, slot2, 10086)
				else
					slot4 = slot1

					slot1.finish(slot3)
				end
			end)
		else
			slot3 = slot0

			slot0.finish(slot2)
		end
	end)
end

return
