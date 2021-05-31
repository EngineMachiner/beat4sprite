
local t = Def.ActorFrame{}

local tweaks = {

	{ 
		Index = 2,
		X_coord = 1 
	}

}
	t[#t+1] = loadfile( "/BGAnimations/5th001C/default.lua" )( tweaks )
	
return Def.ActorFrame{ t }