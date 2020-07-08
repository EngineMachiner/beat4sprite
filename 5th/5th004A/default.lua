local tweaks_2 = ...
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = 4,
		Y_num = 2,
		Y_coord = 1,
		Frame_i = 14,
		ResetParams = true,
		Commands = "Move"
	},

	{
		Index = 2,
		Remove = true
	}

}
	
	if tweaks_2 then BGA_ParamsTweaks( tweaks, tweaks_2 ) end
	t[#t+1] = LoadActor( "/BGAnimations/5th003A", tweaks )..{}

return Def.ActorFrame{ t }