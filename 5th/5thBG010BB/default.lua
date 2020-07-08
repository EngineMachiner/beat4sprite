return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/BG/7.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = { "Mirror", "Rainbow" },
		BGMirror = true
	} )..{}
}