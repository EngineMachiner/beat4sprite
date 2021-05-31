

local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		BGMirror = true,
		X_num = 1
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		X_num = 5,
		Cut = 1,
		Y_num = { -2, 1 },
		Blend = "BlendMode_Add",
		TCV = { -1, 0 },
		Commands = "StairsStates"
	}

}
 
	local s = "/BGAnimations/Resources/Scripts/WarpingEffects/FlagY.lua"
	BGA_G.ParTweak( params, args )
	t[#t+1] = loadfile( s )( params[1] )
	BGA_G.Tile(t,params[2])

return Def.ActorFrame{ t }