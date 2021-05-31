
local params = {

	Index = 3,
	Remove = true

}

local s = "/BGAnimations/Resources"
local params_2 = {

	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}


return Def.ActorFrame{

	loadfile( "/BGAnimations/5th035A/default.lua" )( params ),
	loadfile( s .. "/Scripts/LineXY.lua" )( params_2 )

}