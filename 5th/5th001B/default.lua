
local t = Def.ActorFrame{}

local tweaks = {
	Index = 2, -- what table with index to tweak
	X_coord = 1
}

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }