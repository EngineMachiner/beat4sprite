
local tweaks = ...

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		X_num = { -5, 4 },
		Y_num = 1
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/DABC 4x4.png",
		Frame_i = 9,
		Clockwise = true
	}

}
	BGA_G.ParTweak(params,tweaks)
	
return Def.ActorFrame{

	loadfile( s .. "/Scripts/TileTool.lua" )( params[1] ),
	loadfile( s .. "/Scripts/SpaceEffects/RoundTrace.lua" )( params[2] )

}