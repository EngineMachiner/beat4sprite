
local count = 0
local tweaks = ...

local t = Def.ActorFrame{}

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Backgrounds/CA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/CAB 5x4.png",
		Frame_i = 11,
		Frame_l = 15
	}

} 
 	
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params[1] )

	t[#t+1] = loadfile( s .. "/Scripts/WallBumps.lua" )( params[2] )

return Def.ActorFrame{ t }