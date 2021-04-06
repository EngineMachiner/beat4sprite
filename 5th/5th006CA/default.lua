
local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( "/BGAnimations/5th006A" )..{}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12

}

	t[#t+1] = LoadActor("../Resources/Scripts/LineXY.lua", params)..{}


return Def.ActorFrame{ t }