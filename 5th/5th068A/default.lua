
local replace = ...

local s = "/BGAnimations/Resources"
local tweaks = {

	{
		Index = 1,
		Cleanup = true,
		File = s .. "/5th/Backgrounds/CA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/CAB 5x4.png",
		Cleanup = true,
		Frame_i = 11,
		Frame_l = 15,
		Dir = "Left",
		Script = s .. "/Scripts/Particles.lua"
	}

}

	BGA_G.ParTweak( tweaks, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th064A/default.lua" )( tweaks )
}