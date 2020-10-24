
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {


	{ 
		Index = 1,
		Remove = true
	},

	{
		Index = 2,
		File = {
					"/BGAnimations/Resources/5th/Backgrounds/ABC.png",
					"/BGAnimations/Resources/5th/Backgrounds/ABC2.png"
				},
		X_num = { -1, 1 },
		X_pos = -0.5,
		Y_coord = -1,
		Commands = "Move",
		ResetParams = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( tweaks, replace )
	
	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }