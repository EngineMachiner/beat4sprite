local replace = ...

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	X_num = 5,
	Y_num = { -2, 1 },
	Frame_i = 4,
	X_coord = 1,
	Commands = "Move"
}

local tweaks = {

	{
		Index = 1,
		X_num = { -6, 5 },
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 8,
		X_coord = -1,
		Commands = "Move"
	},

	{
		Index = 3, 
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( tweaks, replace )

return Def.ActorFrame{

	LoadActor( "../5th042A", tweaks )..{},
	LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params )..{}

}