
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th014A")..{},
	LoadActor("../Resources/Scripts/5th/Z_Effects/R_WhirlTrace", params)..{}

}