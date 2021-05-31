
local tweaks = {
	Index = 2,
	Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Line.lua",
	Dir = "In",
	Shade = true
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th061A/default.lua" )( tweaks )
}