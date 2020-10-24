
local replace = ...

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/5th/BG/1.lua", params )..{}
}