AbstractPackageHandler = class("AbstractPackageHandler")

AbstractPackageHandler.ctor = function (slot0, ...)
	slot0._buffer = ByteArray.new()
	slot0._packageSize = 0
	slot0._packageLenByteNum = 2
end

AbstractPackageHandler.handlePackage = function (slot0, slot1)
	assert(false, "this method is supposed to be oveerride")
end

AbstractPackageHandler.readPackageLen = function (slot0)
	assert(false, "this method is supposed to be oveerride")

	return slot0._buffer:readInt() - 4
end

AbstractPackageHandler.cookOject2Bytes = function (slot0, slot1, slot2, ...)
	assert(false, "this method is supposed to be oveerride")

	return ByteArray.new()
end

AbstractPackageHandler.cookBytes2Object = function (slot0, slot1, slot2)
	slot3 = slot0._buffer:getPosition()

	slot0._buffer:setPosition(slot0._buffer:getSize() + 1)

	if StringUtil.isStringValid(slot1) then
		slot0._buffer:writeBytesViaString(slot1)
	end

	if StringUtil.isStringValid(slot2) then
		slot0._buffer:writeBytesViaString(slot2)
	end

	slot0._buffer:setPosition(slot3)
	slot0:cutPackages()
end

AbstractPackageHandler.resetBuffer = function (slot0)
	slot0._buffer = ByteArray.new()
	slot0._packageSize = 0
end

AbstractPackageHandler.cutPackages = function (slot0)
	if not slot0._buffer then
		return
	end

	if slot0._packageSize == 0 then
		if slot0._packageLenByteNum <= slot0._buffer:getBytesAvailable() then
			slot0._packageSize = slot0:readPackageLen()
		else
			return
		end
	end

	slot1 = slot0._buffer:getBytesAvailable()

	if slot0._packageSize ~= 0 and slot0._packageSize <= slot1 then
		slot0._buffer:removeAlreadyReadBytes()
		slot0:handlePackage(slot0._buffer:readBytes(slot0._packageSize))

		slot0._packageSize = 0

		slot0:cutPackages()
	end
end

AbstractPackageHandler.destroy = function (slot0)
	slot0._buffer = nil
	slot0._packageSize = nil
	slot0._packageLenByteNum = nil
end

return
