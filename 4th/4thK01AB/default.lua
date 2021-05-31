

local args = ...

local tweaks = {

	Index = 2,
	Remove = true

}

local s = "/BGAnimations/Resources"
local params = {
	Index = 3,
	File = s .. "/4th/Sprites/ABCDEF 5x4.png",
	Frames = 16,
	X_num = 5,
	Y_num = { -2, 3 },
	Zoom = 0.925,
	HurryTweenBy = 2,
	Commands = { "Rainbow", "SpinFrame", "Alpha" }
}

	BGA_G.ParTweak( tweaks, args )
	BGA_G.ParTweak( params, args )
	
return Def.ActorFrame{
	loadfile( "/BGAnimations/4thK01A/default.lua" )( tweaks ),
	loadfile( s .. "/Scripts/AFTSpin.lua" )( params )
}