ComplaintController = class("ComplaintController")
URL_COMPLAINT = "/feedback"
KEY_COMPLAINT = "xxxxxxxxxxxxxxxxxkey3"

ComplaintController.ctor = function (slot0, slot1)
	slot0.model = slot1
end

ComplaintController.requestComplaintList = function (slot0, slot1)
	trace("投诉列表返回url:", slot3)
	requestHttp(URL_COMPLAINT .. table.concat(slot2, "&"), function (slot0)
		trace("投诉列表返回:", slot0)

		if cjson.decode(slot0).status ~= 0 then
			tweenMsgMgr:showRedMsg(slot1.msg)
		else
			slot2 = {}
			slot3 = {}

			for slot7, slot8 in pairs(slot1.data.list) do
				if tonumber(slot8.handlestatus) == 1 then
					table.insert(slot3, slot8)

					if tonumber(slot8.isreaded) ~= 1 then
						table.insert(slot2, slot8.msgid)
					end
				end
			end

			slot0.model:setNotReadedList(slot2)
			slot0.model:setComplaintList(slot3)

			if slot1 then
				slot1()
			end
		end
	end, nil, nil, nil, nil, nil, nil, nil, true)
end

ComplaintController.requestComplaintSubmit = function (slot0, slot1, slot2)
	table.insert(slot3, "content=" .. slot1)
	requestHttp(URL_COMPLAINT .. table.concat(slot3, "&"), function (slot0)
		trace("投诉建议提交:", slot0)

		if cjson.decode(slot0).status ~= 0 then
			tweenMsgMgr:showRedMsg(slot1.msg)
		else
			tweenMsgMgr:showGreenMsg("投诉建议提交成功！")

			if slot0 then
				slot0()
			end
		end
	end)
end

ComplaintController.requestReadComplaint = function (slot0)
	table.insert(slot1, "msgid=" .. slot2)
	requestHttp(URL_COMPLAINT .. table.concat(slot1, "&"), function (slot0)
		trace("投诉回复阅读:", slot0)

		if cjson.decode(slot0).status ~= 0 then
			tweenMsgMgr:showRedMsg(slot1.msg)
		else
			slot0.model:setNotReadedList({})
		end
	end)
end

ComplaintController.requestEvaluate = function (slot0, slot1, slot2, slot3)
	slot4 = slot0:getCommonReqData("evaluate")

	table.insert(slot4, "msgid=" .. slot1)
	table.insert(slot4, "score=" .. slot2)

	function onComplete(slot0)
		trace("评价结果:", slot0)

		if cjson.decode(slot0).status ~= 0 then
			tweenMsgMgr:showRedMsg(slot1.msg)
		else
			tweenMsgMgr:showMsg(slot1.msg)
			slot0:requestComplaintList()
			applyFunction(slot1)
		end
	end

	requestHttp(URL_COMPLAINT .. table.concat(slot4, "&"), onComplete)
end

ComplaintController.gotoReportKefu = function (slot0)
	OSUtil.openURL(Hero:getComplaintLink())
end

ComplaintController.getCommonReqData = function (slot0, slot1)
	table.insert(slot2, "userid=" .. tostring(Hero:getDwUserID()))
	table.insert(slot2, "interfacetype=" .. slot1)
	table.insert(slot2, "timestamp=" .. slot3)
	table.insert({}, "sign=" .. StringUtil.md5sum(slot4, false))

	return 
end

ComplaintController.destroy = function (slot0)
	slot0.model = nil
end

return
