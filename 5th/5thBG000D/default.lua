
local replace = ...
local t = Def.ActorFrame{}

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	Commands = { "Mirror", "Move" },
	X_num = 1,
	Y_num = 1,
	MultipleFiles = { 2, 2 },
	Y_coord = -1,

}

	BGA_G.ParTweak( params, replace )
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }
