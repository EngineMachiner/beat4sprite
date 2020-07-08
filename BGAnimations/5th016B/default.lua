
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frame_i = 9,
	Z_coord = -1,
	Spin = true,
	Commands = "Shade"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th016A")..{},
	LoadActor("../Resources/5th/Scripts/Z_Effects/Stairs.lua", params)..{}

}