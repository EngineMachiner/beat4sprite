
local tweaks = ...

local count = 0
local t = Def.ActorFrame{}

local s = "/BGAnimations/Resources"

local params = {

	File = s .. "/5th/Sprites/HSV/DAB2 4x4.png",
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Frame_i = 8,
	Frame_l = 9,
	Static = true,
	Commands = { "StairsStates" }

} 
 	
count = count + 1
params.Index = count
BGA_G.ParTweak( params, tweaks )
BGA_G.Tile( t, params )

params = {

	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 1,
	Frame_l = 2

}

t[#t+1] = loadfile( s .. "/Scripts/SpiralStaticTrace.lua" )( params )

return Def.ActorFrame{ t }