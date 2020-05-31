
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2

}

return Def.ActorFrame{ 
	LoadActor("../5th039A")..{},
	LoadActor( "../Resources/Scripts/Z_Effects/Stairs.lua", params )..{}
}