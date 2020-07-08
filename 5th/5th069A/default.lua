
local replace = ...

local tweaks = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 16,
		Frame_l = 20,
		ResetParams = true,
		X_num = 5,
		Y_num = { -2, 1 }
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_ParamsTweaks( tweaks, replace )

return Def.ActorFrame{
	LoadActor( "../5th001A", tweaks )..{}
}