
local params_2 = {
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 1,
	Frame_l = 2
}

local t = LoadActor( "../Resources/Scripts/WallBumps.lua", params_2 )..{}

return Def.ActorFrame{
	LoadActor( "../5thBG002A" )..{},
	t
}