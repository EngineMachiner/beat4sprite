
local replace = ...

local s = "/BGAnimations/Resources"
local params = {
	Index = 1,
	File = s .. "/5th/Sprites/CAB 5x4.png",
	X_num = { -6, 5 },
	Y_num = { -2, 1 },
	Frame_i = 4,
	Delay = 2,
	Commands = "Move",
	X_coord = 1
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th042A/default.lua" )( { Index = 3, Remove = true } ),
	loadfile( s .. "/Scripts/TileTool.lua" )( params )

}