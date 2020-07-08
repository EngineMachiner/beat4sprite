return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/5th/BG/7.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = { "Mirror", "Rainbow" },
		BGMirror = true
	} )..{}
}