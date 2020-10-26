
local t = Def.ActorFrame{}

local tweaks = ...

local params = {

	{
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		Commands = { "Color", "Mirror" },
		Color = color("#808080"),
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/C.png",
		Zoom = 1/3,
		Commands = { "Rainbow", "Blend" },
		Blend = "BlendMode_Add",
		X_num = 2,
		Y_num = 1
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, tweaks )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )


return Def.ActorFrame{ t }