slot0 = class("BeanManager")

requireClientCoreMain("bean.AbstractBean")

slot0.ctor = function (slot0)
	return
end

slot0.deploy = function (slot0, slot1, slot2)
	if slot0._beans then
		for slot6, slot7 in pairs(slot0._beans) do
			if slot7.destroy then
				slot7:destroy()
			end
		end
	end

	slot0._beanStartTime = nil
	slot0._beans = slot1
	slot0._beansLen = #slot1
	slot0._curBeanIndex = 1

	slot0:startBean(slot2)
end

slot0.startBean = function (slot0, slot1)
	if slot1 then
		if type(slot1) == "table" then
			slot1 = table.indexof(slot0._beans, slot1)
		end

		slot0._curBeanIndex = slot1
	end

	if slot0._beanStartTime and slot0._beans[slot0._curBeanIndex - 1] then
		slot0._beanStartTime = tickMgr:getTimer()

		traceLog("Deploy bean " .. slot2.__cname .. " cost(s):" .. tostring(tickMgr:getTimer() - slot0._beanStartTime))
	end

	if slot0._curBeanIndex <= slot0._beansLen then
		slot3 = slot0._beans[slot0._curBeanIndex].new()

		slot3.finishSignal:addOnce(slot0.startBean, slot0)

		slot0._curBeanIndex = slot0._curBeanIndex + 1
		slot0._beanStartTime = tickMgr:getTimer()

		print("[BEAN] Deplay bean : " .. tostring(slot3.__cname))
		slot3:start()
	else
		print("[BEAN] All beans have been deployed!")
	end
end

slot0.destroy = function (slot0)
	slot0._beanStartTime = nil
	slot0._beans = nil
	slot0._beansLen = nil
	slot0._curBeanIndex = nil
end

beanMgr = slot0.new()

return
