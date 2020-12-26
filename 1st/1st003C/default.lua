
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
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/B001 5x3.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_l = 15,
		Zoom = 1.5,
		Commands = { "Blend", "Rainbow", "Mirror" }
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/F 4x4.png",
		Zoom = 0.51*2,
		X_num = 4,
		Y_num = { -2, 1 },
		Frame_l = 8,
		FrameReverse = true,
		Delay = 1/8,
		Color = color("#808080"),
		Commands = { "Color" }
	}

} 

	t[#t+1] = Def.Quad{
		OnCommand=function(self)
			self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
		end
	}
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )

return Def.ActorFrame{ t }