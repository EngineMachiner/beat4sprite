
local replace = ...

local tweaks = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_i = 3,
	BGMirror = true,
	Commands = "Mirror",
	Cleanup = true
}

local params = {
	Index = 1,
	Script = "../Resources/Scripts/SpaceEffects/RoundTrace.lua",
	File = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
	Frame_i = 11,
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	LoadActor("../5th069A", tweaks)..{},
	LoadActor( params.Script, params )..{}

}