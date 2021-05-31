
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
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
		Delay = 0.25,
		BGMirror = true,
		Commands = { "Mirror" }
	}
}

	BGA_G.Tile( t, params[1] )
	
	params[2]["Color"] = Color.Black
	params[2]["Commands"] = { "Mirror", "Color" }
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params[2] )


return Def.ActorFrame{ t }