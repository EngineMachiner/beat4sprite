
local replace = ...

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	X_num = { -6, 5 },
	Y_num = { -2, 1 },
	Frame_i = 4,
	Delay = 2,
	Commands = "Move",
	X_coord = 1
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{

	LoadActor( "../5th042A", { Index = 3, Remove = true } )..{},
	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params )..{}

}