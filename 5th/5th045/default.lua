
local count = 0
local t = Def.ActorFrame{}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Frame_i = 8,
	Frame_l = 9,
	Commands = { "FramePerSprite", "StairsStates" }

} 
 	
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, tweaks )
	PSX_BGA_Globals["BGA_TileTool"]( t, params )
	PSX_BGA_Globals["BGA_PostSpawn"]( t, params, tweaks )

	params = {

		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 1,
		Frame_l = 2

	}

	t[#t+1] = LoadActor("../Resources/Scripts/5th/SpiralStaticTrace.lua", params)..{}

return Def.ActorFrame{ t }