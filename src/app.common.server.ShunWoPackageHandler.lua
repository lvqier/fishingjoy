slot2 = "ShunWoPackageHandler"
ShunWoPackageHandler = class(slot1)
socketListeners = {}

ShunWoPackageHandler.ctor = function (slot0)
	slot4 = AbstractPackageHandler

	ClassUtil.extends(slot2, slot0)

	slot4 = "TCP_Info"
	slot0._packageLenByteNum = ffiMgr.sizeOf(slot2, ffiMgr)
	slot4 = "TCP_Head"
	slot0._packageHeadByteNum = ffiMgr.sizeOf(slot2, ffiMgr)
	slot5 = nil

	createSetterGetter(slot2, slot0, "dataType")
end

ShunWoPackageHandler.cookOject2Bytes = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = ""

	if slot1 then
		if slot7 then
			slot8 = slot1
		else
			slot13 = slot6
			slot8 = ffiMgr.toLuaString(slot10, ffiMgr, slot1)
		end
	end

	if slot3 then
		slot14 = 64
		slot13 = string.sub("res/cocos/btn_close.png", DisplayUtil.getMsgOfPng(slot10), 1)
		slot8 = StringUtil.rc4Str("res/cocos/btn_close.png", slot8)
	end

	slot10 = ffiMgr.createCStruct(slot11, ffiMgr)
	slot10.Head.CommandInfo.wMainCmdID = slot4
	slot10.Head.CommandInfo.wSubCmdID = slot5
	slot10.Head.TCPInfo.wPacketSize = #slot8 + slot0._packageHeadByteNum
	slot10.cbBuffer = slot8
	slot16 = #slot8 + slot0._packageHeadByteNum
	slot16 = slot0._dataType

	return CryptoSwManager_mappedBuffer(ffiMgr, ffiMgr.toLuaString("TCP_Buffer", ffiMgr, slot10)).buffer
end

ShunWoPackageHandler.readPackageLen = function (slot0)
	slot5 = slot0._packageLenByteNum
	slot6 = slot0._buffer.getPosition(slot2)

	slot0._buffer.setPosition(slot0._buffer, slot0._buffer)

	slot7 = "TCP_Info"

	return ffiMgr.toCStruct(slot0._buffer, ffiMgr, slot0._buffer.readBytes2String(slot0._buffer, slot0._buffer)).wPacketSize
end

ShunWoPackageHandler.handlePackage = function (slot0, slot1)
	slot4 = slot1

	if slot1.getBytesAvailable(slot3) > 0 then
		slot8 = slot1
		slot7 = slot0._dataType

		if CryptoSwManager_unmapBuffer(slot1, slot1.readBytes2String(slot4, slot1.getBytesAvailable(slot7))) then
			slot9 = slot0._packageHeadByteNum
			slot9 = slot0._packageHeadByteNum + 1
			slot6 = string.sub(slot3, slot3)
			slot11 = "TCP_Head"
			slot8 = tonumber(ffiMgr)
			slot11 = ffiMgr.toCStruct(slot3, ffiMgr, slot5).CommandInfo.wSubCmdID
			slot9 = tonumber(ffiMgr.toCStruct(slot3, ffiMgr, slot5).CommandInfo.wMainCmdID)
			slot14 = __G__TRACKBACK__

			xpcall(slot12, function ()
				slot6 = slot3._dataType

				networkMgr.onSocketDataReceived(slot1, networkMgr, networkMgr.onSocketDataReceived, slot1, )
			end)
		end
	end
end

ShunWoPackageHandler.defaultSocketErrorCallback = function (slot0)
	return
end

return
