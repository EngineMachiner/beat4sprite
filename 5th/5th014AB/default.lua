
local replace = ...

local params = {

	Index = 1,
	Delay = 2
	
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th014A/default.lua" )( params )

}