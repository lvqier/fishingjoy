slot0 = ClassLoader:aquireClass("TexturedNumber")
slot1 = class_C("FixWidthTexturedNumber", function ()
	return slot0:create()
end)

slot1.ctor = function (slot0)
	return
end

slot1.setFixWidth = function (slot0, slot1)
	slot0._fixWidth = slot1

	slot0:doLayout()
end

slot1.doLayout = function (slot0)
	slot0:doLayout()

	slot1 = 1
	slot2 = slot0:getContentSize()

	if slot0._fixWidth and slot0._fixWidth < slot2.width then
		slot1 = slot0._fixWidth / slot2.width
	end

	slot0.__spriteContainer:setAnchorPoint(0.5, 0.5)
	slot0.__spriteContainer:setContentSize(slot2)
	slot0.__spriteContainer:setScale(slot1)
	slot0.__spriteContainer:setPosition(slot2.width / 2 * slot1, slot2.height / 2 * slot1)
	slot0:setContentSize(cc.size(slot2.width * slot1, slot2.height * slot1))
end

slot1.onDestroy = function (slot0)
	slot0:onDestroy()
end

return slot1
