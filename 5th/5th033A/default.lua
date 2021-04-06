
local replace = ...
local t = Def.ActorFrame{}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/D 5x4.png",
	Frames = { 1, 20, Type = 1 },
	Y_num = { -3, 4 },
	X_num = 5,
	Commands = { "Move", "StairsStates" },
	Y_coord = -1

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{ 

	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params )..{}

}