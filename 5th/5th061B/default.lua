
local tweaks = {
	Index = 2,
	Script = "/BGAnimations/Resources/Scripts/Particles.lua",
	Dir = "Up",
	Commands = "RandomStates"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th061A/default.lua" )( tweaks )
}