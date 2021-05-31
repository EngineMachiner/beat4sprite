
local replace = ...

local s = "/BGAnimations/Resources"
local tweaks = {

	{
		Index = 1,
		Cleanup = true,
		File = s .. "/5th/Backgrounds/AB.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		Cleanup = true,
		File = s .. "/5th/Sprites/ABCD 4x3.png",
		Frame_l = 12,
		Dir = "Out",
		Script = s .. "/Scripts/SpaceEffects/Stairs.lua"
	}

}

	BGA_G.ParTweak( tweaks, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th060A/default.lua" )( tweaks )
}