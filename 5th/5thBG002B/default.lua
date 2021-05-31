
local s = "/BGAnimations/Resources"

local params_2 = {
	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 1,
	Frame_l = 2
}

local t = loadfile( s .. "/Scripts/WallBumps.lua" )( params_2 )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5thBG002A/default.lua" )(),
	t
}