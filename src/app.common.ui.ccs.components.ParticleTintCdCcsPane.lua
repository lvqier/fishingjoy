slot2 = "ParticleTintCdCcsPane"
ParticleTintCdCcsPane = class(slot1)

ParticleTintCdCcsPane.onCreationComplete = function (slot0)
	slot0._w = nil
	slot0._h = nil
	slot0._r = nil
	slot0._offsetX = nil
	slot0._offsetY = nil
	slot3 = slot0
	slot0._parent = slot0.getParent(slot2)
	slot0._isCdReverse = false

	if slot0.shadow then
		slot0._shadowTimer = cc.ProgressTimer.create(slot3, cc.ProgressTimer)
		slot4 = slot0.shadow.getPositionX(slot1)
		slot6 = cc.p(slot3, slot0.shadow.getPositionY(slot1))
		slot5 = slot0._shadowTimer
		slot9 = slot0.shadow.convertToWorldSpace(slot4, slot1)

		slot0._shadowTimer.setPosition(slot4, slot0._parent.convertToNodeSpace(slot0.shadow, slot0._parent))

		slot5 = slot0._shadowTimer
		slot8 = slot0.shadow

		slot0._shadowTimer.setScale(slot4, slot0.shadow:getScale())

		slot6 = cc.PROGRESS_TIMER_TYPE_RADIAL

		slot0._shadowTimer.setType(slot4, slot0._shadowTimer)

		slot6 = false

		slot0._shadowTimer.setReverseDirection(slot4, slot0._shadowTimer)

		slot6 = slot0._shadowTimer

		slot0._parent.addChild(slot4, slot0._parent)

		slot6 = CCSTweenProgressBar

		ClassUtil.extends(slot4, slot1)

		slot5 = slot0.shadow

		CCSTweenProgressBar.onCreationComplete(slot4)

		slot5 = slot0.shadow

		slot0.shadow.removeFromParent(slot4)
	end

	slot4 = slot0
	slot0._progressTimer = cc.ProgressTimer.create(slot2, cc.ProgressTimer)
	slot3 = slot0._progressTimer
	slot6 = slot0

	slot0._progressTimer.setPosition(slot2, slot0.getPosition(slot5))

	slot3 = slot0._progressTimer
	slot6 = slot0

	slot0._progressTimer.setScale(slot2, slot0.getScale(slot5))

	slot4 = cc.PROGRESS_TIMER_TYPE_RADIAL

	slot0._progressTimer.setType(slot2, slot0._progressTimer)

	slot4 = false

	slot0._progressTimer.setReverseDirection(slot2, slot0._progressTimer)

	slot4 = slot0._progressTimer

	slot0._parent.addChild(slot2, slot0._parent)

	slot4 = CCSTweenProgressBar

	ClassUtil.extends(slot2, slot0)

	slot3 = slot0

	CCSTweenProgressBar.onCreationComplete(slot2)

	slot3 = slot0

	slot0.removeFromParent(slot2)
end

ParticleTintCdCcsPane.deploy = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0._isCdReverse = slot7
	slot11 = slot0._isCdReverse

	slot0._progressTimer.setReverseDirection(slot9, slot0._progressTimer)

	if slot0._shadowTimer then
		slot11 = slot0._isCdReverse

		slot0._shadowTimer.setReverseDirection(slot9, slot0._shadowTimer)
	end

	slot0._w = slot2
	slot0._h = slot3
	slot0._r = slot4
	slot8 = math.atan(slot9)
	slot9 = math.atan(slot2 / slot3)
	slot0._radians = {
		slot8,
		slot9,
		slot9,
		slot8,
		slot8,
		slot9,
		slot9,
		slot8
	}
	slot0._offsetX = slot5
	slot0._offsetY = slot6
	slot12 = slot1

	if type(slot3 / slot2) == "string" then
		slot13 = slot1
		slot0._particle = cc.ParticleSystemQuad.create(slot11, cc.ParticleSystemQuad)
	else
		slot12 = slot1

		if type(slot11) == "table" then
			slot12 = slot1

			for slot13, slot14 in ipairs(slot11) do
				if slot13 == 1 then
					slot18 = slot14
					slot0._particle = cc.ParticleSystemQuad.create(slot16, cc.ParticleSystemQuad)
				else
					slot18 = slot14
					slot19 = cc.ParticleSystemQuad.create(slot16, cc.ParticleSystemQuad)

					slot0._particle.addChild(cc.ParticleSystemQuad, slot0._particle)
				end
			end
		else
			slot0._particle = slot1
		end
	end

	slot13 = 1

	slot0._particle.setPositionType(slot11, slot0._particle)

	slot12 = slot0._particle

	slot0._particle.stopSystem(slot11)

	slot13 = slot0._particle

	slot0._progressTimer.addChild(slot11, slot0._progressTimer)
end

ParticleTintCdCcsPane.setProgressPlaying = function (slot0, slot1, slot2, slot3)
	slot7 = 0

	slot0.reset(slot5, slot0)

	slot7 = slot1

	DisplayUtil.setVisible(slot5, slot0._progressTimer)

	if slot0._shadowTimer then
		slot7 = slot1

		DisplayUtil.setVisible(slot5, slot0._shadowTimer)
	end

	if slot0._particle then
		slot7 = slot1

		DisplayUtil.setVisible(slot5, slot0._particle)
	end

	if slot0._tintTl then
		slot6 = slot0._tintTl

		slot0._tintTl.kill(slot5)

		slot0._tintTl = nil
	end

	if slot1 then
		if slot0._particle then
			slot6 = slot0._particle

			slot0._particle.start(slot5)
		end

		slot13 = slot0._isCdReverse

		slot0.setTweenPercent(slot5, slot0, 100, slot2, nil, nil, nil, nil)

		if not slot3 then
			slot6 = slot0._progressTimer
			slot9 = 7915520

			slot0._progressTimer.setColor(slot5, DisplayUtil.rgb2ccc3(slot8))

			slot0._tintTl = TimelineLite.new()
			slot6 = slot0._tintTl
			slot11 = {
				tint = 16776960,
				ease = Linear.easeNone
			}

			slot0._tintTl.append(slot5, TweenLite.to(slot8, slot0._progressTimer, slot2 * 0.5))

			slot6 = slot0._tintTl
			slot11 = {
				tint = 16711680,
				ease = Linear.easeNone
			}

			slot0._tintTl.append(slot5, TweenLite.to(slot8, slot0._progressTimer, slot2 * 0.5))
		end
	else
		slot7 = 0

		slot0.applyPercent(slot5, slot0)

		if slot0._particle then
			slot6 = slot0._particle

			slot0._particle.stopSystem(slot5)
		end
	end
end

ParticleTintCdCcsPane.applyPercent = function (slot0, slot1)
	slot6 = 100
	slot1 = MathUtil.getValueBetween(slot3, slot1 or 0, 0)

	if slot0._isReverse then
		slot1 = 100 - slot1
	end

	slot2 = slot1

	if slot0._radians then
		slot4 = 0
		slot8 = slot1 / 100 / 0.125
		slot7 = (slot1 / 100 - math.floor(slot7) * 0.125) / 0.125

		for slot11 = 1, math.floor(slot7), 1 do
			slot4 = slot4 + slot0._radians[slot11]
		end

		if slot0._radians[slot6 + 1] then
			slot4 = slot4 + slot8 * slot7
		end

		slot2 = slot4 / (2 * math.pi) * 100
	end

	slot6 = slot1

	slot0._progressTimer.setPercentage(slot4, slot0._progressTimer)

	if slot0._shadowTimer then
		slot6 = slot1

		slot0._shadowTimer.setPercentage(slot4, slot0._shadowTimer)
	end

	if slot0._particle then
		slot3 = slot2 / 100

		if slot0._isCdReverse then
			slot3 = 1 - slot3
		end

		slot11 = slot0._r
		slot9 = slot0._h * 0.5 + MathUtil.calRoundRectPosition(slot5, slot3, 0, 0, slot0._w, slot0._h).y + slot0._offsetY

		slot0._particle.setPosition(slot3, slot0._particle, slot0._w * 0.5 + MathUtil.calRoundRectPosition(slot5, slot3, 0, 0, slot0._w, slot0._h).x + slot0._offsetX)
	end
end

ParticleTintCdCcsPane.destroy = function (slot0)
	if slot0._tintTl then
		slot3 = slot0._tintTl

		slot0._tintTl.kill(slot2)

		slot0._tintTl = nil
	end

	if slot0._particle then
		slot3 = slot0._particle

		slot0._particle.stopSystem(slot2)

		slot0._particle = nil
	end

	slot3 = slot0

	CCSTweenProgressBar.destroy(slot2)
end

return
