

local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = "/BGAnimations/Resources/4th/Sprites/Gradients/A 5x6.png",
		Frames = { 1, 30 },
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Zoom = 3,
		Commands = "Mirror"
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/ABCD 5x4.png",
		Frames = 11,
		Spin = true,
		Dir = "Out"
	}

}
 
	local s = "/BGAnimations/Resources/Scripts/SpaceEffects/Stairs.lua"
	BGA_G.ParTweak( params, args )
	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( s )( params[2] )

return Def.ActorFrame{ t }