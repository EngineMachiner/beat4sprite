
local replace = ...

local s = "/BGAnimations/Resources"
local params = {
	Index = 1,
	Script = s .. "/Scripts/Particles.lua",
	File = s .. "/5th/Sprites/BA 4x3.png",
	Frame_i = 1,
	Frame_l = 4,
	Dir = "Right"
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th052/default.lua" )( params )
}