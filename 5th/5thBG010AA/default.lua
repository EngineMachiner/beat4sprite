
local replace = ...

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	Beat = 0.5,
	BGMirror = true
}

BGA_G.ParTweak(params, replace)

local s = "/BGAnimations/Resources/Scripts/WarpingEffects/FlagX.lua"
return Def.ActorFrame{
	loadfile( s )( params )
}