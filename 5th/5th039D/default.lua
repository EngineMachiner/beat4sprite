
local s = "/BGAnimations/Resources"
local params = {

	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}

local params_2 = {

	Index = 1,
	File = s .. "/5th/Sprites/HSV/DA 4x3.png",
	Frame_i = 3,
	X_num = 5,
	X_coord = -1,
	Commands = { "Move", "Rainbow" }

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th039A/default.lua" )( params_2 ),
	loadfile( s .. "/Scripts/LineXY.lua" )( params )
}