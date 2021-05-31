
local t = Def.ActorFrame{}

	t[#t+1] = loadfile( "/BGAnimations/5th006A/default.lua" )()

local s = "/BGAnimations/Resources"

local params = {
	
	File = s .. "/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12

}

	s = s .. "/Scripts"
	t[#t+1] = loadfile( s .. "/LineXY.lua" )( params )


return Def.ActorFrame{ t }