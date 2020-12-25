
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local tweaks = ...

local params = {

	{
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HSV/B 4x1.png",
		X_num = 1,
		Frame_l = 4,
		Delay = 0.125,
		BGMirror = true,
		Blend = "BlendMode_Add",
		Commands = { "Mirror", "Blend" }
	}
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, tweaks )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	
	params[2]["Color"] = Color.Black
	params[2]["Commands"] = { "Mirror", "Color" }
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )


return Def.ActorFrame{ t }