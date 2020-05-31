local t = Def.ActorFrame{}

local tweaks = {
	
	Index = 1,
	Y_coord = -1

}

	t[#t+1] = LoadActor( "/BGAnimations/5th004A", tweaks )..{}

return Def.ActorFrame{ t }