
local tweaks = ...

local params = {

	{ Index = 1 },

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 11,
	Frame_l = 15,
	Dir = "Up"

}

	BGA_G.ParTweak( params, tweaks )

return Def.ActorFrame{
	LoadActor( "../5th044A", params )..{},
	LoadActor("../Resources/Scripts/Particles.lua", params_2)..{}
}