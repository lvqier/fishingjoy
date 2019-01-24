BaseVerletModel = class("BaseVerletModel")

BaseVerletModel.ctor = function (slot0)
	slot0.m_fXPosVerlet = 0
	slot0.m_fYPosVerlet = 0
	slot0.m_fTempXVerlet = 0
	slot0.m_fTempYVerlet = 0
	slot0.m_fPreXVerlet = 0
	slot0.m_fPreYVerlet = 0
end

BaseVerletModel.updateVerlet = function (slot0)
	slot0.m_fTempXVerlet = slot0.m_fXPosVerlet
	slot0.m_fTempYVerlet = slot0.m_fYPosVerlet
	slot0.m_fXPosVerlet = slot0.m_fXPosVerlet + slot0:getVx()
	slot0.m_fYPosVerlet = slot0.m_fYPosVerlet + slot0:getVy()
	slot0.m_fPreXVerlet = slot0.m_fTempXVerlet
	slot0.m_fPreYVerlet = slot0.m_fTempYVerlet
end

BaseVerletModel.setX = function (slot0, slot1)
	slot0.m_fPreXVerlet = slot1
	slot0.m_fXPosVerlet = slot1
end

BaseVerletModel.setY = function (slot0, slot1)
	slot0.m_fPreYVerlet = slot1
	slot0.m_fYPosVerlet = slot1
end

BaseVerletModel.setVx = function (slot0, slot1)
	slot0.m_fPreXVerlet = slot0.m_fXPosVerlet - slot1
end

BaseVerletModel.setVy = function (slot0, slot1)
	slot0.m_fPreYVerlet = slot0.m_fYPosVerlet - slot1
end

BaseVerletModel.getVx = function (slot0)
	return slot0.m_fXPosVerlet - slot0.m_fPreXVerlet
end

BaseVerletModel.getVy = function (slot0)
	return slot0.m_fYPosVerlet - slot0.m_fPreYVerlet
end

BaseVerletModel.getX = function (slot0)
	return slot0.m_fXPosVerlet
end

BaseVerletModel.getY = function (slot0)
	return slot0.m_fYPosVerlet
end

BaseVerletModel.setXY = function (slot0, slot1, slot2)
	slot0:setX(slot1)
	slot0:setY(slot2)
end

BaseVerletModel.getXY = function (slot0)
	return slot0:getX(), slot0:getY()
end

BaseVerletModel.setPosition = function (slot0, slot1)
	slot0:setXY(slot1.x, slot1.y)
end

BaseVerletModel.getPosition = function (slot0)
	return cc.p(slot0:getX(), slot0:getY())
end

BaseVerletModel.getPositionXY = function (slot0)
	return slot0:getX(), slot0:getY()
end

BaseVerletModel.isStill = function (slot0)
	return slot0:getVx() == 0 and slot0:getVy() == 0
end

BaseVerletModel.makeStill = function (slot0)
	slot0:setVx(0)
	slot0:setVy(0)
end

BaseVerletModel.destroy = function (slot0)
	slot0.m_fXPosVerlet = nil
	slot0.m_fYPosVerlet = nil
	slot0.m_fTempXVerlet = nil
	slot0.m_fTempYVerlet = nil
	slot0.m_fPreXVerlet = nil
	slot0.m_fPreYVerlet = nil
end

return BaseVerletModel
