
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DAB 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 16,
		Frame_l = 13,
		ScrollSpeed = 2,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{}
	
}