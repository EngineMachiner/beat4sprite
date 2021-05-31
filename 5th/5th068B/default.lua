
local tweaks = {
	Index = 2,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Cleanup = true,
	Frame_i = 11,
	Frame_l = 11+4,
	Script = "/BGAnimations/Resources/Scripts/LineXY.lua"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th068A/default.lua" )( tweaks )
}