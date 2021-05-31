
local replace = ...

local params = {

	{
		Index = 1,
		X_num = { -5, 4 },
		X_coord = 1,
		Commands = "Move"
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th010AA/default.lua" )( params )

}