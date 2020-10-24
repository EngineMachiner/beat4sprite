
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Y_coord = 1,
		Commands = { "StairsStates", "Move" },
	},

	{
		Index = 2,
		Remove = true
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( tweaks, replace )
	t[#t+1] = LoadActor( "/BGAnimations/5th006A", tweaks )..{}

return Def.ActorFrame{ t }