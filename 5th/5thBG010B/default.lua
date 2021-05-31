local s = "/BGAnimations/Resources/Scripts/WarpingEffects/FlagY.lua"
return Def.ActorFrame{
	loadfile( s )( {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	} )
}