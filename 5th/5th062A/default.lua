
local replace = ...

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/DANCE 1x5.png",
	Frame_i = 1,
	Frame_l = 4,
	Commands = { "FramePerSprite", "StairsStates", "Move" },
	X_coord = -1,
	Delay = 1,
	X_num = { -1, 5 },
	Y_num = 2
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{},
}