require("clientcore.com.main.network.socket.assets.AbstractPackageHandler")

NormalPackageHandler = class("NormalPackageHandler")

NormalPackageHandler.ctor = function (slot0, ...)
	ClassUtil.extends(slot0, AbstractPackageHandler)

	slot0._packageLenByteNum = 4
end

NormalPackageHandler.readPackageLen = function (slot0)
	return slot0._buffer:readInt() - slot0._packageLenByteNum
end

NormalPackageHandler.handlePackage = function (slot0, slot1)
	slot1:toDebug()
	print("操作码:" .. tostring(slot2))
	slot1:toDebug()
	print("服务器id:" .. tostring(slot3))
	slot1:toDebug()
	print("版本号:" .. tostring(slot1:readByte()))
	slot1:toDebug()

	slot5 = nil

	if slot1:readByte() == SocketInstruction.DIRECT_MESSAGE then
	elseif slot2 == SocketInstruction.BROADCAST_MESSAGE then
		slot0:handleDirectMsg(slot5)
	end
end

NormalPackageHandler.handleDirectMsg = function (slot0, slot1)
	if socketCallbackMgr:remove(tostring(slot1.serialId)) then
	end
end

return
