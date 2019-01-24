slot0 = class_C("GameConfig")

slot0.ctor = function (slot0)
	slot0.Width = 1334
	slot0.Height = 750
	slot0.ChangeRatioFishScore = 0
	slot0.ChangeRatioUserScore = 0
	slot0.ExchangeOnce = 0
	slot0.FireInterval = 0
	slot0.MaxInterval = 0
	slot0.MinInterval = 0
	slot0.MaxBullet = 0
	slot0.MaxCannon = 0
	slot0.MirrorConfig = false
	slot0.CannonMultiple = 1
	slot0.VisualMap = {}
	slot0.FishMap = {}
	slot0.BulletVector = {}
	slot0.SceneSets = {}
	slot0.KingFishMap = {}
	slot0.SanYuanFishMap = {}
	slot0.SiXiFishMap = {}
	slot0.CannonPos = {}
	slot0.CannonSetArray = {}
	slot0.PathMap = {}
	slot0.PLATFORM_ANDROID = (PathMath.copyTransform and true) or false
	slot0.loaded = false
end

slot0.loadViewProjMatrix = function (slot0)
	cc_matrix_multiply_copy(slot14, slot4, {
		(2 * 200) / (2 * math.tan(math.pi / 6) * 200 * display.width / display.height),
		0,
		0,
		0,
		0,
		(2 * 200) / (2 * math.tan(math.pi / 6) * 200),
		0,
		0,
		0,
		0,
		-(200 + 5000) / (5000 - 200),
		-1,
		0,
		0,
		(-2 * 200 * 5000) / (5000 - 200),
		0
	})

	slot0._viewProjectMatrix = 

	cc_set_win_size(slot1, slot2)
	cc_set_xy_offset((display.width - slot0.Width) / 2, (display.height - slot0.Height) / 2)

	if not slot0.PLATFORM_ANDROID then
		cc_set_xy_base((slot1 - slot0.Width) / 2, (slot2 - slot0.Height) / 2)
	end
end

slot0.loadGameConfig = function (slot0)
	if slot0.loaded then
		assert(false)
	end

	slot0.loaded = true

	slot0:LoadSystemConfig(slot0.LocalConfigFiles.FISHGAME3D_XML_SYSTEM)
	slot0:LoadFish(slot0.LocalConfigFiles.FISHGAME3D_XML_FISH)
	slot0:LoadBulletSet(slot0.LocalConfigFiles.FISHGAME3D_XML_BULLETSET)
	slot0:LoadScenes(slot0.LocalConfigFiles.FISHGAME3D_XML_SCENE)
	slot0:LoadCannonSet(slot0.LocalConfigFiles.FISHGAME3D_XML_CANNONSET)
	slot0:LoadVisual(slot0.LocalConfigFiles.FISHGAME3D_XML_VISUAL)
	slot0:LoadNormalPath(slot0.LocalConfigFiles.FISHGAME3D_XML_PATH)
	slot0:LoadTroopSet(slot0.LocalConfigFiles.FISHGAME3D_XML_TROOPSET)
	slot0:LoadTroopPath(slot0.LocalConfigFiles.FISHGAME3D_XML_TROOPPATH)
	slot0:LoadFishWiki(slot0.LocalConfigFiles.FISHGAME3D_XML_FISHWIKI)
	slot0:LoadSceneMap(slot0.LocalConfigFiles.FISHGAME3D_XML_SCENEMAP)
	slot0:LoadSelectorConfig()
	slot0:loadViewProjMatrix()
end

slot0.LoadSelectorConfig = function (slot0)
	ClassLoader:aquireSingleton("CollisionManager"):loadConfig("select_10", GET_PATH(FilePath.MODEL, "%s/%s.json", slot1, slot1), ENUM.COLLISION_AREA_TYPE.SELECT)
end

slot0.getConfigTable = function (slot0, slot1)
	return custom.XMLParser:create():parseXML(slot1, "")
end

slot0.setMirrorFlag = function (slot0, slot1)
	slot0.MirrorFlag = slot1
end

slot0.getMirrorFlag = function (slot0)
	return slot0.MirrorFlag
end

slot0.LoadSystemConfig = function (slot0, slot1)
	slot4 = slot0:getConfigTable(slot1).SystemSet.ExchangeScore
	slot5 = slot0.getConfigTable(slot1).SystemSet.Fire

	for slot10 = 1, #string.split(slot0.getConfigTable(slot1).SystemSet.ExchangeScore.Ratio, ":"), 1 do
		slot6[slot10] = tonumber(slot6[slot10])
		slot6[slot10] = (slot6[slot10] > 0 and slot6[slot10]) or 1
	end

	slot0.nChangeRatioUserScore = slot6[1]
	slot0.nChangeRatioFishScore = slot6[2]
	slot0.nExchangeOnce = tonumber(slot3.ExchangeScore.Once)
	slot0.nShowGoldMinMul = tonumber(slot3.ExchangeScore.ShowGoldMinMul)
	slot0.nFireInterval = (tonumber(slot3.Fire.Interval) or 0) / 1000
	slot0.nMaxInterval = tonumber(slot3.Fire.MaxInterval) or 0
	slot0.nMinInterval = tonumber(slot3.Fire.MinInterval) or 0
	slot0.nMaxBullet = tonumber(slot3.Fire.MaxBullet)
end

slot0.LoadSceneMap = function (slot0, slot1)
	slot0.SceneMap = {}

	for slot6, slot7 in ipairs(slot0:getConfigTable(slot1).Maps.Map) do
		slot8 = {
			id = tonumber(slot7.Id),
			directory = slot7.Directory,
			spriteMaps = {}
		}

		if #slot7.Sprite > 0 then
			for slot13, slot14 in ipairs(slot9) do
				table.insert(slot8.spriteMaps, {
					name = slot14.name,
					localZOrder = tonumber(slot14.localZOrder)
				})
			end
		else
			table.insert(slot8.spriteMaps, {
				name = slot9.name,
				localZOrder = tonumber(slot9.localZOrder)
			})
		end

		slot8.spineMaps = {}

		if #slot7.Spine > 0 then
			for slot14, slot15 in ipairs(slot10) do
				table.insert(slot8.spineMaps, {
					name = slot15.name,
					localZOrder = tonumber(slot15.localZOrder),
					ani = slot15.ani
				})
			end
		else
			table.insert(slot8.spineMaps, {
				name = slot10.name,
				localZOrder = tonumber(slot10.localZOrder),
				ani = slot10.ani
			})
		end

		slot8.bubbleMaps = {}

		if #slot7.Bubble > 0 then
			for slot15, slot16 in pairs(slot11) do
				table.insert(slot8.bubbleMaps, {
					x = tonumber(slot16.x),
					y = tonumber(slot16.y),
					z = tonumber(slot16.z),
					delay = tonumber(slot16.delay)
				})
			end
		else
			table.insert(slot8.bubbleMaps, {
				x = tonumber(slot11.x),
				y = tonumber(slot11.y),
				z = tonumber(slot11.z),
				delay = tonumber(slot11.delay)
			})
		end

		slot0.SceneMap[slot8.id] = slot8
	end
end

slot0.LoadFish = function (slot0, slot1)
	slot0.FishMap = {}

	for slot8, slot9 in ipairs(slot4) do
		slot0.FishMap[({
			nTypeID = tonumber(slot9.TypeID),
			szName = slot9.Name,
			nSpeed = tonumber(slot9.Speed),
			nVisualID = tonumber(slot9.VisualID),
			bShowBingo = slot9.ShowBingo == "true",
			bShakeScreen = slot9.ShakeScreen == "true",
			szParticle = slot9.Particle,
			KingType = tonumber(slot9.KingType) or 0,
			BossId = tonumber(slot9.BossId) or 0
		})["nTypeID"]] = 
	end
end

slot0.LoadCompareBone = function (slot0, slot1)
	slot2 = {}

	if #slot1 <= 0 then
		table.insert(slot2, {
			name = slot1.name
		})
	else
		for slot6 = 1, #slot1, 1 do
			table.insert(slot2, {
				name = slot1[slot6].name
			})
		end
	end

	return slot2
end

slot0.LoadVisual = function (slot0, slot1)
	slot2 = slot0:getConfigTable(slot1)
	slot4 = slot0:getOrCreateArray(slot2.Effects.Effect)
	slot5 = slot0:getOrCreateArray(slot2.Visuals.Visual)
	slot0.FishModels = {}

	for slot9, slot10 in ipairs(slot3) do
		slot11 = {
			id = tonumber(slot10.Id),
			resName = slot10.resName,
			scale = tonumber(slot10.Scale),
			live = slot0:LoadAnimationConfig(slot10.Live or {}),
			hurt = slot0:LoadAnimationConfig(slot10.Hurt or {}),
			die = slot0:LoadAnimationConfig(slot10.Die or {}),
			cast = slot0:LoadAnimationConfig(slot10.Cast or {}),
			special = slot0:LoadAnimationConfig(slot10.Special or {})
		}

		if slot10.Bone then
			slot11.compareBone = slot0:LoadCompareBone(slot10.Bone)
		end

		slot0.FishModels[slot11.id] = slot11
	end

	slot0.FishEffects = {}

	for slot9, slot10 in ipairs(slot4) do
		slot0.FishEffects[({
			id = tonumber(slot10.Id),
			resName = slot10.resName,
			scale = tonumber(slot10.Scale) or 1,
			type = slot10.type or "spine",
			live = slot10.live,
			cast = slot10.cast,
			die = slot10.die
		})["id"]] = 
	end

	slot0.FishVisuals = {}

	for slot9, slot10 in ipairs(slot5) do
		slot0.FishVisuals[({
			id = tonumber(slot10.Id),
			effectLevel = tonumber(slot10.EffectLevel) or 0,
			collisionModel = tonumber(slot10.collisionModel),
			scale = tonumber(slot10.Scale) or 1,
			modelRefs = slot0:LoadModelConfig(slot10.Model or {}),
			effectRefs = slot0:LoadEffectConfig(slot10.Effect or {}),
			castRefs = slot0:LoadCastConfig(slot10.Cast or {}),
			shakeScreen = slot0:toBoolean(slot10.ShakeScreen),
			noRotation = slot0:toBoolean(slot10.noRotation),
			showBingo = slot0:toBoolean(slot10.ShowBingo),
			localZOrder = tonumber(slot10.localZOrder),
			isBoss = slot0:toBoolean(slot10.Boss),
			bossName = slot10.BossName,
			presentationScale = tonumber(slot10.presentationScale) or 1,
			presentationOffsetY = tonumber(slot10.presentationOffsetY) or 0,
			troopScale = tonumber(slot10.troopScale) or 1,
			useRandomAction = slot0:toBoolean(slot10.useRandomAction)
		})["id"]] = 
	end

	slot6 = ClassLoader:aquireSingleton("CollisionManager")

	for slot10, slot11 in pairs(slot0.FishVisuals) do
		if slot11.collisionModel and slot11.modelRefs[slot11.collisionModel] and slot0.FishModels[slot12.id] then
			slot6:loadConfig(slot13.resName, GET_PATH(FilePath.MODEL, "%s/%s.json", slot13.resName, slot13.resName), ENUM.COLLISION_AREA_TYPE.FISH)
		end
	end
end

slot0.LoadAnimationConfig = function (slot0, slot1)
	slot2 = {
		size = 0
	}

	if #slot1 == 0 and table.nums(slot1) > 0 then
		table.insert(slot2, {
			ffrom = tonumber(slot1.ffrom),
			fto = tonumber(slot1.fto)
		})

		slot2.size = slot2.size + 1
	else
		for slot6, slot7 in ipairs(slot1) do
			table.insert(slot2, {
				ffrom = tonumber(slot7.ffrom),
				fto = tonumber(slot7.fto)
			})

			slot2.size = slot2.size + 1
		end
	end

	return slot2
end

slot0.LoadModelConfig = function (slot0, slot1)
	slot2 = {}

	if #slot1 == 0 and table.nums(slot1) > 0 then
		({
			id = tonumber(slot1.Id),
			scale = tonumber(slot1.Scale) or 1,
			offset = {},
			bindingTarget = tonumber(slot1.bindingTarget),
			bindingPoint = slot1.bindingPoint
		})["offset"].x = tonumber(slot1.OffsetX) or 0
		()["offset"].y = tonumber(slot1.OffsetY) or 0
		()["offset"].z = tonumber(slot1.OffsetZ) or 0

		table.insert(slot2, )
	else
		for slot6, slot7 in ipairs(slot1) do
			({
				id = tonumber(slot7.Id),
				scale = tonumber(slot7.Scale) or 1,
				offset = {},
				bindingTarget = tonumber(slot7.bindingTarget),
				bindingPoint = slot7.bindingPoint
			})["offset"].x = tonumber(slot7.OffsetX) or 0
			()["offset"].y = tonumber(slot7.OffsetY) or 0
			()["offset"].z = tonumber(slot7.OffsetZ) or 0

			table.insert(slot2, )
		end
	end

	return slot2
end

slot0.LoadEffectConfig = function (slot0, slot1)
	slot2 = {}

	if #slot1 == 0 and table.nums(slot1) > 0 then
		({
			id = tonumber(slot1.Id),
			scale = tonumber(slot1.Scale) or 1,
			offset = {},
			bindingTarget = tonumber(slot1.bindingTarget),
			positionType = tonumber(slot1.positionType) or 0,
			bindingPoint = slot1.bindingPoint,
			depthLevel = slot1.depthLevel,
			useDepthTest = slot0:toBoolean(slot1.useDepthTest),
			useRotation = slot0:toBoolean(slot1.useRotation)
		})["offset"].x = tonumber(slot1.OffsetX) or 0
		()["offset"].y = tonumber(slot1.OffsetY) or 0
		()["offset"].z = tonumber(slot1.OffsetZ) or 0

		table.insert(slot2, )
	else
		for slot6, slot7 in ipairs(slot1) do
			({
				id = tonumber(slot7.Id),
				scale = tonumber(slot7.Scale) or 1,
				offset = {},
				bindingTarget = tonumber(slot7.bindingTarget),
				positionType = tonumber(slot7.positionType) or 0,
				bindingPoint = slot7.bindingPoint,
				depthLevel = slot7.depthLevel or "none",
				useDepthTest = slot0:toBoolean(slot7.useDepthTest),
				useRotation = slot0:toBoolean(slot7.useRotation)
			})["offset"].x = tonumber(slot7.OffsetX) or 0
			()["offset"].y = tonumber(slot7.OffsetY) or 0
			()["offset"].z = tonumber(slot7.OffsetZ) or 0

			table.insert(slot2, )
		end
	end

	return slot2
end

slot0.LoadCastConfig = function (slot0, slot1)
	slot2 = {}

	if #slot1 == 0 and table.nums(slot1) > 0 then
		slot2[({
			id = tonumber(slot1.type),
			performer = slot1.performer or "",
			delay = tonumber(slot1.delay) or 0,
			txtOffset = tonumber(slot1.txtOffset) or 0
		})["id"]] = 
	else
		for slot6, slot7 in ipairs(slot1) do
			slot2[({
				id = tonumber(slot7.type),
				performer = slot7.performer or "",
				delay = tonumber(slot7.delay) or 0,
				txtOffset = tonumber(slot1.txtOffset) or 0
			})["id"]] = 
		end
	end

	dump(slot2)

	return slot2
end

slot0.toBoolean = function (slot0, slot1)
	return slot1 == "true"
end

slot0.LoadCannonSet = function (slot0, slot1)
	slot0.CannonPos = {}
	slot0.CannonSetArray = {}

	for slot8, slot9 in ipairs(slot4) do
		slot0.CannonPos[tonumber(slot9.id)] = cc.p(tonumber(slot9.PosX), tonumber(slot9.PosY))
	end

	slot5 = slot3.CannonEffect
	slot0.CannonSetArray = {}

	for slot10, slot11 in ipairs(slot6) do
		slot12 = {
			bRebound = slot11.Rebound == "true",
			nID = tonumber(slot11.id),
			nNormalID = tonumber(slot11.normal),
			nIonID = tonumber(slot11.ion),
			nDoubleID = tonumber(slot11.double),
			Sets = {}
		}
		slot13 = slot11.CannonType or {}

		for slot17, slot18 in ipairs(slot13) do
			slot19 = {
				nTypeID = tonumber(slot18.type),
				Cannon = {
					szResourceName = slot18.Cannon or {}.ResName,
					Name = slot18.Cannon or .Name,
					nResType = tonumber(slot18.Cannon or .ResType),
					Pos = cc.p(tonumber(slot18.Cannon or .PosX) or 0, tonumber(slot18.Cannon or .PosY) or 0),
					PosX = tonumber(slot18.Cannon or .PosX),
					PosY = tonumber(slot18.Cannon or .PosY),
					FireOfffest = tonumber(slot18.Cannon or .FireOffest),
					nType = tonumber(slot18.Cannon or .type),
					RoateSpeed = tonumber(slot18.Cannon or .RoateSpeed)
				},
				BulletSet = {}
			}

			for slot25, slot26 in ipairs(slot18.Bullet) do
				slot19.BulletSet[#slot19.BulletSet + 1] = {
					szResourceName = slot26.ResName,
					Name = slot26.Name,
					nResType = tonumber(slot26.ResType),
					fScale = tonumber(slot26.Scale),
					Pos = cc.p(tonumber(slot26.PosX) or 0, tonumber(slot26.PosY) or 0),
					PosX = tonumber(slot20.PosX),
					PosY = tonumber(slot20.PosY)
				}
			end

			slot19.NetSet = {}

			for slot25, slot26 in ipairs(slot18.Net) do
				slot19.NetSet[#slot19.NetSet + 1] = {
					szResourceName = slot26.ResName,
					Name = slot26.Name,
					nResType = tonumber(slot26.ResType),
					fScale = tonumber(slot26.Scale),
					Pos = cc.p(tonumber(slot26.PosX) or 0, tonumber(slot26.PosY) or 0),
					PosX = tonumber(slot20.PosX),
					PosY = tonumber(slot20.PosY)
				}
			end

			slot12.Sets[slot19.nTypeID] = slot19
		end

		slot0.CannonSetArray[slot12.nID] = slot12
	end
end

slot0.LoadBulletSet = function (slot0, slot1)
	slot0.BulletVector = {}

	for slot7, slot8 in ipairs(slot3) do
		slot10 = string.format("bullet_%d", ({
			nMulriple = tonumber(slot8.Mulriple),
			nSpeed = tonumber(slot8.Speed),
			nMaxCatch = tonumber(slot8.MaxCatch),
			nCatchRadio = tonumber(slot8.CatchRadio),
			nCannonType = tonumber(slot8.CannonType),
			nBulletSize = tonumber(slot8.BRidio)
		})["nCatchRadio"])

		ClassLoader:aquireSingleton("CollisionManager"):loadConfig(slot10, GET_PATH(FilePath.MODEL, "%s/%s.json", slot10, slot10), ENUM.COLLISION_AREA_TYPE.BULLET)

		if slot0.MaxCannon < ()["nMulriple"] then
			slot0.MaxCannon = slot9.nMulriple
		end

		table.insert(slot0.BulletVector, slot9)
	end
end

slot0.LoadScenes = function (slot0, slot1)
	slot0.SceneSets = {}
	slot4 = 1

	for slot8, slot9 in ipairs(slot3) do
		slot4 = ({
			nID = tonumber(slot9.id),
			fSceneTime = tonumber(slot9.time),
			szMap = slot9.map,
			nNextID = tonumber(slot9.next),
			bgMap = slot9.bmg,
			TroopList = {}
		})["nID"]
		slot11 = slot9.TroopSet or {}

		for slot15, slot16 in ipairs(slot11) do
			table.insert(slot10.TroopList, {
				fBeginTime = tonumber(slot16.BeginTime),
				fEndTime = tonumber(slot16.EndTime),
				nTroopID = tonumber(slot16.id)
			})
		end

		slot10.DistrubList = {}
		slot12 = slot9.DistrubFish or {}

		for slot16, slot17 in ipairs(slot12) do
			slot19 = string.split(slot17.TypeList, ",")
			slot20 = string.split(slot17.WeightList, ",")

			for slot24 = 1, slot18.TypeCount, 1 do
				table.insert(slot18.FishID, tonumber(slot19[slot24]))
				table.insert(slot18.Weight, tonumber(slot20[slot24]))
			end

			slot18.OffsetX = tonumber(slot17.OffsetX)
			slot18.OffsetY = tonumber(slot17.OffsetY)
			slot18.OffsetTime = tonumber(slot17.OffestTime)

			table.insert(slot10.DistrubList, slot18)
		end

		slot0.SceneSets[slot10.nID] = slot10
	end
end

slot0.LoadFishWiki = function (slot0, slot1)
	slot0.FishWiki = {
		Normal = slot0:loadWikiData(slot0:getOrCreateArray(slot0:getConfigTable(slot1).Wiki.Normal.Fish), "normal"),
		Special = slot0:loadWikiData(slot0:getOrCreateArray(slot0.getConfigTable(slot1).Wiki.Special.Fish), "special"),
		Boss = slot0:loadWikiData(slot0:getOrCreateArray(slot0.getConfigTable(slot1).Wiki.Boss.Fish), "boss"),
		Map = {}
	}

	slot0:addToMap(slot0.FishWiki.Normal, slot0.FishWiki.Map)
	slot0:addToMap(slot0.FishWiki.Special, slot0.FishWiki.Map)
	slot0:addToMap(slot0.FishWiki.Boss, slot0.FishWiki.Map)
end

slot0.loadWikiData = function (slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1) do
		slot9 = {
			visualId = tonumber(slot8.visualId),
			name = slot8.name,
			score = slot8.score,
			speed = tonumber(slot8.speed),
			catch = tonumber(slot8.catch),
			class = tonumber(slot8.class),
			index = tonumber(slot8.index),
			offsetX = tonumber(slot8.offsetX) or 0,
			offsetY = tonumber(slot8.offsetY) or 0,
			brief = slot8.brief or "",
			sea = {},
			type = slot2,
			index = slot7,
			scale = tonumber(slot8.modelScale) or 1
		}

		for slot14 = 1, #string.split(slot8.sea, ";"), 1 do
			slot9.sea[slot14] = tonumber(slot10[slot14])
		end

		slot9.introduction = slot8.introduction

		table.insert(slot3, slot9)
	end

	return slot3
end

slot0.addToMap = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		slot2[slot7.visualId] = slot7
	end
end

slot0.LoadNormalPath = function (slot0, slot1)
	slot0.NormalPaths = {}

	for slot7, slot8 in pairs(slot3) do
		slot9.weight = ((({
			type = tonumber(slot8.Type),
			weight = tonumber(slot8.weight)
		})["weight"] == nil or slot9.weight == 0) and 0.5) or slot9.weight
		slot9.controlPoints = {}
		slot9.specialAction = {
			size = 0
		}

		for slot13, slot14 in ipairs(slot8.Position) do
			slot9.controlPoints[slot13] = {
				x = tonumber(slot14.x),
				y = tonumber(slot14.y),
				z = tonumber(slot14.z),
				speedCoef = tonumber(slot14.speedCoef),
				distance = tonumber(slot14.distance) or 0,
				actionIndex = tonumber(slot14.actionIndex) or 0
			}

			if slot15.actionIndex > 0 then
				slot9.specialAction.size = slot9.specialAction.size + 1
				slot9.specialAction[slot9.specialAction.size] = {
					distance = slot15.distance,
					actionIndex = slot15.actionIndex
				}
			end
		end

		if slot9.type == slot0.PathType.CIRCLE then
			slot0:convertPointTypeCircle(slot9.controlPoints)
		elseif slot9.type == slot0.PathType.BEZIER then
			slot0:convertPointTypePath(slot9.controlPoints)

			slot9.bezierRoute = PathMath.createBezierRoute(slot9.controlPoints, slot9.weight)
		elseif slot9.type == slot0.PathType.SPIRAL then
			slot9.bezierRoute = PathMath.createSpiralRoute(slot9.controlPoints)
		else
			slot0:convertPointTypePath(slot9.controlPoints)
		end

		for slot13, slot14 in ipairs(slot9.controlPoints) do
			slot9.controlPoints[slot13] = nil
		end

		slot9.controlPoints = nil
		slot0.NormalPaths[slot7] = slot9
	end
end

slot0.LoadTroopPath = function (slot0, slot1)
	slot0.TroopPaths = {}

	for slot7, slot8 in pairs(slot3) do
		slot9.weight = ((({
			type = tonumber(slot8.Type),
			weight = tonumber(slot8.weight)
		})["weight"] == nil or slot9.weight == 0) and 0.5) or slot9.weight
		slot9.controlPoints = {}
		slot9.specialAction = {
			size = 0
		}

		for slot13, slot14 in ipairs(slot8.Position) do
			slot9.controlPoints[slot13] = {
				x = tonumber(slot14.x),
				y = tonumber(slot14.y),
				z = tonumber(slot14.z),
				speedCoef = 1,
				distance = tonumber(slot14.distance) or 0,
				actionIndex = tonumber(slot14.actionIndex) or 0
			}

			if slot15.actionIndex > 0 then
				slot9.specialAction.size = slot9.specialAction.size + 1
				slot9.specialAction[slot9.specialAction.size] = {
					distance = slot15.distance,
					actionIndex = slot15.actionIndex
				}
			end
		end

		if slot9.type == slot0.PathType.CIRCLE then
			slot0:convertPointTypeCircle(slot9.controlPoints)
		elseif slot9.type == slot0.PathType.BEZIER then
			slot0:convertPointTypePath(slot9.controlPoints)

			slot9.bezierRoute = PathMath.createBezierRoute(slot9.controlPoints, slot9.weight)
		elseif slot9.type == slot0.PathType.SPIRAL then
			slot9.bezierRoute = PathMath.createSpiralRoute(slot9.controlPoints)
		else
			slot0:convertPointTypePath(slot9.controlPoints)
		end

		for slot13, slot14 in ipairs(slot9.controlPoints) do
			slot9.controlPoints[slot13] = nil
		end

		slot9.controlPoints = nil
		slot0.TroopPaths[slot7] = slot9
	end
end

slot0.LoadTroopSet = function (slot0, slot1)
	slot0.GroupConfigs = {}

	for slot7, slot8 in ipairs(slot3) do
		slot9 = tonumber(slot8.id)

		if slot8.Transform then
			slot0.GroupConfigs[slot9] = ClassLoader:aquireSingleton("TransformActionFactory"):createWithConfig(slot10)
		end
	end
end

slot0.convertPointTypePath = function (slot0, slot1)
	slot2 = slot0.Width / 2
	slot3 = slot0.Height / 2

	for slot7, slot8 in ipairs(slot1) do
		slot8.x = slot8.x + slot2
		slot8.y = slot8.y + slot3
	end
end

slot0.convertPointTypeCircle = function (slot0, slot1)
	slot0:convertPointWithViewConfig(slot1[1])
end

slot0.convertPointWithViewConfig = function (slot0, slot1)
	slot5 = (slot0.Height / 1.1566 + slot0.Height / 2 + 400) - 0.1
	slot1.x = slot1.x * slot0.Width
	slot1.y = slot1.y * slot0.Height

	if slot1.z then
		slot1.z = slot2 - slot4 - slot1.z * slot5
	else
		slot1.z = 0
	end
end

slot0.mirrorPosition = function (slot0, slot1, slot2)
	slot4 = (cc.Director:getInstance():getVisibleSize().width - 1336) / 2

	if slot0.MirrorFlag then
		slot2.x = slot0.Width - slot1.x
		slot2.x = (slot2.x * slot3.width) / 1336 - slot4
		slot2.y = slot0.Height - slot1.y
		slot2.z = slot1.z

		return slot2
	else
		if slot1 ~= slot2 then
			slot2.x = (slot1.x * slot3.width) / 1336 - slot4
			slot2.y = slot1.y
			slot2.z = slot1.z
		end

		return slot2
	end
end

slot0.isFishInScreen = function (slot0, slot1)
	return slot1.x >= -10 and slot1.x <= slot0.Width + 10 and slot1.y >= -10 and slot1.y <= slot0.Height + 10
end

slot0.getOrCreateArray = function (slot0, slot1)
	if slot1 then
		if #slot1 > 0 then
			return slot1
		else
			return {
				slot1
			}
		end
	else
		return {}
	end
end

slot0.SpecialFishType = {
	ESFT_NORMAL = 0,
	ESFT_MAX = 5,
	ESFT_KING = 1,
	ESFT_KINGANDQUAN = 2,
	ESFT_SIXI = 4,
	ESFT_SANYUAN = 3
}
slot0.LocalConfigFiles = {
	FISHGAME3D_XML_BULLETSET = FilePath.CONFIG .. "BulletSet.xml",
	FISHGAME3D_XML_FISH = FilePath.CONFIG .. "Fish_New.xml",
	FISHGAME3D_XML_SCENE = FilePath.CONFIG .. "Scene.xml",
	FISHGAME3D_XML_CANNONSET = FilePath.CONFIG .. "CannonSet.xml",
	FISHGAME3D_XML_VISUAL = FilePath.CONFIG .. "Visual_New.xml",
	FISHGAME3D_XML_SYSTEM = FilePath.CONFIG .. "System.xml",
	FISHGAME3D_XML_PATH = FilePath.CONFIG .. "path.xml",
	FISHGAME3D_XML_TROOPSET = FilePath.CONFIG .. "TroopSet.xml",
	FISHGAME3D_XML_TROOPPATH = FilePath.CONFIG .. "TroopPath.xml",
	FISHGAME3D_XML_FISHWIKI = FilePath.CONFIG .. "FishWiki.xml",
	FISHGAME3D_XML_SCENEMAP = FilePath.CONFIG .. "SceneMap.xml"
}
slot0.PathType = {
	SPIRAL = 4,
	BEZIER = 1,
	DELAY = 3,
	CIRCLE = 2,
	LINE = 0
}

return slot0
