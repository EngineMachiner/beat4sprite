
local replace = ...

local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Delay = 2,
		Frame_i = 14,
		Frame_l = 15,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }