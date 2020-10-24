
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Frame_i = 16,
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 11,
	Frame_l = 12,
	Commands = "TwoSprites",
	Script = "../Resources/Scripts/5th/LineXY.lua"
	
}

	PSX_BGA_Globals["BGA_ParamsTweaks"](params_2,replace)

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{},
	LoadActor(params_2.Script,params_2)..{}

}

return Def.ActorFrame{ t }