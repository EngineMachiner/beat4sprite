
local replace = ...

local tweaks = {

	{
		Index = 1,
		ResetParams = true,
		File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		ResetParams = true,
		Frame_i = 11,
		Frame_l = 11+4,
		Dir = "Left",
		Script = "../Resources/Scripts/5th/Particles.lua"
	}

}

	BGA_ParamsTweaks( tweaks, replace )

return Def.ActorFrame{
	LoadActor( "../5th064A", tweaks )..{}
}