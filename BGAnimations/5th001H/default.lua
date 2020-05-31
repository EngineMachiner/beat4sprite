
local t = Def.ActorFrame{}

local tweaks = {

	Index = 2,
	X_coord = 1

}

	t[#t+1] = LoadActor( "/BGAnimations/5th001G", tweaks )..{}

return Def.ActorFrame{ t }