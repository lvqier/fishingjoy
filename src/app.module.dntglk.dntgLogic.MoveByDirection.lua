slot0 = requireLuaFromModule(slot1)
slot1 = class("dntglk.dntgLogic.MoveCompent")
slot4 = cc.Director
slot4 = cc.Director.getInstance("MoveByDirection")
slot3 = 1440 / cc.Director.getInstance("MoveByDirection").getVisibleSize("MoveByDirection").width
slot4 = 900 / cc.Director.getInstance("MoveByDirection").getVisibleSize("MoveByDirection").height

slot1.ctor = function (slot0)
	slot4 = slot0

	ClassUtil.extends(slot2, slot0)

	slot0.inited_ = false
	slot0.angle_ = 0
	slot0.dx_ = 0
	slot0.dy_ = 0
	slot0.OnUpdate = slot0.OnUpdate
	slot0.CalcAngle = slot0.CalcAngle
	slot0.pi = M_PI
	slot0._math_acos = math.acos
	slot0._math_sqrt = math.sqrt
	slot0._math_cos = math.cos
	slot0._math_sin = math.sin
	slot0.m_bRebound = true
	slot0._tempPos = {
		x = 0,
		y = 0
	}
end

slot1.GetCompentDirection = function (slot0, slot1)
	return slot0._fixDirection
end

slot1.SetDirection = function (slot0, slot1)
	slot0._fixDirection = slot1
	slot4 = slot0._fixDirection - M_PI_2
	slot0.dx_ = slot0._math_cos(slot3)
	slot4 = slot0._fixDirection - M_PI_2
	slot0.dy_ = slot0._math_sin(slot3)
end

slot1.SetOwner = function (slot0, slot1)
	slot0.m_pOwner = slot1
	slot5 = slot0._fixDirection

	slot0.m_pOwner.SetDirection(slot3, slot0.m_pOwner)
end

slot1.CalcDistance = function (slot0, slot1, slot2, slot3, slot4)
	return (slot1 - slot3) * () + (slot2 - slot4) * ()
end

slot1.CalcAngle = function (slot0, slot1, slot2, slot3, slot4)
	slot9 = (slot1 - slot3) * () + (slot2 - slot4) * ()
	slot11 = (slot1 - slot3) / slot0._math_sqrt(slot8)

	return ((slot4 < slot2 and slot0._math_acos((slot2 - slot4) * ())) or 6.283185 - slot0._math_acos((slot2 - slot4) * ())) + 1.570796, slot7
end

slot1.OnUpdate = function (slot0, slot1)
	slot3 = slot0.m_fSpeed * slot1
	slot4 = 0

	if slot0.m_pOwner._pTarget and slot2.m_nState < DNTGLK_OBJ_STATE.EOS_DEAD then
		slot5 = slot0.m_pPosition
		slot0._tempPos.x = slot2.m_pPosition.x
		slot0._tempPos.y = slot2.m_pPosition.y

		if slot0.m_pOwner.lockingIndex > 0 then
			slot7 = slot0._math_sin(slot8)
			slot10 = slot2.m_fDirection
			slot8 = slot0._math_cos(slot6)
			slot9 = slot2.bbList[slot0.m_pOwner.lockingIndex]
			slot10 = 1

			if slot2.bbList.useBinding then
				slot13 = slot2.m_fDirection

				if math.cos(slot12) < 0 then
					slot13 = ProxyDntglk.model

					if ProxyDntglk.model.getMirror(slot12) then
						slot10 = -1
					end
				end
			end

			if slot2.bbList.useBinding then
				slot13 = slot2.m_fDirection

				if math.cos(slot12) > 0 then
					slot13 = ProxyDntglk.model

					if not ProxyDntglk.model.getMirror(slot12) then
						slot10 = -1
					end
				end
			end

			slot0._tempPos.x = (slot0._tempPos.x + slot9.offsetX * slot8 * slot0) - slot9.offsetY * slot7 * slot1 * slot10
			slot0._tempPos.y = slot0._tempPos.y + slot9.offsetX * slot7 * slot0 + slot9.offsetY * slot8 * slot1 * slot10
		end

		slot12 = slot5.y
		slot0._fixDirection, slot4 = slot0.CalcAngle(slot7, slot0, slot0._tempPos.x, slot0._tempPos.y, slot5.x)

		if slot7 < slot3 then
			slot3 = slot4 or slot3
			slot8 = slot0._fixDirection - M_PI_2
			slot0.dx_ = slot0._math_cos(slot7)
			slot8 = slot0._fixDirection - M_PI_2
			slot0.dy_ = slot0._math_sin(slot7)
			slot9 = slot0._fixDirection

			slot0.m_pOwner.SetDirection(slot7, slot0.m_pOwner)

			slot0.m_bRebound = false
		end
	else
		slot0.m_pOwner._pTarget = nil
		slot0.m_bRebound = true
	end

	slot0.m_pPosition.x = slot0.m_pPosition.x + slot0.dx_ * slot3
	slot0.m_pPosition.y = slot0.m_pPosition.y + slot0.dy_ * slot3

	if slot0.m_bRebound then
		if slot0.m_pPosition.x < 0.01 then
			slot0.m_pPosition.x = 0 + 0 - slot0.m_pPosition.x
			slot0.dx_ = -slot0.dx_
			slot0._fixDirection = -slot0._fixDirection
			slot8 = slot0._fixDirection

			slot0.m_pOwner.SetDirection(0 + 0 - slot0.m_pPosition.x, slot0.m_pOwner)
		end

		if slot0.m_pPosition.x > 1440 then
			slot0.m_pPosition.x = 2880 - slot0.m_pPosition.x
			slot0.dx_ = -slot0.dx_
			slot0._fixDirection = -slot0._fixDirection
			slot8 = slot0._fixDirection

			slot0.m_pOwner.SetDirection(2880 - slot0.m_pPosition.x, slot0.m_pOwner)
		end

		if slot0.m_pPosition.y < 0.01 then
			slot0.m_pPosition.y = 0 + 0 - slot0.m_pPosition.y
			slot0.dy_ = -slot0.dy_
			slot0._fixDirection = slot0.pi - slot0._fixDirection
			slot8 = slot0._fixDirection

			slot0.m_pOwner.SetDirection(slot0._fixDirection, slot0.m_pOwner)
		end

		if slot0.m_pPosition.y > 900 then
			slot0.m_pPosition.y = 1800 - slot0.m_pPosition.y
			slot0.dy_ = -slot0.dy_
			slot0._fixDirection = slot0.pi - slot0._fixDirection
			slot8 = slot0._fixDirection

			slot0.m_pOwner.SetDirection(slot0._fixDirection, slot0.m_pOwner)
		end
	end

	slot0.m_pOwner.m_pPosition.x = slot0.m_pPosition.x
	slot0.m_pOwner.m_pPosition.y = slot0.m_pPosition.y
end

return slot1
