
local params = {
	Index = 2,
	Remove = true
}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 11,
	Frame_l = 15,
	Dir = "Up"

}

return Def.ActorFrame{
	LoadActor( "../5th044A", params )..{},
	LoadActor("../Resources/Scripts/5th/Particles.lua", params_2)..{}
}