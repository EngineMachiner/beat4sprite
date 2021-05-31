
local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = {
			"/BGAnimations/Resources/4th/Backgrounds/A01.png",
			"/BGAnimations/Resources/4th/Backgrounds/A02.png"
		},
		TCV = { -1, 0 },
		Reversed = true
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/A 1x4.png",
		Y_num = { -2, 0 },
		Spacing = { 1, 1.5 },
		Frames = { 1, 4 },
		RandomInitState = true,
		Blend = "BlendMode_Add"
	}

}
 
	BGA_G.ParTweak( params, args )
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }