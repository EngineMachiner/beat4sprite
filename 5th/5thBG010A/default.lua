local s = "/BGAnimations/Resources/Scripts/WarpingEffects/FlagX.lua"
return Def.ActorFrame{
	loadfile( s )( {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = { "Mirror", "Rainbow" },
		BGMirror = true
	} )
}