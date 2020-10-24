
local replace = ...
local t = Def.ActorFrame{}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/D 5x4.png",
	Y_num = { -3, 4 },
	X_num = 5,
	Delay = 0.25,
	ScrollSpeed = 2,
	FramingXY = true,
	Commands = "Move",
	Y_coord = -1

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{ 

	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params )..{}

}