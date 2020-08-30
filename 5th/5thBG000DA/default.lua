
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
	ScrollSpeed = 0.5,
	Y_coord = -1,

}

	BGA_ParamsTweaks( params, replace )
	BGA_ScrollTextures( t, params )

return Def.ActorFrame{ t }