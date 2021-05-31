

local args = ...

local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = "/BGAnimations/Resources/4th/Backgrounds/B.png",
		BGMirror = true,
		X_num = 1,
		Commands = { "Rainbow" }
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = 1,
		Dir = "Left"
	},

	{	
		Index = 3,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		Blend = "BlendMode_Add",
		Dir = "Left"
	}

}
 
	local s = "/BGAnimations/Resources/Scripts/"
	BGA_G.ParTweak( params, args )
	t[#t+1] = loadfile( s .. "WarpingEffects/FlagY.lua" )( params[1] )
	t[#t+1] = loadfile( s .. "Particles.lua" )( params[2] )
	t[#t+1] = loadfile( s .. "Particles.lua" )( params[3] )

return Def.ActorFrame{ t }