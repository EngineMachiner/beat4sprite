
local replace = ...

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/Resources/Scripts/WarpingEffects/Pulse.lua" )( params )
}