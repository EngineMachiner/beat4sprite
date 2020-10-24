
local replace = ...

local params = {
	Index = 1,
	Script = "../Resources/Scripts/5th/Particles.lua",
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 1,
	Frame_l = 4,
	Dir = "Right"
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{
	LoadActor( "../5th052", params )..{}
}