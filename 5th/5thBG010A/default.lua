return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/BG/6.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = { "Mirror", "Rainbow" },
		BGMirror = true
	} )..{}
}