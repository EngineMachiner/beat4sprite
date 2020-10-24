
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		Commands = "StairsStates"
	},

	{
		Index = 2,
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th001A", params )..{}

}