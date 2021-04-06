
local replace = ...

local params = {

	Index = 1,
	Delay = 2
	
}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th014A",params)..{}

}