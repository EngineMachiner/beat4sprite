
local tweaks = {
	Index = 2,
	Script = "../Resources/Scripts/SpaceEffects/Line.lua",
	Dir = "In",
	Shade = true
}

return Def.ActorFrame{
	LoadActor( "../5th061A", tweaks )..{}
}