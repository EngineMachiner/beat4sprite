
local replace = ...

local params = {
	Index = 1,
	Frame_i = 2
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th056B/default.lua" )( params )
}