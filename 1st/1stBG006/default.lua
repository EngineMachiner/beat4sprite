
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
		Commands = { "Color", "MirrorYPerRow", "Blend" },
		Blend = "BlendMode_Modulate",
		Color = color("0,0,1,1")
	}

} 

	local s = "/BGAnimations/Resources/Scripts/Kaleidoscopes/Main.lua"
	t[#t+1] = loadfile( s )( params[1] )
	BGA_G.Tile( t, params[2] )

return Def.ActorFrame{ t }