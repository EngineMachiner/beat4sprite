local replace = ...

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/BG/2.lua", params )..{}
}