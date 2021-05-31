
local tweaks = {
	Index = 2,
	Script = "/BGAnimations/Resources/Scripts/LineXY.lua"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th061A/default.lua" )( tweaks )
}