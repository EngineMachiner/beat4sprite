return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/BG/6.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	} )..{}
}