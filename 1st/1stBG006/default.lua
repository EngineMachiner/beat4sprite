
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local params = {

	{
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		BGMirror = true,
		Commands = { "Mirror" },
		Script = ""
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/I 4x4.png",
		X_num = 2,
		Y_num = { -2, 1 },
		Frame_l = 16,
		Delay = 0.125,
		Commands = { "Color", "MirrorYPerRow", "Blend" },
		Blend = "BlendMode_Modulate",
		Color = color("0,0,1,1")
	}

} 

	t[#t+1] = LoadActor( "../Resources/Scripts/1st/KA.lua", params[1] )..{}	
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

return Def.ActorFrame{ t }