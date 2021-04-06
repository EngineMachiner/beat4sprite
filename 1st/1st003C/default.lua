
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
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
		Delay = 0.5,
		Commands = { "Blend", "Rainbow", "Mirror" }
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/F 4x4.png",
		X_num = 4,
		Y_num = { -2, 1 },
		Frame_l = 8,
		FrameReverse = true,
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
	BGA_G.Tile( t, params[2] )
	BGA_G.Tile( t, params[1] )

return Def.ActorFrame{ t }