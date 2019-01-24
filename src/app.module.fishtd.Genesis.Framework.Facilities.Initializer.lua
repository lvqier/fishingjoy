require("app.module.fishtd.FilePath")
require(PATH_GENESIS("Framework.Facilities.Enumerations"))
require(PATH_GENESIS("Framework.Facilities.ClassImp"))
require(PATH_GENESIS("Framework.Facilities.ClassLoader"))
ClassLoader:registerClass({
	{
		class = "Tools",
		path = PATH_GENESIS("Framework.Utils.Tools")
	},
	{
		class = "ListQueue",
		path = PATH_GENESIS("Framework.Utils.ListQueue")
	},
	{
		class = "SimpleQueue",
		path = PATH_GENESIS("Framework.Utils.SimpleQueue")
	},
	{
		class = "ButtonWrapper",
		path = PATH_GENESIS("Framework.Controls.ButtonWrapper")
	},
	{
		class = "TexturedNumber",
		path = PATH_GENESIS("Framework.Controls.TexturedNumber")
	},
	{
		class = "FixWidthTexturedNumber",
		path = PATH_GENESIS("Framework.Controls.FixWidthTexturedNumber")
	},
	{
		class = "INotification",
		path = PATH_GENESIS("Framework.Interfaces.INotification")
	},
	{
		class = "IPropertyContainer",
		path = PATH_GENESIS("Framework.Interfaces.IPropertyContainer")
	},
	{
		class = "IDerivedProperty",
		path = PATH_GENESIS("Framework.Interfaces.IDerivedProperty")
	},
	{
		class = "PropertyMediator",
		path = PATH_GENESIS("Framework.Services.SimplePropertyMediator")
	},
	{
		class = "StateMachine",
		path = PATH_GENESIS("Framework.Utils.StateMachine")
	},
	{
		class = "BaseNode",
		path = PATH_GENESIS("Framework.Utils.BaseNode")
	},
	{
		class = "GameConfig",
		path = PATH_MODEL("GameConfig")
	},
	{
		class = "CocosLayerManager",
		path = PATH_GENESIS("CocosLayerManager")
	},
	{
		class = "Entity",
		path = PATH_GENESIS("Entity")
	},
	{
		class = "World",
		path = PATH_GENESIS("Worlds.World")
	},
	{
		class = "WorldBuilder",
		path = PATH_GENESIS("Worlds.WorldBuilder")
	},
	{
		class = "GameSupervisor",
		path = PATH_GENESIS("Supervisors.GameSupervisor")
	},
	{
		class = "GameObject",
		path = PATH_GENESIS("GameObjects.GameObject")
	},
	{
		class = "Fish",
		path = PATH_GENESIS("GameObjects.Fishes.Fish")
	},
	{
		class = "FishGrouped",
		path = PATH_GENESIS("GameObjects.Fishes.FishGrouped")
	},
	{
		class = "Bullet",
		path = PATH_GENESIS("GameObjects.Bullets.Bullet")
	},
	{
		class = "FishFactory",
		path = PATH_GENESIS("GameObjects.Fishes.FishFactory")
	},
	{
		class = "BulletFactory",
		path = PATH_GENESIS("GameObjects.Bullets.BulletFactory")
	},
	{
		class = "Component",
		path = PATH_GENESIS("Components.Component")
	},
	{
		class = "Visual",
		path = PATH_GENESIS("Components.Visuals.Visual")
	},
	{
		class = "FishVisual",
		path = PATH_GENESIS("Components.Visuals.FishVisual")
	},
	{
		class = "FishVisualGroup",
		path = PATH_GENESIS("Components.Visuals.FishVisualGroup")
	},
	{
		class = "FishVisualEffectTarget",
		path = PATH_GENESIS("Components.Visuals.FishVisualEffectTarget")
	},
	{
		class = "FishVisualEffectCycle",
		path = PATH_GENESIS("Components.Visuals.FishVisualEffectCycle")
	},
	{
		class = "FishVisualCap",
		path = PATH_GENESIS("Components.Visuals.FishVisualCap")
	},
	{
		class = "FishVisualEffectCap",
		path = PATH_GENESIS("Components.Visuals.FishVisualEffectCap")
	},
	{
		class = "FishVisualFrozen",
		path = PATH_GENESIS("Components.Visuals.FishVisualFrozen")
	},
	{
		class = "FishVisualExplode",
		path = PATH_GENESIS("Components.Visuals.FishVisualExplode")
	},
	{
		class = "FishVisualVortex",
		path = PATH_GENESIS("Components.Visuals.FishVisualVortex")
	},
	{
		class = "FishVisualLight",
		path = PATH_GENESIS("Components.Visuals.FishVisualLight")
	},
	{
		class = "BulletVisual",
		path = PATH_GENESIS("Components.Visuals.BulletVisual")
	},
	{
		class = "Cannon",
		path = PATH_GENESIS("GameObjects.Cannons.Cannon")
	},
	{
		class = "CannonVisual",
		path = PATH_GENESIS("Components.Visuals.CannonVisual")
	},
	{
		class = "CannonFactory",
		path = PATH_GENESIS("GameObjects.Cannons.CannonFactory")
	},
	{
		class = "MotionController",
		path = PATH_GENESIS("Components.MotionControllers.MotionController")
	},
	{
		class = "MotionPath",
		path = PATH_GENESIS("Components.MotionControllers.MotionPath")
	},
	{
		class = "MotionDirection",
		path = PATH_GENESIS("Components.MotionControllers.MotionDirection")
	},
	{
		class = "MotionDirection3D",
		path = PATH_GENESIS("Components.MotionControllers.MotionDirection3D")
	},
	{
		class = "CollisionArea",
		path = PATH_GENESIS("Components.Collisions.CollisionArea")
	},
	{
		class = "CollisionManager",
		path = PATH_GENESIS("Framework.Services.CollisionManager")
	},
	{
		class = "PathTracker",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTracker")
	},
	{
		class = "PathTrackerBezier",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerBezier")
	},
	{
		class = "PathTrackerCubicBezier",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerCubicBezier")
	},
	{
		class = "PathTrackerSpiral",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerSpiral")
	},
	{
		class = "PathTrackerCircle",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerCircle")
	},
	{
		class = "PathTrackerDelay",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerDelay")
	},
	{
		class = "PathTrackerLine",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerLine")
	},
	{
		class = "PathTrackerFactory",
		path = PATH_GENESIS("Components.MotionControllers.PathTrackers.PathTrackerFactory")
	},
	{
		class = "CannonUI",
		path = PATH_GENESIS("Components.Visuals.CCS.CannonUI")
	},
	{
		class = "CannonTop",
		path = PATH_GENESIS("Components.Visuals.CCS.CannonTop")
	},
	{
		class = "CannonBottom",
		path = PATH_GENESIS("Components.Visuals.CCS.CannonBottom")
	},
	{
		class = "CannonBottomSelf",
		path = PATH_GENESIS("Components.Visuals.CCS.CannonBottomSelf")
	},
	{
		class = "CannonTopSelf",
		path = PATH_GENESIS("Components.Visuals.CCS.CannonTopSelf")
	},
	{
		class = "BackgroundPresentor",
		path = PATH_GENESIS("Presentors.BackgroundPresentor")
	},
	{
		class = "EffectPresentor",
		path = PATH_GENESIS("Presentors.EffectPresentor")
	},
	{
		class = "Effect",
		path = PATH_GENESIS("Components.Effects.Effect")
	},
	{
		class = "EffectKill",
		path = PATH_GENESIS("Components.Effects.EffectKill")
	},
	{
		class = "EffectMoney",
		path = PATH_GENESIS("Components.Effects.EffectMoney")
	},
	{
		class = "EffectFactory",
		path = PATH_GENESIS("Components.Effects.EffectFactory")
	},
	{
		class = "LockSelector",
		path = PATH_GENESIS("GameObjects.Selectors.LockSelector")
	},
	{
		class = "Group",
		path = PATH_GENESIS("GameObjects.Groups.Group")
	},
	{
		class = "GroupFactory",
		path = PATH_GENESIS("GameObjects.Groups.GroupFactory")
	},
	{
		class = "HomingController",
		path = PATH_GENESIS("Components.HomingControllers.HomingController")
	},
	{
		class = "FiringController",
		path = PATH_GENESIS("Components.FiringControllers.FiringController")
	},
	{
		class = "LockingController",
		path = PATH_GENESIS("Components.LockingControllers.LockingController")
	},
	{
		class = "TransformActionFactory",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformActionFactory")
	},
	{
		class = "TransformAction",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformAction")
	},
	{
		class = "TransformSequence",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformSequence")
	},
	{
		class = "TransformSpawn",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformSpawn")
	},
	{
		class = "TransformSwing",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformSwing")
	},
	{
		class = "TransformScale",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformScale")
	},
	{
		class = "TransformRoll",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformRoll")
	},
	{
		class = "TransformPosition",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformPosition")
	},
	{
		class = "TransformDirection",
		path = PATH_GENESIS("Components.Transformations.TransformActions.TransformDirection")
	},
	{
		class = "SimpleTransformation",
		path = PATH_GENESIS("Components.Transformations.SimpleTransformation")
	},
	{
		class = "ObjectManager",
		path = PATH_GENESIS("Framework.Facilities.ObjectManager")
	}
})

return
