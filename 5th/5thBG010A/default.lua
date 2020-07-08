return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/5th/BG/6.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = { "Mirror", "Rainbow" },
		BGMirror = true
	} )..{}
}