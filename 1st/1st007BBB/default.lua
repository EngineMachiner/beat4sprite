
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D2.png",
		X_num = 1,
		Zoom = 0.5,
		Y_num = { -1, 0 },
		Delay = 8,
		Commands = "Move",
		X_coord = -1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/C 5x1.png",
		Frame_l = 5,
		Commands = "FramePerSprite",
		Zoom = 1.875 * 0.5,
		Clockwise = true,
		Slices = 6*2,
		Pattern = 5,
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/SpiralTrace.lua"
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor(params[2]["Script"], params[2])..{}

return Def.ActorFrame{ t }