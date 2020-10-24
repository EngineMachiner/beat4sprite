
local replace = ...
local t = Def.ActorFrame{}

local params = {
	Index = 1,
	File = { 
		GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		GAMESTATE:GetCurrentSong():GetBackgroundPath()
	},
	Commands = { "Move", "Mirror" },
	BGMirror = true,
	X_num = 1,
	Y_coord = -1,

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )
	PSX_BGA_Globals["BGA_ScrollTextures"]( t, params )

return Def.ActorFrame{ t }