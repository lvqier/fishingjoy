cc.FileUtils:getInstance():addSearchPath("res/gameres/module/fishtd/ui/ingame/cannon")

FilePath = {
	SOUND = "gameres/module/fishtd/sound/",
	ANIMATION = "gameres/module/fishtd/animation/",
	CSB = "gameres/module/fishtd/csb/",
	UI = "gameres/module/fishtd/ui/",
	INGAME_UI = "gameres/module/fishtd/ui/ingame/",
	CONFIG = "gameres/module/fishtd/config/",
	MODEL = "gameres/module/fishtd/model/",
	ModelPath = "res/gameres/module/fishtd/model/",
	SHADER = "gameres/module/fishtd/shader/",
	FISH_EFFECT = "gameres/module/fishtd/fishEffect/",
	PARTICLE = "gameres/module/fishtd/particle/",
	SRC = {}
}
FilePath.SRC.GENESIS = "app.module.fishtd.Genesis."
FilePath.SRC.MODEL = "app.module.fishtd.model."

function GET_PATH(slot0, slot1, ...)
	return slot0 .. string.format(slot1, ...)
end

function PATH_GENESIS(slot0)
	return FilePath.SRC.GENESIS .. slot0
end

function PATH_MODEL(slot0)
	return FilePath.SRC.MODEL .. slot0
end

return
