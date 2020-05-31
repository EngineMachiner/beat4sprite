
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
	Frame_i = 3,
	Frame_l = 6,
	Commands = "RandomState"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th012A")..{},
	LoadActor("../Resources/Scripts/WallBumps.lua",params)..{}

}