return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/WarpingEffects/FlagY.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	} )..{}
}