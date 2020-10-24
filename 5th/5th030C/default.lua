
local replace = ...

local tweaks = {

	{
		Index = 2,
		Remove = true
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
		Frame_i = 10,
		Commands = "TwoSprites",
		Script = "/BGAnimations/Resources/Scripts/5th/Z_Effects/Stairs.lua"
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( tweaks, replace )

return Def.ActorFrame{ 
	LoadActor( "/BGAnimations/5th001G", tweaks )..{},
	LoadActor( tweaks[2]["Script"], tweaks[2] )..{}
}