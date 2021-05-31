local t = Def.ActorFrame{}

local tweaks = {
	
	Index = 1,
	Y_coord = -1

}

	t[#t+1] = loadfile( "/BGAnimations/5th004A/default.lua" )( tweaks )

return Def.ActorFrame{ t }