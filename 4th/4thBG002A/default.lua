

local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		BGMirror = true,
		X_num = 1,
		Commands = "Rainbow"
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/ABCD 5x4.png",
		Frames = 1,
		Dir = "Out",
		Spin = true
	}

}
 
	local s = "/BGAnimations/Resources/Scripts/"
	BGA_G.ParTweak( params, args )
	t[#t+1] = loadfile( s .. "WarpingEffects/FlagY.lua" )( params[1] )
	t[#t+1] = loadfile( s .. "4th/SpaceEffects/Stairs.lua" )( params[2] )

return Def.ActorFrame{ t }