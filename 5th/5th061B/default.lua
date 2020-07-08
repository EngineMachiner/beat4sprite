
local tweaks = {
	Index = 2,
	Script = "../Resources/Scripts/5th/Particles.lua",
	Dir = "Up",
	Commands = "RandomStates"
}

return Def.ActorFrame{
	LoadActor( "../5th061A", tweaks )..{}
}