
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
	Frame_i = 5,
	Frame_l = 6,

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th012A")..{},
	LoadActor("../Resources/5th/Scripts/WallBumps.lua",params)..{}

}