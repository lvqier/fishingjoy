slot2 = "HueNode"
HueNode = class(slot1)

HueNode.createSprite = function (slot0)
	slot5 = HueNode

	ClassUtil.extends(slot0, display.newSprite(slot2))

	return display.newSprite(slot2)
end

HueNode.ctor = function (slot0)
	slot13 = slot0.onHueChanged

	createSetterGetter(slot2, slot0, "hue", 0, nil, nil, nil, handler(slot11, slot0))

	slot0._shaderState = nil
end

HueNode.applyShaderState = function (slot0, slot1, slot2)
	if slot1.setGLProgramState then
		slot6 = slot2

		slot1.setGLProgramState(slot4, slot1)
	end

	slot7 = slot1

	for slot6, slot7 in ipairs(slot1.getChildren(slot6)) do
		slot12 = slot2

		slot0.applyShaderState(slot9, slot0, slot7)
	end
end

HueNode.onHueChanged = function (slot0)
	slot0._hue = (slot0._hue or 0) % 6.28
	slot1 = (slot0._hue or 0) % 6.28 * MathUtil.RANDIAN_2_DEGREE

	if not slot0._shaderState then
		slot6 = "gameres/shader/Hue.fsh"
		slot2 = cc.GLProgram.createWithFilenames(slot3, cc.GLProgram, "gameres/shader/Hue.vsh")
		slot7 = cc.VERTEX_ATTRIB_POSITION

		slot2.bindAttribLocation(cc.GLProgram, slot2, cc.ATTRIBUTE_NAME_POSITION)

		slot7 = cc.VERTEX_ATTRIB_COLOR

		slot2.bindAttribLocation(cc.GLProgram, slot2, cc.ATTRIBUTE_NAME_COLOR)

		slot7 = cc.VERTEX_ATTRIB_TEX_COORD

		slot2.bindAttribLocation(cc.GLProgram, slot2, cc.ATTRIBUTE_NAME_TEX_COORD)

		slot6 = slot2
		slot0._shaderState = cc.GLProgramState.getOrCreateWithGLProgram(cc.GLProgram, cc.GLProgramState)
		slot8 = slot1

		slot0._shaderState.setUniformFloat(cc.GLProgramState, slot0._shaderState, "fHue")

		slot8 = cc.GLProgramState.getOrCreateWithGLProgram(cc.GLProgram, cc.GLProgramState)

		slot0.applyShaderState(cc.GLProgramState, slot0, slot0)
	else
		slot6 = slot1

		slot0._shaderState.setUniformFloat(slot3, slot0._shaderState, "fHue")
	end
end

return
