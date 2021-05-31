
local replace = ...

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
}

	BGA_G.ParTweak( params, replace )

local s = "/BGAnimations/Resources/Scripts/WarpingEffects/Wag.lua"
return Def.ActorFrame{
	loadfile( s )( params )
}
