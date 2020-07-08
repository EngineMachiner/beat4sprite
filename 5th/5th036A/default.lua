
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = { -5, 6 },
		Y_num = 2,
		Frame_i = 9,
		X_coord = -1,
		Y_coord = -1,
		Delay = 2,
		Commands = "Move",
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}
	
	BGA_ParamsTweaks( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

local params = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 1,
	X_num = 5,
	Y_num = { -2, 1 }

}

	BGA_ParamsTweaks( params, replace )
	BGA_TileTool( t, params )

return Def.ActorFrame{ t }