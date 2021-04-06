
local params = {

	Index = 3,
	Remove = true

}


local params_2 = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}


return Def.ActorFrame{

	LoadActor( "../5th035A", params )..{},
	LoadActor( "/BGAnimations/Resources/Scripts/LineXY.lua", params_2 )..{}

}