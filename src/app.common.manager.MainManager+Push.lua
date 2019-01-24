function cpp_lua_onRegisterForRemoteNotificationsWithDeviceToken(slot0)
	slot5 = slot0
	slot5 = true
	slot8 = StringUtil.md5sum("device=%d&devicetoken=%s&key=LPevJofXmWvLHh4C2fKj4ObceLBe83AK", string.format(slot2, "device=%d&devicetoken=%s&key=LPevJofXmWvLHh4C2fKj4ObceLBe83AK", PACKAGE_DEVICE_TYPE))
	slot8 = "请求push注册：" .. slot2

	trace(HtmlUtil.createYellowTxt(0))

	slot15 = true

	requestHttp(PACKAGE_DEVICE_TYPE, string.format("device=%d&devicetoken=%s&key=LPevJofXmWvLHh4C2fKj4ObceLBe83AK", "/apns_api?device=%d&devicetoken=%s&istesting=%d&sign=%s", PACKAGE_DEVICE_TYPE, slot0, 0), function (slot0)
		slot4 = "push注册返回"

		trace(slot0)

		slot4 = cjson.decode(slot2)

		trace_r(slot0)

		if cjson.decode(slot2).status == 0 then
			pushToken2Update2Server = nil
			slot4 = "push注册成功"

			print(slot3)
		end
	end, nil, nil, nil, nil, nil, nil, nil)
end

MainManager.deployPushToken = function (slot0)
	slot4 = pushToken2Update2Server

	trace(slot2, "检查启动时的push token")

	if pushToken2Update2Server then
		slot3 = pushToken2Update2Server

		cpp_lua_onRegisterForRemoteNotificationsWithDeviceToken(slot2)
	end
end

return
