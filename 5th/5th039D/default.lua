
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
	Frame_i = 3,
	X_num = 5,
	X_coord = -1,
	Commands = { "Move", "Rainbow" }

}

return Def.ActorFrame{ 
	LoadActor("../5th039A",params_2)..{},
	LoadActor( "../Resources/Scripts/LineXY.lua", params )..{}
}