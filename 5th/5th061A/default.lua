
local replace = ...

local tweaks = {

	{
		Index = 1,
		ResetParams = true,
		File = "/BGAnimations/Resources/5th/Backgrounds/AB.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		ResetParams = true,
		File = "/BGAnimations/Resources/5th/Sprites/ABCD 4x3.png",
		Frame_l = 12,
		Dir = "Out",
		Script = "../Resources/Scripts/5th/Z_Effects/Stairs.lua"
	}

}

	BGA_ParamsTweaks( tweaks, replace )

return Def.ActorFrame{
	LoadActor( "../5th060A", tweaks )..{}
}