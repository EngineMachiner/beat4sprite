
-- Never ResetParams twice in the same table using BGA_G.ParTweak
local count = 0
local tweaks = ...

local t = Def.ActorFrame{}
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	X_num = { -4, 3 },
	Y_num = 1,
	Frames = { 5, 8 },
	RandomInitState = true

}
 
 	count = count + 1
 	params.Index = count
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params )
	
params = {

	File = {
		"/BGAnimations/Resources/5th/Backgrounds/BAB2.png",
		"/BGAnimations/Resources/5th/Backgrounds/BAB.png"
	},
	TCV = { -1, 0 },

}
	
 	count = count + 1
 	params.Index = count
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }