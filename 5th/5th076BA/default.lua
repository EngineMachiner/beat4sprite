
local tweaks = ...

local params = {

	{
		Index = 1,
		File ="/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		X_num = { -5, 4 },
		Y_num = 1
	},

	{
		Index = 2,
		File ="/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 10,
		Clockwise = true
	}

}
	BGA_G.ParTweak(params,tweaks)
	
return Def.ActorFrame{

	LoadActor("../Resources/Scripts/TileTool.lua", params[1])..{},
	LoadActor("../Resources/Scripts/SpaceEffects/Spiral.lua", params[2])..{}

}