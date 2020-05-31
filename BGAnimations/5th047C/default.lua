
local tweaks = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
	Frame_i = 10,
	Frame_l = 11,
	Commands = { "Move", "Rainbow" },
	Y_coord = 1,
	X_coord = 1,
	X_num = 5,
	Y_num = 2
}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"

}

return Def.ActorFrame{
	LoadActor( "../5th047A", tweaks )..{},
	LoadActor( "../Resources/Scripts/LineXY.lua", params )..{}
}