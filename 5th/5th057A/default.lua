
local replace = ...

local params = {

	{
		Index = 1,
		Frame_i = 3,
	},

	{
		Index = 2,
		Frame_i = 10,
		Dir = "Down"
	}

}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th056A/default.lua" )( params )
}