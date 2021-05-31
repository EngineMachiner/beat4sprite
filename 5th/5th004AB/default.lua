
local t = Def.ActorFrame{}

local tweaks = {
	
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
	Frame_i = 6,
	Commands = { "Move", "Rainbow" }

}

	t[#t+1] = loadfile( "/BGAnimations/5th004A/default.lua" )( tweaks )

return Def.ActorFrame{ t }