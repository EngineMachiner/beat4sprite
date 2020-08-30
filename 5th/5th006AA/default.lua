
local replace = ...
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		ResetParams = true,
		File = "/BGAnimations/Resources/5th/Sprites/DABCD 1x4.png",
		Frame_l = 4,
		X_num = 1,
		Y_num = { -3, 4 },
		Delay = 0.5,
		ScrollSpeed = 0.5,
		Y_coord = -1,
		Commands = { "StairsStates", "Move" }
	},

	{
		Index = 2,
		Remove = true
	}
	
}
	
	BGA_ParamsTweaks( tweaks, replace )
	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }