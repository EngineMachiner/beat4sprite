
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/ABCDE 1x4.png",
		X_num = 1,
		Y_num = { -2, 1 },
		Frame_l = 4,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
	Frame_l = 4,
	X_num = { -4, 3 },
	Y_num = { -2, 1 }
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{}

}

if replace then
	params_2.ID = #t + 1
	PSX_BGA_Globals["BGA_ParamsTweaks"]( params_2, replace )
	PSX_BGA_Globals["BGA_TileTool"]( t, params_2 )
	PSX_BGA_Globals["BGA_PostSpawn"]( t, params_2, replace )
else
	PSX_BGA_Globals["BGA_TileTool"]( t, params_2 )
end

return Def.ActorFrame{ t }