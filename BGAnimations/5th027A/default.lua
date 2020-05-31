
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

	BGA_ParamsTweaks( params, replace )

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
	Frame_l = 4,
	X_num = { -2, 1 },
	Y_num = { -2, 1 }
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{}

}

if replace then
	params_2.ID = #t + 1
	BGA_ParamsTweaks( params_2, replace )
	BGA_TileTool( t, params_2 )
	BGA_PostSpawn( t, params_2, replace )
else
	BGA_TileTool( t, params_2 )
end

return Def.ActorFrame{ t }