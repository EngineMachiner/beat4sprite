
local replace = ...

local t = Def.ActorFrame{}

local tweaks = {

	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
		Frame_i = 7,
		Frame_l = 8,
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}


	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}


local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
	X_num = { -5, 4 },
	Y_num = { -2, 1 },
	Frame_i = 5,
	Frame_l = 8,
	Commands = "RandomDelays"

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

	t[#t+1] = LoadActor("../Resources/Scripts/TileTool.lua", params )..{}

	if replace then 
		if replace.Remove then 
			t[#t] = nil 
		end
	end


return Def.ActorFrame{ t }