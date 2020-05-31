params = nil
local replace = ...

local t = Def.ActorFrame{}

local tweaks = {

	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 7,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_ParamsTweaks( tweaks, replace )
	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

local params_2 = {

	Index = 3,
	ID = 2,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 3,
	Spin = true

}

	BGA_ParamsTweaks( params_2, replace )
	t[#t+1] = LoadActor( "../Resources/Scripts/Z_Effects/Stairs.lua", params_2 )..{}
	BGA_PostSpawn( t, params_2, replace )

return Def.ActorFrame{ t }