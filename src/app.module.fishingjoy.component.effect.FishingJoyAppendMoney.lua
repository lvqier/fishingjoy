slot2 = "FishingJoyAppendMoney"
slot5 = "component.effect.FishingJoyEffectBase"
slot0 = class(slot1, FishingJoyRequireLua(slot4))

slot0.ctor = function (slot0)
	slot3 = slot0

	slot0.super.ctor(slot2)

	slot4 = FISHINGJOY_EFFECT_TYPE.APPENDMONEY

	slot0.setEffectType(slot2, slot0)

	slot0.effectParamCount = 3
	slot0.score = 0
end

slot0.getEffectParamSize = function (slot0)
	return slot0.effectParamCount
end

slot0.executeEffect = function (slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return 0, slot3
	end

	slot5 = 0
	slot6 = 1
	slot10 = 0
	slot7 = slot0.getEffectParam(slot8, slot0)
	slot11 = 1
	slot8 = slot0:getEffectParam(slot0)
	slot12 = 2
	slot9 = slot0:getEffectParam(slot0)

	if slot0.score == 0 then
		if slot8 < slot9 then
			slot13 = slot9
			slot0.score = math.random(slot11, slot8) or slot8
		end
	end

	if slot7 == 0 then
		slot6 = 1
	elseif slot2 then
		slot12 = slot2
		slot6 = slot2.getBulletScore(slot11)
	end

	if -1 ~= -1 then
		slot0.score = 0
	end

	if slot9 < slot10 + slot0.score then
		slot10 = slot9 - slot0.score
	end

	if slot4 then
		slot10 = 0
	end

	slot5 = (slot0.score + slot10) * slot6

	if slot2.__cname == "FishingJoyBullet" then
		if false then
			slot5 = slot5 * 2
		end
	end

	return slot5, slot3
end

return slot0
