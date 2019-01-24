ShaderUtil = {
	_shaders = {
		GRAY = {
			"gameres/shader/Gray.vsh",
			"gameres/shader/Gray.fsh"
		},
		BLUR = {
			"gameres/shader/Blur.vsh",
			"gameres/shader/Blur.fsh"
		}
	},
	_shaders3D = {
		GREYSCALE = {
			"gameres/shader3D/noMvp.vert",
			"gameres/shader3D/greyScale.fsh"
		},
		OUTLINE = {
			"gameres/shader3D/OutLine.vert",
			"gameres/shader3D/OutLine.frag"
		}
	},
	_shaderCache = {},
	_shaderCache3D = {}
}

ShaderUtil.addShaders = function (slot0)
	slot3 = slot0

	for slot4, slot5 in pairs(slot2) do
		ShaderUtil._shaders[slot4] = slot5
	end
end

ShaderUtil.getShader = function (slot0)
	slot2 = ShaderUtil._shaderCache[slot0]

	if ShaderUtil._shaders[slot0] and not slot2 then
		slot7 = slot1[2]
		slot7 = cc.VERTEX_ATTRIB_POSITION

		cc.GLProgram.createWithFilenames(slot4, cc.GLProgram, slot1[1]).bindAttribLocation(slot4, slot2, cc.ATTRIBUTE_NAME_POSITION)

		slot7 = cc.VERTEX_ATTRIB_COLOR

		cc.GLProgram.createWithFilenames(slot4, cc.GLProgram, slot1[1]).bindAttribLocation(slot4, slot2, cc.ATTRIBUTE_NAME_COLOR)

		slot7 = cc.VERTEX_ATTRIB_TEX_COORD

		cc.GLProgram.createWithFilenames(slot4, cc.GLProgram, slot1[1]).bindAttribLocation(slot4, slot2, cc.ATTRIBUTE_NAME_TEX_COORD)

		slot6 = cc.GLProgram.createWithFilenames(slot4, cc.GLProgram, slot1[1])
		ShaderUtil._shaderCache[slot0] = cc.GLProgramState.getOrCreateWithGLProgram(slot4, cc.GLProgramState)
	end

	return slot2
end

ShaderUtil.getShader3D = function (slot0)
	if ShaderUtil._shaders3D[slot0] and not ShaderUtil._shaderCache3D[slot0] then
		slot5 = slot0

		echo(slot3, "ShaderUtil.getShader3D")

		slot5 = cc.GLProgram
		slot3 = cc.GLProgram.new("ShaderUtil.getShader3D")
		ShaderUtil._shaderCache3D[slot0] = slot3
		slot6 = slot1[2]

		ShaderUtil._shaderCache3D[slot0].initWithFilenames(slot3, ShaderUtil._shaderCache3D[slot0], slot1[1])

		slot6 = cc.VERTEX_ATTRIB_POSITION

		ShaderUtil._shaderCache3D[slot0].bindAttribLocation(slot3, ShaderUtil._shaderCache3D[slot0], cc.ATTRIBUTE_NAME_POSITION)

		slot6 = cc.VERTEX_ATTRIB_COLOR

		ShaderUtil._shaderCache3D[slot0].bindAttribLocation(slot3, ShaderUtil._shaderCache3D[slot0], cc.ATTRIBUTE_NAME_COLOR)

		slot6 = cc.VERTEX_ATTRIB_TEX_COORD

		ShaderUtil._shaderCache3D[slot0].bindAttribLocation(slot3, ShaderUtil._shaderCache3D[slot0], cc.ATTRIBUTE_NAME_TEX_COORD)
	end

	return ShaderUtil._shaderCache3D[slot0]
end

ShaderUtil.setShaderByName = function (slot0, slot1)
	if ShaderUtil._shaders[slot1] then
		slot4 = slot0
		slot7 = slot1

		ShaderUtil.setShader(slot3, ShaderUtil.getShader(slot6))
	end
end

ShaderUtil.setShader = function (slot0, slot1)
	if not slot0 or not slot1 then
		return
	end

	if slot0.setGLProgramState then
		slot5 = slot1

		slot0.setGLProgramState(slot3, slot0)
	end

	slot6 = slot0

	for slot5, slot6 in ipairs(slot0.getChildren(slot5)) do
		slot10 = slot1

		ShaderUtil.setShader(slot8, slot6)
	end
end

ShaderUtil.setParameter = function (slot0, slot1, slot2)
	slot5 = slot2

	if type(slot4) == "number" then
		slot7 = slot2

		slot0.setUniformFloat(slot4, slot0, slot1)
	else
		slot5 = slot2

		if type(slot4) == "table" then
			if #slot2 == 2 then
				slot7 = {
					x = slot2[1],
					y = slot2[2]
				}

				slot0.setUniformVec2(slot4, slot0, slot1)
			elseif #slot2 == 3 then
				slot7 = {
					x = slot2[1],
					y = slot2[2],
					z = slot2[3]
				}

				slot0.setUniformVec3(slot4, slot0, slot1)
			elseif #slot2 == 4 then
				slot7 = {
					x = slot2[1],
					y = slot2[2],
					z = slot2[3],
					w = slot2[4]
				}

				slot0.setUniformVec4(slot4, slot0, slot1)
			end
		end
	end
end

ShaderUtil.resetShader = function (slot0)
	slot3 = cc.ShaderCache
	slot4 = "ShaderPositionTextureColor_noMVP"
	slot5 = cc.ShaderCache.getInstance(slot2).getProgram(slot2, cc.ShaderCache.getInstance(slot2))
	slot5 = cc.GLProgramState.getOrCreateWithGLProgram(cc.ShaderCache.getInstance(slot2), cc.GLProgramState)

	ShaderUtil.setShader(cc.ShaderCache.getInstance(slot2), slot0)
end

ShaderUtil.gray = function (slot0)
	slot4 = "GRAY"

	ShaderUtil.setShaderByName(slot2, slot0)
end

ShaderUtil.dark = function (slot0)
	slot4 = "DARK"

	ShaderUtil.setShaderByName(slot2, slot0)
end

return
