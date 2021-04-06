
local t = Def.ActorFrame{}

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
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/1stCobweb 8x8.png",
		X_num = 2,
		X_pos = -0.5,
		Y_num = { -1, 0 },
		Frame_i = 1,
		Frame_l = 60,
		Zoom = 4,
		Delay = 2,
		Commands = { "Mirror", "Blend" },
		Blend = "BlendMode_Add"
	}

}

	BGA_G.Tile( t, params[1] )
	BGA_G.Tile( t, params[2] )

return Def.ActorFrame{ t }