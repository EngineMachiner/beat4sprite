
local args = ...

local t = Def.ActorFrame{}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/4th/Sprites/B2 5x4.png",
	X_num = 4,
	Y_num = { -2, 1 },
	Frames = { 1, 15 },
	Delay = 2,
	Commands = { "RandomStates" }

}

	BGA_G.ParTweak( params, args )
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }